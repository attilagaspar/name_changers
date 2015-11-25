*-------------------------------------------------------------*
*              ITT KESZULNEK A CSOPORTVALTOZOK                *
*-------------------------------------------------------------*
gen x=_n
preserve
duplicates drop pos, force
*drop if year==1912
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
tempfile pvg3
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
merge m:1 pos using "`pvg3'"
drop _merge
*merge 1:1 x using "`pvg4'"
*drop _merge

*drop pvar1 pvar2 pvar4

preserve
duplicates drop workplace_clean, force
keep x workplace_clean


strgroup workplace_clean, gen(wpvar3) thresh(0.4)
tempfile wp3
save "`wp3'",replace



restore


merge m:1 workplace_clean using "`wp3'"
drop _merge


gen work=wpvar3

replace work=101 if workplace_clean=="VI k. ak." | workplace_clean=="I k. ak." | workplace_clean=="I-III k. ak" | workplace_clean=="I-III k. anyak." | workplace_clean=="IV k. ak." | workplace_clean=="V-VI k. anyak." | workplace_clean=="VI k. ak." | workplace_clean=="VII k. ak." | workplace_clean=="VIII k. ak." | workplace_clean=="X k. ak." | workplace_clean=="VI k. ak. "
replace work=101 if workplace_clean==" VI k. ak."
replace work=102 if workplace_clean=="Erzs.lárv" | workplace_clean=="Erzs.lárv."

replace work=101 if workplace_clean=="IV-IX-X k. ak."
replace work=101 if workplace_clean=="IV-IX-X. k. ak."
replace work=101 if workplace_clean=="1—II. kér. anyakönyvi hivatal"
replace work=101 if workplace_clean=="V.  és VI. kér. anyakönyvi hivatal"
replace work=101 if workplace_clean=="VII.  kér. anyakönyvi hivatal"
replace work=101 if workplace_clean=="X. kér. anyakönyvi hivatal"

replace work=103 if workplace_clean=="I k. elolj."
replace work=103 if workplace_clean=="I-III k elolj"
replace work=103 if workplace_clean=="I. k. elölj."
replace work=103 if workplace_clean=="II k. elölj."
replace work=103 if workplace_clean=="III k.elolj."
replace work=103 if workplace_clean=="III k.elölj."
replace work=103 if workplace_clean=="IV k. elölj."
replace work=103 if workplace_clean=="IV. k. elölj."
replace work=103 if workplace_clean=="IX k. elölj."
replace work=103 if workplace_clean=="V k. elölj."
replace work=103 if workplace_clean=="V. k. elolj."
replace work=103 if workplace_clean=="V. k. elölj."
replace work=103 if workplace_clean=="VI k. elolj."
replace work=103 if workplace_clean=="VI k. elölj"
replace work=103 if workplace_clean=="VII k. elj."
replace work=103 if workplace_clean=="VII k. elölj"
replace work=103 if workplace_clean=="VIII k. elölj."
replace work=103 if workplace_clean=="VIII k.elj."
replace work=103 if workplace_clean=="X k. elolj"
replace work=103 if workplace_clean=="X k. elölj."
replace work=103 if workplace_clean=="k.elolj."
replace work=103 if workplace_clean=="lV k. Elölj."
replace work=103 if workplace_clean=="I. k. elölj. "
replace work=103 if workplace_clean=="V. k. elölj. "

replace work=104 if workplace_clean==" l-lll k. mérth." | workplace_clean=="I-III k. mérth."

replace work=105 if workplace_clean=="Közp. vcs"
replace work=105 if workplace_clean=="Közp. vcs."
replace work=105 if workplace_clean=="V k. vcs."
replace work=105 if workplace_clean=="VI k. vcs"
replace work=105 if workplace_clean=="VI k. vcs."
replace work=105 if workplace_clean=="VII k. vcs."
replace work=105 if workplace_clean=="VIII k. vcs."
replace work=105 if workplace_clean=="Vásárcsarnokok"
replace work=105 if workplace_clean==" IV k. fed. Vásár"
replace work=105 if workplace_clean=="IV k. fed. vásár"


replace work=106 if workplace_clean=="Vásárig."
replace work=106 if workplace_clean=="vásárig."
replace work=106 if workplace_clean=="Vásarigazgatoság"
replace work=106 if workplace_clean=="V csar. ig."
replace work=106 if workplace_clean=="Vcsrn. ig."


