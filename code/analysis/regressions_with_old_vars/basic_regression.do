set more off 

****toggle workspace categories off/on

*foreach v of varlist gworkplace_broad1 gworkplace_broad2 gworkplace_broad3 gworkplace_broad4 gworkplace_broad5 gworkplace_broad6 gworkplace_broad7 gworkplace_broad8 gworkplace_broad9 gworkplace_broad10 gworkplace_broad11 gworkplace_broad12 gworkplace_broad13 gworkplace_broad14 gworkplace_broad15 gworkplace_broad16 gworkplace_broad17 gworkplace_broad18 gworkplace_broad19 gworkplace_broad20 gworkplace_broad21 gworkplace_broad22 gworkplace_broad23 gworkplace_broad24 gworkplace_broad25 gworkplace_broad26 gworkplace_broad27 gworkplace_broad28 gworkplace_broad29 gworkplace_broad30* {

*replace `v'=0

*} 


*cd "E:\Rita\munka\identity_economics\code" 
* use "..\data\bpp.dta", clear


**** toggle changer categories 
* replace name_foreign=0 if changer==1


reg lsalary1 age agesq exp expsq has_school i.year gworkplace_broad* if year==entry
outreg2 using "..\results/basic_regression.xls", replace dec(3)
reg lsalary1 age agesq exp expsq has_school i.year gworkplace_broad* if year==exit
outreg2 using "../results/basic_regression.xls", append dec(3)

reg lsalary_avg age agesq exp expsq has_school i.year gworkplace_broad* if year==entry
outreg2 using "..\results/basic_regression.xls", append dec(3)
reg lsalary_avg age agesq exp expsq has_school i.year gworkplace_broad* if year==exit
outreg2 using "../results/basic_regression.xls", append dec(3)

reg ltotal_salary age agesq exp expsq has_school i.year gworkplace_broad* if year==entry
outreg2 using "../results/basic_regression.xls", append dec(3)
reg ltotal_salary age agesq exp expsq has_school i.year gworkplace_broad* if year==exit
outreg2 using "../results/basic_regression.xls", append dec(3)

reg ltotal_salary_avg age agesq exp expsq has_school i.year gworkplace_broad* if year==entry
outreg2 using "../results/basic_regression.xls", append dec(3)
reg ltotal_salary_avg age agesq exp expsq has_school i.year gworkplace_broad* if year==exit
outreg2 using "../results/basic_regression.xls", append dec(3)

******************************************************************************************************
reg lsalary1 name_foreign  changer  age agesq exp expsq has_school i.year gworkplace_broad* if year==entry
outreg2  using "../results/basic_regression_changer.xls", replace dec(3) keep(name_foreign  changer)
reg lsalary1 name_foreign  changer age agesq exp expsq has_school i.year gworkplace_broad* if year==exit
outreg2 name_foreign  changer  using "../results/basic_regression_changer.xls", append dec(3) keep(name_foreign  changer)

reg lsalary_avg name_foreign  changer  age agesq exp expsq has_school i.year gworkplace_broad* if year==entry
outreg2 name_foreign  changer  using "../results/basic_regression_changer.xls", append dec(3) keep(name_foreign  changer)
reg lsalary_avg name_foreign  changer age agesq exp expsq has_school i.year gworkplace_broad* if year==exit
outreg2 name_foreign  changer  using "../results/basic_regression_changer.xls", append dec(3) keep(name_foreign  changer)

reg ltotal_salary name_foreign  changer age agesq exp expsq has_school i.year gworkplace_broad* if year==entry
outreg2 name_foreign  changer  using "../results/basic_regression_changer.xls", append dec(3) keep(name_foreign  changer)
reg ltotal_salary name_foreign  changer age agesq exp expsq has_school i.year gworkplace_broad* if year==exit
outreg2 name_foreign  changer  using "../results/basic_regression_changer.xls", append dec(3) keep(name_foreign  changer)

reg ltotal_salary_avg name_foreign  changer age agesq exp expsq has_school i.year gworkplace_broad* if year==entry
outreg2 name_foreign  changer  using "../results/basic_regression_changer.xls", append dec(3) keep(name_foreign  changer)
reg ltotal_salary_avg name_foreign  changer age agesq exp expsq has_school i.year gworkplace_broad* if year==exit
outreg2 name_foreign  changer  using "../results/basic_regression_changer.xls", append dec(3) keep(name_foreign  changer)

******************************************************************************************************

preserve
keep if name_foreign==1
reg lsalary1 name_foreign  changer  age agesq exp expsq has_school i.year gworkplace_broad* if year==entry
outreg2  using "../results/basic_regression_changer_foreignonly.xls", replace dec(3) keep(name_foreign  changer)
reg lsalary1 name_foreign  changer age agesq exp expsq has_school i.year gworkplace_broad* if year==exit
outreg2 name_foreign  changer  using "../results/basic_regression_changer_foreignonly.xls", append dec(3) keep(name_foreign  changer)

reg lsalary_avg name_foreign  changer  age agesq exp expsq has_school i.year gworkplace_broad* if year==entry
outreg2 name_foreign  changer  using "../results/basic_regression_changer_foreignonly.xls", append dec(3) keep(name_foreign  changer)
reg lsalary_avg name_foreign  changer age agesq exp expsq has_school i.year gworkplace_broad* if year==exit
outreg2 name_foreign  changer  using "../results/basic_regression_changer_foreignonly.xls", append dec(3) keep(name_foreign  changer)

reg ltotal_salary name_foreign  changer age agesq exp expsq has_school i.year gworkplace_broad* if year==entry
outreg2 name_foreign  changer  using "../results/basic_regression_changer_foreignonly.xls", append dec(3) keep(name_foreign  changer)
reg ltotal_salary name_foreign  changer age agesq exp expsq has_school i.year gworkplace_broad* if year==exit
outreg2 name_foreign  changer  using "../results/basic_regression_changer_foreignonly.xls", append dec(3) keep(name_foreign  changer)

reg ltotal_salary_avg name_foreign  changer age agesq exp expsq has_school i.year gworkplace_broad* if year==entry
outreg2 name_foreign  changer  using "../results/basic_regression_changer_foreignonly.xls", append dec(3) keep(name_foreign  changer)
reg ltotal_salary_avg name_foreign  changer age agesq exp expsq has_school i.year gworkplace_broad* if year==exit
outreg2 name_foreign  changer  using "../results/basic_regression_changer_foreignonly.xls", append dec(3) keep(name_foreign  changer)
restore

******************************************************************************************************
preserve
keep if name_foreign==0 | changer==1 

reg lsalary1 name_foreign  changer  age agesq exp expsq has_school i.year gworkplace_broad* if year==entry
outreg2  using "../results/basic_regression_changer_hunonly.xls", replace dec(3) keep(name_foreign  changer)
reg lsalary1 name_foreign  changer age agesq exp expsq has_school i.year gworkplace_broad* if year==exit
outreg2 name_foreign  changer  using "../results/basic_regression_changer_hunonly.xls", append dec(3) keep(name_foreign  changer)

reg lsalary_avg name_foreign  changer  age agesq exp expsq has_school i.year gworkplace_broad* if year==entry
outreg2 name_foreign  changer  using "../results/basic_regression_changer_hunonly.xls", append dec(3) keep(name_foreign  changer)
reg lsalary_avg name_foreign  changer age agesq exp expsq has_school i.year gworkplace_broad* if year==exit
outreg2 name_foreign  changer  using "../results/basic_regression_changer_hunonly.xls", append dec(3) keep(name_foreign  changer)

reg ltotal_salary name_foreign  changer age agesq exp expsq has_school i.year gworkplace_broad* if year==entry
outreg2 name_foreign  changer  using "../results/basic_regression_changer_hunonly.xls", append dec(3) keep(name_foreign  changer)
reg ltotal_salary name_foreign  changer age agesq exp expsq has_school i.year gworkplace_broad* if year==exit
outreg2 name_foreign  changer  using "../results/basic_regression_changer_hunonly.xls", append dec(3) keep(name_foreign  changer)

reg ltotal_salary_avg name_foreign  changer age agesq exp expsq has_school i.year gworkplace_broad* if year==entry
outreg2 name_foreign  changer  using "../results/basic_regression_changer_hunonly.xls", append dec(3) keep(name_foreign  changer)
reg ltotal_salary_avg name_foreign  changer age agesq exp expsq has_school i.year gworkplace_broad* if year==exit
outreg2 name_foreign  changer  using "../results/basic_regression_changer_hunonly.xls", append dec(3) keep(name_foreign  changer)

restore

*change in wage

reg d.lsalary1 name_foreign  changer  age agesq exp expsq has_school i.year gworkplace_broad*, vce(cluster idmaster)
outreg2  using "../results/basic_regression_changer_change.xls", replace dec(3) keep(name_foreign  changer)
reg d.lsalary1 name_foreign  changer age agesq exp expsq has_school i.year gworkplace_broad* , vce(cluster idmaster)
outreg2 name_foreign  changer  using "../results/basic_regression_changer_change.xls", append dec(3) keep(name_foreign  changer)

reg d.lsalary_avg name_foreign  changer  age agesq exp expsq has_school i.year gworkplace_broad*, vce(cluster idmaster)
outreg2 name_foreign  changer  using "../results/basic_regression_changer_change.xls", append dec(3) keep(name_foreign  changer)
reg d.lsalary_avg name_foreign  changer age agesq exp expsq has_school i.year gworkplace_broad* , vce(cluster idmaster)
outreg2 name_foreign  changer  using "../results/basic_regression_changer_change.xls", append dec(3) keep(name_foreign  changer)

reg d.ltotal_salary name_foreign  changer age agesq exp expsq has_school i.year gworkplace_broad* , vce(cluster idmaster)
outreg2 name_foreign  changer  using "../results/basic_regression_changer_change.xls", append dec(3) keep(name_foreign  changer)
reg d.ltotal_salary name_foreign  changer age agesq exp expsq has_school i.year gworkplace_broad* , vce(cluster idmaster)
outreg2 name_foreign  changer  using "../results/basic_regression_changer_change.xls", append dec(3) keep(name_foreign  changer)

reg d.ltotal_salary_avg name_foreign  changer age agesq exp expsq has_school i.year gworkplace_broad* , vce(cluster idmaster)
outreg2 name_foreign  changer  using "../results/basic_regression_changer_change.xls", append dec(3) keep(name_foreign  changer)
reg d.ltotal_salary_avg name_foreign  changer age agesq exp expsq has_school i.year gworkplace_broad* , vce(cluster idmaster)
outreg2 name_foreign  changer  using "../results/basic_regression_changer_change.xls", append dec(3) keep(name_foreign  changer)

****************************************************************************************************
reg lsalary1 name_foreign  changer change_1898 change_after age agesq exp expsq has_school i.year gworkplace_broad* if year==entry
outreg2 using "../results/basic_regression_1898.xls", replace dec(3) keep(name_foreign  changer change_1898 change_after)
reg lsalary1 name_foreign  changer change_1898 change_after age agesq exp expsq has_school i.year gworkplace_broad* if year==exit
outreg2 name_foreign  changer change_1898 change_after using "../results/basic_regression_1898.xls", append dec(3) keep(name_foreign  changer change_1898 change_after)

reg lsalary_avg name_foreign  changer change_1898 change_after age agesq exp expsq has_school i.year gworkplace_broad* if year==entry
outreg2 name_foreign  changer change_1898 change_after using "../results/basic_regression_1898.xls", append dec(3)  keep(name_foreign  changer change_1898 change_after)
reg lsalary_avg name_foreign  changer change_1898 change_after age agesq exp expsq has_school i.year gworkplace_broad* if year==exit
outreg2 name_foreign  changer change_1898 change_after using "../results/basic_regression_1898.xls", append dec(3)  keep(name_foreign  changer change_1898 change_after)

reg ltotal_salary name_foreign  changer change_1898 change_after age agesq exp expsq has_school i.year gworkplace_broad* if year==entry
outreg2 name_foreign  changer change_1898 change_after using "../results/basic_regression_1898.xls", append dec(3)  keep(name_foreign  changer change_1898 change_after)
reg ltotal_salary name_foreign  changer change_1898 change_after age agesq exp expsq has_school i.year gworkplace_broad* if year==exit
outreg2 name_foreign  changer change_1898 change_after using "../results/basic_regression_1898.xls", append dec(3)  keep(name_foreign  changer change_1898 change_after)

reg ltotal_salary_avg name_foreign  changer change_1898 change_after age agesq exp expsq has_school i.year gworkplace_broad* if year==entry
outreg2 name_foreign  changer change_1898 change_after using "../results/basic_regression_1898.xls", append dec(3)  keep(name_foreign  changer change_1898 change_after)
reg ltotal_salary_avg name_foreign  changer change_1898 change_after age agesq exp expsq has_school i.year gworkplace_broad* if year==exit
outreg2 name_foreign  changer change_1898 change_after using "../results/basic_regression_1898.xls", append dec(3)  keep(name_foreign  changer change_1898 change_after)

*****************************************************************************************************
 *gen change_pre=0
 *replace change_pre=1 if change_year<entryyear & changer==1 & entryyear<. & change_year<.
 *gen change_post=0
 replace change_post=1 if change_year>entryyear & changer==1 & entryyear<. & change_year<.
 
 ***compareing those who changed before entry and after entry 
 ***what to do whit those who changed name exactly in the year of entry: change_year==entryyear
 *1. drop them
 cap drop x
 gen x=0
 replace x=1 if change_year==entryyear & entryyear!=.
 
reg lsalary1 name_foreign  changer change_post age agesq exp expsq has_school i.year gworkplace_broad* if year==entry & x==0
outreg2  using "../results/basic_regression_prepost.xls", replace dec(3) keep(name_foreign changer change_post)
reg lsalary1 name_foreign  changer change_post age agesq exp expsq has_school i.year gworkplace_broad* if year==exit & x==0
outreg2 name_foreign changer change_post using "../results/basic_regression_prepost.xls", append dec(3) keep(name_foreign changer change_post)

reg lsalary_avg name_foreign  changer change_post age agesq exp expsq has_school i.year gworkplace_broad* if year==entry & x==0
outreg2 name_foreign changer change_post using "../results/basic_regression_prepost.xls", append dec(3) keep(name_foreign changer change_post)
reg lsalary_avg name_foreign  changer change_post age agesq exp expsq has_school i.year gworkplace_broad* if year==exit & x==0
outreg2 name_foreign changer change_post using "../results/basic_regression_prepost.xls", append dec(3) keep(name_foreign changer change_post)


reg ltotal_salary name_foreign  changer change_post age agesq exp expsq has_school i.year gworkplace_broad* if year==entry & x==0
outreg2 name_foreign changer change_post using "../results/basic_regression_prepost.xls", append dec(3) keep(name_foreign changer change_post)
reg ltotal_salary name_foreign  changer change_post age agesq exp expsq has_school i.year gworkplace_broad* if year==exit & x==0
outreg2 name_foreign changer change_post using "../results/basic_regression_prepost.xls", append dec(3) keep(name_foreign changer change_post)

reg ltotal_salary_avg name_foreign  changer change_post age agesq exp expsq has_school i.year gworkplace_broad* if year==entry & x==0
outreg2 name_foreign changer change_post using "../results/basic_regression_prepost.xls", append dec(3) keep(name_foreign changer change_post)
reg ltotal_salary_avg name_foreign  changer change_post age agesq exp expsq has_school i.year gworkplace_broad* if year==exit & x==0
outreg2 name_foreign changer change_post using "../results/basic_regression_prepost.xls", append dec(3) keep(name_foreign changer change_post)

 *2. they are most probably changig their name due to the job, so lets consider them as post changer
 cap drop change_post2
 gen change_post2=change_post
 replace change_post2=1 if change_year==entryyear & entryyear!=.

reg lsalary1 name_foreign  changer change_post2 age agesq exp expsq has_school i.year gworkplace_broad* if year==entry 
outreg2 name_foreign changer change_post2 using "../results/basic_regression_prepost.xls", append dec(3) keep(name_foreign changer change_post2 )
reg lsalary1 name_foreign  changer change_post2 age agesq exp expsq has_school i.year gworkplace_broad* if year==exit 
outreg2 name_foreign changer change_post2 using "../results/basic_regression_prepost.xls", append dec(3) keep(name_foreign changer change_post2 )

reg lsalary_avg name_foreign  changer change_post2 age agesq exp expsq has_school i.year gworkplace_broad* if year==entry 
outreg2 name_foreign changer change_post2 using "../results/basic_regression_prepost.xls", append dec(3) keep(name_foreign changer change_post2 )
reg lsalary_avg name_foreign  changer change_post2 age agesq exp expsq has_school i.year gworkplace_broad* if year==exit 
outreg2 name_foreign changer change_post2 using "../results/basic_regression_prepost.xls", append dec(3) keep(name_foreign changer change_post2 )


reg ltotal_salary name_foreign  changer change_post2 age agesq exp expsq has_school i.year gworkplace_broad* if year==entry 
outreg2 name_foreign changer change_post2 using "../results/basic_regression_prepost.xls", append dec(3) keep(name_foreign changer change_post2 )
reg ltotal_salary name_foreign  changer change_post2 age agesq exp expsq has_school i.year gworkplace_broad* if year==exit 
outreg2 name_foreign changer change_post2 using "../results/basic_regression_prepost.xls", append dec(3) keep(name_foreign changer change_post2 )
 
reg ltotal_salary_avg name_foreign  changer change_post2 age agesq exp expsq has_school i.year gworkplace_broad* if year==entry 
outreg2 name_foreign changer change_post2 using "../results/basic_regression_prepost.xls", append dec(3) keep(name_foreign changer change_post2 )
reg ltotal_salary_avg name_foreign  changer change_post2 age agesq exp expsq has_school i.year gworkplace_broad* if year==exit 
outreg2 name_foreign changer change_post2 using "../results/basic_regression_prepost.xls", append dec(3) keep(name_foreign changer change_post2 )
 
 
*IV
preserve
keep if name_foreign==1
keep if year==exit

ivregress gmm lsalary1 age agesq exp expsq has_school i.year gworkplace_broad* (changer=unchanged_scrab unchanged_scrab2), rob first  
outreg2 using "../results/iv_sq.xls", replace dec(3) keep(changer )

ivregress gmm lsalary_avg age agesq exp expsq has_school i.year gworkplace_broad* (changer=unchanged_scrab unchanged_scrab2), rob first  
outreg2 changer using "../results/iv_sq.xls", append dec(3)  keep(changer )

ivregress gmm ltotal_salary age agesq exp expsq has_school i.year gworkplace_broad* (changer=unchanged_scrab unchanged_scrab2), rob first  
outreg2 changer using "../results/iv_sq.xls", append dec(3)  keep(changer )

ivregress gmm ltotal_salary_avg age agesq exp expsq has_school i.year gworkplace_broad* (changer=unchanged_scrab unchanged_scrab2), rob first  
outreg2 changer using "../results/iv_sq.xls", append dec(3)  keep(changer )


ivregress gmm lsalary1 age agesq exp expsq has_school i.year gworkplace_broad* (changer=unchanged_scrab), rob first  
outreg2 changer using "../results/iv.xls", replace dec(3)  keep(changer )

ivregress gmm lsalary_avg age agesq exp expsq has_school i.year gworkplace_broad* (changer=unchanged_scrab), rob first  
outreg2 changer using "../results/iv.xls", append dec(3)  keep(changer )

ivregress gmm ltotal_salary age agesq exp expsq has_school i.year gworkplace_broad* (changer=unchanged_scrab), rob first  
outreg2 changer using "../results/iv.xls", append dec(3)  keep(changer )

ivregress gmm ltotal_salary_avg age agesq exp expsq has_school i.year gworkplace_broad* (changer=unchanged_scrab), rob first  
outreg2 changer using "../results/iv.xls", append dec(3)  keep(changer )
restore 

*IV SHORT 
preserve
keep if name_foreign==1
keep if year==exit

ivregress gmm lsalary1  i.year  (changer=unchanged_scrab unchanged_scrab2), rob first  
outreg2 using "../results/iv_sq_short.xls", replace dec(3) keep(changer )

ivregress gmm lsalary_avg  i.year  (changer=unchanged_scrab unchanged_scrab2), rob first  
outreg2 changer using "../results/iv_sq_short.xls", append dec(3)  keep(changer )

ivregress gmm ltotal_salary  i.year  (changer=unchanged_scrab unchanged_scrab2), rob first  
outreg2 changer using "../results/iv_sq_short.xls", append dec(3)  keep(changer )

ivregress gmm ltotal_salary_avg  i.year  (changer=unchanged_scrab unchanged_scrab2), rob first  
outreg2 changer using "../results/iv_sq_short.xls", append dec(3)  keep(changer )


ivregress gmm lsalary1  i.year  (changer=unchanged_scrab), rob first  
outreg2 changer using "../results/iv_short.xls", replace dec(3)  keep(changer )

ivregress gmm lsalary_avg  i.year  (changer=unchanged_scrab), rob first  
outreg2 changer using "../results/iv_short.xls", append dec(3)  keep(changer )

ivregress gmm ltotal_salary  i.year  (changer=unchanged_scrab), rob first  
outreg2 changer using "../results/iv_short.xls", append dec(3)  keep(changer )

ivregress gmm ltotal_salary_avg  i.year  (changer=unchanged_scrab), rob first  
outreg2 changer using "../results/iv_short.xls", append dec(3)  keep(changer )
restore 


*PLACEBO
preserve
keep if name_foreign==0
keep if year==exit

regress lsalary1 age agesq exp expsq has_school i.year gworkplace_broad* unchanged_scrab unchanged_scrab2 if year==exit, rob  
outreg2 using "../results/placebo_sq.xls", replace dec(3) keep(unchanged_scrab unchanged_scrab2 )

regress lsalary_avg age agesq exp expsq has_school i.year gworkplace_broad* unchanged_scrab unchanged_scrab2 if year==exit, rob 
outreg2 using "../results/placebo_sq.xls", append dec(3)  keep(unchanged_scrab unchanged_scrab2 )


regress ltotal_salary age agesq exp expsq has_school i.year gworkplace_broad* unchanged_scrab unchanged_scrab2 if year==exit, rob 
outreg2  using "../results/placebo_sq.xls", append dec(3)  keep(unchanged_scrab unchanged_scrab2 )


regress ltotal_salary_avg age agesq exp expsq has_school i.year gworkplace_broad* unchanged_scrab unchanged_scrab2 if year==exit, rob  
outreg2  using "../results/placebo_sq.xls", append dec(3)  keep(unchanged_scrab unchanged_scrab2 )




regress lsalary1 age agesq exp expsq has_school i.year gworkplace_broad* unchanged_scrab  if year==exit , rob  
outreg2  using "../results/placebo.xls", replace dec(3) keep(unchanged_scrab unchanged_scrab2 )

regress lsalary_avg age agesq exp expsq has_school i.year gworkplace_broad* unchanged_scrab   if year==exit, rob 
outreg2 using "../results/placebo.xls", append dec(3) keep(unchanged_scrab unchanged_scrab2 )

regress ltotal_salary age agesq exp expsq has_school i.year gworkplace_broad* unchanged_scrab  if year==exit , rob 
outreg2 using "../results/placebo.xls", append dec(3) keep(unchanged_scrab unchanged_scrab2 )

regress ltotal_salary_avg age agesq exp expsq has_school i.year gworkplace_broad* unchanged_scrab  if year==exit , rob  
outreg2  using "../results/placebo.xls", append dec(3) keep(unchanged_scrab unchanged_scrab2 )

restore


*** winsorize*********************************************************************************************************************

cap drop wins_*

foreach v of varlist lsalary1 ltotal_salary ltotal_salary_avg lsalary_avg {

winsor `v', gen(wins_`v') p(0.025)

}


