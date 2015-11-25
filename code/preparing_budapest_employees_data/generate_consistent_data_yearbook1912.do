

clear
import excel "../data/budapest_employees/raw/1912_yearbook/1912_yearbook_with_places.xlsx", sheet("Sheet1") firstrow
do kill_accents.do

cap drop year
gen year=1912
gen unique_id="yb1912"+string(id)


label variable place_match_quality   "strength of match between worker and workplace" 
*  mennyire volt eros a kötés a hely és az ember között

label variable pid "workplace identifier"
* adott évben identifikálja azt, hogy melyik helyen dolgozik az ember. Évek között nem konzisztens. Ha kézzel vittem be az adatot, a pid hiányzik.

label variable workplace "Workplace"

label variable workplace_name_original "name of the worker in the workplace data"
*az a név, amely  alapján kötöttük a workplace listában lévo embert a fizetéslistában lévohöz

label variable workplace_hand_edited "Dummy – 1 if the workplace variable was cleaned by hand"
*ISSUE2: jo ez igy?
gen workplace_cleaned=workplace



label variable cant_tell "Dummy if worker and workplace do not match uniquely"
* Van két külön „Kiss János” szolga a fizetéslistában, és van két „Kiss János” szolga a helyek közt, és nem tudjuk, melyik melyik.


label variable source "indicating the source of the raw data"

label variable year "year of the observation"
rename Nv fullname
label variable fullname "the original full name (as in the raw data)"
rename fizetesioszt level
label variable level "salary level"
rename fiz salary1
label variable salary1 "base salary"
rename lakaspotlek home_allowance1
label variable home_allowance1 "allowance related to residence"
rename beosztas position
label variable position "current position"
rename lakas home
rename megjegyzes  comment
label variable comment "comments - other informations"
replace Szletsivhsnap="1868. máj. 1." if fullname=="Tóth József   "
replace Szletsivhsnap="1880. szept. 29." if fullname=="Kovács Mihály (pálmajori)"


cap drop O fullname_cl abreviation 


*Rumbacli Dezso   
replace fullname="Rumbach Dezso" if regexm(fullname,"Rumbacli Dezso")
*Zaitz László
*Stohansl Ede József  
*Windhager Ferenc
*Liftner Emil
*Stuchlicli Rezso
replace fullname="Stuchlich Rezso" if regexm(fullname,"Stuchlicli Rezso")
*Schrnaderer Oszkár dr
replace fullname="Schmaderer Oszkár dr" if regexm(fullname, "Schrnaderer Oszkár dr")
*Toperczer Valéria
*Seeber Béla
*Schara Béla
*Mtiller Sándor
replace fullname="Müller Sándor" if regexm(fullname, "Mtiller Sándor")
*Alni Károly
replace fullname="Alm Károly" if regexm(fullname, "Alni Károly")
*Rótli Gyula
replace fullname="Róth Gyula" if regexm(fullname, "Rótli Gyula")
*Nagv Vendel
replace fullname="Nagy Vendel" if regexm(fullname, "Nagv Vendel")
*Korény János
*n Koritsánszky János
replace fullname="Koritsánszky János" if regexm(fullname, "n Koritsánszky János")
*Villói jános
*Szakinány József
replace fullname="Szakmány József" if regexm(fullname, "Szakinány József")
*Szeift Károly
replace fullname="Szeiff Károly" if regexm(fullname, "Szeift Károly")
*Ádáin Béla
replace fullname="Ádám Béla" if regexm(fullname, "Ádáin Béla")
*ReichI Károly dr
replace fullname="Reichl Károly dr" if regexm(fullname, "ReichI Károly dr")
*PoppelJános
replace fullname="Poppel János" if regexm(fullname, "PoppelJános")
*Priickler Ilka
replace fullname="Prückler Ilka" if regexm(fullname, "Priickler Ilka")
*Oszterniann Péter
replace fullname="Osztermann Péter" if regexm(fullname, "Oszterniann Péter")
*Orágffy Gyula
*Hertendy József
*Kuzniik Pál dr
replace fullname="Kuzmik Pál dr" if regexm(fullname, "Kuzniik Pál dr")
*fgali József
replace fullname="Igali József" if regexm(fullname, "fgali József")
*llkey László
replace fullname="Ilkey László" if regexm(fullname, "llkey László")
*Alniásy Lajos
replace fullname="Almásy Lajos" if regexm(fullname, "Alniásy Lajos")
*Kiliti András
*MukkSándor 
replace fullname="Mukk András" if regexm(fullname, "MukkSándor")
*Mánk Fiilöp
replace fullname="Mánk Fülöp" if regexm(fullname, "Mánk Fiilöp")
*Katzer Józsefj
replace fullname="Katzer József" if regexm(fullname, "Katzer Józsefj")
*Gyulai Kálmánná
replace fullname="Gyulai Kálmánné" if regexm(fullname, "Gyulai Kálmánná")
*Lukács Pálj
replace fullname="Lukács Pál" if regexm(fullname, "Lukács Pálj")
*Török Zsiginond
replace fullname="Török Zsigmond" if regexm(fullname, "Török Zsiginond")
*Haintz Rejmond
replace fullname="Egressy Galambos Gábor" if regexm(fullname, "Egressy Galambos'Gábor")




