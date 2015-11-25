use bpp_with_namevars.dta, clear
set more off

* cleaning issues
replace changer = 1 if oldname!=""


* jewish share
gen jewish_share1= ngr1_newname_count_jewish/ ngr1_newname_count
gen jewish_share2= ngr2_newname_count_jewish/ ngr2_newname_count
gen jewish_share=jewish_share1
replace jewish_share=jewish_share2 if oldname!=""
gen js2=jewish_share
replace js2=0 if js2==.
la var js2 "share of jews among people who change names from this surname"

* changer count
gen changer_count=ngr1_oldname_count
replace changer_count=ngr2_oldname_count if oldname!=""
gen has_changer=0
replace has_changer=1 if changer_count>0
la var js2 "this surname has name changers abandoning this name"


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
	
	cap rm regs_1120_`v'.xls


}

foreach v in "lsalary1" "lsalary_avg"	"lsalary_avg"	"ltotal_salary"	"ltotal_salary_avg"{
	foreach x in "x1" "x2" "x3"   {
		
		foreach sam in "samp1" "samp2" {
			
			foreach s in "se1" "se2"  {
			
				reg `v' ``x''##c.js2 `contr'  ``sam'', ``s''
				outreg2 using regs_1120_`v'.xls, append  ///
				addtext(model, level, righthand, ``x'd', sampleused, ``sam'desc', serror, ``s'') drop(`contr')
			
			}
			*keep(`x''##c.js2)
			
			
		}
		
			foreach s in "se1" "se2" "se3" {
			
				reg d.`v' ``x''##c.js2 `contr'  , ``s''
				outreg2 using regs_1120_`v'.xls, append  ///
				addtext(model, difference, righthand ,``x'd', sampleused, whole, serror, ``s'') drop(`contr')
				
			
			}
		
	}



}

/*

reg lsalary1 changer##c.js2 age agesq exp expsq has_school i.year gworkplace_broad* if year==exit
reg lsalary1 changer##c.js2 age agesq exp expsq has_school i.year gworkplace_broad* if year==exit & has_changer==1
reg d.lsalary1 changer##c.js2 age agesq exp expsq has_school i.year gworkplace_broad*, rob

reg lsalary1 (changer change_1898 change_after)##c.js2 age agesq exp expsq has_school i.year gworkplace_broad* if year==exit
reg lsalary1 (changer change_1898 change_after)##c.js2 age agesq exp expsq has_school i.year gworkplace_broad* if year==exit & has_changer==1
reg d.lsalary1 (changer change_1898 change_after)##c.js2 age agesq exp expsq has_school i.year gworkplace_broad*
reg d.lsalary1 (changer change_1898 change_after)##c.js2 age agesq exp expsq has_school i.year gworkplace_broad*, rob
reg d.lsalary1 (changer change_1898 change_after)##c.js2 age agesq exp expsq has_school i.year gworkplace_broad*, vce (cluster idmaster)
reg d.lsalary1 (changer change_1898 change_after)##c.js2 age agesq exp expsq has_school i.year gworkplace_broad*, vce (cluster workplace_broad)


reg lsalary1 (change_pre change_post)##c.js2 age agesq exp expsq has_school i.year gworkplace_broad* if year==exit
reg lsalary1 (change_pre change_post)##c.js2 age agesq exp expsq has_school i.year gworkplace_broad* if year==exit & has_changer==1
reg d.lsalary1 (change_pre change_post)##c.js2 age agesq exp expsq has_school i.year gworkplace_broad*
reg d.lsalary1 (change_pre change_post)##c.js2 age agesq exp expsq has_school i.year gworkplace_broad*, rob
reg d.lsalary1 (change_pre change_post)##c.js2 age agesq exp expsq has_school i.year gworkplace_broad*, vce (cluster idmaster)
reg d.lsalary1 (change_pre change_post)##c.js2 age agesq exp expsq has_school i.year gworkplace_broad*, vce (cluster workplace_broad)







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
