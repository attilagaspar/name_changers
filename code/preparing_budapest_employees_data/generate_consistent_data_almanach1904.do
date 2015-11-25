* Input of the script: raw excel sheet of 1904 almanach data

* This script achieves two things:
* 1) It creates a name variable stripped of titles such as 
* "Doctor", "Junior", "Senior", "Count", is in lower case and special
* Hungarian characters are replaced with their ASCII counterparts. This
* variable will be used to merge data across years.
* 2) It creates a cleaned salary variable


clear
import excel "../data/budapest_employees/raw/1904_almanac/1904_almanach_clean_nc.xlsx", sheet("Sheet1") firstrow clear
do kill_accents.do

* translating variable names and labeling 
rename forras source
label variable source "indicating the source of the raw data"
rename ev year
label variable year "year of the observation"
rename name fullname
label variable fullname "the original full name (as in the raw data)"
rename kulf foreigner
label variable foreigner "whether the name sounds as an originally foreigner name"
rename nemet german
label variable german "whether the name sounds as an originally German name"
rename szul birthyear
label variable birthyear "year of birth"
rename csalad maritalstatus
label variable maritalstatus "marital status"
rename fov_szolg entryyear
label variable entryyear "year of starting a career as an official (at the capital - Budapest)"
rename elolepes promotionyear
label variable promotionyear "year of the last promotion"
rename hol workplace
label variable workplace "place of the job"
rename hol_cleaned workplace_cleaned
label variable workplace_cleaned "cleaned place of the job"
rename beosztas position
label variable position "current position"
rename fiz1 salary1
label variable salary1 "base salary"
rename fiz2 salary2
label variable salary2 "base salary"
rename fiz3 salary3
label variable salary3 "base salary"
rename fiz4 salary4
label variable salary4 "base salary"
rename lak1 home_allowance1
label variable home_allowance1 "allowance related to residence"
rename lak2 home_allowance2
label variable home_allowance2 "allowance related to residence"
rename lak3 home_allowance3
label variable home_allowance3 "allowance related to residence"
rename lak4 home_allowance4
label variable home_allowance4 "allowance related to residence"
rename term_jutt other_nm_allowance
label variable other_nm_allowance "other non-monetary allowance"
rename megjegyzes comment
label variable comment "comments - other information"

cap drop matchingname matchingname_1 key1 key2 key3 key4
cap drop gyanus veztetknevu

* cleaning names
gen fullname_clean=fullname
label variable fullname_cl "cleaned full name"


*at the begining of the name
replace  fullname_cl = subinstr( fullname_cl, "legifj. ", "", .)
replace  fullname_cl = subinstr( fullname_cl, "dr. ", "", .)
replace  fullname_cl = subinstr( fullname_cl, "Dr. ", "", .)
replace  fullname_cl = subinstr( fullname_cl, "id. ", "", .)
replace  fullname_cl = subinstr( fullname_cl, "Id. ", "", .)
replace  fullname_cl = subinstr( fullname_cl, "ifj. ", "", .)
replace  fullname_cl = subinstr( fullname_cl, "Ifj. ", "", .)
replace  fullname_cl = subinstr( fullname_cl, "dr ", "", .)
replace  fullname_cl = subinstr( fullname_cl, "Dr ", "", .)
replace  fullname_cl = subinstr( fullname_cl, "id ", "", .)
replace  fullname_cl = subinstr( fullname_cl, "Id ", "", .)
replace  fullname_cl = subinstr( fullname_cl, "ifj ", "", .)
replace  fullname_cl = subinstr( fullname_cl, "Ifj ", "", .)
replace  fullname_cl = subinstr( fullname_cl, "-né", "", .)
replace  fullname_cl = subinstr( fullname_cl, "Ir. ", "", .)
replace  fullname_cl = subinstr( fullname_cl, "If. ", "", .)
replace  fullname_cl = subinstr( fullname_cl, "Gr. ", "", .)

*at the end of the name
replace  fullname_cl = subinstr( fullname_cl, " dr.", "", .)
replace  fullname_cl = subinstr( fullname_cl, " Dr.", "", .)
replace  fullname_cl = subinstr( fullname_cl, " id.", "", .)
replace  fullname_cl = subinstr( fullname_cl, " Id.", "", .)
replace  fullname_cl = subinstr( fullname_cl, " ifj.", "", .)
replace  fullname_cl = subinstr( fullname_cl, " Ifj.", "", .)