replace Szletsivhsnap="1883 máj 23" if fullname=="Török Erno 1883 máj 23"
replace fullname="Török Erno" if fullname=="Török Erno 1883 máj 23"
replace Afv="1895. máj. 25." if fullname=="Pálmán Endre "
replace Afv="1883. szept. 10." if fullname=="Szlobodnik Pál"
replace Afv="1903. jan. 22." if fullname=="Bártl Tivadar "
replace Afv="1911. márc. 11." if fullname=="Szánthó István"
replace Afv="1909. szept. 1." if fullname=="Fábián Mihály "
replace Jelenl="1906. jún. 25." if fullname=="Vaszilievits János dr"
replace Jelenl="1911. aug. 1." if fullname=="Éless László"
replace Jelenl="1911. jan. 1." if fullname=="Opitz József"
replace Jelenl="" if fullname=="Györffy Károly   "
replace Jelenl="1908. szept. 1." if fullname=="Schmidt Keresztély   "

**********************************************************************************
*****spliting birth date into year, month and day
*****cleaning the year of birth 
**********************************************************************************

gen birth=Szletsivhsnap
replace birth=substr(birth, 2, length(birth)) if  regex(birth, "^ ")==1
replace birth=substr(birth, 4, length(birth)) if  regex(birth, "^ij ")==1
replace birth=substr(birth, 3, length(birth)) if  regex(birth, "^í ")==1
replace birth=substr(birth, 3, length(birth)) if  regex(birth, "^i ")==1
replace birth=substr(birth, 3, length(birth)) if  regex(birth, "^1 ")==1
replace birth=substr(birth, 3, length(birth)) if  regex(birth, "^j ")==1
replace birth=substr(birth, 3, length(birth)) if  regex(birth, "^; ")==1
replace birth=substr(birth, 2, length(birth)) if  regex(birth, "^11")==1
replace birth=substr(birth, 1, length(birth)-3) if  regex(birth, " il$")==1
replace birth=substr(birth, 1, length(birth)-2) if  regex(birth, " I$")==1
replace birth=substr(birth, 1, length(birth)-2) if  regex(birth, " j$")==1


gen birthyear=birth
replace birthyear=substr(birthyear, 1, 4)
replace  birthyear = subinstr(birthyear, " ", "", .)
replace  birthyear = subinstr(birthyear, ".", "", .)
gen x=length(birthyear)
 
*browse Szletsivhsnap birth* x if x!=4

drop x

gen birthmonth=birth
replace birthmonth=subinstr(birthmonth, birthyear, "",.)
replace birthmonth=subinstr(birthmonth, ".", "",.)
replace birthmonth=subinstr(birthmonth, ",", "",.)
replace birthmonth=subinstr(birthmonth, " ", "",.)
replace birthmonth=subinstr(birthmonth, "0", "",.)
replace birthmonth=subinstr(birthmonth, "1", "",.)
replace birthmonth=subinstr(birthmonth, "2", "",.)
replace birthmonth=subinstr(birthmonth, "3", "",.)
replace birthmonth=subinstr(birthmonth, "4", "",.)
replace birthmonth=subinstr(birthmonth, "5", "",.)
replace birthmonth=subinstr(birthmonth, "6", "",.)
replace birthmonth=subinstr(birthmonth, "7", "",.)
replace birthmonth=subinstr(birthmonth, "8", "",.)
replace birthmonth=subinstr(birthmonth, "9", "",.)


