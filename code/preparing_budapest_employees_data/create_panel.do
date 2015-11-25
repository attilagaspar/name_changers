
use "../data/budapest_employees/derived/almanach_yearbook_match_list.dta", clear
* 1904
rename id_1904 id
merge m:1 id using `a1904'
drop if _merge==2
drop _merge
gen allow1904=home_allowance1
replace allow1904=0 if allow1904==.
keep id_1907 id id_1912 id_1909 foreigner german work_place_cleaned position salary1 birth_y entry_y promotion_y unique_id fullname allow1904

rename fullname fullname1904
rename foreigner frg 
rename german ger
rename work_place_cleaned wp1904
rename position pos1904
rename salary1 sal1904
rename birth_y by1904
rename entry_y ey1904
rename promotion_y prom1904
rename id id_1904
rename unique_id uid1904

*1907
rename id_1907 id
merge m:1 id using `a1907'
drop if _merge==2
drop _merge
rename work_place_cleaned wp1907
rename position pos1907
rename salary1 sal1907
rename birth_y by1907
rename entry_y ey1907
rename promotion_y prom1907
rename id id_1907
rename unique_id uid1907
rename fullname fullname1907
gen allow1907=home_allowance1
replace allow1907=0 if allow1907==.

keep id_1907 id_1904 id_1912 id_1909 frg ger by1904 ey1904 prom1904 wp1904 pos1904 sal1904 by1907 ey1907 prom1907 wp1907 pos1907 sal1907 fullname* allow*


*1909
rename id_1909 id
merge m:1 id using `y1909'
drop if _merge==2
drop _merge

gen allow1909=home_allowance1
replace allow1909=0 if home_allowance1==.
replace allow1909=allow1909+personal_allowance if personal_allowance!=.
replace allow1909=allow1909+temporary_allowance if temporary_allowance!=.


rename workplace wp1909
rename position pos1909
rename salary1 sal1909
rename birth_y by1909
rename entry_y ey1909
rename promotion_y prom1909
rename fullname fullname1909
rename id id_1909

keep id_1907 id_1904 id_1912 id_1909 frg ger by1904 ey1904 prom1904 wp1904 pos1904 sal1904 by1907 ey1907 prom1907 wp1907 pos1907 sal1907 by1909 ey1909 prom1909 pos1909 sal1909 wp1909 fullname* allow*


* 1912

rename id_1912 id
cap drop _merge
merge m:1 id using `y1912'
drop if _merge==2
drop _merge

gen allow1912=home_allowance1
replace allow1912=0 if home_allowance1==.
replace allow1912=allow1912+manager_allowance if manager_allowance!=.
replace allow1912=allow1912+other_allowance if other_allowance!=.


rename workplace wp1912
rename position pos1912
rename salary1 sal1912
rename birth_y by1912
rename entry_y ey1912
rename promotion_y prom1912
rename fullname fullname1912
rename id id_1912

*keep id_1907 id_1904 id_1912 id_1909 frg ger by1904 ey1904 prom1904 wp1904 pos1904 sal1904 by1907 ey1907 prom1907 wp1907 pos1907 sal1907 by1909 ey1909 prom1909 pos1909 sal1909 wp1909 fullname* allow*
keep id* frg* ger* by* ey* prom* wp* pos* sal* fullname* allow*




