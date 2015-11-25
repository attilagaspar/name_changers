  
* education - we only match education data to one observation per person. 
* this needs to be changed in order that all observations have it.

egen maxeduc=max(has_school), by(idmaster)
egen maxdub=max(dubious), by(idmaster)
replace has_school=maxeduc
replace dubious=maxdub
drop maxdub maxeduc
  
* scrabble score - scrabble scores can be different throughout the years since 
* there are different spelling conventions and names can be abbreviated as well.
* for that reason we use the highest possible scrabble score for each person.
 
foreach v of varlist unchanged_scrab changed_scrab unchanged_rscrab changed_rscrab unchanged_scrab2 changed_scrab2 unchanged_rscrab2 changed_rscrab2 {

	egen maxscore=max(`v'), by(idmaster)
	replace `v'=maxscore
	drop maxscore

}
  
  
* cleaning birth years
egen birthyear_alternative = mode(birthyear), by(idmaster) minmode
egen birthyear_alternative2 = mode(birthyear), by(year workplace_broad) minmode
replace birthyear_alternative=birthyear_alternative2 if birthyear==. & birthyear_alternative==.
drop birthyear_alternative2
gen flag_birthyear_imputed=0
replace flag_birthyear_imputed=1 if birthyear!=birthyear_alternative
replace birthyear=birthyear_alternative 

la var flag_birthyear_imputed "AG - dummy indicating that the birth year was cleaned for the person-year observation"

* cleaning entry years
egen entryyear_alternative = mode(entryyear), by(idmaster) minmode
egen entryyear_alternative2 = mode(entryyear), by(year workplace_broad) minmode
replace entryyear_alternative=entryyear_alternative2 if entryyear==. & entryyear_alternative==.
drop entryyear_alternative2
gen flag_entryyear_imputed=0
replace flag_entryyear_imputed=1 if entryyear!=entryyear_alternative
replace entryyear=entryyear_alternative 

la var flag_entryyear_imputed "AG - dummy indicating that the entry year was cleaned for the person-year observation"


* some changer matches are not good (they are matched on old name while they 
* presumably changed a lot earlier

gen m=0
replace m=1 if change_year>year & match_type=="matched by new name"
replace m=2 if change_year<year & match_type=="matched by old name"

replace changer=0 if m>0



*readjusting age, experience, their squares, entry and exit 

cap drop entry exit age agesq exp expsq

*cleaning birthyear 
replace birthyear=. if birthyear==188

*cleaning entryyear
replace entryyear=1893 if entryyear==1993
replace entryyear=1885 if entryyear==1985
replace entryyear=. if entryyear==1930 | entryyear==1932
replace entryyear=1907 if entryyear==1807
 
gen age = year - birthyear
gen exp = year - entryyear
replace exp=. if exp>age


gen agesq = age ^ 2
gen expsq = exp ^ 2


egen entry = min(year), by(idmaster)
egen exit = max(year), by(idmaster)


la var entry "AG - year of entering sample" 
la var exit "AG - year of last observation"
la var age "AG - age (current year - year of birth)"
la var agesq "AG - square of age"
la var exp "AG - experience (current year - entry year)"
la var expsq "AG - square of experience"
  