gen birthday=birth
replace birthday=subinstr(birthday, birthyear, "",.)
replace birthday=subinstr(birthday, birthmonth, "",.)
replace birthday=subinstr(birthday, ".", "",.)
replace birthday=subinstr(birthday, " ", "",.)
replace birthday=subinstr(birthday, ",", "",.)
replace birthday=subinstr(birthday, birthmonth, "",.)



*browse if birthmonth==""

*cleaning by hand
replace birthyear="1864" if birthyear=="864"
replace birthyear="1879" if birthyear=="|18"
replace birthyear="" if fullname=="Popelka János    "
replace birthyear="1865" if fullname=="Zoványi Jeno    "


* Afovrosszolglatbalpet Jelenlegitllsbajutott
* entry Afovrosszolglatbalpet

gen entry=Afv
replace entry=substr(entry, 2, length(entry)) if  regex(entry, "^ ")==1
replace entry=substr(entry, 3, length(entry)) if  regex(entry, "^  ")==1
replace entry=substr(entry, 4, length(entry)) if  regex(entry, "^   ")==1
replace entry=substr(entry, 3, length(entry)) if  regex(entry, "^. ")==1
replace entry=substr(entry, 2, length(entry)) if  regex(entry, "^ ")==1
replace entry=substr(entry, 1, length(entry)-1) if  regex(entry, "i$")==1

gen entryyear=entry
replace entryyear=substr(entryyear, 1, 4)
replace  entryyear = subinstr(entryyear, " ", "", .)
replace  entryyear = subinstr(entryyear, ".", "", .)
gen x=length(entryyear)
 


drop x

gen entrymonth=entry
replace entrymonth=subinstr(entrymonth, entryyear, "",.)
replace entrymonth=subinstr(entrymonth, ".", "",.)
replace entrymonth=subinstr(entrymonth, ",", "",.)
replace entrymonth=subinstr(entrymonth, " ", "",.)
replace entrymonth=subinstr(entrymonth, "0", "",.)
replace entrymonth=subinstr(entrymonth, "1", "",.)
replace entrymonth=subinstr(entrymonth, "2", "",.)
replace entrymonth=subinstr(entrymonth, "3", "",.)
replace entrymonth=subinstr(entrymonth, "4", "",.)
replace entrymonth=subinstr(entrymonth, "5", "",.)
replace entrymonth=subinstr(entrymonth, "6", "",.)
replace entrymonth=subinstr(entrymonth, "7", "",.)
replace entrymonth=subinstr(entrymonth, "8", "",.)
replace entrymonth=subinstr(entrymonth, "9", "",.)


gen entryday=entry
replace entryday=subinstr(entryday, entryyear, "",.)
replace entryday=subinstr(entryday, entrymonth, "",.)
replace entryday=subinstr(entryday, ".", "",.)
replace entryday=subinstr(entryday, " ", "",.)
replace entryday=subinstr(entryday, ",", "",.)
replace entryday=subinstr(entryday, entrymonth, "",.)

* Afovrosszolglatbalpet Jelenlegitllsbajutott
* promotion Jelenlegitllsbajutott

gen promotion=Jelenlegitllsbajutott
replace promotion=substr(promotion, 2, length(promotion)) if  regex(promotion, "^ ")==1
replace promotion=substr(promotion, 3, length(promotion)) if  regex(promotion, "^  ")==1
replace promotion=substr(promotion, 4, length(promotion)) if  regex(promotion, "^   ")==1
replace promotion=substr(promotion, 3, length(promotion)) if  regex(promotion, "^. ")==1
replace promotion=substr(promotion, 2, length(promotion)) if  regex(promotion, "^ ")==1
replace promotion=substr(promotion, 1, length(promotion)-1) if  regex(promotion, "i$")==1
replace  promotion = subinstr(promotion, ",", "", .)

gen promotionyear=promotion
replace promotionyear=substr(promotionyear, 1, 4)
replace  promotionyear = subinstr(promotionyear, " ", "", .)
replace  promotionyear = subinstr(promotionyear, ".", "", .)
gen x=length(promotionyear)
 


drop x