*ITT VAGTAM EL A RENDBERAKAST APRILIS 29-EN HATKOR
/*


destring prom1907, force replace
destring prom1909, force replace

rename frg frg1904
gen frg1907=frg1904
gen frg1909=frg1904

rename ger ger1904
gen ger1907=ger1904
gen ger1909=ger1904

gen unique_id="alm1904"+string(id_1904)
merge m:1 unique_id using "../data/treatment/treatment.dta"
drop if _merge==2
drop _merge
gen chg=0
replace chg=1 if change_year!=.
rename change_year cy1904
rename macse_id macse_id1904
rename oldname oldname1904
rename newname newname1904
rename religion religion1904
*keep id_1907 id_1904 id_1912 id_1909 frg1904 ger1904 by1904 ey1904 prom1904 wp1904 pos1904 sal1904 by1907 ey1907 prom1907 wp1907 pos1907 sal1907 by1909 ey1909 prom1909 pos1909 sal1909 wp1909 frg1907 frg1909 ger1907 ger1909 cy1904 chg fullname* macse_id* oldname* newname* allow*  religion*
keep id* frg* ger* by* ey* prom* wp* pos* sal* fullname* macse_id* oldname* newname* allow*  religion* chg cy*

gen unique_id="alm1907"+string(id_1907)
merge m:1 unique_id using "../data/treatment/treatment.dta"
drop if _merge==2
drop _merge
replace chg=1 if change_year!=.
rename change_year cy1907
rename macse_id macse_id1907
rename oldname oldname1907
rename newname newname1907
rename religion religion1907
*keep id_1907 id_1904 id_1912 id_1909 frg1904 ger1904 by1904 ey1904 prom1904 wp1904 pos1904 sal1904 by1907 ey1907 prom1907 wp1907 pos1907 sal1907 by1909 ey1909 prom1909 pos1909 sal1909 wp1909 frg1907 frg1909 ger1907 ger1909 cy1904 chg cy1907 fullname* macse_id* oldname* newname* allow*  religion*
keep id* frg* ger* by* ey* prom* wp* pos* sal* fullname* macse_id* oldname* newname* allow*  religion* chg cy*

gen unique_id="yb1909"+string(id_1909)
merge m:1 unique_id using "../data/treatment/treatment.dta"
drop if _merge==2
drop _merge
replace chg=1 if change_year!=.
rename change_year cy1909
rename macse_id macse_id1909
rename oldname oldname1909
rename newname newname1909
rename religion religion1909

*keep id_1907 id_1904 id_1912 id_1909 frg1904 ger1904 by1904 ey1904 prom1904 wp1904 pos1904 sal1904 by1907 ey1907 prom1907 wp1907 pos1907 sal1907 by1909 ey1909 prom1909 pos1909 sal1909 wp1909 frg1907 frg1909 ger1907 ger1909 cy1904 chg cy1907 cy1909 fullname* macse_id* oldname* newname* allow*  religion*
keep id* frg* ger* by* ey* prom* wp* pos* sal* fullname* macse_id* oldname* newname* allow*  religion* chg cy*

gen unique_id="yb1912"+string(id_1912)
merge m:1 unique_id using "../data/treatment/treatment.dta"
drop if _merge==2
drop _merge
replace chg=1 if change_year!=.
rename change_year cy1912
rename macse_id macse_id1912
rename oldname oldname1912
rename newname newname1912
rename religion religion1912
*keep id_1907 id_1904 id_1912 id_1909 frg1904 ger1904 by1904 ey1904 prom1904 wp1904 pos1904 sal1904 by1907 ey1907 prom1907 wp1907 pos1907 sal1907 by1909 ey1909 prom1909 pos1909 sal1909 wp1909 frg1907 frg1909 ger1907 ger1909 cy1904 chg cy1907 cy1909 fullname* macse_id* oldname* newname* allow*  religion*
keep id* frg* ger* by* ey* prom* wp* pos* sal* fullname* macse_id* oldname* newname* allow*  religion* chg cy*

rename chg chg1904
gen chg1907=chg1904
gen chg1909=chg1904
gen chg1912=chg1904
gen i=_n




gen fname=fullname1904
replace fname=fullname1907 if fname==""
replace fname=fullname1909 if fname==""
replace fname=fullname1912 if fname==""



reshape long id_ oldname newname macse_id frg ger by ey wp pos sal prom allow chg cy fullname religion, i(i) j(t)
drop if sal==.

replace prom=1906 if prom==11906
drop if ey>1912 & ey !=.

*name cleaning - creating foreign and german vars
split fname, gen(name)
drop name3 name4 name5 name6 name7
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
* f: foreign ; g: german (all germans are foreigners)
gen f=0
gen g=0
replace f=1 if substr(name1,-2,2)=="er"
replace g=1 if substr(name1,-2,2)=="er"

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
replace chg=0 if oldname=="Szili"
replace chg=0 if oldname=="Juhász"
replace chg=0 if oldname=="Farkas"
replace chg=0 if oldname=="Kiss"

replace chg_g=0 if chg==0

*ONCE A CHANGER, ALWAYS A CHANGER
egen chg2=max(chg), by(i)
replace chg=1 if chg2==1
egen cy2=max(cy), by(i)
replace cy=cy2 if cy==. & chg2==1

* changer X german interactions
egen chg_ger=max(chg_g), by(i)

replace g=1 if chg_ger==1
replace f=1 if chg_ger==1

replace f=1 if chg==1 & chg_ger==0

*-------------------------------------------------------------*
*              ITT KESZULNEK A CSOPORTVALTOZOK                *
*-------------------------------------------------------------*
gen x=_n
preserve
duplicates drop pos, force
drop if t==1912
keep x pos
*strgroup pos, gen(pvar1) thresh(0.2)
*tempvar pvg1
*save "`pvg1'",replace
*drop pvar1
*strgroup pos, gen(pvar2) thresh(0.3)
*tempvar pvg2
*save "`pvg2'",replace
*drop pvar2
* EZ LESZ JÓ:
strgroup pos, gen(pvar3) thresh(0.4)
tempvar pvg3
save "`pvg3'",replace
*drop pvar3
*strgroup pos, gen(pvar4) thresh(0.5)
*tempvar pvg4
*save "`pvg4'",replace
restore

*merge 1:1 x using "`pvg1'"
*drop _merge
*merge 1:1 x using "`pvg2'"
*drop _merge
merge 1:1 x using "`pvg3'"
drop _merge
*merge 1:1 x using "`pvg4'"
*drop _merge

*drop pvar1 pvar2 pvar4

preserve
duplicates drop wp, force
keep x wp

/*strgroup wp, gen(wpvar1) thresh(0.2)
tempvar wp1
save "`wp1'",replace
drop wpvar1

strgroup wp, gen(wpvar2) thresh(0.3)
tempvar wp2
save "`wp2'",replace
drop wpvar2*/