reg wins_lsalary1 age agesq exp expsq has_school i.year gworkplace_broad* if year==entry
outreg2 using "..\results/basic_regression_wins.xls", replace dec(3)
reg wins_lsalary1 age agesq exp expsq has_school i.year gworkplace_broad* if year==exit
outreg2 using "../results/basic_regression_wins.xls", append dec(3)

reg wins_lsalary_avg age agesq exp expsq has_school i.year gworkplace_broad* if year==entry
outreg2 using "..\results/basic_regression_wins.xls", append dec(3)
reg wins_lsalary_avg age agesq exp expsq has_school i.year gworkplace_broad* if year==exit
outreg2 using "../results/basic_regression_wins.xls", append dec(3)

reg wins_ltotal_salary age agesq exp expsq has_school i.year gworkplace_broad* if year==entry
outreg2 using "../results/basic_regression_wins.xls", append dec(3)
reg wins_ltotal_salary age agesq exp expsq has_school i.year gworkplace_broad* if year==exit
outreg2 using "../results/basic_regression_wins.xls", append dec(3)

reg wins_ltotal_salary_avg age agesq exp expsq has_school i.year gworkplace_broad* if year==entry
outreg2 using "../results/basic_regression_wins.xls", append dec(3)
reg wins_ltotal_salary_avg age agesq exp expsq has_school i.year gworkplace_broad* if year==exit
outreg2 using "../results/basic_regression_wins.xls", append dec(3)

