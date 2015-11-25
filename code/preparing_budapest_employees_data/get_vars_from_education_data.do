
* THIS CODE MATCHES INDIVIDUALS IN THE BUDAPEST PANEL TO EDUCATION DATA

* ISSUE: THIS MATCH IS INCOMPLETE.

* DATA FILES USED IN THE PROCESS:

* Raw education data: EDU-ID + edu data
*** NPT_adatk/BP2+RES.csv? NPT_adatok/BP1.dat

* Raw matches between Education and Budapest panel:  EDU-ID + BP-ID pairs
*** save_NPT_BP_rawmatches_full_CLEAN.dta

* Budapest panel:  consistent database ouf our panel on budapest workers
*** bpp.dta


********************** IMPORTING EDUCATION DATA SENT BY NPT *******************
* the following part imports the raw education data sent back in the 2nd round 
* BP2+RES means 'the second round of the Budapest matches and the Reserve officer matches'
insheet using "../data/education/raw/BP2+RES.dat", clear

* let's drop everything which is messy and don't know what is good for
keep sorszam eletkor szulev kalkszulev1 kalkszulev2 kalkszulev3 ///
	vallas_iskfelekkel vallas_iskfel_5kat vallas5kat vallas5_nevjell3  ///
	zsido3_nemzsido vallasrendben fenntarto fenntarto_felek szulhely ///
	apafogl_4var_osszevonas apafogl_agazat apafogl_szfera szellemi_atlag_19e ///
	magyartmp nemettmp latintmp torttmp matektmp fizikatmp ///
	vallas1 vallas5kat
	
	*nevek  v8	v9	v10	v_nev_0	v_nev_1	v_nev_2	nevkieg	v11	u_nev_0	u_nev_1	u_nev_2	u_nev_3	u_nev_4	u_nev_5	u_nev_6	u_nev_7


tempfile educ1
save `educ1'

clear

* importing the first round of matches, hand-picked by NPT
insheet using "../data/education/raw/BP1.dat"

keep sorszam eletkor szulev kalkszulev1 kalkszulev2 kalkszulev3 ///
	vallas_iskfelekkel vallas_iskfel_5kat vallas5kat vallas5_nevjell3  ///
	zsido3_nemzsido vallasrendben fenntarto fenntarto_felek szulhely ///
	apafogl_4var_osszevonas apafogl_agazat apafogl_szfera szellemi_atlag_19e ///
	magyartmp nemettmp latintmp torttmp matektmp fizikatmp ///
	vallas1 vallas5kat
	
	*nevek  v8	v9	v10	v_nev_0	v_nev_1	v_nev_2	nevkieg	v11	u_nev_0	u_nev_1	u_nev_2	u_nev_3	u_nev_4	u_nev_5	u_nev_6	u_nev_7
	
destring magyartmp nemettmp latintmp torttmp matektmp fizikatmp, force replace
append using `educ1'

duplicates drop

* save everything in a Stata file
tempfile educ2
save `educ2'

*************************** MATCHING EDUCATION TO MATCH ID-S ********

* the following file contains the queries sent to NPT. what it contains:
* Budapest-ID of potential match - paired with education-ID of potential match
* IMPORTANT!!!!!!!! THESE MATCHES ARE ONLY UNIQUE FOR EDUCATION ID.
*ÊThat is: it contains every individual in the education data who potentially match
* anyone in the Budapest data. 
* --> THIS DATA HAS A LOT OF FALSE POSITIVES, WHICH NEED TO BE FILTERED
use "../data/education/derived/save_NPT_BP_rawmatches_full_CLEAN.dta", clear

* STEP: Merge the file containing match ID-s with education data
drop _merge
merge m:1 sorszam using `educ2'

keep i v_nev_1 u_nev_1 sorszam eletkor szulev kalkszulev1 kalkszulev2 kalkszulev3 ///
	vallas_iskfelekkel vallas_iskfel_5kat vallas5kat vallas5_nevjell3  ///
	zsido3_nemzsido vallasrendben fenntarto fenntarto_felek szulhely ///
	apafogl_4var_osszevonas apafogl_agazat apafogl_szfera szellemi_atlag_19e ///
	magyartmp nemettmp latintmp torttmp matektmp fizikatmp ///
	vallas1 vallas5kat budapest_id
	
	