gen promotionmonth=promotion
replace promotionmonth=subinstr(promotionmonth, promotionyear, "",.)
replace promotionmonth=subinstr(promotionmonth, ".", "",.)
replace promotionmonth=subinstr(promotionmonth, ",", "",.)
replace promotionmonth=subinstr(promotionmonth, " ", "",.)
replace promotionmonth=subinstr(promotionmonth, "0", "",.)
replace promotionmonth=subinstr(promotionmonth, "1", "",.)
replace promotionmonth=subinstr(promotionmonth, "2", "",.)
replace promotionmonth=subinstr(promotionmonth, "3", "",.)
replace promotionmonth=subinstr(promotionmonth, "4", "",.)
replace promotionmonth=subinstr(promotionmonth, "5", "",.)
replace promotionmonth=subinstr(promotionmonth, "6", "",.)
replace promotionmonth=subinstr(promotionmonth, "7", "",.)
replace promotionmonth=subinstr(promotionmonth, "8", "",.)
replace promotionmonth=subinstr(promotionmonth, "9", "",.)


gen promotionday=entry
replace promotionday=subinstr(promotion, promotionyear, "",.)
replace promotionday=subinstr(promotionday, promotionmonth, "",.)
replace promotionday=subinstr(promotionday, ".", "",.)
replace promotionday=subinstr(promotionday, " ", "",.)
replace promotionday=subinstr(promotionday, ",", "",.)
replace promotionday=subinstr(promotionday, promotionmonth, "",.)

rename Afv entry_original
rename Szletsivhsnap birth_original

*********************************************************************************************
*********************************************************************************************
*cleaning names
*********************************************************************************************
*********************************************************************************************

gen fullname_cl=fullname
label variable fullname_cl "cleaned full name"



replace fullname_cl=substr(fullname, 1, length(fullname)-3) if  regex(fullname_cl, " dr$")==1
replace fullname_cl=substr(fullname, 1, length(fullname)-4) if  regex(fullname_cl, " dr $")==1
replace fullname_cl=substr(fullname, 1, length(fullname)-4) if  regex(fullname_cl, " drj$")==1
replace fullname_cl=substr(fullname, 1, length(fullname)-3) if  regex(fullname_cl, " dr,$")==1
replace fullname_cl=substr(fullname, 1, length(fullname)-5) if  regex(fullname_cl, " Jdr $")==1
replace fullname_cl=substr(fullname, 1, length(fullname)-4) if  regex(fullname_cl, " özv$")==1


replace fullname_cl=substr(fullname, 1, length(fullname)-4) if  regex(fullname_cl, " ifj$")==1
replace fullname_cl=substr(fullname, 1, length(fullname)-5) if  regex(fullname_cl, " ifj $")==1
replace fullname_cl=substr(fullname, 1, length(fullname)-5) if  regex(fullname_cl, " ifj,$")==1

replace fullname_cl=substr(fullname, 1, length(fullname)-4) if  regex(fullname_cl, " id $")==1

replace fullname_cl=substr(fullname, 4, length(fullname)) if  regex(fullname_cl, "^özv")==1
replace fullname_cl=substr(fullname, 5, length(fullname)) if  regex(fullname_cl, "^Özv ")==1
replace fullname_cl=substr(fullname, 3, length(fullname)) if  regex(fullname_cl, "^I ")==1
replace fullname_cl=substr(fullname, 3, length(fullname)) if  regex(fullname_cl, "^n ")==1
replace fullname_cl=substr(fullname, 4, length(fullname)) if  regex(fullname_cl, "^il ")==1
replace fullname_cl=substr(fullname, 4, length(fullname)) if  regex(fullname_cl, "^dr ")==1


replace fullname_cl=substr(fullname, 1, length(fullname)-5) if  regex(fullname_cl, " gróf$")==1
replace fullname_cl=substr(fullname, 1, length(fullname)-4) if  regex(fullname_cl, " br $")==1

replace fullname_cl=substr(fullname, 1, length(fullname)-2) if  regex(fullname_cl, " M $")==1
replace fullname_cl=substr(fullname, 1, length(fullname)-2) if  regex(fullname_cl, " v$")==1


