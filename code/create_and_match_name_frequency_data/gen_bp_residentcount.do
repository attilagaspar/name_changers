import delimited D:\Attila\browser_automation\bp_lakcimjegyzek_1896.txt, encoding(UTF-8)  clear
keep v2
split v2, gen(name)
keep name1
rename name1 name
gen c=1
gen key=name
do gen_matchkey.do
collapse (sum) c (first)name_key=name, by(key)
gen idusing=_n
save "D:\Attila\browser_automation\bp_names.dta", replace