tempfile educ3
save `educ3'


clear


*********** MATCHING (EDUCATION DATA+MATCH DATA) TO BUDAPEST DATA

use ../data/BPP.dta, clear
*nevek fname	frg	ger	name1	name2

cap drop _merge
merge m:m i using `educ3'
* drop everyone who is _only_ in the education data, that is, there is potentially
* no counterpart in the Budapest data
drop if _merge==2

*keep only the matched 
keep if _merge==3

**********checking whether there is any duplicates by duplicates report i t sorszam
duplicates drop 
duplicates tag i year sorszam, gen(dupl_all)

/*

*browse if dupl_all>0
drop dupl_all
*********** CHOOSING THE BEST MATCHES BY SOME CRITERIA
duplicates tag i year, gen(dupl)
sort i year
*browse  i t name1 name2    newname_using oldname_using oldname newname  v_nev_1 u_nev_1 by kalkszulev1 dupl if _merge==3 & dupl>0




gen name1x = key1
gen name2x = key2

gen v_nev_1x=lower(v_nev_1)
gen u_nev_1x=lower(u_nev_1)
gen oldnamex=lower(oldname)
gen newnamex=lower(newname)


foreach v of varlist name1x name2x oldnamex newnamex  v_nev_1x u_nev_1x  {

	replace `v' = subinstr(`v', "á", "a", .)
	replace `v' = subinstr(`v', "ä", "a", .)
	replace `v' = subinstr(`v', "é", "e", .)
	replace `v' = subinstr(`v', "ó", "o", .)
	replace `v' = subinstr(`v', "ö", "o", .)
	replace `v' = subinstr(`v', "õ", "o", .)
	replace `v' = subinstr(`v', "ú", "u", .)
	replace `v' = subinstr(`v', "ü", "u", .)
	replace `v' = subinstr(`v', "û", "u", .)
	replace `v' = subinstr(`v', "í", "i", .)
	replace `v' = subinstr(`v', "oe", "o", .)

	replace `v' = subinstr(`v', "Á", "a", .)
	replace `v' = subinstr(`v', "Ä", "a", .)
	replace `v' = subinstr(`v', "É", "e", .)
	replace `v' = subinstr(`v', "Ó", "o", .)
	replace `v' = subinstr(`v', "Ö", "o", .)
	replace `v' = subinstr(`v', "Õ", "o", .)
	replace `v' = subinstr(`v', "Ú", "u", .)
	replace `v' = subinstr(`v', "Ü", "u", .)
	replace `v' = subinstr(`v', "Û", "u", .)
	replace `v' = subinstr(`v', "Í", "i", .)
	
	replace `v' = subinstr(`v', "cz", "c", .)
	replace `v' = subinstr(`v', "w", "v", .)
	}

duplicates drop i sorszam, force
* CRITERION 1: If there are more potential matches to one individual, let's
* keep the one where the birth year gap between the birth year data on the 
* two sides is minimal
gen gap = abs(by - kalkszulev1)
label var gap "difference between the birth year in the two dataset"
egen mingap=min(gap), by(i t)
label var mingap "the minimum birth year difference"

* CRITERION 2: having exact name match
gen namematch1=0
replace namematch1=1 if name1x==v_nev_1x | newnamex==v_nev_1x | oldnamex==v_nev_1x 
label var namematch1 "having exact match on familiy name"
gen namematch2=0
replace namematch2=1 if name2x==u_nev_1x
label var namematch2 "having exact match on first name"

*egen gap_namematch1=max(namematch1), by(i t)
egen gap_namematch1=max(namematch1), by(i)
label var gap_namematch1 "whether the individual has any perfect match based on family name"
*egen gap_namematch2=max(namematch2), by(i t)
egen gap_namematch2=max(namematch2), by(i)
label var gap_namematch2 "whether the individual has any perfect match based on first name"


gen bestmatch=0
replace bestmatch=1 if mingap==gap & namematch1 & namematch2==1
label var bestmatch "best match based on birth year and name"
*egen bestmatchxx=max(bestmatch), by(i t)
egen bestmatchxx=max(bestmatch), by(i)
label var bestmatchxx "shows whether the individual has any best match"

*drop the ones who have best match but the best match is not the one we see
drop if bestmatch==0 & bestmatchxx==1

*tag those where there are still duplicates
drop dupl
*duplicates tag i t, gen(dupl)
*sort i t
duplicates tag i, gen(dupl)
sort i


*browse  i t sorszam name1x name2x    newname_usingx oldname_usingx oldnamex newnamex  v_nev_1x u_nev_1x by kalkszulev1 dupl gap mingap bestmatch if _merge==3 & dupl>0

*by hand
replace bestmatch=1 if i==516 & t==1909 & sorszam==5310783
replace bestmatchxx=1 if i==516 & t==1909


*replace bestmatch=1 if i==699 & t==1909 & sorszam==5520152
*replace bestmatchxx=1 if i==699 & t==1909


replace bestmatch=1 if i==799 & t==1904 & sorszam==5373337
replace bestmatchxx=1 if i==799 & t==1904


*replace bestmatch=1 if i==1057 & t==1909 & sorszam==5141517
*replace bestmatchxx=1 if i==1057 & t==1909


replace bestmatch=1 if i==1592 & t==1909 & sorszam==5048559
replace bestmatchxx=1 if i==1592 & t==1909


replace bestmatch=1 if i==2067 & t==1907 & sorszam==5141601
replace bestmatchxx=1 if i==2067 & t==1907

replace bestmatch=1 if i==2207 & t==1912 & sorszam==5310783
replace bestmatchxx=1 if i==2207 & t==1912

	
*replace bestmatch=1 if i==3124 & t==1912 & sorszam==5326277
*replace bestmatchxx=1 if i==3124 & t==1912

*replace bestmatch=1 if i==3227 & t==1912 & sorszam==5018097
*replace bestmatchxx=1 if i==3227 & t==1912

replace bestmatch=1 if i==4974 & t==1912 & sorszam==5082119
replace bestmatchxx=1 if i==4974 & t==1912

replace bestmatch=1 if i==5165 & t==1912 & sorszam==5210336
replace bestmatchxx=1 if i==5165 & t==1912



drop if i==2515 & t==1912 &  sorszam==5430842
drop if i==2515 & t==1912 &  sorszam==5592544
drop if i==2608 
drop if i==2610 
drop if i==2613 & t==1912 &	sorszam==5048132
drop if i==2641 & t==1912 & sorszam==5414706
drop if i==2744 & t==1912 & sorszam==5310906
drop if i==2845 
drop if i==2889 
drop if i==3025 & t==1912 & sorszam==5464467
*drop if i==3129 & t==1912 & sorszam==5079152 | sorszam==5078886
drop if i==3250 & t==1912 & sorszam== 5190894
drop if i==3262 
drop if i==103 
drop if i==787 & t==1909 & sorszam==5496081 | sorszam==5413248
drop if i==3509 
drop if i==3511 
drop if i==4034	& t==1912 & sorszam==5254269
drop if i==4005 
drop if i==4080 
drop if i==4408
drop if i==4517
drop if i==4521
drop if i==4532
drop if i==4534 
drop if i==4535 
drop if i==4553 
drop if i==4668 
drop if i==5380 & t==1992 & sorszam==5043810


*drop the ones who have best match but the best match is not the one we see
drop if bestmatch==0 & bestmatchxx==1



drop dupl
duplicates tag i t, gen(dupl)

tab dupl


drop if mingap!=gap


****************************************************************************
****deriving important variables
***************************************************************************
* School score is generated from a grade variable in the edu data
gen score=szellemi_atlag
*replace score="0" if score==""
replace score=subinstr(score,",",".",.)
destring score, replace
label var score "average of school grades"
*in this period 1 was "excellent" and 5 was "insufficient" - we revert the scale
*for easier interpretation
replace score=6-score


drop dupl
duplicates tag i, gen(dupl)

gen score_unique=score if dupl==0
label var score_unique "average of grades for those where the match is unique"

egen score_notunique=mean(score), by(i)
label var score_notunique "average of grades across all matches"



*wrapping up variables
destring vallas5kat, force replace
label define religs5 1 "Roman Chatolic" 2 "Reformed" 3 "Lutheran" 4 "Israelite" 5 "Other christian"
la val vallas5kat religs5
rename vallas5kat religion2
la var score_unique "ED - average grade (unique match)"
la var score_notunique "ED - average grade (non unique match)"
la var religion2 "ED - religion data from education"

*list of those who went to school and their scores 
preserve
keep if dupl==0
keep idmaster score_unique religion2
duplicates drop
gen has_school=1
la var has_school "ED - Individual was found in high school data (unique match)"

*contains the list of those where the match was unique
save "../data/education/derived/has_school_unique.dta", replace

restore, preserve


keep idmaster score_notunique religion2
duplicates drop idmaster, force
gen has_school=1
la var has_school "ED - Individual was found in high school data (non unique match)"

*contains the list of those where there is at least one match
save "../data/education/derived/has_school_notunique.dta", replace

restore







