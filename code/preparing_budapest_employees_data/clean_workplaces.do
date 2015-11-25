*cleaning workplaces

*use "..\data\derived\Budapest_panel.dta", clear



gen workplace_cl=""
label var workplace_cl "cleaned workplace variable"

replace workplace_cl="Dunabalparti köztemetok" if regexm(wp, "Db. közt.")==1
replace workplace_cl="Dunabalparti köztemetok" if regexm(wp, "Db. Közt.")==1
replace workplace_cl="Dunabalparti köztemetok" if regexm(wp, "Dunabalparti köztemetok")==1
replace workplace_cl="Dunabalparti köztemetok" if regexm(wp, "Balp. ktem. ig.")==1

replace workplace_cl="Dunajobbparti köztemetok" if regexm(wp, "Dunajobbparti köztemetok")==1

replace workplace_cl="Elnöki ügyosztály" if regexm(wp, "Eln. üo")==1
replace workplace_cl="Elnöki ügyosztály" if regexm(wp, "Elnöki ügyosztály")==1
replace workplace_cl="Budai szegényház" if regexm(wp, "Budai szegényház")==1
replace workplace_cl="Erzsébet szegényház" if regexm(wp, "Erszébet szház")==1
replace workplace_cl="Erzsébet szegényház" if regexm(wp, "Erzs. szh.")==1
replace workplace_cl="Erzsébet szegényház" if regexm(wp, "Erzsébet szegényház")==1
replace workplace_cl="Erzsébet leányárvaház" if regexm(wp, "Erzs.lárv")==1
replace workplace_cl="Erzsébet leányárvaház" if regexm(wp, "Erzs.lárv.")==1
replace workplace_cl="Erzsébet leányárvaház" if regexm(wp, "leányárvaház")==1
replace workplace_cl="József fiúárvaház" if regexm(wp, "József")==1
replace workplace_cl="Mayer Ferenc árvaház" if regexm(wp, "Mayer")==1
replace workplace_cl="Árv. shiv" if regexm(wp, "Árv. shiv")==1
replace workplace_cl="Árvaszék" if regexm(wp, "Árvaszék")==1
replace workplace_cl="Fopolgármesteri hivatal" if regexm(wp, "Fopolg")==1
replace workplace_cl="Fovárosi múzeum" if regexm(wp, "Fov Museum")==1
replace workplace_cl="Fovárosi múzeum" if regexm(wp, "Fovárosi múzeum")==1
replace workplace_cl="Gazdasági hivatal" if regexm(wp, "Gazd. hiv")==1
replace workplace_cl="Gazdasági hivatal" if wp=="Gazdasági hivatal"
replace workplace_cl="Gazdasági hivatal erdo- és mezogazdaság" if regexm(wp, "Gazdasági hivatal erdo- és mezogazdaság")==1
replace workplace_cl="Gazdasági hivatal erdo- és mezogazdaság" if regexm(wp, "Gazdasági hivatal erdoés mezogazdasági")==1
replace workplace_cl="Jobbp. gazdasági hivatal" if regexm(wp, "Jobbp. gazd. h")==1
replace workplace_cl="Hordójelzo hivatal" if regexm(wp, "Hordó jelzo hivatal")==1
replace workplace_cl="Hordójelzo hivatal" if regexm(wp, "Hordójelzo hivatal")==1
replace workplace_cl="Házinyomda" if regexm(wp, "Házi ny")==1
replace workplace_cl="Házinyomda" if regexm(wp, "Házinyomda")==1
replace workplace_cl="Dunabalparti közkórházak" if regexm(wp, "Dunabalparti közkórházak")==1
replace workplace_cl="Dunajobbparti kórházak" if regexm(wp, "Dunajobbparti kórházak")==1
replace workplace_cl="Szt István kórház" if regexm(wp, "Szt István kór.")==1
replace workplace_cl="Szt István kórház" if regexm(wp, "Szt.-István kór.")==1
replace workplace_cl="Szt János kórház" if regexm(wp, "Szt János kórh.")==1
replace workplace_cl="Szt János kórház" if regexm(wp, "Szt.-János kór.")==1
replace workplace_cl="Szt Margit kórház" if regexm(wp, "Szt Marg. Kórh")==1
replace workplace_cl="Szt Margit kórház" if regexm(wp, "Szt.Marg. kór.")==1
replace workplace_cl="Szt László kórház" if regexm(wp, "Szt. László kór.")==1
replace workplace_cl="Szt László kórház" if regexm(wp, "Szt.László kór.")==1
replace workplace_cl="Rók. kórház" if regexm(wp, "Rók. kór.")==1
replace workplace_cl="Rók. kórház" if regexm(wp, "Rók. kórh")==1
replace workplace_cl="Uj dkórház" if regexm(wp, "Uj dkórh")==1

replace workplace_cl="Köztisztasági hivatal" if regexm(wp, "Ktiszt.")==1
replace workplace_cl="Köztisztasági hivatal" if regexm(wp, "Köztisztasági hivatal")==1
replace workplace_cl="Adófopénztár" if regexm(wp, "Adófopt.")==1
replace workplace_cl="Adófopénztár" if regexm(wp, "Kp. afopt.")==1
replace workplace_cl="Központi adószámviteli hivatal" if regexm(wp, "Közp. adószr.")==1
replace workplace_cl="Központi adószámviteli hivatal" if regexm(wp, "Közp. Adószv")==1
replace workplace_cl="Központi adószámviteli hivatal" if regexm(wp, "Központi adószámviteli hivatal")==1
replace workplace_cl="Központi adószámviteli hivatal" if regexm(wp, "Központi adóhivatal")==1
replace workplace_cl="Ker. pénztár" if regexm(wp, "Ker. pt.")==1
replace workplace_cl="Központi pénztár" if regexm(wp, "Közp. pt.")==1
replace workplace_cl="Központi pénztár" if regexm(wp, "Központi pénztár")==1
replace workplace_cl="Központi számvevoség" if regexm(wp, "Kp. szv.")==1
replace workplace_cl="Központi számvevoség" if regexm(wp, "Közp. szv.")==1
replace workplace_cl="Központi számvevoség" if regexm(wp, "Központi számvevoség")==1
replace workplace_cl="Kp. vház" if regexm(wp, "Kp. vház")==1
replace workplace_cl="Fertotleníto intézet" if regexm(wp, "Fertotleníto intézet")==1
replace workplace_cl="Fertotleníto intézet" if regexm(wp, "Közp. fért. int.")==1
replace workplace_cl="Fertotleníto intézet" if regexm(wp, "Kötp. fert. int")==1
replace workplace_cl="Központi anyagszertár" if regexm(wp, "Központi anyagszertár")==1