strgroup wp, gen(wpvar3) thresh(0.4)
tempvar wp3
save "`wp3'",replace
drop wpvar3

/*strgroup wp, gen(wpvar4) thresh(0.5)
tempvar wp4
save "`wp4'",replace
drop wpvar4

strgroup wp, gen(wpvar5) thresh(0.6)
tempvar wp5
save "`wp5'",replace
drop wpvar5

strgroup wp, gen(wpvar6) thresh(0.7)
tempvar wp6
save "`wp6'",replace
drop wpvar6

strgroup wp, gen(wpvar7) thresh(0.8)
tempvar wp7
save "`wp7'",replace
drop wpvar7

strgroup wp, gen(wpvar8) thresh(0.9)
tempvar wp8
save "`wp8'",replace
drop wpvar8*/

restore

/*merge 1:1 x using "`wp1'"
drop _merge
merge 1:1 x using "`wp2'"
drop _merge*/
merge 1:1 x using "`wp3'"
drop _merge
/*merge 1:1 x using "`wp4'"
drop _merge
merge 1:1 x using "`wp5'"
drop _merge
merge 1:1 x using "`wp6'"
drop _merge
merge 1:1 x using "`wp7'"
drop _merge
merge 1:1 x using "`wp8'"
drop _merge*/

gen work=wpvar3

replace work=101 if wp=="VI k. ak." | wp=="I k. ak." | wp=="I-III k. ak" | wp=="I-III k. anyak." | wp=="IV k. ak." | wp=="V-VI k. anyak." | wp=="VI k. ak." | wp=="VII k. ak." | wp=="VIII k. ak." | wp=="X k. ak." | wp=="VI k. ak. "
replace work=101 if wp==" VI k. ak."
replace work=102 if wp=="Erzs.lárv" | wp=="Erzs.lárv."

replace work=101 if wp=="IV-IX-X k. ak."
replace work=101 if wp=="IV-IX-X. k. ak."
replace work=101 if wp=="1—II. kér. anyakönyvi hivatal"
replace work=101 if wp=="V.  és VI. kér. anyakönyvi hivatal"
replace work=101 if wp=="VII.  kér. anyakönyvi hivatal"
replace work=101 if wp=="X. kér. anyakönyvi hivatal"

replace work=103 if wp=="I k. elolj."
replace work=103 if wp=="I-III k elolj"
replace work=103 if wp=="I. k. elölj."
replace work=103 if wp=="II k. elölj."
replace work=103 if wp=="III k.elolj."
replace work=103 if wp=="III k.elölj."
replace work=103 if wp=="IV k. elölj."
replace work=103 if wp=="IV. k. elölj."
replace work=103 if wp=="IX k. elölj."
replace work=103 if wp=="V k. elölj."
replace work=103 if wp=="V. k. elolj."
replace work=103 if wp=="V. k. elölj."
replace work=103 if wp=="VI k. elolj."
replace work=103 if wp=="VI k. elölj"
replace work=103 if wp=="VII k. elj."
replace work=103 if wp=="VII k. elölj"
replace work=103 if wp=="VIII k. elölj."
replace work=103 if wp=="VIII k.elj."
replace work=103 if wp=="X k. elolj"
replace work=103 if wp=="X k. elölj."
replace work=103 if wp=="k.elolj."
replace work=103 if wp=="lV k. Elölj."
replace work=103 if wp=="I. k. elölj. "
replace work=103 if wp=="V. k. elölj. "

