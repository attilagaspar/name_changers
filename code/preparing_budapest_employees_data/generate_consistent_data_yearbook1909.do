

clear
import excel "../data/budapest_employees/raw/1909_yearbook/1909_yearbook_with_places.xlsx", sheet("Sheet1") firstrow clear
do kill_accents.do



* In this year the workplace and the other data were found in phisically different chapters
* so another matching procedure was inevitable.

label variable place_match_quality   "strength of match between worker and workplace" 
*  mennyire volt eros a kötés a hely és az ember között
label variable pid "workplace identifier"
* adott évben identifikálja azt, hogy melyik helyen dolgozik az ember. Évek között nem konzisztens. Ha kézzel vittem be az adatot, a pid hiányzik.
label variable workplace "Workplace"
label variable workplace2 "Second workplace"
* az egyik évben volt pár eset ahol szinte biztos hogy a két azonos nevu ember ugyanaz a személy akinek két beosztása van. A Workplace2 tartalmazza ezt, de lehet, hogy érdemes kidobni majd, mert nagyon kevés megfigyelés.
label variable workplace_name_original "name of the worker in the workplace data"
*az a név, amely  alapján kötöttük a workplace listában lévo embert a fizetéslistában lévohöz
label variable workplace_hand_edited "Dummy – 1 if the workplace variable was cleaned by hand"
label variable cant_tell "Dummy if worker and workplace do not match uniquely"
* Van két külön „Kiss János” szolga a fizetéslistában, és van két „Kiss János” szolga a helyek közt, és nem tudjuk, melyik melyik.

*ISSUE2: is this ok?
gen workplace_cleaned=workplace




rename id_1909 id
gen source="yearbook"
label variable source "indicating the source of the raw data"
gen year=1909
gen unique_id="yb1909"+string(id)


label variable year "year of the ob	servation"
rename nev fullname
label variable fullname "the original full name (as in the raw data)"
rename szul_ev birthyear
label variable birthy "year of birth"
rename szul_ho birthmonth
label variable birthm "month of birth"
rename szul_nap birthday
label variable birthday "day of birth"
rename miotafv_ev  entryyear
label variable entryy "year of starting a career as an official (at the capital - Budapest)"
rename miotafv_ho entrymonth
label variable entrym "month of starting a career as an official (at the capital - Budapest)"
rename miotafv_nap  entryd
label variable entryd "day of starting a career as an official (at the capital - Budapest)"
rename elolepes_ev promotionyear
label variable promotionyear "year of the last promotion"
rename elolepes_ho promotionmonth
label variable promotionm "month of the last promotion"
rename elolepes_nap promotionday
label variable promotiond "day of the last promotion"
rename position_1909 position
label variable position "current position"
rename fizetesioszt level
label variable level "salary level"
rename fiz1_1909 salary1
label variable salary1 "base salary"
rename fiz2_1909 salary2
label variable salary2 "base salary"
rename lak1 home_allowance1
label variable home_allowance1 "allowance related to residence"
rename lak2 home_allowance2
label variable home_allowance2 "allowance related to residence"
rename fiz1p_1909 allowance1
rename fiz2p_1909 allowance2
rename megjegszes_1909  comment
label variable comment "comments - other informations"
rename szemelyip_1909 personal_allowance
rename atmenetip_1909 temporary_allowance
rename term_jut_tip_1909 other_nm_allowance
label variable other_nm_allowance "other non-monetary allowance"


cap drop term_jut_ fullname_cl abreviation