replace workplace_cl="Közvágó ig." if regexm(wp, "Közv. ig")==1
replace workplace_cl="Közigazgatási bizottság segédhivatala" if regexm(wp, "Közigazgatási bizottság segédhivatala")==1
replace workplace_cl="Községi kenyérgyár" if regexm(wp, "Községi kenyérgyár")==1
replace workplace_cl="Községi szeretetház" if regexm(wp, "Községi szeretetház")==1
replace workplace_cl="Közvágóhíd" if regexm(wp, "Közvhíd")==1
replace workplace_cl="Közvágóhíd" if regexm(wp, "Közvhid.")==1
replace workplace_cl="Közvágóhíd" if regexm(wp, "Közvágóhidak és állatvásáro")==1
replace workplace_cl="Közvágóhíd" if regexm(wp, "Közv.állatv.")==1
replace workplace_cl="Artézi fürdo" if regexm(wp, "Árt. fürdo")==1
replace workplace_cl="Artézi fürdo" if regexm(wp, "Artézi fürdo")==1
replace workplace_cl="Artézi fürdo" if regexm(wp, "Irt. fürdo ig")==1
replace workplace_cl="Rudas-fürdo" if regexm(wp, "Rudasf")==1
replace workplace_cl="Rudas-fürdo" if regexm(wp, "Rudas-fürdo")==1
replace workplace_cl="Statisztikai hivatal" if regexm(wp, "Stat. Hiv")==1
replace workplace_cl="Statisztikai hivatal" if regexm(wp, "Stat. hiv")==1
replace workplace_cl="Statisztikai hivatal" if regexm(wp, "Statisztikai hivatal")==1
replace workplace_cl="Számvevoség" if wp=="Számv."
replace workplace_cl="Számvevoség" if wp=="Számvevoség"
replace workplace_cl="Számvevoség" if regexm(wp, "Számv. kez. oszt.")==1
replace workplace_cl="Számvevoség I osztály" if regexm(wp, "Szv. I üo.")==1
replace workplace_cl="Számvevoség I osztály" if regexm(wp, "Számvevoség- I. osztály")==1
replace workplace_cl="Számvevoség I osztály" if regexm(wp, "Számvevoség— I. osztály")==1
replace workplace_cl="Számvevoség II osztály" if regexm(wp, "Szv II üo.")==1
replace workplace_cl="Számvevoség II osztály" if regexm(wp, "Szv. II üo.")==1
replace workplace_cl="Számvevoség II osztály" if regexm(wp, "Számvevoség- II. osztály")==1
replace workplace_cl="Számvevoség II osztály" if regexm(wp, "Számvevoség— II. osztály")==1
replace workplace_cl="Számvevoség III osztály" if regexm(wp, "Szv.III üo.")==1
replace workplace_cl="Számvevoség III osztály" if regexm(wp, "Számvevoség- III. osztály")==1
replace workplace_cl="Számvevoség III osztály" if regexm(wp, "Számvevoség— III. osztály")==1
replace workplace_cl="Számvevoség IV osztály" if regexm(wp, "Szv IV üo.")==1
replace workplace_cl="Számvevoség IV osztály" if regexm(wp, "Számvevoség- IV. osztály")==1
replace workplace_cl="Számvevoség IV osztály" if regexm(wp, "Számvevoség— IV. osztály")==1
replace workplace_cl="Számvevoség V osztály" if wp=="Sz. V. üo."
replace workplace_cl="Számvevoség V osztály" if regexm(wp, "Szv.V üo")==1
replace workplace_cl="Számvevoség V osztály" if regexm(wp, "Számvevoség- V. osztály")==1
replace workplace_cl="Számvevoség V osztály" if regexm(wp, "Számvevoség— V. osztály")==1
replace workplace_cl="Számvevoség VI osztály" if wp=="Szv VI üo."
replace workplace_cl="Számvevoség VI osztály" if regexm(wp, "Számvevoség- VI. osz¬tály")==1
replace workplace_cl="Számvevoség VI osztály" if regexm(wp, "Számvevoség— VI. osztály")==1
replace workplace_cl="Számvevoség VII osztály" if regexm(wp,"Sz. VII üo")==1
replace workplace_cl="Számvevoség VII osztály" if regexm(wp, "Számvevoség- VII. osztály")==1
replace workplace_cl="Számvevoség VII osztály" if regexm(wp, "Számvevoség— VII. osztály")==1
replace workplace_cl="Számvevoség VIII osztály" if regexm(wp,"Számvevoség- VIII. osztálya")==1
replace workplace_cl="Számvevoség VIII osztály" if regexm(wp, "Számv. VIII üo.")==1
replace workplace_cl="Számvevoség VIII osztály" if regexm(wp, "Számvevoség— VIII. osztály")==1
replace workplace_cl="Számvevoség IX osztály" if regexm(wp, "Számvevoség— IX. osztály")==1
replace workplace_cl="Vegyészeti és tápszer Vizsgáló Intézet" if regexm(wp, "Vegy. és tápsz. Vizsg. Int")==1
replace workplace_cl="Vegyészeti és élelmiszervizsgáló intéz" if regexm(wp, "Vegyészeti és élelmiszervizsg")==1
replace workplace_cl="Mérnöki hivatal" if regexm(wp, "Mérn. Hiv")==1
replace workplace_cl="Mérnöki hivatal" if regexm(wp, "Mérn. hiv")==1
replace workplace_cl="Mérnöki hivatal" if regexm(wp, "Mérnöki hivatal")==1
replace workplace_cl="Mérth. h." if regexm(wp, "Mérth. h.")==1
replace workplace_cl="Tanácsi I ügyosztály" if wp=="T. I. üo."
replace workplace_cl="Tanácsi I ügyosztály" if regexm(wp, "T. I üo.")==1
replace workplace_cl="Tanácsi I ügyosztály" if regexm(wp, "Tanácsi I. ügyosztály")==1
replace workplace_cl="Tanácsi I ügyosztály" if wp=="Tanácsi I"
replace workplace_cl="Tanácsi II ügyosztály" if regexm(wp, "Tanácsi II. ügyosztály")==1
replace workplace_cl="Tanácsi II ügyosztály" if regexm(wp, "T. II üo.")==1
replace workplace_cl="Tanácsi III ügyosztály" if regexm(wp, "T. III üo.")==1
replace workplace_cl="Tanácsi III ügyosztály" if regexm(wp, "Tanácsi III. ügyosztály")==1
replace workplace_cl="Tanácsi IV ügyosztály" if regexm(wp, "T. IV üo.")==1
replace workplace_cl="Tanácsi IV ügyosztály" if regexm(wp, "T. IV. üo.")==1
replace workplace_cl="Tanácsi IV ügyosztály" if regexm(wp, "Tan. IV. üoszt.")==1
replace workplace_cl="Tanácsi IV ügyosztály" if regexm(wp, "Tan. IV. üo.")==1
replace workplace_cl="Tanácsi IV ügyosztály" if regexm(wp, "Tanácsi IV. ügyosztály")==1
replace workplace_cl="Tanácsi V ügyosztály" if regexm(wp, "T. V üo.")==1
replace workplace_cl="Tanácsi V ügyosztály" if regexm(wp, "Tanácsi V. ügyosztály")==1
replace workplace_cl="Tanácsi VI ügyosztály" if regexm(wp, "T. VI üo.")==1
replace workplace_cl="Tanácsi VI ügyosztály" if wp=="T. VI. üo."
replace workplace_cl="Tanácsi VI ügyosztály" if regexm(wp, "Tanácsi VI. ügyosztály")==1
replace workplace_cl="Tanácsi VII ügyosztály" if wp=="Tanácsi VII. ügyosztály"
replace workplace_cl="Tanácsi VII ügyosztály" if regexm(wp, "T. VII üo.")
replace workplace_cl="Tanácsi VII ügyosztály" if wp=="T. VII. üo."
replace workplace_cl="Tanácsi VIII ügyosztály" if regexm(wp, "T. VIII üo.")==1
replace workplace_cl="Tanácsi VIII ügyosztály" if wp=="Tanácsi VIII. ügyosztály"
replace workplace_cl="Tanácsi IX ügyosztály" if regexm(wp, "T. IX üo.")==1
replace workplace_cl="Tanácsi IX ügyosztály" if wp=="Tanácsi IX. ügyosztály"
replace workplace_cl="Tanácsi X ügyosztály" if regexm(wp, "T. X üo.")==1
replace workplace_cl="Tanácsi X ügyosztály" if wp=="Tanácsi X. ügyosztály"
replace workplace_cl="Tanácsi X ügyosztály" if wp==" T. X. üo."
replace workplace_cl="Tanácsi XI ügyosztály" if wp=="Tanácsi XI. ügyosztály"
replace workplace_cl="Tanácsi XII ügyosztály" if wp=="Tanácsi XII. ügyosztály"
replace workplace_cl="Tanácsi XIII ügyosztály" if wp=="Tanácsi XIII. ügyosztály"
replace workplace_cl="Tanácsi XIV ügyosztály" if wp=="Tanácsi XIV. ügyosztály"
replace workplace_cl="Tanácsi XV ügyosztály" if wp=="Tanácsi XV. ügyosztály"
replace workplace_cl="Tanácsi XVI ügyosztály" if wp=="Tanácsi XVI. ügyosztály"
replace workplace_cl="Tanácsi ügyosztály" if wp==" T. ügy."
replace workplace_cl="T. levéltár" if regexm(wp, "T. levélt")==1
replace workplace_cl="Tanácsi segédhivatal" if regexm(wp, "Tan. sh")==1
replace workplace_cl="Tanácsi segédhivatal" if regexm(wp, "T.segédh")==1
replace workplace_cl="Tanácsi segédhivatal" if regexm(wp, "Tanácsi segédhivatal")==1