replace work=9 if workplace_clean=="IV.  és IX. kér"
replace work=9 if workplace_clean=="V.  és VI. kér"

replace work=107 if workplace_clean=="Közv. ig."
replace work=107 if workplace_clean=="Közvhid."
replace work=107 if workplace_clean=="Közvhíd"
replace work=107 if workplace_clean=="Közv.állatv."
replace work=107 if workplace_clean=="Közvágóhidak és állatvásáro"
replace work=107 if workplace_clean=="Közvágóhidak és állatvásárok"
replace work=107 if workplace_clean==" Közv. ig"

replace work=36 if workplace_clean=="Erzsébet szegényház" | workplace_clean=="Erzs. szh."
replace work=36 if workplace_clean=="Községi szeretetház"


replace work=108 if workplace_clean=="Vízv. ig."
replace work=108 if workplace_clean=="Vizmü-ig."
replace work=108 if workplace_clean=="Vízmü-ig."

replace work=108 if workplace_clean=="h. vízv. ig."
replace work=108 if workplace_clean=="h. vízv.ig."

replace work=109 if workplace_clean==" Közp. adószr."
replace work=109 if workplace_clean=="Közp. Adószv"

replace work=101 if workplace_clean=="V-VI any. K. h. "

replace work=4 if workplace_clean=="Kp. szv."
replace work=4 if workplace_clean=="Közp. szv."
replace work=4 if workplace_clean=="Szv VI üo."
replace work=4 if workplace_clean==" Sz. VII üo"
replace work=4 if workplace_clean=="Szv. I üo."
replace work=4 if workplace_clean=="Szv II üo."
replace work=4 if workplace_clean=="Szv IV üo."
replace work=4 if workplace_clean=="Számv. VIII üo."
replace work=4 if workplace_clean=="Szv.V üo"
replace work=4 if workplace_clean=="Sz. V. üo."
replace work=4 if workplace_clean=="Szv. II üo."
replace work=4 if workplace_clean=="Szv.III üo."


replace work=32 if workplace_clean=="József fiá."
replace work=32 if workplace_clean==" József fiá."

replace work=30 if workplace_clean=="Gazd. hiv."
replace work=29 if workplace_clean=="Mérn. hiv."
replace work=29 if workplace_clean=="Mérn. Hiv"

replace work=7 if wpvar3==8

replace work=32 if workplace_clean=="Árv. shiv"
replace work=32 if workplace_clean=="Árv. shiv."
replace work=32 if workplace_clean=="Mayer á."
replace work=32 if workplace_clean=="Mayer á"
replace work=32 if wpvar3==48

replace work=10 if wpvar3==11
replace work=10 if workplace_clean=="Dunabalparti közkórházak"
replace work=10 if workplace_clean=="Dunajobbparti kórházak"
replace work=10 if workplace_clean=="Rók. kórh"
replace work=10 if workplace_clean=="Rók. kór."
replace work=10 if workplace_clean=="Uj dkórh."
replace work=10 if workplace_clean=="Uj dkórh"
replace work=9 if wpvar3==70
replace work=7 if wpvar3==38

replace work=76 if work==75
replace work=42 if work==52
replace work=77 if work==81
replace work=77 if work==67
replace work=77 if work==68
replace work=77 if workplace_clean=="Alpolgármesterek mellé szolgálatra rendelve"


replace work=30 if workplace_clean=="Jobbp. gazd. hiv."
replace work=30 if workplace_clean=="Jobbp. gazd. h."
replace work=30 if workplace_clean=="Gazdasági hivatal erdo- és mezogazdasági osztálya"

replace work=18 if workplace_clean=="Dunabalparti köztemetok"
replace work=18 if workplace_clean=="Dunajobbparti köztemetok"
replace work=18 if workplace_clean==" Db. közt."
replace work=18 if workplace_clean=="Db. Közt."
replace work=18 if workplace_clean==" X. kér. temeto."
replace work=18 if workplace_clean=="X. kér. temeto"
replace work=18 if workplace_clean=="Balp. ktem. ig."


replace work=7 if wpvar3==2


egen wgroup=min(work), by(wp)
rename work wtag
rename wgroup work
drop x wpvar3 wtag

rename pvar3 group_position
la var group_position "AG - group variable based on position"
rename work group_workplace
la var group_workplace "AG - group variable based on physical location of work"
