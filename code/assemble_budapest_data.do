clear
*cd "C:\Users\Administrator\Desktop\name_changers\code\"
*cd /Users/attilagaspar/Dropbox/name_changers/code
set more off

*VARIABLE LABELING CONVENTION
*AG_ 	: "analyist generated" variables - ids, match indicators etc.
*BPP_ 	: variables originating from the Budapest panel
*NCD_ 	: variables originating from MACSE name changing data 
*ED_ 	: variables originating from the education data


****************************************
* STEP 1: Assemble years of panel
****************************************

*ISSUE0: semennyit se foglalkoztunk azzal, hogy megnezzuk hogy a sokfele salary 
*kozul melyikre melyik illhet. Lehet, meg kellene ezt nézni a konyvekben. 
*de az is lehet, hogy nem

*YEAR 1904
do preparing_budapest_employees_data/generate_consistent_data_almanach1904.do
gen id_1904=id if year==1904
*CHANGE ON 08/25/2015: this line refers to the old matches and is changed to new ones
merge 1:m id_1904 using "../data/budapest_employees/derived/almanach_yearbook_match_list.dta", gen(m1904)
keep if m1904==3
keep idmaster id_1904 key1 key2 unique_id source year fullname birthyear entryyear promotionyear workplace workplace_cleaned position salary1 home_allowance1 salary2 home_allowance2    home
tempfile a1904
save `a1904'

*YEAR 1907
do preparing_budapest_employees_data/generate_consistent_data_almanach1907.do
gen id_1907=id if year==1907
*CHANGE ON 08/25/2015: this line refers to the old matches and is changed to new ones
merge 1:m id_1907 using "../data/budapest_employees/derived/almanach_yearbook_match_list.dta", gen(m1907)
keep if m1907==3
keep idmaster id_1907 key1 key2 unique_id source year fullname birthyear entryyear promotionyear workplace workplace_cleaned position salary1 home_allowance1 salary2 home_allowance2    home
tempfile a1907
save `a1907'

*YEAR 1909
do preparing_budapest_employees_data/generate_consistent_data_yearbook1909.do
*ISSUE1: ideiglenes hivatalnokoknal (519 megfigyeles) nincs salary. miert?
*ISSUE2: a workplace nincs kulon kipucolva. jo ez igy?
*ISSUE3: 1909-ben hianyzik 569 promotion year. miert? lehet hogy ok mind uj belepo?
gen id_1909=id if year==1909
*CHANGE ON 08/25/2015: this line refers to the old matches and is changed to new ones
merge 1:m id_1909 using "../data/budapest_employees/derived/almanach_yearbook_match_list.dta", gen(m1909)
keep if m1909==3
keep idmaster id_1909 key1 key2 unique_id source year fullname birthyear entryyear promotionyear workplace workplace_cleaned position salary1 home_allowance1 salary2 home_allowance2    home
tempfile y1909
save `y1909'

*YEAR 1912
do preparing_budapest_employees_data/generate_consistent_data_yearbook1912.do
gen id_1912=id if year==1912
*ISSUE1: 1900 megfigyelesre incs fizetes, no appearant reason
*ISSUE2: a workplace nincs kulon kipucolva. jo ez igy?

*CHANGE ON 08/25/2015: this line refers to the old matches and is changed to new ones
merge 1:m id_1912 using "../data/budapest_employees/derived/almanach_yearbook_match_list.dta", gen(m1912)
keep if m1912==3
*ISSUE3: nincs 2. fizetes
gen salary2=. 
gen home_allowance2=.
keep idmaster id_1912  key1 key2 unique_id source year fullname birthyear entryyear promotionyear workplace workplace_cleaned position salary1 home_allowance1 salary2 home_allowance2     home

order idmaster unique_id source year fullname birthyear entryyear promotionyear workplace workplace_cleaned position salary1 home_allowance1 salary2 home_allowance2    home

* Assembling all
append using `a1904', force
append using `a1907', force
append using `y1909', force


*CHANGE ON 08/25/2015: UPDATING IDS:
merge 1:m unique_id using "../data/budapest_employees/derived/new_panel_ids.dta", gen(merge_id_revision)

rename idmaster idmaster_old
gen idmaster=idmaster_old
replace idmaster=idmaster_alternative if idmaster_alternative!=.
order idmaster idmaster_alternative idmaster_old

*assert panel variables are unique
drop if idmaster_alternative==0
duplicates drop idmaster year, force
tsset idmaster year

la var idmaster "AG - Identifies person"
la var idmaster_alternative "AG - person ID after revision"
la var idmaster_old "AG - person ID before revision"

la var unique_id "AG - Identifies person-year and data source"
la var source "AG - Indicates the origin of the raw data"
la var key1 "AG - string key generated from family name" 
la var key2 "AG - string key generated from given name" 

la var year "BPP - year of obs"
la var fullname "BPP - original full name as in raw data"
la var salary1 "BPP - base salary"
la var home_allowance1 "BPP - home allowance"
la var salary2 "BPP - base salary (alternative)"
la var home_allowance2 "BPP - home allowance (alternative)"
la var home "BPP - lodging included"
la var birthyear "BPP - Year of birth "
la var entryyear "BPP - Year of entering municipal service"
la var workplace "BPP - Physical location of work"
la var workplace_cleaned "BPP - Physical location of work, harmonized across years"
la var promotionyear "BPP - Year of moving to current position"
la var position "BPP - Current position"

***********************************************
* STEP 2: Merge name changer treatment variable and generate name dummies
***********************************************
do preparing_budapest_employees_data/merge_treatment.do

*name dummies
do preparing_budapest_employees_data/generate_name_dummies.do
*workplace and position groups
do preparing_budapest_employees_data/create_workplace_and_position_groups.do


***********************************************
* STEP 2: Matching education vars
***********************************************

*attaching alternate id-s needed for education match

gen t=year

foreach v in 1904 1907 1909 1912 {

	preserve
	rename fullname fn
	keep if t==`v'
	rename id_`v' id_
	merge 1:1 t id_ using "../data/budapest_employees/derived/idmatch.dta"
	drop if _merge==2
	drop _merge
	tempfile slice`v'
	save `slice`v''
	restore

}

use `slice1904', clear
append using `slice1907'
append using `slice1909'
append using `slice1912'

*ISSUE: 1909-es ideiglenes hivatalnokok, akiknek nincs meg a bére, kimaradtak a 
*régi panelb?l, és itt se találjuk. mi lehet az oka?


do "preparing_budapest_employees_data/clean_education_matches.do"

gen wp=workplace_cleaned
do "preparing_budapest_employees_data/clean_workplaces.do"
drop wp name6 name7

la var workplace_cl "AG - Cleaned workplace variable"
la var workplace_broad "AG - Broad workplace categories"
replace workplace_broad="0" if workplace==""

do "preparing_budapest_employees_data/create_scrabble_score.do"

do "preparing_budapest_employees_data/affirm_panel_consistency.do"

do "preparing_budapest_employees_data/data_cleaning.do"

saveold ../data/bpp.dta, replace version(11)

egen t = group(year)
tsset idmaster t

do "basic_regression.do"