replace work=104 if wp==" l-lll k. mérth." | wp=="I-III k. mérth."

replace work=105 if wp=="Közp. vcs"
replace work=105 if wp=="Közp. vcs."
replace work=105 if wp=="V k. vcs."
replace work=105 if wp=="VI k. vcs"
replace work=105 if wp=="VI k. vcs."
replace work=105 if wp=="VII k. vcs."
replace work=105 if wp=="VIII k. vcs."
replace work=105 if wp=="Vásárcsarnokok"
replace work=105 if wp==" IV k. fed. Vásár"
replace work=105 if wp=="IV k. fed. vásár"


replace work=106 if wp=="Vásárig."
replace work=106 if wp=="vásárig."
replace work=106 if wp=="Vásarigazgatoság"
replace work=106 if wp=="V csar. ig."
replace work=106 if wp=="Vcsrn. ig."


replace work=9 if wp=="IV.  és IX. kér"
replace work=9 if wp=="V.  és VI. kér"

replace work=107 if wp=="Közv. ig."
replace work=107 if wp=="Közvhid."
replace work=107 if wp=="Közvhíd"
replace work=107 if wp=="Közv.állatv."
replace work=107 if wp=="Közvágóhidak és állatvásáro"
replace work=107 if wp=="Közvágóhidak és állatvásárok"
replace work=107 if wp==" Közv. ig"

replace work=36 if wp=="Erzsébet szegényház" | wp=="Erzs. szh."
replace work=36 if wp=="Községi szeretetház"


replace work=108 if wp=="Vízv. ig."
replace work=108 if wp=="Vizmü-ig."
replace work=108 if wp=="Vízmü-ig."

replace work=108 if wp=="h. vízv. ig."
replace work=108 if wp=="h. vízv.ig."

replace work=109 if wp==" Közp. adószr."
replace work=109 if wp=="Közp. Adószv"

replace work=101 if wp=="V-VI any. K. h. "

replace work=4 if wp=="Kp. szv."
replace work=4 if wp=="Közp. szv."
replace work=4 if wp=="Szv VI üo."
replace work=4 if wp==" Sz. VII üo"
replace work=4 if wp=="Szv. I üo."
replace work=4 if wp=="Szv II üo."
replace work=4 if wp=="Szv IV üo."
replace work=4 if wp=="Számv. VIII üo."
replace work=4 if wp=="Szv.V üo"
replace work=4 if wp=="Sz. V. üo."
replace work=4 if wp=="Szv. II üo."
replace work=4 if wp=="Szv.III üo."


replace work=32 if wp=="József fiá."
replace work=32 if wp==" József fiá."

replace work=30 if wp=="Gazd. hiv."
replace work=29 if wp=="Mérn. hiv."
replace work=29 if wp=="Mérn. Hiv"

replace work=7 if wpvar3==8

replace work=32 if wp=="Árv. shiv"
replace work=32 if wp=="Árv. shiv."
replace work=32 if wp=="Mayer á."
replace work=32 if wp=="Mayer á"
replace work=32 if wpvar3==48

replace work=10 if wpvar3==11
replace work=10 if wp=="Dunabalparti közkórházak"
replace work=10 if wp=="Dunajobbparti kórházak"
replace work=10 if wp=="Rók. kórh"
replace work=10 if wp=="Rók. kór."
replace work=10 if wp=="Uj dkórh."
replace work=10 if wp=="Uj dkórh"
replace work=9 if wpvar3==70
replace work=7 if wpvar3==38

replace work=76 if work==75
replace work=42 if work==52
replace work=77 if work==81
replace work=77 if work==67
replace work=77 if work==68
replace work=77 if wp=="Alpolgármesterek mellé szolgálatra rendelve"


replace work=30 if wp=="Jobbp. gazd. hiv."
replace work=30 if wp=="Jobbp. gazd. h."
replace work=30 if wp=="Gazdasági hivatal erdo- és mezogazdasági osztálya"

replace work=18 if wp=="Dunabalparti köztemetok"
replace work=18 if wp=="Dunajobbparti köztemetok"
replace work=18 if wp==" Db. közt."
replace work=18 if wp=="Db. Közt."
replace work=18 if wp==" X. kér. temeto."
replace work=18 if wp=="X. kér. temeto"
replace work=18 if wp=="Balp. ktem. ig."


replace work=7 if wpvar3==2


egen wgroup=min(work), by(wp)
rename work wtag
rename wgroup work



/*gen c1897=0
replace c1897=1 if cy<1898
gen c1897_ger=c1897*g
gen c1898=0
replace c1898=1 if cy==1898
gen c1898_ger=c1898*g*/


