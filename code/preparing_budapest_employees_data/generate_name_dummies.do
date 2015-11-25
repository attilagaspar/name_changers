*name cleaning - creating foreign and german vars
cap drop name1 
cap drop name2
split fullname, gen(name)
drop name3 name4 name5 
*drop prefixes 
replace name1=name2 if name1=="Dr"
replace name1=name2 if name1=="Dr."
replace name1=name2 if name1=="Gr."
replace name1=name2 if name1=="Id."
replace name1=name2 if name1=="If."
replace name1=name2 if name1=="Ifj."
replace name1=name2 if name1=="Ir."
replace name1=name2 if name1=="ifj."
replace name1=name2 if name1=="Özv"

replace name1=substr(name1,4,.) if substr(name1,1,3)=="özv" | substr(name1,1,4)=="Özv"

replace oldname=trim(oldname)
replace name1=trim(name1)
* f: foreign ; g: german (all germans are foreigners)
gen f=0
gen g=0
replace f=1 if substr(name1,-2,2)=="er"
replace g=1 if substr(name1,-2,2)=="er"

replace f=1 if substr(name1,1,3)=="Sch"
replace g=1 if substr(name1,1,3)=="Sch"

replace f=1 if substr(name1,-4,4)=="mann"
replace g=1 if substr(name1,-4,4)=="mann"

replace f=1 if substr(name1,-5,5)=="ovich"
replace f=1 if substr(name1,-5,5)=="ovics"
replace f=1 if substr(name1,-5,5)=="ovicz"

replace f=1 if substr(name1,-2,2)=="ld"
replace g=1 if substr(name1,-2,2)=="ld"

replace f=1 if substr(name1,-2,2)=="ck"
replace g=1 if substr(name1,-2,2)=="ck"

replace f=1 if substr(name1,-2,2)=="gl"
replace g=1 if substr(name1,-2,2)=="gl"

replace f=1 if substr(name1,-2,2)=="in"
replace g=1 if substr(name1,-2,2)=="in"

replace f=1 if substr(name1,-2,2)=="ld"
replace g=1 if substr(name1,-2,2)=="ld"

replace f=1 if substr(name1,-2,2)=="ck"
replace g=1 if substr(name1,-2,2)=="ck"

replace f=1 if substr(name1,-2,2)=="ch"
replace g=1 if substr(name1,-2,2)=="ch" & substr(name1,-4,4)!="vich"

replace f=1 if substr(name1,-3,3)=="its"

replace f=1 if substr(name1,-2,2)=="ns"
replace g=1 if substr(name1,-2,2)=="ns"

replace f=1 if substr(name1,-1,1)=="l" & name1!="Hajnal"  & name1!="Szakál"  & name1!= "Gaál" & name1!= "Lengyel" & name1!= "Fél" & name1!= "Pál"
replace g=1 if substr(name1,-1,1)=="l" & name1!="Hajnal"  & name1!="Szakál"  & name1!= "Gaál" & name1!= "Lengyel" & name1!= "Fél" & name1!= "Pál" & name1!= "Navratil"

replace f=1 if substr(name1,-2,2)=="ák" & name1!="Deák"

replace f=1 if substr(name1,-2,2)=="tz"
replace g=1 if substr(name1,-2,2)=="tz"

replace f=1 if substr(name1,-2,2)=="ik"

replace f=1 if substr(name1,-2,2)=="ht"
replace g=1 if substr(name1,-2,2)=="ht"

replace f=1 if substr(name1,-3,3)=="ics"

replace f=1 if substr(name1,-2,2)=="en"
replace g=1 if name1=="Baumgarten"
replace g=1 if name1=="Manchen"

replace f=1 if substr(name1,-3,3)=="zky"

replace f=1 if substr(name1,-2,2)=="ff"

replace f=1 if substr(name1,-2,2)=="ek"

replace f=1 if substr(name1,-2,2)=="dt"
replace g=1 if substr(name1,-2,2)=="dt"

replace f=1 if substr(name1,1,1)=="W"
replace g=1 if substr(name1,1,1)=="W" & name1!="Wittkovszky" & name1!="Warga" & name1!="Wiskonsky"