replace workplace_cl="Tuzoltó foparancsnokság" if regexm(wp, "Tuz. fop")==1
replace workplace_cl="Tuzoltó foparancsnokság" if regexm(wp, "Tuzoltó foparancsnokság")==1
replace workplace_cl="Tuzoltóság" if regexm(wp, "Tuzoltóság")==1
replace workplace_cl="Alpolgármesterek." if regexm(wp, "Alpolgármesterek")==1
replace workplace_cl="Polgármesteri hivatal" if regexm(wp, "Polgárm")==1
replace workplace_cl="Tiszti foorvosi hivatal" if regexm(wp, "Tiszt. foorv. h")==1
replace workplace_cl="Tiszti foorvosi hivatal" if regexm(wp, "Tiszti foorvosi hivatal")==1
replace workplace_cl="Tiszti foorvosi hivatal" if wp=="t. foorv. H." 
replace workplace_cl="Tiszti foorvosi hivatal" if wp=="t. foorv. h." 
replace workplace_cl="Tiszti ügyészség" if regexm(wp, "Tiszt. ügyész")==1
replace workplace_cl="Tiszti ügyészség" if regexm(wp, "Tiszti ügyészség")==1
replace workplace_cl="Közp vcs" if regexm(wp, "Közp. vcs")==1
replace workplace_cl="Vásárcsarnok ig" if regexm(wp, "Vcsrn. ig.")==1
replace workplace_cl="Vásárcsarnok ig" if regexm(wp, "V csar. ig.")==1
replace workplace_cl="Vásárigazgatóság" if regexm(wp, "vásárig")==1
replace workplace_cl="Vásárigazgatóság" if regexm(wp, "Vásárig")==1
replace workplace_cl="Vásárigazgatóság" if regexm(wp, "Vásarigazgatoság")==1
replace workplace_cl="Vásárigazgatóság" if regexm(wp, "Vásárigazgatóság")==1
replace workplace_cl="Vásárcsarnokok" if regexm(wp, "Vásárcsarnokok")==1
replace workplace_cl="IV k fed. vásár" if regexm(wp, "IV k. fed. vásár")==1
replace workplace_cl="IV k fed. vásár" if regexm(wp, "IV k. fed. Vásár")==1
replace workplace_cl="V k vcs" if regexm(wp, "V k. vcs.")==1
replace workplace_cl="IV k vcs" if regexm(wp, "VI k. vcs")==1
replace workplace_cl="VII k vcs" if regexm(wp, "VII k. vcs.")==1
replace workplace_cl="VIII k vcs" if regexm(wp, "VIII k. vcs.")==1
replace workplace_cl="Sz-fov. szolot." if regexm(wp, "Sz-fov. szolot.")==1
replace workplace_cl="I ker anyakönyvi hivatal" if wp=="I k. ak."
replace workplace_cl="I-II ker anyakönyvi hivatal" if regexm(wp, "1—II. kér. anyakönyvi hivatal")==1
replace workplace_cl="I-II ker anyakönyvi hivatal" if regexm(wp, "I-III k. ak")==1
replace workplace_cl="I-II ker anyakönyvi hivatal" if regexm(wp, "I-III k. anyak.")==1
replace workplace_cl="IV ker anyakönyvi hivatal" if regexm(wp, "IV k. ak.")==1
replace workplace_cl="V-VI ker anyakönyvi hivatal" if regexm(wp, "V-VI any. K. h.")==1
replace workplace_cl="V-VI ker anyakönyvi hivatal" if regexm(wp, "V-VI k. anyak.")==1
replace workplace_cl="V-VI ker anyakönyvi hivatal" if regexm(wp, "V.  és VI. kér. anyakönyvi hivatal")==1
replace workplace_cl="VI ker anyakönyvi hivatal" if regexm(wp, "VI k. ak.")==1
replace workplace_cl="VII ker anyakönyvi hivatal" if regexm(wp, "VII k. ak.")==1
replace workplace_cl="VII ker anyakönyvi hivatal" if regexm(wp, "VII.  kér. anyakönyvi hivatal")==1
replace workplace_cl="VIII ker anyakönyvi hivatal" if regexm(wp, "VIII k. ak.")==1
replace workplace_cl="IV-IX-X ker anyakönyvi hivatal" if regexm(wp, "IV-IX-X k. ak.")==1
replace workplace_cl="IV-IX-X ker anyakönyvi hivatal" if regexm(wp, "IV-IX-X. k. ak.")==1
replace workplace_cl="X ker anyakönyvi hivatal" if wp=="X k. ak."
replace workplace_cl="X ker anyakönyvi hivatal" if wp=="X. kér. anyakönyvi hivatal"
replace workplace_cl="X ker temeto" if regexm(wp, "X. kér. temeto.")==1
replace workplace_cl="X ker temeto" if regexm(wp, "X. kér. temeto")==1