******************************************************************************************************
reg wins_lsalary1 name_foreign  changer  age agesq exp expsq has_school i.year gworkplace_broad* if year==entry
outreg2  using "../results/basic_regression_changer_wins.xls", replace dec(3) keep(name_foreign  changer)
reg wins_lsalary1 name_foreign  changer age agesq exp expsq has_school i.year gworkplace_broad* if year==exit
outreg2 name_foreign  changer  using "../results/basic_regression_changer_wins.xls", append dec(3) keep(name_foreign  changer)

reg wins_lsalary_avg name_foreign  changer  age agesq exp expsq has_school i.year gworkplace_broad* if year==entry
outreg2 name_foreign  changer  using "../results/basic_regression_changer_wins.xls", append dec(3) keep(name_foreign  changer)
reg wins_lsalary_avg name_foreign  changer age agesq exp expsq has_school i.year gworkplace_broad* if year==exit
outreg2 name_foreign  changer  using "../results/basic_regression_changer_wins.xls", append dec(3) keep(name_foreign  changer)

reg wins_ltotal_salary name_foreign  changer age agesq exp expsq has_school i.year gworkplace_broad* if year==entry
outreg2 name_foreign  changer  using "../results/basic_regression_changer_wins.xls", append dec(3) keep(name_foreign  changer)
reg wins_ltotal_salary name_foreign  changer age agesq exp expsq has_school i.year gworkplace_broad* if year==exit
outreg2 name_foreign  changer  using "../results/basic_regression_changer_wins.xls", append dec(3) keep(name_foreign  changer)