*!!!!!!!!!!!44
/*replace chg=0 if cy==.
egen xxx=total(chg), by(work)
drop if xxx==0*/

/*drop x
egen x=max(ey), by(i)
egen y=min(ey), by(i)
gen z=x-y
keep if z==0*/

/*
reg sal chg
outreg2 using regression.xls, replace
reg sal chg f
outreg2 using regression.xls
reg sal chg f exp
outreg2 using regression.xls
reg sal chg f exp exp2
outreg2 using regression.xls
reg sal chg f exp exp2 i.t
outreg2 using regression.xls
reg sal chg f exp exp2 i.t i.work
outreg2 using regression.xls

preserve 
*keep if sal>800 & sal<5000

reg sal chg
outreg2 using regression.xls 
reg sal chg f
outreg2 using regression.xls
reg sal chg f exp
outreg2 using regression.xls
reg sal chg f exp exp2
outreg2 using regression.xls
reg sal chg f exp exp2 i.t
outreg2 using regression.xls
reg sal chg f exp exp2 i.t i.work
outreg2 using regression.xls

reg sal chg, rob
outreg2 using regression.xls 
reg sal chg f, rob
outreg2 using regression.xls
reg sal chg f exp, rob
outreg2 using regression.xls
reg sal chg f exp exp2, rob
outreg2 using regression.xls
reg sal chg f exp exp2 i.t, rob
outreg2 using regression.xls
reg sal chg f exp exp2 i.t i.work, rob
outreg2 using regression.xls

reg sal chg, vce(cluster i)
outreg2 using regression.xls 
reg sal chg f, vce(cluster i)
outreg2 using regression.xls
reg sal chg f exp, vce(cluster i)
outreg2 using regression.xls
reg sal chg f exp exp2, vce(cluster i)
outreg2 using regression.xls
reg sal chg f exp exp2 i.t, vce(cluster i)
outreg2 using regression.xls
reg sal chg f exp exp2 i.t i.work, vce(cluster i)
outreg2 using regression.xls

restore
cap gen pre1899=0
replace pre1899=1 if cy<1899
reg sal chg pre1899
outreg2 using regression2.xls, replace
reg sal chg  pre1899 f
outreg2 using regression2.xls
reg sal chg  pre1899 f exp 
outreg2 using regression2.xls
reg sal chg  pre1899 f exp exp2
outreg2 using regression2.xls
reg sal chg  pre1899 f exp exp2 i.t
outreg2 using regression2.xls
reg sal chg  pre1899 f exp exp2 i.t i.work
outreg2 using regression2.xls

preserve 
*keep if sal>800 & sal<5000

reg sal chg pre1899
outreg2 using regression2.xls 
reg sal chg  pre1899 f
outreg2 using regression2.xls
reg sal chg  pre1899 f exp
outreg2 using regression2.xls
reg sal chg  pre1899 f exp exp2
outreg2 using regression2.xls
reg sal chg  pre1899 f exp exp2 i.t
outreg2 using regression2.xls
reg sal chg  pre1899 f exp exp2 i.t i.work
outreg2 using regression2.xls


reg sal chg pre1899, rob
outreg2 using regression2.xls 
reg sal chg pre1899 f, rob
outreg2 using regression2.xls
reg sal chg pre1899 f exp, rob
outreg2 using regression2.xls
reg sal chg pre1899 f exp exp2, rob
outreg2 using regression2.xls
reg sal chg  pre1899 f exp exp2 i.t, rob
outreg2 using regression2.xls
reg sal chg  pre1899 f exp exp2 i.t i.work, rob
outreg2 using regression2.xls

reg sal chg  pre1899, vce(cluster i)
outreg2 using regression2.xls 
reg sal chg  pre1899 f, vce(cluster i)
outreg2 using regression2.xls
reg sal chg  pre1899 f exp, vce(cluster i)
outreg2 using regression2.xls
reg sal chg  pre1899 f exp exp2, vce(cluster i)
outreg2 using regression2.xls
reg sal chg   pre1899 f exp exp2 i.t, vce(cluster i)
outreg2 using regression2.xls
reg sal chg   pre1899 f exp exp2 i.t i.work, vce(cluster i)
outreg2 using regression2.xls


restore

cap drop c1897 c1898 c1899

gen c1897=0
replace c1897=1 if chg==1 & cy<1898
gen c1898=0
replace c1898=1 if chg==1 & cy==1898
gen c1899=0
replace c1899=1 if chg==1 & cy>1898

reg sal chg  c1897 c1898 , rob
outreg2 using regression3.xls, replace
reg sal chg  c1897 c1898  f, rob
outreg2 using regression3.xls
reg sal chg  c1897 c1898  f exp, rob
outreg2 using regression3.xls
reg sal chg  c1897 c1898  f exp exp2, rob
outreg2 using regression3.xls
reg sal chg c1897 c1898   f exp exp2 i.t, rob
outreg2 using regression3.xls
reg sal chg c1897 c1898   f exp exp2 i.t i.work, rob
outreg2 using regression3.xls





*CSOPORTOK ÉS POZÍCIÓK
*KÜLFÖLDI
*INSAMPLE CHANGEREK


reg sal chg
outreg2 using regression_ger.xls, replace
reg sal chg f g
outreg2 using regression_ger.xls
reg sal chg f g exp
outreg2 using regression_ger.xls
reg sal chg f g exp exp2
outreg2 using regression_ger.xls
reg sal chg f g exp exp2 i.t
outreg2 using regression_ger.xls
reg sal chg f g exp exp2 i.t i.work
outreg2 using regression_ger.xls

preserve 
*keep if sal>800 & sal<5000

reg sal chg
outreg2 using regression_ger.xls 
reg sal chg f g
outreg2 using regression_ger.xls
reg sal chg f g exp
outreg2 using regression_ger.xls
reg sal chg f g exp exp2
outreg2 using regression_ger.xls
reg sal chg f g exp exp2 i.t
outreg2 using regression_ger.xls
reg sal chg f g exp exp2 i.t i.work
outreg2 using regression_ger.xls

reg sal chg, rob
outreg2 using regression_ger.xls 
reg sal chg f g , rob
outreg2 using regression_ger.xls
reg sal chg f g exp, rob
outreg2 using regression_ger.xls
reg sal chg f g exp exp2, rob
outreg2 using regression_ger.xls
reg sal chg f g exp exp2 i.t, rob
outreg2 using regression_ger.xls
reg sal chg f g exp exp2 i.t i.work, rob
outreg2 using regression_ger.xls

reg sal chg, vce(cluster work)
outreg2 using regression_ger.xls 
reg sal chg f g, vce(cluster work)
outreg2 using regression_ger.xls
reg sal chg f g exp, vce(cluster work)
outreg2 using regression_ger.xls
reg sal chg f g exp exp2, vce(cluster work)
outreg2 using regression_ger.xls
reg sal chg f g exp exp2 i.t, vce(cluster work)
outreg2 using regression_ger.xls
reg sal chg f g exp exp2 i.t i.work, vce(cluster work)
outreg2 using regression_ger.xls

restore

preserve
*keep if sal>800 & sal<5000
keep if chg==1 | f==1
drop if chg==1 & cy==.
reg sal chg
outreg2 using regression_chonly.xls, replace
reg sal chg 
outreg2 using regression_chonly.xls
reg sal chg  exp
outreg2 using regression_chonly.xls
reg sal chg  exp exp2
outreg2 using regression_chonly.xls
reg sal chg  exp exp2 i.t
outreg2 using regression_chonly.xls
reg sal chg  exp exp2 i.t i.work
outreg2 using regression_chonly.xls

*keep if sal>800 & sal<5000
restore, preserve
keep if chg==1 | f==1
drop if chg==1 & cy==.
reg sal chg chg_g g
outreg2 using regression_chonly.xls, replace
reg sal chg chg_g g exp
outreg2 using regression_chonly.xls
reg sal chg chg_g g exp exp2
outreg2 using regression_chonly.xls
reg sal chg chg_g g exp exp2 i.t
outreg2 using regression_chonly.xls
reg sal chg chg_g g exp exp2 i.t i.work
outreg2 using regression_chonly.xls



reg sal chg g
outreg2 using regression_chonly.xls
reg sal chg g
outreg2 using regression_chonly.xls
reg sal chg  g exp
outreg2 using regression_chonly.xls
reg sal chg  g exp exp2
outreg2 using regression_chonly.xls
reg sal chg  g exp exp2 i.t
outreg2 using regression_chonly.xls
reg sal chg  g exp exp2 i.t i.work
outreg2 using regression_chonly.xls


reg sal chg,rob
outreg2 using regression_chonly.xls
reg sal chg,rob
outreg2 using regression_chonly.xls
reg sal chg  exp,rob
outreg2 using regression_chonly.xls
reg sal chg  exp exp2,rob
outreg2 using regression_chonly.xls
reg sal chg  exp exp2 i.t,rob
outreg2 using regression_chonly.xls
reg sal chg  exp exp2 i.t i.work,rob
outreg2 using regression_chonly.xls

reg sal chg g,rob
outreg2 using regression_chonly.xls
reg sal chg g,rob
outreg2 using regression_chonly.xls
reg sal chg g exp,rob
outreg2 using regression_chonly.xls
reg sal chg g exp exp2,rob
outreg2 using regression_chonly.xls
reg sal chg g exp exp2 i.t,rob
outreg2 using regression_chonly.xls
reg sal chg g exp exp2 i.t i.work,rob
outreg2 using regression_chonly.xls



reg sal prech postch, rob
outreg2 using regression_chonly2.xls
reg sal prech postch exp exp2,rob
outreg2 using regression_chonly2.xls
reg sal prech postch exp exp2 i.t,rob
outreg2 using regression_chonly2.xls
reg sal prech postch exp exp2 i.t i.work,rob
outreg2 using regression_chonly2.xls

reg sal c1897 c1898 c1899, rob
outreg2 using regression_chonly3.xls
reg sal c1897 c1898 c1899 exp exp2,rob
outreg2 using regression_chonly3.xls
reg sal c1897 c1898 c1899 exp exp2 i.t,rob
outreg2 using regression_chonly3.xls
reg sal c1897 c1898 c1899 exp exp2 i.t i.work,rob
outreg2 using regression_chonly3.xls

restore

preserve
*keep if sal>800 & sal<5000
drop if chg==1 & cy==.
qreg sal chg, quantile(.1)
outreg2 using changer_qreg.xls, replace ctitle("decile 1")
forvalues i = 2(1)9 {
        local p=`i'/10
		qreg sal chg, quantile(`p')
		
		outreg2 using changer_qreg.xls, ctitle("decile `i'")
	

}

qreg sal chg exp exp2 i.t i.work, quantile(.1)
outreg2 using changer_qreg2.xls, replace ctitle("decile 1")
forvalues i = 2(1)9 {
        local p=`i'/10
		qreg sal chg exp exp2 i.t i.work, quantile(`p')
		
		outreg2 using changer_qreg2.xls, ctitle("decile `i'")
	

}


keep if chg==1 | f==1

qreg sal chg, quantile(.1)
outreg2 using changer_qreg_chonly.xls, replace ctitle("decile 1")
forvalues i = 2(1)9 {
        local p=`i'/10
		qreg sal chg, quantile(`p')
		
		outreg2 using changer_qreg_chonly.xls, ctitle("decile `i'")
	

}

qreg sal chg exp exp2 i.t i.work, quantile(.1)
outreg2 using changer_qreg_chonly2.xls, replace ctitle("decile 1")
forvalues i = 2(1)9 {
        local p=`i'/10
		qreg sal chg exp exp2 i.t i.work, quantile(`p')
		
		outreg2 using changer_qreg_chonly2.xls, ctitle("decile `i'")
	

}

restore


gen chg_jew =0
replace chg_jew=1 if religion=="izr."

reg sal chg chg_jew
outreg2 using regression_jew.xls 
reg sal chg chg_jew f
outreg2 using regression_jew.xls
reg sal chg chg_jew f exp
outreg2 using regression_jew.xls
reg sal chg chg_jew f exp exp2
outreg2 using regression_jew.xls
reg sal chg chg_jew f exp exp2 i.t
outreg2 using regression_jew.xls
reg sal chg chg_jew f exp exp2 i.t i.work
outreg2 using regression_jew.xls

reg sal chg chg_jew, rob
outreg2 using regression_jew.xls 
reg sal chg chg_jew f, rob
outreg2 using regression_jew.xls
reg sal chg chg_jew f exp, rob
outreg2 using regression_jew.xls
reg sal chg chg_jew f exp exp2, rob
outreg2 using regression_jew.xls
reg sal chg chg_jew f exp exp2 i.t, rob
outreg2 using regression_jew.xls
reg sal chg chg_jew f exp exp2 i.t i.work, rob
outreg2 using regression_jew.xls

reg sal chg chg_jew, vce(cluster i)
outreg2 using regression_jew.xls 
reg sal chg chg_jew f, vce(cluster i)
outreg2 using regression_jew.xls
reg sal chg chg_jew f exp, vce(cluster i)
outreg2 using regression_jew.xls
reg sal chg chg_jew f exp exp2, vce(cluster i)
outreg2 using regression_jew.xls
reg sal chg chg_jew f exp exp2 i.t, vce(cluster i)
outreg2 using regression_jew.xls
reg sal chg chg_jew f exp exp2 i.t i.work, vce(cluster i)
outreg2 using regression_jew.xls

reg sal chg chg_jew
outreg2 using regression_jew.xls 
reg sal chg chg_jew f g
outreg2 using regression_jew.xls
reg sal chg chg_jew f g exp
outreg2 using regression_jew.xls
reg sal chg chg_jew f g exp exp2
outreg2 using regression_jew.xls
reg sal chg chg_jew f g exp exp2 i.t
outreg2 using regression_jew.xls
reg sal chg chg_jew f g exp exp2 i.t i.work
outreg2 using regression_jew.xls

reg sal chg chg_jew, rob
outreg2 using regression_jew.xls 
reg sal chg chg_jew f g, rob
outreg2 using regression_jew.xls
reg sal chg chg_jew f g exp, rob
outreg2 using regression_jew.xls
reg sal chg chg_jew f g exp exp2, rob
outreg2 using regression_jew.xls
reg sal chg chg_jew f g exp exp2 i.t, rob
outreg2 using regression_jew.xls
reg sal chg chg_jew f g exp exp2 i.t i.work, rob
outreg2 using regression_jew.xls

reg sal chg chg_jew, vce(cluster i)
outreg2 using regression_jew.xls 
reg sal chg chg_jew f g , vce(cluster i)
outreg2 using regression_jew.xls
reg sal chg chg_jew f g exp, vce(cluster i)
outreg2 using regression_jew.xls
reg sal chg chg_jew f g exp exp2, vce(cluster i)
outreg2 using regression_jew.xls
reg sal chg chg_jew f g exp exp2 i.t, vce(cluster i)
outreg2 using regression_jew.xls
reg sal chg chg_jew f g exp exp2 i.t i.work, vce(cluster i)
outreg2 using regression_jew.xls

* a maslow-piramis forintosítása

* graphs
twoway kdensity exp if chg==0, legend(label(1 "non-changer experience")) || kdensity exp if chg==1, legend(label(2 "changer experience")) || kdensity exp if f==1, legend(label(3 "foreigner experience"))
twoway kdensity exp if chg==1 & chg_jew==0, legend(label(1 "non-jewish changers' experience")) || kdensity exp if chg==1 & chg_jew==1, legend(label(2 "jewish changers' experience")) 

twoway kdensity age if chg==0, legend(label(1 "non-changer age")) || kdensity age if chg==1, legend(label(2 "changer age")) || kdensity age if f==1, legend(label(3 "foreigner age"))

twoway kdensity sal if chg==0, legend(label(1 "non-changer salary")) || kdensity sal if chg==1, legend(label(2 "changer salary")) || kdensity sal if f==1, legend(label(3 "foreigner salary"))



gen ff=f
replace ff=1 if chg==1
gen gg=g
replace gg=1 if chg_g==1

reg sal chg chg_g gg ff exp exp2 i.t i.work, rob


reg sal chg chg_jew, rob
outreg2 using regression_g.xls 
reg sal chg chg_jew f g, rob
outreg2 using regression_g.xls
reg sal chg chg_jew f g exp, rob
outreg2 using regression_g.xls
reg sal chg chg_jew f g exp exp2, rob
outreg2 using regression_g.xls
reg sal chg chg_jew f g exp exp2 i.t, rob
outreg2 using regression_g.xls
reg sal chg chg_jew f g exp exp2 i.t i.work, rob
outreg2 using regression_g.xls

gen ls=log(sal)

kdensity ls if chg==0 & f==0, legend(label(1 "wage - always Hungarian"))
graph export 1_alwayshungarian.png ,replace
kdensity ls if f==1 & g==0, legend(label(1 "wage - neverchanger non-German"))
graph export 2_neverchanger_nongerman.png,replace
kdensity ls if f==1 & g==1, legend(label(1 "wage - neverchanger German"))
graph export 3_neverchanger_german.png,replace
kdensity ls if chg==1 & chg_g==0, legend(label(1 "wage - changer non-German"))
graph export 4_changer_nongerman.png,replace
kdensity ls if chg==1 & chg_g==1, legend(label(1 "wage - changer German"))
graph export 5_changer_german.png,replace
kdensity ls if chg==1 & chg_jew==1, legend(label(1 "wage - changer Jewish"))
graph export 6_changer_jewish.png,replace



reg ls prech postch exp exp2 i.t i.work,rob
reg ls c1897 c1898 c1899 exp exp2 i.t i.work,rob

reg ls prech postch ff gg exp exp2 age age2 i.t i.work,rob
*/