replace workplace_cl="I-III ker mérth" if regexm(wp, "I-III k. mérth.")==1
replace workplace_cl="I-III ker mérth" if regexm(wp, "l-lll k. mérth.")==1
replace workplace_cl="I ker" if wp=="I. kér"
replace workplace_cl="II ker" if wp=="II. kér"
replace workplace_cl="I-II ker" if wp=="1—II. kér"
replace workplace_cl="I-II ker" if wp=="I—II. kér"
replace workplace_cl="III ker" if wp=="III.  kér"
replace workplace_cl="III ker" if wp=="III. kér"
replace workplace_cl="IV ker" if wp=="IV.  kér"
replace workplace_cl="IV ker" if wp=="IV. kér"
replace workplace_cl="IV es IX ker" if wp=="IV.  és IX. kér"
replace workplace_cl="V ker" if wp=="V. kér"
replace workplace_cl="V es VI ker" if wp=="V.  és VI. kér"
replace workplace_cl="VI ker" if wp=="VI. kér"
replace workplace_cl="VII ker" if wp=="VII.  kér"
replace workplace_cl="VII ker" if wp=="VII. kér"
replace workplace_cl="VIII ker" if wp=="VIII.  kér"
replace workplace_cl="VIII ker" if wp=="VIII. kér"
replace workplace_cl="IX ker" if wp=="IX. kér"
replace workplace_cl="X ker" if wp=="X. kér"

replace workplace_cl="I ker eloljarosag" if wp=="I k. elolj."
replace workplace_cl="I ker eloljarosag" if wp=="I. k. elölj. "
replace workplace_cl="I ker eloljarosag" if wp=="I. kér. elüljáróság"
replace workplace_cl="I ker eloljarosag" if wp=="I.kér. elüljáróság"

replace workplace_cl="II ker eloljarosag" if wp=="II k. elölj."
replace workplace_cl="II ker eloljarosag" if wp=="II. kér. elüljáróság"

replace workplace_cl="III ker eloljarosag" if wp=="III k.elolj."
replace workplace_cl="III ker eloljarosag" if wp=="III k.elölj."
replace workplace_cl="III ker eloljarosag" if wp=="III.  kér. elüljáróság"

replace workplace_cl="I-III ker eloljarosag" if wp=="I-III k elolj"

replace workplace_cl="IV ker eloljarosag" if wp=="IV k. elölj."
replace workplace_cl="IV ker eloljarosag" if wp=="IV.  kér. elüljáróság"
replace workplace_cl="IV ker eloljarosag" if wp=="IV. k. elölj."
replace workplace_cl="IV ker eloljarosag" if wp=="IV. kér. elüljáróság"
replace workplace_cl="IV ker eloljarosag" if wp=="lV k. Elölj."

replace workplace_cl="V ker eloljarosag" if wp=="V k. elölj."
replace workplace_cl="V ker eloljarosag" if wp=="V. k. elolj."
replace workplace_cl="V ker eloljarosag" if wp=="V. k. elölj. "

replace workplace_cl="V ker eloljarosag" if wp=="V. kér. elüljáróság"
replace workplace_cl="V ker eloljarosag" if wp=="V.kér.elöljáróság."

replace workplace_cl="VI ker eloljarosag" if wp=="VI k. elolj."
replace workplace_cl="VI ker eloljarosag" if wp=="VI k. elölj"
replace workplace_cl="VI ker eloljarosag" if wp=="VI. kér. elüljáróság"
replace workplace_cl="VI ker eloljarosag" if wp=="VI.kér. elüljáróság"
replace workplace_cl="VI ker eloljarosag" if wp=="VI.kér. elüljáróság."

replace workplace_cl="VII ker eloljarosag" if wp=="VII k. elj."
replace workplace_cl="VII ker eloljarosag" if wp=="VII k. elölj"
replace workplace_cl="VII ker eloljarosag" if wp=="VII. kér. elüljáróság"
replace workplace_cl="VII ker eloljarosag" if wp=="VII.kér. elüljáróság"


replace workplace_cl="VIII ker eloljarosag" if wp=="VIII k. elölj."
replace workplace_cl="VIII ker eloljarosag" if wp=="VIII k.elj."
replace workplace_cl="VIII ker eloljarosag" if wp=="VIII. kér. elöljáróság"

replace workplace_cl="IX ker eloljarosag" if wp=="IX k. elölj."

replace workplace_cl="ker eloljarosag" if wp=="k.elolj."

replace workplace_cl="X ker eloljarosag" if wp=="X k. elolj"
replace workplace_cl="X ker eloljarosag" if wp=="X k. elölj."
replace workplace_cl="X ker eloljarosag" if wp=="X. kér. elöljáróság"

replace workplace_cl="VI ker Népszálló" if wp=="VI. kér Népszálló"
 
replace workplace_cl="Bakteriológiai intézet" if wp=="Bakteriológiai intézet"

replace workplace_cl="Erdom. h." if wp=="Erdom. h."
 
replace workplace_cl="Gázmuvek igazgatósága" if wp=="Gázmuvek igazgatósága"

replace workplace_cl="Kertészek" if wp=="Kertészek."
replace workplace_cl="Könyvtár" if wp=="Könyvtár"

replace workplace_cl="Levéltár" if wp=="Levéltár"

replace workplace_cl="Légszeszvilágítási házi szerelo muhely" if wp=="Légszeszvilágítási házi szerelo muhely" 

replace workplace_cl="Nmvgyit" if wp=="Nmvgyit" 

replace workplace_cl="Sertésközvágó" if wp=="Sertésközvág." 

replace workplace_cl="Tanítási szerek leltári osztálya" if wp=="Tanítási szerek leltári osztálya" 

replace workplace_cl="Tattersall és lóvásártelep" if wp=="Tattersall és lóvásártelep" 

replace workplace_cl="Vízmüigazgatóság" if wp=="Vizmü-ig." 
replace workplace_cl="Vízmüigazgatóság" if wp=="Vízmü-ig." 
replace workplace_cl="Vízmüigazgatóság" if wp=="Vízmüigazgatóság" 

replace workplace_cl="Vízvezetéki igazgatóság" if wp=="Vízv. ig." 
replace workplace_cl="Vízvezetéki igazgatóság" if wp=="Vízvezetéki igazgatóság" 
replace workplace_cl="Vízvezetéki igazgatóság" if wp=="h. vízv. ig." 
replace workplace_cl="Vízvezetéki igazgatóság" if wp=="h. vízv.ig."

 
replace workplace_cl="Zsibáru-t" if wp=="Zsibáru-t" 



replace workplace_cl="Állategészségügyi telep" if wp=="Állategészségügyi telep" 
replace workplace_cl="Állatkert" if wp=="Állatkert" 
replace workplace_cl="Állatkert" if wp=="Állatés növénykert"

replace workplace_cl="A budapesti kerületi munkásbiztosító pénztár mellé rendelt székesfovárosi behajtási osztály" if wp=="A budapesti kerületi munkásbiztosító pénztár mellé rendelt székesfovárosi behajtási osztály" 
replace workplace_cl="Légszeszvilágítási házi szerelo muhely és raktár" if wp=="Légszeszvilágítási házi szerelo muhely és raktár" 
replace workplace_cl="Fuvartelep" if wp=="Fuvartelep"
replace workplace_cl="Budapest székesfováros hirdeto vállalata" if wp=="Budapest székesfováros hirdeto vállalata"