replace f=1 if substr(name1,-2,2)=="ng"
replace g=1 if substr(name1,-2,2)=="ng"

replace f=1 if substr(name1,-2,2)=="rg"
replace g=1 if substr(name1,-2,2)=="rg"

replace f=1 if substr(name1,-2,2)=="um"
replace g=1 if substr(name1,-2,2)=="um"

replace f=1 if substr(name1,-2,2)=="lt"
replace g=1 if substr(name1,-2,2)=="lt"

replace f=1 if substr(name1,-2,2)=="ov"

replace f=1 if substr(name1,-2,2)=="cz"  & name1!="Rácz"
replace g=1 if substr(name1,-2,2)=="cz"  & name1!="Rácz" & name1!="Oravecz" & name1!="Berecz" & name1!="Jakubecz" & name1!="Kabarcz" & name1!="Pólencz"


* name changers old name - same rules apply
gen chg_g=0
replace chg_g=1 if substr(oldname,-2,2)=="er"
replace chg_g=1 if substr(oldname,-4,4)=="mann"
replace chg_g=1 if substr(oldname,-2,2)=="ld"
replace chg_g=1 if substr(oldname,-2,2)=="ck"
replace chg_g=1 if substr(oldname,-2,2)=="gl"
replace chg_g=1 if substr(oldname,-2,2)=="in"
replace chg_g=1 if substr(oldname,-2,2)=="ld"
replace chg_g=1 if substr(oldname,-2,2)=="ck"
replace chg_g=1 if substr(oldname,-2,2)=="ch" & substr(oldname,-4,4)!="vich"
replace chg_g=1 if substr(oldname,-2,2)=="ns"
replace chg_g=1 if substr(oldname,-1,1)=="l" & oldname!="Hajnal"  & oldname!="Szakál"  & oldname!= "Gaál" & oldname!= "Lengyel" & oldname!= "Fél" & oldname!= "Pál" & oldname!= "Navratil"
replace chg_g=1 if substr(oldname,-2,2)=="tz"
replace chg_g=1 if substr(oldname,-2,2)=="ht"
replace chg_g=1 if oldname=="Baumgarten"
replace chg_g=1 if oldname=="Manchen"
replace chg_g=1 if substr(oldname,-2,2)=="dt"
replace chg_g=1 if substr(oldname,1,1)=="W" & oldname!="Wittkovszky" & oldname!="Warga" & oldname!="Wiskonsky"
replace chg_g=1 if substr(oldname,-2,2)=="ng"
replace chg_g=1 if substr(oldname,-2,2)=="rg"
replace chg_g=1 if substr(oldname,-2,2)=="um"
replace chg_g=1 if substr(oldname,-2,2)=="lt"
replace chg_g=1 if substr(oldname,-2,2)=="cz"  & oldname!="Rácz" & oldname!="Oravecz" & oldname!="Berecz" & oldname!="Jakubecz" & oldname!="Kabarcz" & oldname!="Pólencz"