reg wins_ltotal_salary_avg name_foreign  changer age agesq exp expsq has_school i.year gworkplace_broad* if year==entry
outreg2 name_foreign  changer  using "../results/basic_regression_changer_wins.xls", append dec(3) keep(name_foreign  changer)
reg wins_ltotal_salary_avg name_foreign  changer age agesq exp expsq has_school i.year gworkplace_broad* if year==exit
outreg2 name_foreign  changer  using "../results/basic_regression_changer_wins.xls", append dec(3) keep(name_foreign  changer)


****************************************************************************************************
reg wins_lsalary1 name_foreign  changer change_1898 change_after age agesq exp expsq has_school i.year gworkplace_broad* if year==entry
outreg2 using "../results/basic_regression_1898_wins.xls", replace dec(3) keep(name_foreign  changer change_1898 change_after)
reg wins_lsalary1 name_foreign  changer change_1898 change_after age agesq exp expsq has_school i.year gworkplace_broad* if year==exit
outreg2 name_foreign  changer change_1898 change_after using "../results/basic_regression_1898_wins.xls", append dec(3) keep(name_foreign  changer change_1898 change_after)

reg wins_lsalary_avg name_foreign  changer change_1898 change_after age agesq exp expsq has_school i.year gworkplace_broad* if year==entry
outreg2 name_foreign  changer change_1898 change_after using "../results/basic_regression_1898_wins.xls", append dec(3)  keep(name_foreign  changer change_1898 change_after)
reg wins_lsalary_avg name_foreign  changer change_1898 change_after age agesq exp expsq has_school i.year gworkplace_broad* if year==exit
outreg2 name_foreign  changer change_1898 change_after using "../results/basic_regression_1898_wins.xls", append dec(3)  keep(name_foreign  changer change_1898 change_after)