*ADDITIONAL EDITS AS OF 07/09/2015
replace workplace_cl="Főpolgármesteri hivatal" if workplace=="Főpolg"
replace workplace_cl="I ker eloljarosag" if workplace=="I k. elj"
replace workplace_cl="I ker eloljarosag" if workplace=="I k. elölj"
replace workplace_cl="I ker eloljarosag" if workplace=="I k. elölj"
replace workplace_cl="I ker eloljarosag" if workplace=="I k. elölj."
replace workplace_cl="I ker eloljarosag" if workplace=="I k. elölj."
replace workplace_cl="III ker eloljarosag" if workplace=="III k. elölj"
replace workplace_cl="Számvevoség" if workplace=="Számv."
replace workplace_cl="Számvevoség" if workplace=="Szárnv."
replace workplace_cl="Tűzoltó főparancsnokság" if workplace=="Tűz. főp."
replace workplace_cl="Tűzoltó főparancsnokság" if workplace=="Tűz. főp."
replace workplace_cl="Tűzoltó főparancsnokság" if workplace=="Tűz. főp."
replace workplace_cl="Tűzoltó főparancsnokság" if workplace=="Tűz. főp."
replace workplace_cl="Tűzoltó főparancsnokság" if workplace=="Tűz. főp."
replace workplace_cl="Tűzoltó főparancsnokság" if workplace=="Tűz. főp."
replace workplace_cl="V ker eloljarosag" if workplace=="V k. elj"
replace workplace_cl="V ker eloljarosag" if workplace=="V k. elölj"
replace workplace_cl="V ker eloljarosag" if workplace=="V k. elölj"
replace workplace_cl="V ker eloljarosag" if workplace=="V k. elölj."
replace workplace_cl="VI ker eloljarosag" if workplace=="VI k. elj"
replace workplace_cl="VI ker eloljarosag" if workplace=="VI k. elj.|"
replace workplace_cl="VI ker eloljarosag" if workplace=="VI k. elölj."
replace workplace_cl="VI ker eloljarosag" if workplace=="VI k. élj."
replace workplace_cl="VI ker eloljarosag" if workplace=="VIk. elölj,"
replace workplace_cl="X ker eloljarosag" if workplace=="X k elj"
replace workplace_cl="X ker eloljarosag" if workplace=="X k. el ölj."
replace workplace_cl="X ker eloljarosag" if workplace=="X k. elölj,"
replace workplace_cl="X ker eloljarosag" if workplace=="X k. élj."
replace workplace_cl="X ker eloljarosag" if workplace=="X k.elj"
replace workplace_cl="I ker eloljarosag" if workplace=="1 k. elölj."
replace workplace_cl="I ker eloljarosag" if workplace=="1 k. elölj."
replace workplace_cl="I ker eloljarosag" if workplace=="1 k. elölj."
replace workplace_cl="Adófőpénztár" if workplace=="Adófőpt"
replace workplace_cl="Adófőpénztár" if workplace=="Adófőpt."
replace workplace_cl="Adófőpénztár" if workplace=="Adófőpt."
replace workplace_cl="Adófőpénztár" if workplace=="Adófőpt."
replace workplace_cl="Erdőmérnöki hivatal" if workplace=="Erdm. hiv."
replace workplace_cl="Erdőmérnöki hivatal" if workplace=="Erdm.hiv."
replace workplace_cl="Erdőmérnöki hivatal" if workplace=="Erdőm. h."
replace workplace_cl="Erdőmérnöki hivatal" if workplace=="Erdőm. h."
replace workplace_cl="Erdőmérnöki hivatal" if workplace=="Erdőm. h."
replace workplace_cl="Főpolgármesteri hivatal" if workplace=="Főpoik. h"
replace workplace_cl="Főpolgármesteri hivatal" if workplace=="Főpolg."
replace workplace_cl="Főpolgármesteri hivatal" if workplace=="Főpolg."
replace workplace_cl="Főpolgármesteri hivatal" if workplace=="Főpolg."
replace workplace_cl="Főpolgármesteri hivatal" if workplace=="Főpolg. h."
replace workplace_cl="Főpolgármesteri hivatal" if workplace=="Főpolg. h."
replace workplace_cl="Főpolgármesteri hivatal" if workplace=="Főpolg. h."
replace workplace_cl="I ker eloljarosag" if workplace=="I k elolj"
replace workplace_cl="I ker eloljarosag" if workplace=="I k elölj."
replace workplace_cl="I ker eloljarosag" if workplace=="I k elölj."
replace workplace_cl="I ker eloljarosag" if workplace=="I k. Elölj"
replace workplace_cl="I ker eloljarosag" if workplace=="I k. elölj"
replace workplace_cl="I ker eloljarosag" if workplace=="I k. elölj"
replace workplace_cl="I ker eloljarosag" if workplace=="I k. elölj"
replace workplace_cl="I ker eloljarosag" if workplace=="I k. elölj"
replace workplace_cl="I ker eloljarosag" if workplace=="I k. elölj"
replace workplace_cl="I ker eloljarosag" if workplace=="I k. elölj *"
replace workplace_cl="I ker eloljarosag" if workplace=="I k. elölj'"
replace workplace_cl="I ker eloljarosag" if workplace=="I k. elölj,"
replace workplace_cl="I ker eloljarosag" if workplace=="I k. elölj,"
replace workplace_cl="I ker eloljarosag" if workplace=="I k. elölj."
replace workplace_cl="I ker eloljarosag" if workplace=="I k. elölj."
replace workplace_cl="I ker eloljarosag" if workplace=="I k. elölj."
replace workplace_cl="I ker eloljarosag" if workplace=="I k. elölj."
replace workplace_cl="I ker eloljarosag" if workplace=="I k. elölj."
replace workplace_cl="I ker eloljarosag" if workplace=="I k. elölj."
replace workplace_cl="I ker eloljarosag" if workplace=="I k. elölj."
replace workplace_cl="I ker eloljarosag" if workplace=="I k. elölj."
replace workplace_cl="I ker eloljarosag" if workplace=="I k. elölj."
replace workplace_cl="I ker eloljarosag" if workplace=="I k. elölj."
replace workplace_cl="I ker eloljarosag" if workplace=="I k. elölj."
replace workplace_cl="I ker eloljarosag" if workplace=="I k. elölj."
replace workplace_cl="I ker eloljarosag" if workplace=="I k. elölj."
replace workplace_cl="I ker eloljarosag" if workplace=="I k. elölj."
replace workplace_cl="I ker eloljarosag" if workplace=="I k. elölj."
replace workplace_cl="I ker eloljarosag" if workplace=="I k. előlj"
replace workplace_cl="I ker eloljarosag" if workplace=="I k. előlj"
replace workplace_cl="I ker eloljarosag" if workplace=="I k. előlj"
replace workplace_cl="I ker eloljarosag" if workplace=="I k. előlj"
replace workplace_cl="I ker eloljarosag" if workplace=="I k. előlj"
replace workplace_cl="I ker eloljarosag" if workplace=="I k. előlj."
replace workplace_cl="I ker eloljarosag" if workplace=="I k. élj."
replace workplace_cl="I ker eloljarosag" if workplace=="I k. élj."
replace workplace_cl="I ker eloljarosag" if workplace=="I k. élj."
replace workplace_cl="III ker eloljarosag" if workplace=="III  k. Elölj"
replace workplace_cl="III ker eloljarosag" if workplace=="III k előlj."
replace workplace_cl="III ker eloljarosag" if workplace=="III k előlj."
replace workplace_cl="III ker eloljarosag" if workplace=="III k. Elölj"
replace workplace_cl="III ker eloljarosag" if workplace=="III k. elölj"
replace workplace_cl="III ker eloljarosag" if workplace=="III k. elölj"
replace workplace_cl="III ker eloljarosag" if workplace=="III k. elölj"
replace workplace_cl="III ker eloljarosag" if workplace=="III k. elölj"
replace workplace_cl="III ker eloljarosag" if workplace=="III k. elölj"
replace workplace_cl="III ker eloljarosag" if workplace=="III k. elölj,"
replace workplace_cl="III ker eloljarosag" if workplace=="III k. elölj."
replace workplace_cl="III ker eloljarosag" if workplace=="III k. elölj."
replace workplace_cl="III ker eloljarosag" if workplace=="III k. elölj."
replace workplace_cl="III ker eloljarosag" if workplace=="III k. elölj."
replace workplace_cl="III ker eloljarosag" if workplace=="III k. elölj."
replace workplace_cl="III ker eloljarosag" if workplace=="III k. előli."
replace workplace_cl="III ker eloljarosag" if workplace=="III k. előlj"
replace workplace_cl="III ker eloljarosag" if workplace=="III k.előlj"
replace workplace_cl="III ker eloljarosag" if workplace=="III k.előlj"
replace workplace_cl="III ker eloljarosag" if workplace=="III k.előlj"
replace workplace_cl="III ker eloljarosag" if workplace=="III k.előlj"
replace workplace_cl="III ker eloljarosag" if workplace=="III k.előlj"
replace workplace_cl="III ker eloljarosag" if workplace=="III k.előlj"
replace workplace_cl="III ker eloljarosag" if workplace=="III k.előlj-"
replace workplace_cl="III ker eloljarosag" if workplace=="III k.előlj."
replace workplace_cl="III ker eloljarosag" if workplace=="III k.előlj."
replace workplace_cl="III ker eloljarosag" if workplace=="III k.előlj."
replace workplace_cl="III ker eloljarosag" if workplace=="III k.előlj."
replace workplace_cl="III ker eloljarosag" if workplace=="III. k. elölj."
replace workplace_cl="III ker eloljarosag" if workplace=="III. k. elölj."
replace workplace_cl="III ker eloljarosag" if workplace=="III. k. elölj."
replace workplace_cl="III ker eloljarosag" if workplace=="III.elölj."
replace workplace_cl="III ker eloljarosag" if workplace=="Ilik. elölj."
replace workplace_cl="III ker eloljarosag" if workplace=="Ilik. elölj."
replace workplace_cl="Számvevoség" if workplace=="Számv."
replace workplace_cl="Számvevoség" if workplace=="Számv."
replace workplace_cl="Számvevoség" if workplace=="Számv."
replace workplace_cl="Számvevoség" if workplace=="Számvevőség"
replace workplace_cl="Tuzoltóság" if workplace=="Tűz. főp"
replace workplace_cl="Tuzoltóság" if workplace=="Tűz. főp."
replace workplace_cl="Tuzoltóság" if workplace=="Tűz. főp."
replace workplace_cl="Tuzoltóság" if workplace=="Tűz. lop"
replace workplace_cl="Tuzoltóság" if workplace=="Tűz. lop"
replace workplace_cl="V ker eloljarosag" if workplace=="V k elolj"
replace workplace_cl="V ker eloljarosag" if workplace=="V k elolj"
replace workplace_cl="V ker eloljarosag" if workplace=="V k elolj"
replace workplace_cl="V ker eloljarosag" if workplace=="V k elolj"
replace workplace_cl="V ker eloljarosag" if workplace=="V k elolj"
replace workplace_cl="V ker eloljarosag" if workplace=="V k eéj"
replace workplace_cl="V ker eloljarosag" if workplace=="V k. elj"
replace workplace_cl="V ker eloljarosag" if workplace=="V k. elj"
replace workplace_cl="V ker eloljarosag" if workplace=="V k. elölj"
replace workplace_cl="V ker eloljarosag" if workplace=="V k. elölj"
replace workplace_cl="V ker eloljarosag" if workplace=="V k. elölj"
replace workplace_cl="V ker eloljarosag" if workplace=="V k. elölj"
replace workplace_cl="V ker eloljarosag" if workplace=="V k. elölj"
replace workplace_cl="V ker eloljarosag" if workplace=="V k. elölj*"
replace workplace_cl="V ker eloljarosag" if workplace=="V k. elölj,"
replace workplace_cl="V ker eloljarosag" if workplace=="V k. elölj."
replace workplace_cl="V ker eloljarosag" if workplace=="V k. elölj."
replace workplace_cl="V ker eloljarosag" if workplace=="V k. elölj."
replace workplace_cl="V ker eloljarosag" if workplace=="V k. elölj."
replace workplace_cl="V ker eloljarosag" if workplace=="V k. elölj."
replace workplace_cl="V ker eloljarosag" if workplace=="V k. elölj."
replace workplace_cl="V ker eloljarosag" if workplace=="V k. elölj."
replace workplace_cl="V ker eloljarosag" if workplace=="V k. elölj.I"
replace workplace_cl="V ker eloljarosag" if workplace=="V k. elől."
replace workplace_cl="V ker eloljarosag" if workplace=="V k. előli."
replace workplace_cl="V ker eloljarosag" if workplace=="V k. előli."
replace workplace_cl="V ker eloljarosag" if workplace=="V k. előljl"
replace workplace_cl="V ker eloljarosag" if workplace=="V k. élj."
replace workplace_cl="V ker eloljarosag" if workplace=="V k. élj."
replace workplace_cl="V ker eloljarosag" if workplace=="V k. élj."
replace workplace_cl="V ker eloljarosag" if workplace=="V k. élj."
replace workplace_cl="V ker eloljarosag" if workplace=="V k. élj."
replace workplace_cl="V ker eloljarosag" if workplace=="V k. élj."
replace workplace_cl="V ker eloljarosag" if workplace=="V k. élj."
replace workplace_cl="V ker eloljarosag" if workplace=="V k. élj."
replace workplace_cl="V ker eloljarosag" if workplace=="V k. élj."
replace workplace_cl="V ker eloljarosag" if workplace=="V k. élj."
replace workplace_cl="V ker eloljarosag" if workplace=="V k. élj. ."
replace workplace_cl="V ker eloljarosag" if workplace=="V. k. előlj."
replace workplace_cl="V ker eloljarosag" if workplace=="V. k. élj."
replace workplace_cl="VI ker eloljarosag" if workplace=="VI k elj.l"
replace workplace_cl="VI ker eloljarosag" if workplace=="VI k elj.l"
replace workplace_cl="VI ker eloljarosag" if workplace=="VI k elj.l"
replace workplace_cl="VI ker eloljarosag" if workplace=="VI k elj.l"
replace workplace_cl="VI ker eloljarosag" if workplace=="VI k elj.l"
replace workplace_cl="VI ker eloljarosag" if workplace=="VI k elj.l"
replace workplace_cl="VI ker eloljarosag" if workplace=="VI k elolj"
replace workplace_cl="VI ker eloljarosag" if workplace=="VI k elolj"
replace workplace_cl="VI ker eloljarosag" if workplace=="VI k elolj"
replace workplace_cl="VI ker eloljarosag" if workplace=="VI k előlj"
replace workplace_cl="VI ker eloljarosag" if workplace=="VI k előlj"
replace workplace_cl="VI ker eloljarosag" if workplace=="VI k. e"
replace workplace_cl="VI ker eloljarosag" if workplace=="VI k. elj"
replace workplace_cl="VI ker eloljarosag" if workplace=="VI k. elölj"
replace workplace_cl="VI ker eloljarosag" if workplace=="VI k. elölj"
replace workplace_cl="VI ker eloljarosag" if workplace=="VI k. elölj"
replace workplace_cl="VI ker eloljarosag" if workplace=="VI k. elölj"
replace workplace_cl="VI ker eloljarosag" if workplace=="VI k. elölj"
replace workplace_cl="VI ker eloljarosag" if workplace=="VI k. elölj"
replace workplace_cl="VI ker eloljarosag" if workplace=="VI k. elölj"
replace workplace_cl="VI ker eloljarosag" if workplace=="VI k. elölj'"
replace workplace_cl="VI ker eloljarosag" if workplace=="VI k. elölj'I"
replace workplace_cl="VI ker eloljarosag" if workplace=="VI k. elölj*"
replace workplace_cl="VI ker eloljarosag" if workplace=="VI k. elölj*"
replace workplace_cl="VI ker eloljarosag" if workplace=="VI k. elölj."
replace workplace_cl="VI ker eloljarosag" if workplace=="VI k. elölj."
replace workplace_cl="VI ker eloljarosag" if workplace=="VI k. elölj."
replace workplace_cl="VI ker eloljarosag" if workplace=="VI k. elölj."
replace workplace_cl="VI ker eloljarosag" if workplace=="VI k. elölj."
replace workplace_cl="VI ker eloljarosag" if workplace=="VI k. elölj."
replace workplace_cl="VI ker eloljarosag" if workplace=="VI k. elölj."
replace workplace_cl="VI ker eloljarosag" if workplace=="VI k. elölj."
replace workplace_cl="VI ker eloljarosag" if workplace=="VI k. elölj•"
replace workplace_cl="VI ker eloljarosag" if workplace=="VI k. elől"
replace workplace_cl="VI ker eloljarosag" if workplace=="VI k. előli"
replace workplace_cl="VI ker eloljarosag" if workplace=="VI k. élj"
replace workplace_cl="VI ker eloljarosag" if workplace=="VI k. élj"
replace workplace_cl="VI ker eloljarosag" if workplace=="VI k. élj"
replace workplace_cl="VI ker eloljarosag" if workplace=="VI k. élj"
replace workplace_cl="VI ker eloljarosag" if workplace=="VI k. élj-"
replace workplace_cl="VI ker eloljarosag" if workplace=="VI k. élj."
replace workplace_cl="VI ker eloljarosag" if workplace=="VI k. élj."
replace workplace_cl="VI ker eloljarosag" if workplace=="VI k. élj."
replace workplace_cl="VI ker eloljarosag" if workplace=="VI k. élj."
replace workplace_cl="VI ker eloljarosag" if workplace=="VI k. élj."
replace workplace_cl="VI ker eloljarosag" if workplace=="VI k. élj."
replace workplace_cl="VI ker eloljarosag" if workplace=="VI k. élj."
replace workplace_cl="VI ker eloljarosag" if workplace=="VI k. élj."
replace workplace_cl="VI ker eloljarosag" if workplace=="VI k. élj."
replace workplace_cl="VI ker eloljarosag" if workplace=="VI k. élj."
replace workplace_cl="VI ker eloljarosag" if workplace=="VI k. élj."
replace workplace_cl="VI ker eloljarosag" if workplace=="VI k.előlj.l"
replace workplace_cl="VI ker eloljarosag" if workplace=="VI. k. élj"
replace workplace_cl="VI ker eloljarosag" if workplace=="VI. k. élj."
replace workplace_cl="VI ker eloljarosag" if workplace=="VIk. elölj"
replace workplace_cl="VI ker eloljarosag" if workplace=="VIk. elölj"
replace workplace_cl="VI ker eloljarosag" if workplace=="VIk. elölj."
replace workplace_cl="VI ker eloljarosag" if workplace=="VIk. elölj."
replace workplace_cl="VI ker eloljarosag" if workplace=="VIk. elölj."
replace workplace_cl="VI ker eloljarosag" if workplace=="VIk. elölj."
replace workplace_cl="VI ker eloljarosag" if workplace=="VIk. elölj."
replace workplace_cl="VI ker eloljarosag" if workplace=="VIk. elölj."
replace workplace_cl="VI ker eloljarosag" if workplace=="VIk. elölj."
replace workplace_cl="VI ker eloljarosag" if workplace=="VIk. elől."
replace workplace_cl="VI ker eloljarosag" if workplace=="VIk.elölj."
replace workplace_cl="VI ker eloljarosag" if workplace=="VIk.elölj."
replace workplace_cl="VI ker eloljarosag" if workplace=="VIk.előjj."
replace workplace_cl="V ker eloljarosag" if workplace=="Vk. elölj"
replace workplace_cl="X ker eloljarosag" if workplace=="X k elolj"
replace workplace_cl="X ker eloljarosag" if workplace=="X k elolj"
replace workplace_cl="X ker eloljarosag" if workplace=="X k. elölj"
replace workplace_cl="X ker eloljarosag" if workplace=="X k. elölj"
replace workplace_cl="X ker eloljarosag" if workplace=="X k. elölj"
replace workplace_cl="X ker eloljarosag" if workplace=="X k. elölj"
replace workplace_cl="X ker eloljarosag" if workplace=="X k. elölj"
replace workplace_cl="X ker eloljarosag" if workplace=="X k. elölj"
replace workplace_cl="X ker eloljarosag" if workplace=="X k. elölj-"
replace workplace_cl="X ker eloljarosag" if workplace=="X k. elölj."
replace workplace_cl="X ker eloljarosag" if workplace=="X k. elölj."
replace workplace_cl="X ker eloljarosag" if workplace=="X k. elölj."
replace workplace_cl="X ker eloljarosag" if workplace=="X k. elölj."
replace workplace_cl="X ker eloljarosag" if workplace=="X k. elölj."
replace workplace_cl="X ker eloljarosag" if workplace=="X k. elölj."
replace workplace_cl="X ker eloljarosag" if workplace=="X k. elölj."
replace workplace_cl="X ker eloljarosag" if workplace=="X k. elölj."
replace workplace_cl="X ker eloljarosag" if workplace=="X k. elölj."
replace workplace_cl="X ker eloljarosag" if workplace=="X k. előlj"
replace workplace_cl="X ker eloljarosag" if workplace=="X k. élj."
replace workplace_cl="X ker eloljarosag" if workplace=="X k. élj."
replace workplace_cl="X ker eloljarosag" if workplace=="X k. élj."
replace workplace_cl="X ker eloljarosag" if workplace=="X k. élj."
replace workplace_cl="X ker eloljarosag" if workplace=="X k. élj."
replace workplace_cl="X ker eloljarosag" if workplace=="X k. élj."
replace workplace_cl="X ker eloljarosag" if workplace=="X k. élj."
replace workplace_cl="X ker eloljarosag" if workplace=="X k.előlj"
replace workplace_cl="X ker eloljarosag" if workplace=="X. K. Elöl"
                              
							  