*replace  fullname_cl = subinstr( fullname_cl, " dr", "", .)
*replace  fullname_cl = subinstr( fullname_cl, " Dr", "", .)
*replace  fullname_cl = subinstr( fullname_cl, " id", "", .)
*replace  fullname_cl = subinstr( fullname_cl, " Id", "", .)
*replace  fullname_cl = subinstr( fullname_cl, " ifj", "", .)
*replace  fullname_cl = subinstr( fullname_cl, " Ifj", "", .)

replace  fullname_cl = subinstr( fullname_cl, "dr.", "", .)
replace  fullname_cl = subinstr( fullname_cl, "Dr.", "", .)
replace  fullname_cl = subinstr( fullname_cl, "ifj.", "", .)
*lower case (name should be in lower case)
replace  fullname_cl = lower(fullname_cl)



*replacing special characters
replace fullname_cl = subinstr(fullname_cl, ",", "&", .)
replace fullname_cl = subinstr(fullname_cl, ".", "&", .)
gen abreviation=0
replace abreviation=1 if regex(fullname_cl, "&")
replace fullname_cl = subinstr(fullname_cl, "&", "", .)
replace fullname_cl = subinstr(fullname_cl, "-", "", .)
replace fullname_cl = subinstr(fullname_cl, "á", "a", .)
replace fullname_cl = subinstr(fullname_cl, "ä", "a", .)
replace fullname_cl = subinstr(fullname_cl, "é", "e", .)
replace fullname_cl = subinstr(fullname_cl, "ó", "o", .)
replace fullname_cl = subinstr(fullname_cl, "ö", "o", .)
replace fullname_cl = subinstr(fullname_cl, "õ", "o", .)
replace fullname_cl = subinstr(fullname_cl, "ú", "u", .)
replace fullname_cl = subinstr(fullname_cl, "ü", "u", .)
replace fullname_cl = subinstr(fullname_cl, "û", "u", .)
replace fullname_cl = subinstr(fullname_cl, "í", "i", .)
replace fullname_cl = subinstr(fullname_cl, "oe", "o", .)
replace fullname_cl = subinstr(fullname_cl, "Á", "a", .)
replace fullname_cl = subinstr(fullname_cl, "Ä", "a", .)
replace fullname_cl = subinstr(fullname_cl, "É", "e", .)
replace fullname_cl = subinstr(fullname_cl, "Ó", "o", .)
replace fullname_cl = subinstr(fullname_cl, "Ö", "o", .)
replace fullname_cl = subinstr(fullname_cl, "Õ", "o", .)
replace fullname_cl = subinstr(fullname_cl, "Ú", "u", .)
replace fullname_cl = subinstr(fullname_cl, "Ü", "u", .)
replace fullname_cl = subinstr(fullname_cl, "Û", "u", .)
replace fullname_cl = subinstr(fullname_cl, "Í", "i", .)
replace fullname_cl = subinstr(fullname_cl, "sch", "s", .)
replace fullname_cl = subinstr(fullname_cl, "sh", "s", .)
replace fullname_cl = subinstr(fullname_cl, "th", "t", .)
replace fullname_cl = subinstr(fullname_cl, "gh", "g", .)
replace fullname_cl = subinstr(fullname_cl, "hr", "r", .)
replace fullname_cl = subinstr(fullname_cl, "ntdn", "ntn", .)
replace fullname_cl = subinstr(fullname_cl, "ch", "c", .)
replace fullname_cl = subinstr(fullname_cl, "cs", "c", .)
replace fullname_cl = subinstr(fullname_cl, "ts", "c", .)
replace fullname_cl = subinstr(fullname_cl, "eo", "o", .)
replace fullname_cl = subinstr(fullname_cl, "w", "v", .)
replace fullname_cl = subinstr(fullname_cl, "zs", "z", .)
replace fullname_cl = subinstr(fullname_cl, "sz", "s", .)
replace fullname_cl = subinstr(fullname_cl, "hn", "n", .)
replace fullname_cl = subinstr(fullname_cl, "cz", "c", .)
replace fullname_cl = subinstr(fullname_cl, "tz", "c", .)
replace fullname_cl = subinstr(fullname_cl, "ck", "k", .)
replace fullname_cl = subinstr(fullname_cl, "gy", "g", .)
replace fullname_cl = subinstr(fullname_cl, "ny", "n", .)
replace fullname_cl = subinstr(fullname_cl, "ty", "t", .)
replace fullname_cl = subinstr(fullname_cl, "aa", "a", .)
replace fullname_cl = subinstr(fullname_cl, "ff", "f", .)
replace fullname_cl = subinstr(fullname_cl, "ss", "s", .)
replace fullname_cl = subinstr(fullname_cl, "nn", "n", .)
replace fullname_cl = subinstr(fullname_cl, "ll", "l", .)
replace fullname_cl = subinstr(fullname_cl, "y", "i", .)