reg wins_ltotal_salary name_foreign  changer change_1898 change_after age agesq exp expsq has_school i.year gworkplace_broad* if year==entry
outreg2 name_foreign  changer change_1898 change_after using "../results/basic_regression_1898_wins.xls", append dec(3)  keep(name_foreign  changer change_1898 change_after)
reg wins_ltotal_salary name_foreign  changer change_1898 change_after age agesq exp expsq has_school i.year gworkplace_broad* if year==exit
outreg2 name_foreign  changer change_1898 change_after using "../results/basic_regression_1898_wins.xls", append dec(3)  keep(name_foreign  changer change_1898 change_after)

reg wins_ltotal_salary_avg name_foreign  changer change_1898 change_after age agesq exp expsq has_school i.year gworkplace_broad* if year==entry
outreg2 name_foreign  changer change_1898 change_after using "../results/basic_regression_1898_wins.xls", append dec(3)  keep(name_foreign  changer change_1898 change_after)
reg wins_ltotal_salary_avg name_foreign  changer change_1898 change_after age agesq exp expsq has_school i.year gworkplace_broad* if year==exit
outreg2 name_foreign  changer change_1898 change_after using "../results/basic_regression_1898_wins.xls", append dec(3)  keep(name_foreign  changer change_1898 change_after)