***********************************************************************************************************************
************************************************************************************************************************
***********************************************************************************************************************

gen workplace_broad=""
label var workplace_broad "broad categories of workplaces" 
replace workplace_broad="korhaz" if regexm(workplace_cl, "kórház")==1

replace workplace_broad="temeto" if regexm(workplace_cl, "temeto")==1

replace workplace_broad="szegenyhaz" if regexm(workplace_cl, "szegényház")==1
replace workplace_broad="szegenyhaz" if regexm(workplace_cl, "szeretetház")==1


replace workplace_broad="anyakonyvi hivatal" if regexm(workplace_cl, "anyakönyvi hivatal")==1

replace workplace_broad="eloljarosag" if regexm(workplace_cl, "eloljarosag")==1                                      
				   
				   
replace workplace_broad="vasarcsarnok es vasar" if regexm(workplace_cl, "vcs")==1  				   
replace workplace_broad="vasarcsarnok es vasar" if regexm(workplace_cl, "vásár")==1  	
replace workplace_broad="vasarcsarnok es vasar" if regexm(workplace_cl, "Vásár")==1

replace workplace_broad="arvahaz" if regexm(workplace_cl, "árvaház")==1  	

replace workplace_broad="szamvevoseg" if regexm(workplace_cl, "Számvevoség")==1  	
replace workplace_broad="szamvevoseg" if regexm(workplace_cl, "számvevoség")==1  

