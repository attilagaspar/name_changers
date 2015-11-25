import delimited D:\Attila\browser_automation\namelist_updated.csv, encoding(UTF-8) clear 
rename n1 name
rename fnf count
gen id=string(sorszam)
tempfile l
save `l'

import delimited D:\Attila\browser_automation\namelist_oldnames_updated.csv, encoding(UTF-8) clear
rename v1 id
rename v2 name
rename v3 count

append using `l'

keep if count>0
duplicates drop name, force

keep id name

export delimited using "D:\Attila\browser_automation\namelist_changersonly.csv", replace