replace chg_g=1 if oldname=="Neumann"
replace chg_g=1 if oldname=="Veisz"
replace chg_g=1 if oldname=="Braun"
replace chg_g=1 if oldname=="Stern"
replace chg_g=1 if oldname=="Trautmann"
replace chg_g=1 if oldname=="Gelb"
replace chg_g=1 if oldname=="Róth"
replace chg_g=1 if oldname=="Roth"
replace chg_g=1 if oldname=="Amtmann"
replace chg_g=1 if oldname=="Grünhut"
replace chg_g=1 if oldname=="Himpchmann"
replace chg_g=1 if oldname=="Róth"
replace chg_g=1 if oldname=="Siegmund"
replace chg_g=1 if oldname=="Blattmann"
replace chg_g=1 if oldname=="Barschrott"
replace chg_g=1 if oldname=="Halm"
replace chg_g=1 if oldname=="Guttmann"
replace chg_g=1 if oldname=="Groszmann"
replace chg_g=1 if oldname=="Ludvig"
replace chg_g=1 if oldname=="Fried"
replace chg_g=1 if oldname=="Fleischmann"
replace chg_g=1 if oldname=="Friedmann"
replace chg_g=1 if oldname=="Groszmann"
replace chg_g=1 if oldname=="Grossmann"
replace chg_g=1 if oldname=="Löwy"
replace chg_g=1 if oldname=="Feichtmann"
replace chg_g=1 if oldname=="Braun"
replace chg_g=1 if oldname=="Grün"
replace chg_g=1 if oldname=="Grosz"
replace chg_g=1 if oldname=="Kaufmann"
replace chg_g=1 if oldname=="Englert"
replace chg_g=1 if oldname=="Gross"
replace chg_g=1 if oldname=="Zwirn"
replace chg_g=1 if oldname=="Spanraff"
replace chg_g=1 if oldname=="Schwarz"
replace chg_g=1 if oldname=="Schöpkesz"
replace chg_g=1 if oldname=="Diamant"
replace chg_g=1 if oldname=="Engelmann"
replace chg_g=1 if oldname=="Schimp"
replace chg_g=1 if oldname=="Schmid"
replace chg_g=1 if oldname=="Grossz"
replace chg_g=1 if oldname=="Czopf"
replace chg_g=1 if oldname=="Czukermann"
replace chg_g=1 if oldname=="Honig"
replace chg_g=1 if oldname=="Schönfeld"
replace chg_g=1 if oldname=="Kohn"
replace chg_g=1 if oldname=="Schulteisz"
replace chg_g=1 if oldname=="Schwarcz"
replace chg_g=1 if oldname=="Schumandl"
replace chg_g=1 if oldname=="Spindler"
replace chg_g=1 if oldname=="Hackstock"
replace chg_g=1 if oldname=="Paukner"
replace chg_g=1 if oldname=="Faszler"
replace chg_g=1 if oldname=="Fuchs"
replace chg_g=1 if oldname=="Gross"
replace chg_g=1 if oldname=="Gruber"
replace chg_g=1 if oldname=="Grósz"
replace chg_g=1 if oldname=="Grünn"
replace chg_g=1 if oldname=="Haas"
replace chg_g=1 if oldname=="Habinstroh"
replace chg_g=1 if oldname=="Hackstock"
replace chg_g=1 if oldname=="Heine"
replace chg_g=1 if oldname=="Hofbauer"
replace chg_g=1 if oldname=="Kron"
replace chg_g=1 if oldname=="Losteiner"
replace chg_g=1 if oldname=="Pfeiffer"
replace chg_g=1 if oldname=="Reiter"
replace chg_g=1 if oldname=="Rosenfeld"
replace chg_g=1 if oldname=="Rosenzweig"
replace chg_g=1 if oldname=="Ruff"
replace chg_g=1 if oldname=="Schmidt"
replace chg_g=1 if oldname=="Schulteisz"
replace chg_g=1 if oldname=="Schumandl"
replace chg_g=1 if oldname=="Schwarcz"
replace chg_g=1 if oldname=="Schweig"
replace chg_g=1 if oldname=="Schön"
replace chg_g=1 if oldname=="Schütz"
replace chg_g=1 if oldname=="Stampf"
replace chg_g=1 if oldname=="Strumpf"



* some changers had Hungarian names before
replace changer=0 if oldname=="Szili"
replace changer=0 if oldname=="Juhász"
replace changer=0 if oldname=="Farkas"
replace changer=0 if oldname=="Kiss"

replace chg_g=0 if chg==0


*ONCE GERMAN, ALWAYS GERMAN
egen maxg=max(g), by(idmaster)
replace g=maxg if maxg!=.
drop maxg

*ONCE FOREIGN, ALWAYS FOREIGN
egen maxf=max(f), by(idmaster)
replace f=maxf if maxf!=.
drop maxf

*ONCE A CHANGER, ALWAYS A CHANGER
egen chg2=max(changer), by(idmaster)
replace changer=1 if chg2==1
egen cy=max(change_year), by(idmaster)
replace change_year=cy if change_year==. & cy!=.
drop cy

*ONCE A CHANGER, ALWAYS A CHANGER
replace change_year=0 if change_year==.
egen maxyear=max(change_year), by(idmaster)
replace change_year=maxyear
replace change_year=. if change_year==0
drop maxyear

* changer X german interactions
egen changer_ger=max(chg_g), by(idmaster)