*****************************************************************************************************
 *gen change_pre=0
 *replace change_pre=1 if change_year<entryyear & changer==1 & entryyear<. & change_year<.
 *gen change_post=0
 replace change_post=1 if change_year>entryyear & changer==1 & entryyear<. & change_year<.
 
 ***compareing those who changed before entry and after entry 
 ***what to do whit those who changed name exactly in the year of entry: change_year==entryyear
 *1. drop them
 cap drop x
 gen x=0
 replace x=1 if change_year==entryyear & entryyear!=.
 
reg wins_lsalary1 name_foreign  changer change_post age agesq exp expsq has_school i.year gworkplace_broad* if year==entry & x==0
outreg2  using "../results/basic_regression_prepost_wins.xls", replace dec(3) keep(name_foreign changer change_post)
reg wins_lsalary1 name_foreign  changer change_post age agesq exp expsq has_school i.year gworkplace_broad* if year==exit & x==0
outreg2 name_foreign changer change_post using "../results/basic_regression_prepost_wins.xls", append dec(3) keep(name_foreign changer change_post)

reg wins_lsalary_avg name_foreign  changer change_post age agesq exp expsq has_school i.year gworkplace_broad* if year==entry & x==0
outreg2 name_foreign changer change_post using "../results/basic_regression_prepost_wins.xls", append dec(3) keep(name_foreign changer change_post)
reg wins_lsalary_avg name_foreign  changer change_post age agesq exp expsq has_school i.year gworkplace_broad* if year==exit & x==0
outreg2 name_foreign changer change_post using "../results/basic_regression_prepost_wins.xls", append dec(3) keep(name_foreign changer change_post)