*split the string by space
split fullname_cl, gen(key)

*cleaning the keys
replace key3="" if key3=="dr"
replace key3="" if key3=="baro"

*middle
gen key4=""
replace key3="" if regexm(key3, "(\(.*\))")

gen probl=0
replace probl=1 if length(key1)==1
replace key4=key1 if probl==1
replace key1=key2 if probl==1
replace key2=key3 if probl==1
replace key3="" if probl==1

gen probl2=0
replace probl2=1 if length(key2)==1 & key3!=""
replace key4=key2 if probl2==1
replace key2=key3 if probl2==1
replace key3=""  if probl2==1

*cleaning by hand
replace key4=key2 if key2=="sabo"
replace key2=key3 if key2=="sabo"
replace key3="" if key4=="sabo"

replace key4=key2 if key2=="vildner"
replace key2=key3 if key2=="vildner"
replace key3="" if key4=="vildner"

replace key4=key3 if key3!=""
replace key3="" if key3!=""

drop probl* key3

label variable key1 "key generated from family (last) name"
label variable key2 "key generated from firstname"
label variable key4 "key generated from middlename"
label variable abreviation "whether the name contains abrevtiation, pay special attention when matching"


gen home=0
label variable home "on the top of the salary he got a home as non-monetary allowance"
replace home=1 if comment=="lak"  
replace home=1 if comment=="lakas"
replace home=1 if comment=="lakas + 200 átal"
replace home=1 if comment=="lakas + 400 átal"
replace home=1 if comment=="lakas + a jöv. 1%-a"
replace home=1 if comment=="lakas +200 átal"
replace home=1 if comment=="lakas, 600 átal"
replace home=1 if comment=="lakas, a jöv. 1%-a"
replace home=1 if comment=="lakas, Tanos Sándor helyett o lett megbízva"
replace home=1 if comment=="lakas, helyette az intézet vezetésével Magdics Károly van megbízva"
replace home=1 if comment=="lakás"
replace home=1 if comment=="lakás és tüzifa"
replace home=1 if home_allowance2=="lak"

replace home_allowance2="" if home_allowance2=="lak"
destring(home_allowance2), replace

replace home=1 if home_allowance3=="lak"
replace home_allowance3="" if home_allowance3=="lak"
destring(home_allowance3), replace

replace home=1 if home_allowance4=="lak"
replace home_allowance4="" if home_allowance4=="lak"
destring(home_allowance4), replace

gen other_allowance =0
replace other_allowance =1200 if comment=="1200 átal"
replace other_allowance =3600 if comment== "3600 átal."
replace other_allowance =400 if comment=="400 átal."
replace other_allowance =600 if comment=="600 átal."
replace other_allowance =200 if comment=="lakas + 200 átal"
replace other_allowance =400 if comment=="lakas + 400 átal"
replace other_allowance =200 if comment=="lakas +200 átal"
replace other_allowance =600 if comment=="lakas, 600 átal"

******************************************************************************
*****duplicates
*****************************************************************************
duplicates tag key1 key2 birthy, gen (duplicates)
*since there is only one duplicate and it is probably the same person, 
*I drop the second observation
duplicates drop key1 key2 birthy, force



save "..\data\consistent\almanach_1904_consistent.dta", replace
