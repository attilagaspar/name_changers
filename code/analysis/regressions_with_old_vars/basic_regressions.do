* basic regressions


* changers OLS
* controls yes/no
* sample has_changer yes/no
* SE rob, cluster 1, cluster 2
set more off

cap rm basic_regs.xls
cap rm basic_regs.txt
cap egen wpb=group(workplace_broad)
local controls=" js2 age agesq exp expsq has_school i.year gworkplace_broad* "

reg lsalary1 changer if year==exit,rob
outreg2 using basic_regs.xls, append ctitle("OLS") keep(changer) addtext(SE, Robust, Controls, No, Sample, Unrestricted)
reg lsalary1 changer if year==exit,vce (cluster idmaster) 
outreg2 using basic_regs.xls, append ctitle("OLS") keep(changer) addtext(SE, cluster:person, Controls, No, Sample, Unrestricted)
reg lsalary1 changer if year==exit,vce (cluster workplace_broad) 
outreg2 using basic_regs.xls, append ctitle("OLS") keep(changer) addtext(SE, cluster:workplace, Controls, No, Sample, Unrestricted)
reg lsalary1 changer if year==exit & has_changer==1,rob
outreg2 using basic_regs.xls, append ctitle("OLS") keep(changer) addtext(SE, Robust, Controls, No, Sample, Restricted)
reg lsalary1 changer if year==exit & has_changer==1,vce (cluster idmaster)
outreg2 using basic_regs.xls, append ctitle("OLS") keep(changer) addtext(SE, cluster:person, Controls, No, Sample, Restricted)
reg lsalary1 changer if year==exit & has_changer==1,vce (cluster wpb)
outreg2 using basic_regs.xls, append ctitle("OLS") keep(changer) addtext(SE, cluster:workplace, Controls, No, Sample, Restricted)


reg lsalary1 changer `controls' if year==exit ,rob
outreg2 using basic_regs.xls, append ctitle("OLS") keep(changer) addtext(SE, Robust, Controls, Yes, Sample, Unrestricted)
reg lsalary1 changer `controls' if year==exit ,vce (cluster idmaster)
outreg2 using basic_regs.xls, append ctitle("OLS") keep(changer) addtext(SE, cluster:person, Controls, Yes, Sample, Unrestricted)
reg lsalary1 changer `controls' if year==exit ,vce (cluster wpb)
outreg2 using basic_regs.xls, append ctitle("OLS") keep(changer) addtext(SE, cluster:workplace, Controls, Yes, Sample, Unrestricted)

reg lsalary1 changer `controls' if year==exit  & has_changer==1,rob 
outreg2 using basic_regs.xls, append ctitle("OLS") keep(changer) addtext(SE, Robust, Controls, Yes, Sample, Restricted)
reg lsalary1 changer `controls' if year==exit  & has_changer==1,vce (cluster idmaster) 
outreg2 using basic_regs.xls, append ctitle("OLS") keep(changer) addtext(SE, cluster:person, Controls, Yes, Sample, Restricted)
reg lsalary1 changer `controls' if year==exit  & has_changer==1,vce (cluster wpb)
outreg2 using basic_regs.xls, append ctitle("OLS") keep(changer) addtext(SE, cluster:workplace, Controls, Yes, Sample, Restricted)


ivregress gmm lsalary1 (changer=scr1)if year==exit,rob 
outreg2 using basic_regs.xls, append ctitle("IV") keep(changer) addtext(SE, Robust, Controls, No, Sample, Unrestricted)
ivregress gmm lsalary1 (changer=scr1)if year==exit,vce (cluster idmaster)
outreg2 using basic_regs.xls, append ctitle("IV") keep(changer) addtext(SE, cluster:person, Controls, No, Sample, Unrestricted)
ivregress gmm lsalary1 (changer=scr1)if year==exit,vce (cluster wpb)
outreg2 using basic_regs.xls, append ctitle("IV") keep(changer) addtext(SE, cluster:workplace, Controls, No, Sample, Unrestricted)

ivregress gmm lsalary1 (changer=scr1)if year==exit & has_changer==1,rob
outreg2 using basic_regs.xls, append ctitle("IV") keep(changer) addtext(SE, Robust, Controls, No, Sample, Restricted)
ivregress gmm lsalary1 (changer=scr1)if year==exit & has_changer==1,vce (cluster idmaster)
outreg2 using basic_regs.xls, append ctitle("IV") keep(changer) addtext(SE, cluster:person, Controls, No, Sample, Restricted)
ivregress gmm lsalary1 (changer=scr1)if year==exit & has_changer==1,vce (cluster wpb)
outreg2 using basic_regs.xls, append ctitle("IV") keep(changer) addtext(SE, cluster:workplace, Controls, No, Sample, Restricted)

ivregress gmm lsalary1 (changer=scr1) `controls' if year==exit ,rob
outreg2 using basic_regs.xls, append ctitle("IV") keep(changer) addtext(SE, Robust, Controls, Yes, Sample, Unrestricted)
ivregress gmm lsalary1 (changer=scr1) `controls' if year==exit ,vce (cluster idmaster)
outreg2 using basic_regs.xls, append ctitle("IV") keep(changer) addtext(SE, cluster:person, Controls, Yes, Sample, Unrestricted)
*ivregress gmm lsalary1 (changer=scr1) `controls' if year==exit ,vce (cluster wpb)
*outreg2 using basic_regs.xls, append ctitle("IV") keep(changer)

ivregress gmm lsalary1 (changer=scr1) `controls' if year==exit & has_changer==1,rob
outreg2 using basic_regs.xls, append ctitle("IV") keep(changer) addtext(SE, Robust, Controls, Yes, Sample, Restricted)
ivregress gmm lsalary1 (changer=scr1) `controls' if year==exit & has_changer==1,vce (cluster idmaster)
outreg2 using basic_regs.xls, append ctitle("IV") keep(changer) addtext(SE, cluster:person, Controls, Yes, Sample, Restricted)
*ivregress gmm lsalary1 (changer=scr1) `controls' if year==exit & has_changer==1,vce (cluster wpb)
*outreg2 using basic_regs.xls, append ctitle("IV") keep(changer)