reg wins_ltotal_salary name_foreign  changer change_post age agesq exp expsq has_school i.year gworkplace_broad* if year==entry & x==0
outreg2 name_foreign changer change_post using "../results/basic_regression_prepost_wins.xls", append dec(3) keep(name_foreign changer change_post)
reg wins_ltotal_salary name_foreign  changer change_post age agesq exp expsq has_school i.year gworkplace_broad* if year==exit & x==0
outreg2 name_foreign changer change_post using "../results/basic_regression_prepost_wins.xls", append dec(3) keep(name_foreign changer change_post)

reg wins_ltotal_salary_avg name_foreign  changer change_post age agesq exp expsq has_school i.year gworkplace_broad* if year==entry & x==0
outreg2 name_foreign changer change_post using "../results/basic_regression_prepost_wins.xls", append dec(3) keep(name_foreign changer change_post)
reg wins_ltotal_salary_avg name_foreign  changer change_post age agesq exp expsq has_school i.year gworkplace_broad* if year==exit & x==0
outreg2 name_foreign changer change_post using "../results/basic_regression_prepost_wins.xls", append dec(3) keep(name_foreign changer change_post)

 *2. they are most probably changig their name due to the job, so lets consider them as post changer
 cap drop change_post2
 gen change_post2=change_post
 replace change_post2=1 if change_year==entryyear & entryyear!=.

reg wins_lsalary1 name_foreign  changer change_post2 age agesq exp expsq has_school i.year gworkplace_broad* if year==entry 
outreg2 name_foreign changer change_post2 using "../results/basic_regression_prepost_wins.xls", append dec(3) keep(name_foreign changer change_post2 )
reg wins_lsalary1 name_foreign  changer change_post2 age agesq exp expsq has_school i.year gworkplace_broad* if year==exit 
outreg2 name_foreign changer change_post2 using "../results/basic_regression_prepost_wins.xls", append dec(3) keep(name_foreign changer change_post2 )

reg wins_lsalary_avg name_foreign  changer change_post2 age agesq exp expsq has_school i.year gworkplace_broad* if year==entry 
outreg2 name_foreign changer change_post2 using "../results/basic_regression_prepost_wins.xls", append dec(3) keep(name_foreign changer change_post2 )
reg wins_lsalary_avg name_foreign  changer change_post2 age agesq exp expsq has_school i.year gworkplace_broad* if year==exit 
outreg2 name_foreign changer change_post2 using "../results/basic_regression_prepost_wins.xls", append dec(3) keep(name_foreign changer change_post2 )


reg wins_ltotal_salary name_foreign  changer change_post2 age agesq exp expsq has_school i.year gworkplace_broad* if year==entry 
outreg2 name_foreign changer change_post2 using "../results/basic_regression_prepost_wins.xls", append dec(3) keep(name_foreign changer change_post2 )
reg wins_ltotal_salary name_foreign  changer change_post2 age agesq exp expsq has_school i.year gworkplace_broad* if year==exit 
outreg2 name_foreign changer change_post2 using "../results/basic_regression_prepost_wins.xls", append dec(3) keep(name_foreign changer change_post2 )
 
