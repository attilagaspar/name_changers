
 
 *
 tab workplace_broad, gen(gworkplace_broad)

 *cleaning change_year
 replace change_year2="" if change_year2=="125 616"
 destring(change_year2), replace
 replace change_year=change_year2 if change_year2<. & change_year==.
 
 *ezt azert at kene nezni, foleg, h koztuk is lehet nemet
 *vagy ha ok a magyarrol magyarra valtok, akkor minden changer adatukat, ugy mint change_year missingre tenni
 replace changer=1 if change_year<. & changer==0 
 
 *ez normalis? veluk mi legyen? 
 count if birthyear>change_year
 *browse year birthyear age entryyear exp change_year change_year2 if birthyear>change_year
 
 *ezt persze lehet maskepp is definialni
 gen change_before1897=0
 replace change_before1897=1 if change_year<1898
 
 gen change_1898=0
 replace change_1898=1 if change_year==1898
 
 gen change_after1899=0
 replace change_after1899=1 if change_year>1898 & change_year<.
 
 gen x=change_before + change_1898 + change_after
 tab x
 count if changer!=x
 drop x
 
 
 *
 gen change_pre=0
 replace change_pre=1 if change_year<entryyear & changer==1 & entryyear<. & change_year<.
 gen change_post=0
 replace change_post=1 if change_year>entryyear & changer==1 & entryyear<. & change_year<.
 
 *veluk mi legyen????????????????????? 49 ilyen van....
 count if change_year==entryyear & entryyear!=.
 
 gen x=change_pre + change_post
 tab x
 count if changer!=x
 browse change_year entryyear if changer!=x
 drop x
 
 
  *cleaning salary
  count if (salary1==. | salary1==0) & salary2<.
  *no such observation 
  
  count if (home_allowance1==. | home_allowance1==0) & home_allowance2<.
  *there are 5 such observation - replace home_allowance1 with home_allowance2 in those cases
  cap drop x
  gen x=0 
  replace x=1 if (home_allowance1==. | home_allowance1==0) & home_allowance2<.
  replace home_allowance1=home_allowance2 if x==1
  replace home_allowance2=. if x==1
 drop x
 
 ****************************************
 *alternative salary measures
 ***************************************
 
 gen lsalary1=log(salary1)

 *lehet a salary1 es salary2 atlaga kene ott, ahol mind a ketto definialva van
 gen salary_avg=salary1
 replace salary_avg=(salary1+salary2)/2 if salary2<. & salary2>0 
 gen lsalary_avg=log(salary_avg)
 
*lehet a home_allowance1 és home_allowance2 atlaga kene ott, ahol mind a ketto letezik
gen total_salary=salary1+home_allowance1
replace total_salary=salary1 if home_allowance1==.
*correcting for those where home is included, using the average home_allowance 
sum home_allowance1 if year==1904 & (home_allowance1==. | home_allowance1==0)
replace total_salary=salary1+r(mean) if year==1904 & (home_allowance1==. | home_allowance1==0) & home==1
sum home_allowance1 if year==1907 & (home_allowance1==. | home_allowance1==0)
replace total_salary=salary1+r(mean) if year==1907 & (home_allowance1==. | home_allowance1==0) & home==1
sum home_allowance1 if year==1909 & (home_allowance1==. | home_allowance1==0)
replace total_salary=salary1+r(mean) if year==1909 & (home_allowance1==. | home_allowance1==0) & home==1
sum home_allowance1 if year==1912 & (home_allowance1==. | home_allowance1==0)
replace total_salary=salary1+r(mean) if year==1912 & (home_allowance1==. | home_allowance1==0) & home==1

gen ltotal_salary=log(total_salary)

*lehet a home_allowance1 és home_allowance2 atlaga kene ott, ahol mind a ketto letezik
gen home_allowance_avg=home_allowance1
replace home_allowance_avg=home_allowance1 + home_allowance2 if home_allowance2>0 & home_allowance2<.

gen total_salary_avg=salary_avg+home_allowance_avg
replace total_salary_avg=salary_avg if home_allowance_avg==.
*correcting for those where home is included, using the average home_allowance 
sum home_allowance_avg if year==1904 & (home_allowance_avg==. | home_allowance_avg==0)
replace total_salary_avg=salary_avg+r(mean) if year==1904 & (home_allowance_avg==. | home_allowance_avg==0) & home==1
sum home_allowance_avg if year==1907 & (home_allowance_avg==. | home_allowance_avg==0)
replace total_salary_avg=salary_avg+r(mean) if year==1907 & (home_allowance_avg==. | home_allowance_avg==0) & home==1
sum home_allowance_avg if year==1909 & (home_allowance_avg==. | home_allowance_avg==0)
replace total_salary_avg=salary_avg+r(mean) if year==1909 & (home_allowance_avg==. | home_allowance_avg==0) & home==1
sum home_allowance_avg if year==1912 & (home_allowance_avg==. | home_allowance_avg==0)
replace total_salary_avg=salary_avg+r(mean) if year==1912 & (home_allowance_avg==. | home_allowance_avg==0) & home==1

gen ltotal_salary_avg=log(total_salary_avg)

sum salary1 salary_avg total_salary total_salary_avg
sum lsalary1 lsalary_avg ltotal_salary ltotal_salary_avg



*labeling
la var change_before1897 "AG - person changed name in 1897 the latest"
la var change_1898 "AG - person changed name in 1898"
la var change_after1899 "AG - person changed name after 1898"
la var change_pre "AG - person changed name before entering service"
la var change_post "AG - person changed name after entering service"
la var lsalary1 "AG - log of base salary"
la var salary_avg "AG - average of salary measures where there is more"
la var lsalary_avg "AG - log of averagy salary"
la var total_salary "AG - salary + allowances"
la var ltotal_salary "AG - log of salary + allowances"
la var home_allowance_avg "AG - average of different home allowances if applicable"
la var total_salary_avg "AG - average if total salary measures where there is more"
la var ltotal_salary_avg "AG - log of average of total salaries where there is more"