replace workplace_broad="tanacsi ugyosztaly, segedhivatal" if regexm(workplace_cl, "Tanácsi")==1	&	regexm(workplace_cl, "ügyosztály")==1
replace workplace_broad="tanacsi ugyosztaly, segedhivatal" if regexm(workplace_cl, "Tanácsi")==1	&	regexm(workplace_cl, "segédhivatal")==1

replace workplace_broad="elnoki ugyosztaly" if 	regexm(workplace_cl, "Elnöki ügyosztály")==1



replace workplace_broad="furdo" if	regexm(workplace_cl, "fürdo")==1

replace workplace_broad="arvaszek" if	regexm(workplace_cl, "Árvaszék")==1
replace workplace_broad="arvaszek" if	regexm(workplace_cl, "Árv. shiv")==1


replace workplace_broad="polgarmesteri hivatal" if	regexm(workplace_cl, "polgármester")==1
replace workplace_broad="polgarmesteri hivatal" if	regexm(workplace_cl, "Polgármester")==1

replace workplace_broad="penztar" if	regexm(workplace_cl, "pénztár")==1

replace workplace_broad="adoszamviteli hivatal" if	regexm(workplace_cl, "adószámv")==1

replace workplace_broad="vagohid es allategeszsegugy" if	regexm(workplace_cl, "vágó")==1
replace workplace_broad="vagohid es allategeszsegugy" if	regexm(workplace_cl, "Állategészségügyi telep")==1