reg wins_ltotal_salary_avg name_foreign  changer change_post2 age agesq exp expsq has_school i.year gworkplace_broad* if year==entry 
outreg2 name_foreign changer change_post2 using "../results/basic_regression_prepost_wins.xls", append dec(3) keep(name_foreign changer change_post2 )
reg wins_ltotal_salary_avg name_foreign  changer change_post2 age agesq exp expsq has_school i.year gworkplace_broad* if year==exit 
outreg2 name_foreign changer change_post2 using "../results/basic_regression_prepost_wins.xls", append dec(3) keep(name_foreign changer change_post2 )
 
 
*IV
preserve
*keep if name_foreign==1
keep if year==exit

ivregress gmm wins_lsalary1 age agesq exp expsq has_school i.year gworkplace_broad* (changer=unchanged_scrab unchanged_scrab2), rob first  
outreg2 using "../results/iv_sq_wins.xls", replace dec(3) keep(changer )

ivregress gmm wins_lsalary_avg age agesq exp expsq has_school i.year gworkplace_broad* (changer=unchanged_scrab unchanged_scrab2), rob first  
outreg2 changer using "../results/iv_sq_wins.xls", append dec(3)  keep(changer )

ivregress gmm wins_ltotal_salary age agesq exp expsq has_school i.year gworkplace_broad* (changer=unchanged_scrab unchanged_scrab2), rob first  
outreg2 changer using "../results/iv_sq_wins.xls", append dec(3)  keep(changer )

ivregress gmm wins_ltotal_salary_avg age agesq exp expsq has_school i.year gworkplace_broad* (changer=unchanged_scrab unchanged_scrab2), rob first  
outreg2 changer using "../results/iv_sq_wins.xls", append dec(3)  keep(changer )


ivregress gmm wins_lsalary1 age agesq exp expsq has_school i.year gworkplace_broad* (changer=unchanged_scrab), rob first  
outreg2 changer using "../results/iv_wins.xls", replace dec(3)  keep(changer )

ivregress gmm wins_lsalary_avg age agesq exp expsq has_school i.year gworkplace_broad* (changer=unchanged_scrab), rob first  
outreg2 changer using "../results/iv_wins.xls", append dec(3)  keep(changer )

ivregress gmm wins_ltotal_salary age agesq exp expsq has_school i.year gworkplace_broad* (changer=unchanged_scrab), rob first  
outreg2 changer using "../results/iv_wins.xls", append dec(3)  keep(changer )

ivregress gmm wins_ltotal_salary_avg age agesq exp expsq has_school i.year gworkplace_broad* (changer=unchanged_scrab), rob first  
outreg2 changer using "../results/iv_wins.xls", append dec(3)  keep(changer )
restore 



*PLACEBO
preserve
keep if name_foreign==0
keep if year==exit

regress wins_lsalary1 age agesq exp expsq has_school i.year gworkplace_broad* unchanged_scrab unchanged_scrab2 if year==exit, rob  
outreg2 using "../results/placebo_sq_wins.xls", replace dec(3) keep(unchanged_scrab unchanged_scrab2 )

regress wins_lsalary_avg age agesq exp expsq has_school i.year gworkplace_broad* unchanged_scrab unchanged_scrab2 if year==exit, rob 
outreg2 using "../results/placebo_sq_wins.xls", append dec(3)  keep(unchanged_scrab unchanged_scrab2 )


regress wins_ltotal_salary age agesq exp expsq has_school i.year gworkplace_broad* unchanged_scrab unchanged_scrab2 if year==exit, rob 
outreg2  using "../results/placebo_sq_wins.xls", append dec(3)  keep(unchanged_scrab unchanged_scrab2 )


regress wins_ltotal_salary_avg age agesq exp expsq has_school i.year gworkplace_broad* unchanged_scrab unchanged_scrab2 if year==exit, rob  
outreg2  using "../results/placebo_sq_wins.xls", append dec(3)  keep(unchanged_scrab unchanged_scrab2 )




regress wins_lsalary1 age agesq exp expsq has_school i.year gworkplace_broad* unchanged_scrab  if year==exit , rob  
outreg2  using "../results/placebo_wins.xls", replace dec(3) keep(unchanged_scrab unchanged_scrab2 )

regress wins_lsalary_avg age agesq exp expsq has_school i.year gworkplace_broad* unchanged_scrab   if year==exit, rob 
outreg2 using "../results/placebo_wins.xls", append dec(3) keep(unchanged_scrab unchanged_scrab2 )

regress wins_ltotal_salary age agesq exp expsq has_school i.year gworkplace_broad* unchanged_scrab  if year==exit , rob 
outreg2 using "../results/placebo_wins.xls", append dec(3) keep(unchanged_scrab unchanged_scrab2 )

regress wins_ltotal_salary_avg age agesq exp expsq has_school i.year gworkplace_broad* unchanged_scrab  if year==exit , rob  
outreg2  using "../results/placebo_wins.xls", append dec(3) keep(unchanged_scrab unchanged_scrab2 )

restore






drop gworkplace_broad*
tab workplace_broad, gen(gworkplace_broad)