*Manger Máíyás 
replace fullname="Manger Mátyás" if regexm(fullname,"Manger Máíyás ")
*Schmidt Kcrcsztély
replace fullname="Schmidt Keresztély" if regexm(fullname, "Schmidt Kcrcsztély")
*Plachtjózsef 
replace fullname="Placht József" if regexm(fullname, "Plachtjózsef")
*ÖzvHuschek Ignácné (szülBlaha Mária)
replace fullname="Özv Huschek Ignácné (szülBlaha Mária)" if regexm(fullname, "ÖzvHuschek Ignácné")
*ÖzvPál Albertné (szülPapp Róza)
replace fullname="Özv Pál Albertné (szülPapp Róza)" if regexm(fullname, "ÖzvPál Albertné")
*ÖzvdrPrihoda Gyuláné (szül (Öhlbaum Hermin)
replace fullname="Özv dr. Prihoda Gyuláné (szül Öhlbaum Hermin)" if regexm(fullname, "ÖzvdrPrihoda Gyuláné")
*ÖzvHyross Györgyiné (szülPlistil Irma)
replace fullname="Özv Hyross Györgyiné (szülPlistil Irma)" if regexm(fullname, "ÖzvHyross Györgyiné")
*\ ÖzvAusim Ernöné
replace fullname="Özv Ausim Ernöné" if regexm(fullname, "\ ÖzvAusim Ernöné")
*KCsászár Kálmán
replace fullname="K Császár Kálmán" if regexm(fullname, "KCsászár Kálmán")
*Mosdósy LJeno
replace fullname="Mosdósy L Jeno" if regexm(fullname, "Mosdósy LJeno")
*Pallér Ferenc
replace fullname="Faller Ferenc" if regexm(fullname, "Pallér Ferenc")
*Bukovszkv Viktor
replace fullname="Bukovszky Viktor" if regexm(fullname, "Bukovszkv Viktor")
*Lobniayer Jeno dr
replace fullname="Lobmayer Jeno dr" if regexm(fullname, "Lobniayer Jeno dr")
*Papperül Gyozo dr
replace fullname="Papperth Gyozo dr" if regexm(fullname, "Papperül Gyozo dr")
*Furebl Gyozo dr
*Padványi Gyula
replace fullname="Radványi Gyula" if regexm(fullname, "Padványi Gyula")
*Csiliéri Dezso
replace fullname="Csilléri Dezso" if regexm(fullname, "Csiliéri Dezso")
*Klinikó Mihály ifj
replace fullname="Klimkó Mihály ifj" if regexm(fullname, "Klinikó Mihály ifj")
*Korlátli Andor
replace fullname="Korláth Andor" if regexm(fullname, "Korlátli Andor")
*Ganimel Alajos
replace fullname="Gammel Alajos" if regexm(fullname, "Ganimel Alajos")
*Reinbotli Rezso
replace fullname="Reinboth Rezso" if regexm(fullname, "Reinbotli Rezso")
*Vidot Gyula , ,
replace fullname="Vidos Gyula" if regexm(fullname, "Vidot Gyula")
*Kornai István
*Herein Károly
*BártI Tivadar
replace fullname="Bártl Tivadar" if regexm(fullname, "BártI Tivadar")
*Baseli Dezso
replace fullname="Basch Dezso" if regexm(fullname, "Baseli Dezso")
*Wefland József
replace fullname="Weiland József" if regexm(fullname, "Wefland József")
*Sfankovits Adorján
replace fullname="Stankovits Adorján" if regexm(fullname, "Sfankovits Adorján")
*Prokesch Antal
*Rrochnov József dr
replace fullname="Prochnov József dr" if regexm(fullname, "Rrochnov József dr")
*Kuztnik Pál dr
replace fullname="Kuzmik Pál dr" if regexm(fullname, "Kuztnik Pál dr")
*Schönhein Lajos dr
*Wimner Mór dr
replace fullname="Wintner Mór dr" if regexm(fullname, "Wimner Mór dr")
*Bánta Péter dr
replace fullname="Sánta Péter dr" if regexm(fullname, "Bánta Péter dr")
*Lázié Pál dr
*Drechsler Henrik dr
*Förök Sándor Ferenc
replace fullname="Török Sándor Ferenc" if regexm(fullname, "Förök Sándor Ferenc")
*Penesch Ferenc
replace fullname="Benesch Ferenc" if regexm(fullname, "Penesch Ferenc")
*Szervvó György
replace fullname="Szervó György" if regexm(fullname, "Szervvó György")
*Ricliter Sarolta
replace fullname="Richter Sarolta" if regexm(fullname, "Ricliter Sarolta")
*Raltzer József
replace fullname="Baltzer József" if regexm(fullname, "Raltzer József")
*Döinök Bálint
replace fullname="Dömök Bálint" if regexm(fullname, "Döinök Bálint")
*SzTóth István
replace fullname="Sz Tóth István" if regexm(fullname, "SzTóth István")
*Kirtzan János
*Hertli Gyozo
*Széll Mihály
*Niiltl Hiimér dr
replace fullname="Hültl Hümér dr" if regexm(fullname, "Niiltl Hiimér dr")
*Miiller Sándor
replace fullname="Müller Sándor" if regexm(fullname, "Miiller Sándor")

replace birthy=1856 if birthy==11856
replace birthy=1865 if regexm(fullname,"Héjj János")
replace birthy=1886 if regexm(fullname, "Brestyánszky Lajo ifj")
replace fullname="Berényi Irma" if regexm(fullname, "Herényi Irma")
replace birthy=1876 if regexm(fullname, "Grollg Erno")
replace fullname="Grolig Erno" if regexm(fullname, "Grollg Erno")
replace birthy=1867 if regexm(fullname, "Modrovich Erno")
replace birthy=1864 if regexm(fullname, "Bauer Lipót")
replace fullname="Kovács Vendel" if regexm(fullname, "Kovács Veiulol")
replace fullname="Klenim L Árpád" if regexm(fullname, "Klenim LÁrpád")


*cleaning names
gen fullname_cl=fullname
label variable fullname_cl "cleaned full name"



replace fullname_cl=substr(fullname, 1, length(fullname)-3) if  regex(fullname_cl, " dr$")==1
replace fullname_cl=substr(fullname, 1, length(fullname)-4) if  regex(fullname_cl, " dr $")==1
replace fullname_cl=substr(fullname, 1, length(fullname)-4) if  regex(fullname_cl, " drj$")==1
replace fullname_cl=substr(fullname, 1, length(fullname)-3) if  regex(fullname_cl, " dr,$")==1
replace fullname_cl=substr(fullname, 1, length(fullname)-5) if  regex(fullname_cl, " Jdr $")==1

replace fullname_cl=substr(fullname, 1, length(fullname)-4) if  regex(fullname_cl, " ifj$")==1
replace fullname_cl=substr(fullname, 1, length(fullname)-5) if  regex(fullname_cl, " ifj $")==1
replace fullname_cl=substr(fullname, 1, length(fullname)-5) if  regex(fullname_cl, " ifj,$")==1

replace fullname_cl=substr(fullname, 1, length(fullname)-4) if  regex(fullname_cl, " id $")==1

replace fullname_cl=substr(fullname, 4, length(fullname)) if  regex(fullname_cl, "^özv")==1
replace fullname_cl=substr(fullname, 4, length(fullname)) if  regex(fullname_cl, "^Özv")==1
replace fullname_cl=substr(fullname, 8, length(fullname)) if  regex(fullname_cl, "^ dr. ")==1


replace fullname_cl=substr(fullname, 1, length(fullname)-5) if  regex(fullname_cl, " gróf$")==1
replace fullname_cl=substr(fullname, 1, length(fullname)-4) if  regex(fullname_cl, " br $")==1

replace fullname_cl=substr(fullname, 1, length(fullname)-2) if  regex(fullname_cl, " M $")==1
replace fullname_cl=substr(fullname, 1, length(fullname)-2) if  regex(fullname_cl, " v$")==1


replace fullname_cl=substr(fullname, 1, length(fullname)-4) if  regex(fullname_cl, " II $")==1
replace fullname_cl=substr(fullname, 1, length(fullname)-2) if  regex(fullname_cl, " I$")==1
replace fullname_cl=substr(fullname, 1, length(fullname)-2) if  regex(fullname_cl, " i$")==1
replace fullname_cl=substr(fullname, 1, length(fullname)-2) if  regex(fullname_cl, " j$")==1
replace fullname_cl=substr(fullname, 2, length(fullname)) if  regex(fullname_cl, "^j ")==1



/*
*at the begining of the name
replace  fullname_cl = subinstr( fullname_cl, "legifj. ", "", .)
replace  fullname_cl = subinstr( fullname_cl, "dr. ", "", .)
replace  fullname_cl = subinstr( fullname_cl, "Dr. ", "", .)
replace  fullname_cl = subinstr( fullname_cl, "id. ", "", .)
replace  fullname_cl = subinstr( fullname_cl, "Id. ", "", .)
replace  fullname_cl = subinstr( fullname_cl, "ifj. ", "", .)
replace  fullname_cl = subinstr( fullname_cl, "Ifj. ", "", .)
*replace  fullname_cl = subinstr( fullname_cl, "dr ", "", .)
replace  fullname_cl = subinstr( fullname_cl, "Dr ", "", .)
*replace  fullname_cl = subinstr( fullname_cl, "id ", "", .)
replace  fullname_cl = subinstr( fullname_cl, "Id ", "", .)
*replace  fullname_cl = subinstr( fullname_cl, "ifj ", "", .)
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

*/

*no abreviation in this dataset, so all "." and "," are errors 
*replaceing special characters
replace fullname_cl = subinstr(fullname_cl, ",", "", .)
replace fullname_cl = subinstr(fullname_cl, ".", "", .)
replace fullname_cl = subinstr(fullname_cl, "-", "", .)
replace fullname_cl = subinstr(fullname_cl, ";", "", .)
replace fullname_cl = subinstr(fullname_cl, ":", "", .)
replace fullname_cl = subinstr(fullname_cl, "?", "", .)
replace fullname_cl = subinstr(fullname_cl, "\", "", .)


*lower case
replace  fullname_cl = lower(fullname_cl)









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
*in some cases we know the name at birth
gen birthname=0
replace birthname=1 if regexm(fullname, "szül")
replace birthname=1 if fullname=="özvNoel Jánosné szNiagul Ilona "

*split the string by space
split fullname_cl, gen(key)

*cleaning birth name
gen birthkey1=""
gen birthkey2=""

replace key3 = subinstr(key3, "(", "", .) if birthname==1
replace key3 = subinstr(key3, ")", "", .) if birthname==1
replace key3 = subinstr(key3, "sul", "", .) if birthname==1

replace key4 = subinstr(key4, "(", "", .) if birthname==1
replace key4 = subinstr(key4, ")", "", .) if birthname==1
replace key4 = subinstr(key4, "sul", "", .) if birthname==1

replace key5 = subinstr(key5, "(", "", .) if birthname==1
replace key5 = subinstr(key5, ")", "", .) if birthname==1
replace key5 = subinstr(key5, "sul", "", .) if birthname==1

replace birthkey1=key3 if birthname==1
replace birthkey2=key4 if birthname==1
replace key3="" if birthname==1
replace key4="" if birthname==1
replace birthkey1=birthkey2 if birthkey1=="" & birthname==1
replace birthkey2=key5 if key5!="" & birthname==1
replace key5="" if key5!="" & birthname==1


label variable key1 "key generated from family (last) name"
label variable key2 "key generated from firstname"
label variable key3 "key generated from second firstname"
label variable key4 "key generated from middlename"
label variable key5 "other information about the identity"

*middle name - key4 
replace key5=key2+" " + key3 if key4!=""
replace key2=key4 if key5!=""
replace key3="" if key5!=""
replace key4=key5 if key5!=""

gen probl=0
replace probl=1 if key2=="kraker"
replace probl=1 if key2=="ber"
replace probl=1 if key2=="dol"
replace probl=1 if key2=="riebaru"
replace probl=1 if key2=="sabo"
replace probl=1 if key2=="dol"
replace probl=1 if key2=="kesler"
replace probl=1 if key2=="kovac"
replace probl=1 if key2=="kasa"

replace key4=key2 if probl==1
replace key2=key3 if probl==1
replace key3="" if probl==1


gen probl2=0
replace probl2=1 if length(key1)==1

replace key4=key1 if probl2==1
replace key1=key2 if probl2==1
replace key2=key3 if probl2==1
replace key3="" if probl2==1

gen home=0
replace home=1 if other_nm_allowance=="lakas"

gen age=1909-birthy
*cleaning birthy

replace birthy=1888 if birthy==11888
replace birthy=1868 if birthy==1808
replace birthy=1846 if fullname=="Majoros János "
replace birthy=. if birthy<1000
replace birthy=1861 if birthy==1801

drop age
gen age=1909-birthy

label variable home "on the top of the salary he got a home as non-monetary allowance"



drop birthkey1 birthkey2 probl probl2 age 

destring birthyear entryyear promotionyear, force replace


