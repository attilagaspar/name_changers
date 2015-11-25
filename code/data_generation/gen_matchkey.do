
replace key=subinstr(key,"Á", "á", 1) if substr(key,1,2)=="Á"
replace key=subinstr(key,"É", "é", 1) if substr(key,1,2)=="É"
replace key=subinstr(key,"Í", "í", 1) if substr(key,1,2)=="Í"
replace key=subinstr(key,"Ö", "ö", 1) if substr(key,1,2)=="Ö"
replace key=subinstr(key,"Ő", "ő", 1) if substr(key,1,2)=="Ő"
replace key=subinstr(key,"Õ", "ő", 1) if substr(key,1,2)=="Õ"

replace key=subinstr(key,"Ü", "ü", 1) if substr(key,1,2)=="Ü"
replace key=subinstr(key,"Ű", "ű", 1) if substr(key,1,2)=="Ű"
replace key=subinstr(key,"Ú", "ú", 1) if substr(key,1,2)=="Ú"
replace key=subinstr(key,"Ó", "ó", 1) if substr(key,1,2)=="Ó"

replace key=lower(key)

replace key = subinstr(key, "á", "a", .)
replace key = subinstr(key, "ä", "a", .)
replace key = subinstr(key, "é", "e", .)
replace key = subinstr(key, "ó", "o", .)
replace key = subinstr(key, "ö", "o", .)
replace key = subinstr(key, "ő", "o", .)
replace key = subinstr(key, "ü", "u", .)
replace key = subinstr(key, "ű", "u", .)
*replace key = subinstr(key, "ۢ,", "u", .)
replace key = subinstr(key, "í", "i", .)

replace key = subinstr(key, "sch", "s", .)
replace key = subinstr(key, "sh", "s", .)
replace key = subinstr(key, "th", "t", .)
replace key = subinstr(key, "gh", "g", .)
replace key = subinstr(key, "hr", "r", .)
replace key = subinstr(key, "ntdn", "ntn", .)
replace key = subinstr(key, "ch", "c", .)
replace key = subinstr(key, "cs", "c", .)
replace key = subinstr(key, "ts", "c", .)
replace key = subinstr(key, "eo", "o", .)
replace key = subinstr(key, "w", "v", .)
replace key = subinstr(key, "zs", "z", .)
replace key = subinstr(key, "sz", "s", .)
replace key = subinstr(key, "hn", "n", .)
replace key = subinstr(key, "cz", "c", .)
replace key = subinstr(key, "tz", "c", .)
replace key = subinstr(key, "ts", "c", .)

replace key = subinstr(key, "ck", "k", .)
replace key = subinstr(key, "gy", "g", .)
replace key = subinstr(key, "ny", "n", .)
replace key = subinstr(key, "ty", "t", .)
replace key = subinstr(key, "zs", "z", .)
replace key = subinstr(key, "sz", "s", .)

replace key = subinstr(key, "ss", "s", .)
replace key = subinstr(key, "nn", "n", .)
replace key = subinstr(key, "ll", "l", .)
replace key = subinstr(key, "kk", "k", .)
replace key = subinstr(key, "mm", "m", .)
replace key = subinstr(key, "tt", "t", .)
replace key = subinstr(key, "nn", "n", .)
*replace key = subinstr(key, "kk", "k", .)
replace key = subinstr(key, "y", "i", .)