replace g=1 if changer_ger==1
replace f=1 if changer_ger==1

replace f=1 if changer==1 & changer_ger==0

rename f name_foreign
rename g name_german

* these names are incorrectly specified as german by the algorithm
replace name_german=0 if idmaster==	40
replace name_german=0 if idmaster==	42
replace name_german=0 if idmaster==	168
replace name_german=0 if idmaster==	170
replace name_german=0 if idmaster==	207
replace name_german=0 if idmaster==	236
replace name_german=0 if idmaster==	247
replace name_german=0 if idmaster==	341
replace name_german=0 if idmaster==	373
replace name_german=0 if idmaster==	489
replace name_german=0 if idmaster==	504
replace name_german=0 if idmaster==	506
replace name_german=0 if idmaster==	560
replace name_german=0 if idmaster==	632
replace name_german=0 if idmaster==	698
replace name_german=0 if idmaster==	840
replace name_german=0 if idmaster==	857
replace name_german=0 if idmaster==	961
replace name_german=0 if idmaster==	962
replace name_german=0 if idmaster==	1021
replace name_german=0 if idmaster==	1492
replace name_german=0 if idmaster==	1757
replace name_german=0 if idmaster==	1965
replace name_german=0 if idmaster==	1996
replace name_german=0 if idmaster==	2047
replace name_german=0 if idmaster==	2149
replace name_german=0 if idmaster==	2178
replace name_german=0 if idmaster==	2201
replace name_german=0 if idmaster==	2313
replace name_german=0 if idmaster==	2344
replace name_german=0 if idmaster==	2394
replace name_german=0 if idmaster==	2404
replace name_german=0 if idmaster==	2414
replace name_german=0 if idmaster==	2570
replace name_german=0 if idmaster==	2598
replace name_german=0 if idmaster==	2616
replace name_german=0 if idmaster==	2663
replace name_german=0 if idmaster==	2771
replace name_german=0 if idmaster==	2921
replace name_german=0 if idmaster==	3020
replace name_german=0 if idmaster==	3644
replace name_german=0 if idmaster==	3717
replace name_german=0 if idmaster==	3853
replace name_german=0 if idmaster==	3978
replace name_german=0 if idmaster==	3995
replace name_german=0 if idmaster==	4122
replace name_german=0 if idmaster==	4337
replace name_german=0 if idmaster==	4572
replace name_german=0 if idmaster==	4637
replace name_german=0 if idmaster==	4937
replace name_german=0 if idmaster==	5108
replace name_german=0 if idmaster==	5110
replace name_german=0 if idmaster==	5127
replace name_german=0 if idmaster==	5217
replace name_german=0 if idmaster==	5316
replace name_german=0 if idmaster==	5406
replace name_german=0 if idmaster==	5409
replace name_german=0 if idmaster==	5416
replace name_german=0 if idmaster==	5418
replace name_german=0 if idmaster==	5430
replace name_german=0 if idmaster==	5478
replace name_german=0 if idmaster==	5496

* these names are incorrectly specified as foreign by the algorithm
replace name_foreign=0 if idmaster==	40
replace name_foreign=0 if idmaster==	247
replace name_foreign=0 if idmaster==	341
replace name_foreign=0 if idmaster==	373
replace name_foreign=0 if idmaster==	1965
replace name_foreign=0 if idmaster==	2394
replace name_foreign=0 if idmaster==	2414
replace name_foreign=0 if idmaster==	2570
replace name_foreign=0 if idmaster==	3020
replace name_foreign=0 if idmaster==	3644
replace name_foreign=0 if idmaster==	3853
replace name_foreign=0 if idmaster==	3978
replace name_foreign=0 if idmaster==	4637
replace name_foreign=0 if idmaster==	4937
replace name_foreign=0 if idmaster==	5406
replace name_foreign=0 if idmaster==	5409
replace name_foreign=0 if idmaster==	5418
replace name_foreign=0 if idmaster==	5478
replace name_foreign=0 if idmaster==	5496



drop name1 name2 chg2 chg_g

la var name_foreign "AG - Name is or previous name was foreign sounding"
la var name_german "AG - Name is or previous name was German sounding"
la var changer_ger "AG - Name changer with a German sounding previous name"