replace fullname_cl=substr(fullname, 1, length(fullname)-4) if  regex(fullname_cl, " II $")==1
replace fullname_cl=substr(fullname, 1, length(fullname)-2) if  regex(fullname_cl, " I$")==1
replace fullname_cl=substr(fullname, 1, length(fullname)-2) if  regex(fullname_cl, " i$")==1
replace fullname_cl=substr(fullname, 1, length(fullname)-2) if  regex(fullname_cl, " j$")==1
replace fullname_cl=substr(fullname, 2, length(fullname)) if  regex(fullname_cl, "^j ")==1




*at the begining of the name

replace  fullname_cl = subinstr( fullname_cl, "dr-néözv", "", .)
replace  fullname_cl = subinstr( fullname_cl, " ifj   ", "", .)
replace  fullname_cl = subinstr( fullname_cl, "1 ", "", .)
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
replace  fullname_cl = subinstr( fullname_cl, " dr ", "", .)
replace  fullname_cl = subinstr( fullname_cl, " dr  ", "", .)
replace  fullname_cl = subinstr( fullname_cl, " özv   ", "", .)
replace  fullname_cl = subinstr( fullname_cl, " özv ", "", .)
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
replace  fullname_cl = subinstr( fullname_cl, "Özv dr ", "", .)


