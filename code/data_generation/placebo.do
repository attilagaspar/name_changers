* placebo
set more off
cap rm placebo.xls
cap rm placebo.txt

local controls="age agesq exp expsq has_school i.year gworkplace_broad* "

reg lsalary1 scr1 if year==exit & has_changer==0,rob
outreg2 using placebo.xls, append ctitle("PLACEBO") keep(scr1) addtext(SE, cluster:rob, Controls, No, Placebo, No changers)
reg lsalary1 scr1 if year==exit & has_changer==0,vce (cluster idmaster)
outreg2 using placebo.xls, append ctitle("PLACEBO") keep(scr1) addtext(SE, cluster:id, Controls, No, Placebo, No changers)
reg lsalary1 scr1 if year==exit & has_changer==0,vce (cluster wpb)
outreg2 using placebo.xls, append ctitle("PLACEBO") keep(scr1) addtext(SE, cluster:workplace, Controls, No, Placebo, No changers)

reg lsalary1 scr1 `controls' if year==exit  & has_changer==0,rob
outreg2 using placebo.xls, append ctitle("PLACEBO") keep(scr1) addtext(SE, cluster:rob, Controls, Yes, Placebo, No changers)
reg lsalary1 scr1 `controls' if year==exit  & has_changer==0,vce (cluster idmaster)
outreg2 using placebo.xls, append ctitle("PLACEBO") keep(scr1) addtext(SE, cluster:id, Controls, Yes, Placebo, No changers)
reg lsalary1 scr1 `controls' if year==exit  & has_changer==0,vce (cluster wpb)
outreg2 using placebo.xls, append ctitle("PLACEBO") keep(scr1) addtext(SE, cluster:workplace, Controls, Yes, Placebo, No changers)

reg lsalary1 scr1 if year==exit & js2==0,rob
outreg2 using placebo.xls, append ctitle("PLACEBO") keep(scr1) addtext(SE, cluster:rob, Controls, No, Placebo, js2=0 )
reg lsalary1 scr1 if year==exit & js2==0,vce (cluster idmaster)
outreg2 using placebo.xls, append ctitle("PLACEBO") keep(scr1) addtext(SE, cluster:id, Controls, No, Placebo, js2=0 )
reg lsalary1 scr1 if year==exit & js2==0,vce (cluster wpb)
outreg2 using placebo.xls, append ctitle("PLACEBO") keep(scr1) addtext(SE, cluster:workplace, Controls, No, Placebo, js2=0 )

reg lsalary1 scr1 `controls' if year==exit  & js2==0,rob
outreg2 using placebo.xls, append ctitle("PLACEBO") keep(scr1) addtext(SE, cluster:rob, Controls, Yes, Placebo, js2=0 )
reg lsalary1 scr1 `controls' if year==exit  & js2==0,vce (cluster idmaster)
outreg2 using placebo.xls, append ctitle("PLACEBO") keep(scr1) addtext(SE, cluster:id, Controls, Yes, Placebo, js2=0 )
reg lsalary1 scr1 `controls' if year==exit  & js2==0,vce (cluster wpb)
outreg2 using placebo.xls, append ctitle("PLACEBO") keep(scr1) addtext(SE, cluster:workplace, Controls, Yes, Placebo, js2=0 )

reg lsalary1 scr1 if year==exit & js2<0.1,rob
outreg2 using placebo.xls, append ctitle("PLACEBO") keep(scr1) addtext(SE, cluster:rob, Controls, No, Placebo, js2<0.1 )
reg lsalary1 scr1 if year==exit & js2<0.1,vce (cluster idmaster)
outreg2 using placebo.xls, append ctitle("PLACEBO") keep(scr1) addtext(SE, cluster:id, Controls, No, Placebo, js2<0.1 )
reg lsalary1 scr1 if year==exit & js2<0.1,vce (cluster wpb)
outreg2 using placebo.xls, append ctitle("PLACEBO") keep(scr1) addtext(SE, cluster:workplace, Controls, No, Placebo, js2<0.1 )

reg lsalary1 scr1 `controls' if year==exit  & js2<0.1,rob
outreg2 using placebo.xls, append ctitle("PLACEBO") keep(scr1) addtext(SE, cluster:rob, Controls, Yes, Placebo, js2<0.1 )
reg lsalary1 scr1 `controls' if year==exit  & js2<0.1,vce (cluster idmaster)
outreg2 using placebo.xls, append ctitle("PLACEBO") keep(scr1) addtext(SE, cluster:id, Controls, Yes, Placebo, js2<0.1 )
reg lsalary1 scr1 `controls' if year==exit  & js2<0.1,vce (cluster wpb)
outreg2 using placebo.xls, append ctitle("PLACEBO") keep(scr1) addtext(SE, cluster:workplace, Controls, Yes, Placebo, js2<0.1 )