replace workplace_broad="intezet" if	regexm(workplace_cl, "Vegyészeti és tápszer Vizsgáló Intézet")==1
replace workplace_broad="intezet" if	regexm(workplace_cl, "Vegyészeti és élelmiszervizsgáló intéz")==1
replace workplace_broad="intezet" if	regexm(workplace_cl, "Bakteriológiai intézet")==1
replace workplace_broad="intezet" if	regexm(workplace_cl, "Fertotleníto intézet")==1



replace workplace_broad="keruleti" if workplace_cl=="I ker"
replace workplace_broad="keruleti" if workplace_cl=="II ker"
replace workplace_broad="keruleti" if workplace_cl=="I-II ker"
replace workplace_broad="keruleti" if workplace_cl=="III ker"
replace workplace_broad="keruleti" if workplace_cl=="IV ker"
replace workplace_broad="keruleti" if workplace_cl=="IV es IX ker"
replace workplace_broad="keruleti" if workplace_cl=="V ker"
replace workplace_broad="keruleti" if workplace_cl=="V es VI ker"
replace workplace_broad="keruleti" if workplace_cl=="VI ker"
replace workplace_broad="keruleti" if workplace_cl=="VII ker"
replace workplace_broad="keruleti" if workplace_cl=="VIII ker"
replace workplace_broad="keruleti" if workplace_cl=="IX ker"
replace workplace_broad="keruleti" if workplace_cl=="X ker"

replace workplace_broad="gazdasagi hivatal" if	regexm(workplace_cl, "gazdasági hivatal")==1
replace workplace_broad="gazdasagi hivatal" if	regexm(workplace_cl, "Gazdasági hivatal")==1




replace workplace_broad="mernoki hivatal" if	regexm(workplace_cl, "Mérnöki hivatal")==1

replace workplace_broad="tuzoltosag" if	regexm(workplace_cl, "Tuzoltó foparancsnokság")==1
replace workplace_broad="tuzoltosag" if	regexm(workplace_cl, "Tuzoltóság")==1

replace workplace_broad="vizvezetek, viz- es gazmuigazgaosag" if	regexm(workplace_cl, "Vízmüigazgatóság")==1
replace workplace_broad="vizvezetek, viz- es gazmuigazgaosag" if	regexm(workplace_cl, "Gázmuvek igazgatósága")==1
replace workplace_broad="vizvezetek, viz- es gazmuigazgaosag" if	regexm(workplace_cl, "Vízvezetéki igazgatóság")==1


replace workplace_broad="konyv es leveltar" if	regexm(workplace_cl, "Könyvtár")==1
replace workplace_broad="konyv es leveltar" if	regexm(workplace_cl, "T. levéltár")==1
replace workplace_broad="konyv es leveltar" if	regexm(workplace_cl, "Levéltár")==1
 
replace workplace_broad="tiszti foorvosi hivatal" if	regexm(workplace_cl, "Tiszti foorvosi hivatal")==1

replace workplace_broad="tiszti ugyeszseg" if	regexm(workplace_cl, "Tiszti ügyészség")==1

replace workplace_broad="hordojelzo hivatal" if	regexm(workplace_cl, "Hordójelzo hivatal")==1

replace workplace_broad="statisztikai hivatal" if	regexm(workplace_cl, "Statisztikai hivatal")==1

replace workplace_broad="koztisztasagi hivatal" if	regexm(workplace_cl, "Köztisztasági hivatal")==1

replace workplace_broad="other" if workplace_broad=="" & workplace_cl!=""

