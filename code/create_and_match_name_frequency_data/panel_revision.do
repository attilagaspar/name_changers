
/*
k—dol‡s ellen?rzŽse:

nŽzzŸk meg, kinŽl egyezik meg az idmaster_alternative Žs az idmaster - azt elbasztam

nŽzzŸk meg, kinŽl 0 az idmaster_alternative - azok val—sz’n?leg duplik‡tumok

nŽzzŸk meg, van-e olyan, hogy van idmaster_alternative de n>1, akkor vsz ‡t kell vari‡lni az id-t

ELTƒRƒSEKRE FLAGEK

preserve
elmenteni ezt a file-t
kimenteni: unique_id, idmaster, idmaster_alternative
elmenteni new_panel_ids.dta nŽven
restore


elemzŽs:

- keresztmetszeti egyŽsgenkŽnkt mindenki szŸletŽsi ŽvŽt cserŸljŸk ki a MîDUSZ szŸletŽsi Žvre (legyen mindegyik ugyanaz minden emberre, lehet?leg nem kerek’tve hanem valamelyiket pontosan)

- akinek tov‡bbra is hi‡nyzik, annak cserŽljŸk le az adott Žv teljes medi‡nj‡ra (ne dobjuk ki azt se, akinek nincs szŸletŽsi Žve)

- repeat step 1 

- ugyanezt entry_year-re

*/
use "/Users/attilagaspar/Downloads/bpp_edited_old.dta", clear
preserve
keep unique_id idmaster idmaster_alternative 
save "/Users/attilagaspar/Dropbox/name_changers/data/budapest_employees/derived/new_panel_ids.dta", replace
restore
save "/Users/attilagaspar/Downloads/work.dta", replace

use "/Users/attilagaspar/Downloads/work.dta", clear

* there are some duplicates
drop if idmaster_alternative==0
replace idmaster=idmaster_alternative if idmaster_alternative!=.
egen n2=count(_n), by(idmaster)


* cleaning birth years
egen birthyear_alternative = mode(birthyear), by(idmaster) minmode
egen birthyear_alternative2 = mode(birthyear), by(year workplace_broad) minmode

replace birthyear_alternative=birthyear_alternative2 if birthyear==. & birthyear_alternative==.

gen flag_birthyear_imputed=0
replace flag_birthyear_imputed=1 if birthyear!=birthyear_alternative

replace birthyear=birthyear_alternative 

* cleaning entry years
egen entryyear_alternative = mode(entryyear), by(idmaster) minmode
egen entryyear_alternative2 = mode(entryyear), by(year workplace_broad) minmode

replace entryyear_alternative=entryyear_alternative2 if entryyear==. & entryyear_alternative==.

gen flag_entryyear_imputed=0
replace flag_entryyear_imputed=1 if entryyear!=entryyear_alternative

replace entryyear=entryyear_alternative 

*readjusting age, experience, their squares, entry and exit 

drop entry exit age agesq exp expsq

gen age = year - birthyear
gen exp = year - entryyear
gen agesq = age ^ 2
gen expsq = exp ^ 2

egen entry = min(year), by(idmaster)
egen exit = max(year), by(idmaster)


* 5 duplik‡tum van a panelben, ezt droppoljuk

duplicates drop idmaster year, force
tsset idmaster year

save "/Users/attilagaspar/Downloads/work.dta", replace


*regressions: educationban legyunk konzervativak



reg lsalary1 name_foreign  changer  age agesq exp expsq has_school i.year gworkplace_broad* if year==entry
reg lsalary1 name_foreign  changer age agesq exp expsq has_school i.year gworkplace_broad* if year==exit

reg lsalary_avg name_foreign  changer  age agesq exp expsq has_school i.year gworkplace_broad* if year==entry
reg lsalary_avg name_foreign  changer age agesq exp expsq has_school i.year gworkplace_broad* if year==exit

reg ltotal_salary name_foreign  changer age agesq exp expsq has_school i.year gworkplace_broad* if year==entry
reg ltotal_salary name_foreign  changer age agesq exp expsq has_school i.year gworkplace_broad* if year==exit

reg ltotal_salary_avg name_foreign  changer age agesq exp expsq has_school i.year gworkplace_broad* if year==entry
reg ltotal_salary_avg name_foreign  changer age agesq exp expsq has_school i.year gworkplace_broad* if year==exit


cap drop t


egen t = group(year)

tsset idmaster t
gen ywg=d.ltotal_salary

*ywg = log(wage1907) - log(wage1904) = log(wage1907 / wage1904) = log(wage1904 * growth1904 * growth1905 * growth1906 / wage1904) 

*= log(growth1904) + log(growth1905) + log(growth1906)

gen years_passed = d.year
gen awg=ywg/years_passed
la var awg "geometric average of yearly wage growth"
la var ywg "wage growth between consecutive time series observations"

* ezek j—k, panelban vagyunk, fixhat‡s kiesett, 
reg awg name_foreign  changer  age agesq exp expsq has_school i.year gworkplace_broad*, vce(cluster idmaster)
reg ywg name_foreign  changer  age agesq exp expsq has_school i.year gworkplace_broad*, vce(cluster idmaster)

* kap-e emelŽst?

gen gets_raise=.
replace gets_raise=0 if ywg!=.
replace gets_raise=1 if ywg!=. & ywg>0 
reg gets_raise name_foreign  changer  age agesq exp expsq has_school i.year gworkplace_broad*, vce(cluster idmaster)
* nem igaz‡n j—



* promot‡lt‡k-e az elmœlt 5 Žvben?

gen gets_promoted5=.
replace gets_promoted5=1 if promotionyear!=entryyear & promotionyear>=year-5
replace gets_promoted5=0 if promotionyear<year-5


foreach v of numlist 1 3 5 10 {

gen gets_promoted_`v'=.
replace gets_promoted_`v'=1 if promotionyear!=entryyear & promotionyear>=year-`v'
replace gets_promoted_`v'=0 if promotionyear<year-`v'

} 

*ez j—nak t?nik
reg gets_promoted_3 name_foreign  changer  age agesq exp expsq has_school i.year gworkplace_broad* if year==exit, vce(cluster idmaster) 



* a first stage j— œgy nŽz ki

reg changer unchanged_scrab unchanged_scrab2 if name_foreign==1
reg changer unchanged_rscrab unchanged_rscrab2 if name_foreign==1
reg changer unchanged_rscrab unchanged_rscrab2 if name_foreign==1 & year==exit
reg changer unchanged_scrab unchanged_scrab2 if name_foreign==1 & year==exit

ivregress gmm lsalary1 age agesq exp expsq has_school yr* gworkplace_broad* (changer=unchanged_scrab unchanged_scrab2) if name_foreign==1, vce(cluster idmaster) first  

* ez meg mindig rossz: a changerek fele annyit keresnek.
ivregress gmm lsalary1 age agesq exp expsq has_school yr* gworkplace_broad* (changer=unchanged_scrab unchanged_scrab2) if name_foreign==1 & year==exit,  rob first  

* ennek kŽne m?kšdnie
ivregress gmm ywg age agesq exp expsq has_school yr* gworkplace_broad* (changer=unchanged_scrab) if name_foreign==1,  vce(cluster idmaster) first  