*no abreviation in this dataset, so all "." and "," are errors 
*replaceing special characters
replace fullname_cl = subinstr(fullname_cl, ",", "", .)
replace fullname_cl = subinstr(fullname_cl, ".", "", .)
replace fullname_cl = subinstr(fullname_cl, "-", "", .)
replace fullname_cl = subinstr(fullname_cl, ";", "", .)
replace fullname_cl = subinstr(fullname_cl, ":", "", .)
replace fullname_cl = subinstr(fullname_cl, "?", "", .)
replace fullname_cl = subinstr(fullname_cl, "\", "", .)
replace fullname_cl = subinstr(fullname_cl, "|", "", .)

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

replace fullname_cl = subinstr(fullname_cl, "ss", "s", .)
replace fullname_cl = subinstr(fullname_cl, "nn", "n", .)
replace fullname_cl = subinstr(fullname_cl, "ll", "l", .)
replace fullname_cl = subinstr(fullname_cl, "y", "i", .)



*split the string by space
split fullname_cl, gen(key)

*some cases we know some information about the place (place of origine????)
gen key5=""
replace key3= subinstr(key3, "(", "@",.)
replace key5=key3 if regexm(key3, "@")
replace key5= subinstr(key5, "@", "(",.)
replace key3="" if regexm(key3, "@")
replace key3="" if key3=="ifj"
replace key3="" if key3=="br"
replace key3="" if key3=="grof"



gen probl=0
replace probl=1 if length(key1)==1
gen key4=""
replace key4=key1 if probl==1
replace key1=key2 if probl==1
replace key2=key3 if probl==1
replace key3="" if probl==1

gen probl2=0
replace probl2=1 if length(key2)==1 & key3!=""
replace key4=key2 if probl2==1
replace key2=key3 if probl2==1
replace key3=""  if probl2==1

gen probl3=0
replace probl3=1 if key2=="kovac"
replace probl3=1 if key2=="palfi"
replace probl3=1 if key2=="kraker"
replace probl3=1 if key2=="nag"
replace probl3=1 if key2=="sabo"
replace probl3=1 if key2=="dol"
replace probl3=1 if key2=="galambos"
replace probl3=1 if key2=="govai"
replace probl3=1 if key2=="janco"
replace key4=key2 if probl3==1
replace key2=key3 if probl3==1
replace key3="" if probl3==1

label variable key1 "key generated from family (last) name"
label variable key2 "key generated from firstname"
label variable key3 "key generated from second firstname"
label variable key4 "key generated from middlename"
label variable key5 "other information about the identity"




label variable home "on the top of the salary he got a home as non-monetary allowance"
drop probl* 
rename Jelenlegitllsbajutott promotion_original
rename igpotlek manager_allowance
rename mukPotlek other_allowance

destring birthyear entryyear promotionyear, force replace


*cleaning age
destring(birthyear), replace
duplicates tag key1 key2 birthyear, gen (duplicates)

gen cat1=regexs(0) if (regexm(level, "[IVX]+"))
gen cat2=regexs(0) if (regexm(level, "[0-9]+"))
replace cat2="1" if cat2==""

replace cat1="VIII" if level=="Vili- 4." | level=="Vili. 4."
replace cat2="4" if level=="Vili- 4." | level=="Vili. 4."

merge m:1 cat1 cat2 using "../data/budapest_employees/raw/1912_yearbook/1912_salaries.dta", update
drop if _merge==2

* HAVI PÉNZ
replace salary1= 300   if position =="Ideiglenes hivatalnokok." & level=="1a."
replace salary1= 275   if position =="Ideiglenes hivatalnokok." & level=="1b."
replace salary1= 250   if position =="Ideiglenes hivatalnokok." & level=="II.a"
replace salary1= 225   if position =="Ideiglenes hivatalnokok." & level=="II.b."
replace salary1= 200   if position =="Ideiglenes hivatalnokok." & level=="III"
replace salary1= 180   if position =="Ideiglenes hivatalnokok." & level=="IV."
replace salary1= 100   if position =="Ideiglenes hivatalnokok." & level=="IX."
replace salary1= 150   if position =="Ideiglenes hivatalnokok." & level=="V"
replace salary1= 150   if position =="Ideiglenes hivatalnokok." & level=="V."
replace salary1= 120   if position =="Ideiglenes hivatalnokok." & level=="VI."
replace salary1= 120   if position =="Ideiglenes hivatalnokok." & level=="VII."
replace salary1= 100   if position =="Ideiglenes hivatalnokok." & level=="VIII."
replace salary1= 100  if position =="Ideiglenes hivatalnokok." & level=="X."
replace salary1= 90   if position =="Ideiglenes hivatalnokok." & level=="XI."
replace salary1= 80   if position =="Ideiglenes hivatalnokok." & level=="XII."

replace salary1=salary1*12 if position =="Ideiglenes hivatalnokok."


* NEGYEDÉVES PÉNZ
replace home_allowance1= 200   if position =="Ideiglenes hivatalnokok." & level=="1a."
replace home_allowance1= 200   if position =="Ideiglenes hivatalnokok." & level=="1b."
replace home_allowance1= 200   if position =="Ideiglenes hivatalnokok." & level=="II.a"
replace home_allowance1= 200   if position =="Ideiglenes hivatalnokok." & level=="II.b."
replace home_allowance1= 200   if position =="Ideiglenes hivatalnokok." & level=="III"
replace home_allowance1= 150   if position =="Ideiglenes hivatalnokok." & level=="IV."
replace home_allowance1= 60   if position =="Ideiglenes hivatalnokok." & level=="IX."
replace home_allowance1= 150   if position =="Ideiglenes hivatalnokok." & level=="V"
replace home_allowance1= 150   if position =="Ideiglenes hivatalnokok." & level=="V."
replace home_allowance1= 150   if position =="Ideiglenes hivatalnokok." & level=="VI."
replace home_allowance1= 100   if position =="Ideiglenes hivatalnokok." & level=="VII."
replace home_allowance1= 100  if position =="Ideiglenes hivatalnokok." & level=="VIII."
replace home_allowance1= 0   if position =="Ideiglenes hivatalnokok." & level=="X."
replace home_allowance1= 0   if position =="Ideiglenes hivatalnokok." & level=="XI."
replace home_allowance1= 0   if position =="Ideiglenes hivatalnokok." & level=="XII."

replace home_allowance1=home_allowance1*12 if position =="Ideiglenes hivatalnokok."


* egyedi hibák

replace salary1=500 if position=="Fuvartelepi id. igazgató"
replace salary1=450 if position=="Házinyomdai osztályvezetok"


*rename promotion promotion_raw
*gen promotion=regexs(0) if (regexm(promotion_raw, "[0-9]+"))
*destring promotion, force replace
*cap drop susp
*gen susp=0
*replace susp=9999999999999 if promotion>1912


*replace promotionyear=1911 if promotion_raw=="1916. jan. 1. "
*replace promotionyear=1911 if promotion_raw=="1913. jan. 1. "
*replace promotionyear=1911 if promotion_raw=="1915. jan. 1. "
*replace promotionyear=1911 if promotion_raw=="1914. jan. 1. "

*replace promotion=1908 if position=="I. oszt. szolgák" & susp>0
*drop if id==.

*destring entry_y, force replace

*replace entryyear=1900 if entryyear==1930
*replace entryyear=1902 if entryyear==1932



*since there is only one duplicate and it is the same person, I keep only the first
*and add the additional information




