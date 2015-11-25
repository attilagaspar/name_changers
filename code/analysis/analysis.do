use ../../data/bpp_with_namevars.dta, clear
set more off

local outpath="../../results/tables/basic_regs/"

* cleaning issues
replace changer = 1 if oldname!=""


* jewish share
/*
gen jewish_share1= ngr1_newname_count_jewish/ ngr1_newname_count
gen jewish_share2= ngr2_newname_count_jewish/ ngr2_newname_count
gen jewish_share=jewish_share1
replace jewish_share=jewish_share2 if oldname!=""
gen jewish_share_old=jewish_share
replace jewish_share_old=0 if jewish_share_old==.
la var jewish_share_old "share of jews among people who change names from this surname"*/

gen jewish_share_old=ngr1_oldname_count_jewish/ ngr1_oldname_count
replace jewish_share_old=ngr2_oldname_count_jewish/ ngr2_oldname_count if changer==1
gen jewish_share_new=ngr1_newname_count_jewish/ ngr1_newname_count

replace jewish_share_old=0 if jewish_share_old==.
replace jewish_share_new=0 if jewish_share_new==.

la var jewish_share_old "share of jewish in adopted name or present name"
la var jewish_share_new "share of jewish in old name or present name"

* changer count
gen changer_count=ngr1_oldname_count
replace changer_count=ngr2_oldname_count if oldname!=""
gen has_changer=0
replace has_changer=1 if changer_count>0


egen t=group(year)
tsset idmaster t

* STANDARD ERROR

local se1 = "rob"
local se2 = "vce(cluster workplace_broad)"
local se3 = "vce(cluster idmaster)"

* CONTROLS

local contr = "age agesq exp expsq has_school i.year gworkplace_broad*"

* SAMPLES

local samp1 = "if year==exit"
local samp2 = "if year==exit & has_changer==1"

local samp1desc = "last year"
local samp2desc = "ly and has changer"

* X
local x1 = "changer"
local x2 = "(changer change_1898 change_after)"
local x3 = "(change_pre change_post)"

local x1d = "changer"
local x2d = "1898"
local x3d = "prepost"

* OUTCOMES 


foreach v in "lsalary1" "lsalary_avg"	"lsalary_avg"	"ltotal_salary"	"ltotal_salary_avg" {
	
	cap rm `outpath'regs_1120_`v'.xls


}

foreach v in "lsalary1" "lsalary_avg"	"lsalary_avg"	"ltotal_salary"	"ltotal_salary_avg"{
	foreach x in "x1" "x2" "x3"   {
		
		foreach sam in "samp1" "samp2" {
			
			foreach s in "se1" "se2"  {
			
				reg `v' ``x''##c.jewish_share_old `contr'  ``sam'', ``s''
				outreg2 using `outpath'regs_1120_`v'.xls, append  ///
				addtext(model, level, righthand, ``x'd', sampleused, ``sam'desc', serror, ``s'') drop(`contr')
			
			}
			*keep(`x''##c.jewish_share_old)
			
			
		}
		
			foreach s in "se1" "se2" "se3" {
			
				reg d.`v' ``x''##c.jewish_share_old `contr'  , ``s''
				outreg2 using `outpath'regs_1120_`v'.xls, append  ///
				addtext(model, difference, righthand ,``x'd', sampleused, whole, serror, ``s'') drop(`contr')
				
			
			}
		
	}



}

/*

reg lsalary1 changer##c.jewish_share_old age agesq exp expsq has_school i.year gworkplace_broad* if year==exit
reg lsalary1 changer##c.jewish_share_old age agesq exp expsq has_school i.year gworkplace_broad* if year==exit & has_changer==1
reg d.lsalary1 changer##c.jewish_share_old age agesq exp expsq has_school i.year gworkplace_broad*, rob

reg lsalary1 (changer change_1898 change_after)##c.jewish_share_old age agesq exp expsq has_school i.year gworkplace_broad* if year==exit
reg lsalary1 (changer change_1898 change_after)##c.jewish_share_old age agesq exp expsq has_school i.year gworkplace_broad* if year==exit & has_changer==1
reg d.lsalary1 (changer change_1898 change_after)##c.jewish_share_old age agesq exp expsq has_school i.year gworkplace_broad*
reg d.lsalary1 (changer change_1898 change_after)##c.jewish_share_old age agesq exp expsq has_school i.year gworkplace_broad*, rob
reg d.lsalary1 (changer change_1898 change_after)##c.jewish_share_old age agesq exp expsq has_school i.year gworkplace_broad*, vce (cluster idmaster)
reg d.lsalary1 (changer change_1898 change_after)##c.jewish_share_old age agesq exp expsq has_school i.year gworkplace_broad*, vce (cluster workplace_broad)


reg lsalary1 (change_pre change_post)##c.jewish_share_old age agesq exp expsq has_school i.year gworkplace_broad* if year==exit
reg lsalary1 (change_pre change_post)##c.jewish_share_old age agesq exp expsq has_school i.year gworkplace_broad* if year==exit & has_changer==1
reg d.lsalary1 (change_pre change_post)##c.jewish_share_old age agesq exp expsq has_school i.year gworkplace_broad*
reg d.lsalary1 (change_pre change_post)##c.jewish_share_old age agesq exp expsq has_school i.year gworkplace_broad*, rob
reg d.lsalary1 (change_pre change_post)##c.jewish_share_old age agesq exp expsq has_school i.year gworkplace_broad*, vce (cluster idmaster)
reg d.lsalary1 (change_pre change_post)##c.jewish_share_old age agesq exp expsq has_school i.year gworkplace_broad*, vce (cluster workplace_broad)







reg lsalary1 age agesq exp expsq has_school i.year gworkplace_broad* if year==entry
reg lsalary1 age agesq exp expsq has_school i.year gworkplace_broad* if year==exit

reg lwage1 age agesq exp expsq has_school i.year gworkplace_broad* if year==entry
reg lwage1 age agesq exp expsq has_school i.year gworkplace_broad* if year==exit



******************************************************************************************************
reg lsalary1 name_foreign  changer  age agesq exp expsq has_school i.year gworkplace_broad* if year==entry

reg lsalary1 name_foreign  changer age agesq exp expsq has_school i.year gworkplace_broad* if year==exit

reg lwage1 name_foreign  changer age agesq exp expsq has_school i.year gworkplace_broad* if year==entry

reg lwage1 name_foreign  changer age agesq exp expsq has_school i.year gworkplace_broad* if year==exit

****************************************************************************************************
reg lsalary1 name_foreign  changer change_1898 change_after age agesq exp expsq has_school i.year gworkplace_broad* if year==entry

reg lsalary1 name_foreign  changer change_1898 change_after age agesq exp expsq has_school i.year gworkplace_broad* if year==exit

reg lwage1 name_foreign  changer change_1898 change_after age agesq exp expsq has_school i.year gworkplace_broad* if year==entry

reg lwage1 name_foreign  changer change_1898 change_after age agesq exp expsq has_school i.year gworkplace_broad* if year==exit
