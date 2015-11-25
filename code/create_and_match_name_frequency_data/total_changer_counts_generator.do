* names in BPP

import delimited D:\Attila\browser_automation\namelist_updated.csv, encoding(UTF-8) clear 
rename n1 name
rename fnf oldname_count
gen id=string(sorszam)
gen source="newname"
tempfile l
save `l'


* old names in BPP
import delimited D:\Attila\browser_automation\namelist_oldnames_updated.csv, encoding(UTF-8) clear
rename v1 id
rename v2 name
rename v3 oldname_count 
gen source="oldname"

append using `l'
duplicates drop name, force

tempfile l
save `l', replace

keep id name oldname_count source

* jewish among changers in BPP
import delimited D:\Attila\browser_automation\namelist_changersonly_updated.csv, encoding(UTF-8) clear

rename v1 id
rename v2 name_changer_jewish
rename v3 oldname_count_jewish

merge 1:1 id using `l', gen(_m1)

tempfile l
save `l', replace

* number of people in MACSE registry birth data
import delimited D:\Attila\browser_automation\namelist_births_updated.csv, encoding(UTF-8) clear
rename v1 id
rename v2 name_birth
rename v3 births

merge 1:1 id using `l', gen(_m2)
tempfile l
save `l', replace

* new names in BPP
import delimited D:\Attila\browser_automation\namelist_newnames_updated.csv, encoding(UTF-8) clear
rename v3 newname_count
rename v2 newname
rename v1 id

merge 1:1 id using `l', gen(_m3)
tempfile l
save `l', replace


* new names, jewish only in bpp
import delimited D:\Attila\browser_automation\namelist_newnames_jews_updated.csv, encoding(UTF-8) clear 
rename v1 id
rename v2 newname_jewish
rename v3 newname_count_jewish
replace newname_count_jewish="" if newname_count_jewish=="FNF"

merge 1:1 id using `l', gen(_m4)
order id source name name_changer_jewish newname newname_jewish name_birth oldname_count oldname_count_jewish newname_count newname_count_jewish births
replace newname_count_jewish="" if newname_count==0
destring newname_count_jewish, force replace
drop name_changer_jewish newname newname_jewish name_birth sorszam _m1 _m2 _m3 _m4
 



****** scrabble score generator

gen check1=lower(name)

replace check1=subinstr(check1,"Á", "á", 1) if substr(check1,1,2)=="Á"
replace check1=subinstr(check1,"É", "é", 1) if substr(check1,1,2)=="É"
replace check1=subinstr(check1,"Í", "í", 1) if substr(check1,1,2)=="Í"
replace check1=subinstr(check1,"Ö", "ö", 1) if substr(check1,1,2)=="Ö"
replace check1=subinstr(check1,"Ő", "ő", 1) if substr(check1,1,2)=="Ő"
replace check1=subinstr(check1,"Õ", "ő", 1) if substr(check1,1,2)=="Õ"

replace check1=subinstr(check1,"Ü", "ü", 1) if substr(check1,1,2)=="Ü"
replace check1=subinstr(check1,"Ű", "ű", 1) if substr(check1,1,2)=="Ű"
replace check1=subinstr(check1,"Ú", "ú", 1) if substr(check1,1,2)=="Ú"
replace check1=subinstr(check1,"Ó", "ó", 1) if substr(check1,1,2)=="Ó"




cap drop srn
gen srn=lower(check1)
cap drop replacements
gen replacements=0

cap drop srn_scrab old_scrab
gen srn_scrab=0


*stop


* SZ, VALUE:3
foreach v of varlist srn  {
	*cap drop `v'_scrab
	*gen `v'_scrab=0

	local N=_N
	quietly forval i = 1/`N' { 
		while strpos(`v'[`i'], "sz")>0 {
			replace `v'=substr(`v',1,strpos(`v'[`i'], "sz")-1)+substr(`v',strpos(`v'[`i'], "sz")+2,.) in `i'
			disp `i'		
			replace `v'_scrab=`v'_scrab+3 in `i'
			replace replacements=replacements+1 in `i'
		}
		
	
	}
	


}

* GY,VALUE: 4
foreach v of varlist srn  {
	*cap drop `v'_scrab
	*gen `v'_scrab=0

	local N=_N
	quietly forval i = 1/`N' { 
		while strpos(`v'[`i'], "gy")>0 {
			replace `v'=substr(`v',1,strpos(`v'[`i'], "gy")-1)+substr(`v',strpos(`v'[`i'], "gy")+2,.) in `i'
			disp `i'		
			replace `v'_scrab=`v'_scrab+4 in `i'
			replace replacements=replacements+1 in `i'

		}
		
	
	}
	


}	
	

* CZ,VALUE: 5 (same as C)
foreach v of varlist srn  {
	*cap drop `v'_scrab
	*gen `v'_scrab=0

	local N=_N
	quietly forval i = 1/`N' { 
		while strpos(`v'[`i'], "cz")>0 {
			replace `v'=substr(`v',1,strpos(`v'[`i'], "cz")-1)+substr(`v',strpos(`v'[`i'], "cz")+2,.) in `i'
			disp `i'		
			replace `v'_scrab=`v'_scrab+5 in `i'
			replace replacements=replacements+1 in `i'
			
		}
		
	
	}
	


}
		
	
* NY,VALUE: 5
foreach v of varlist srn  {
	*cap drop `v'_scrab
	*gen `v'_scrab=0

	local N=_N
	quietly forval i = 1/`N' { 
		while strpos(`v'[`i'], "ny")>0 {
			replace `v'=substr(`v',1,strpos(`v'[`i'], "ny")-1)+substr(`v',strpos(`v'[`i'], "ny")+2,.) in `i'
			disp `i'		
			replace `v'_scrab=`v'_scrab+5 in `i'
			replace replacements=replacements+1 in `i'
			
		}
		
	
	}
	


}
	
	
* CS,VALUE: 7
foreach v of varlist srn {
	*cap drop `v'_scrab
	*gen `v'_scrab=0

	local N=_N
	quietly forval i = 1/`N' { 
		while strpos(`v'[`i'], "cs")>0 {
			replace `v'=substr(`v',1,strpos(`v'[`i'], "cs")-1)+substr(`v',strpos(`v'[`i'], "cs")+2,.) in `i'
			disp `i'		
			replace `v'_scrab=`v'_scrab+7 in `i'
			replace replacements=replacements+1 in `i'
			
		}
		
	
	}
	


}



* szovegi y-bol i-lesz hogy ne konfuzaljuk az ly-lal
foreach v of varlist srn  {

replace `v'=substr(`v',1,length(`v')-1)+"i" if substr(`v',-1,1)=="y"

}
	
* LY,VALUE: 8
foreach v of varlist srn {
	*cap drop `v'_scrab
	*gen `v'_scrab=0

	local N=_N
	quietly forval i = 1/`N' { 
		while strpos(`v'[`i'], "ly")>0 {
			replace `v'=substr(`v',1,strpos(`v'[`i'], "ly")-1)+substr(`v',strpos(`v'[`i'], "ly")+2,.) in `i' 
			*if strpos(`v'[`i'], "ly")!=length(`v')[`i']-1
			*
			disp `i'		
			replace `v'_scrab=`v'_scrab+8 in `i'
			replace replacements=replacements+1 in `i'
			
		}
		
	
	}
	


}	
	

* ZS,VALUE: 8
foreach v of varlist srn  {
	*cap drop `v'_scrab
	*gen `v'_scrab=0

	local N=_N
	quietly forval i = 1/`N' { 
		while strpos(`v'[`i'], "zs")>0 {
			replace `v'=substr(`v',1,strpos(`v'[`i'], "zs")-1)+substr(`v',strpos(`v'[`i'], "zs")+2,.) in `i'
			disp `i'		
			replace `v'_scrab=`v'_scrab+8 in `i'
			replace replacements=replacements+1 in `i'
			
		}
		
	
	}
	


}
	
* TY,VALUE: 10
foreach v of varlist srn  {
	*cap drop `v'_scrab
	*gen `v'_scrab=0

	local N=_N
	quietly forval i = 1/`N' { 
		while strpos(`v'[`i'], "ty")>0 {
			replace `v'=substr(`v',1,strpos(`v'[`i'], "ty")-1)+substr(`v',strpos(`v'[`i'], "ty")+2,.) in `i' 
			*if strpos(`v'[`i'], "ty")!=length(`v'[`i']-1)
			disp `i'		
			replace `v'_scrab=`v'_scrab+10 in `i'
			replace replacements=replacements+1 in `i'
			
		}
		
	
	}
	


}	

*SCORE OF 1

foreach L in "a" "e" "k" "t" "l" "n" "r" "i" "m" "o" "s" "y" {

	foreach v of varlist srn {
		*cap drop `v'_scrab
		*gen `v'_scrab=0

		local N=_N
		quietly forval i = 1/`N' { 
			while strpos(`v'[`i'], "`L'")>0 {
				replace `v'=substr(`v',1,strpos(`v'[`i'], "`L'")-1)+substr(`v',strpos(`v'[`i'], "`L'")+1,.) in `i' 
				*if strpos(`v'[`i'], "ty")!=length(`v'[`i']-1)
				disp `i'		
				replace `v'_scrab=`v'_scrab+1 in `i'
				replace replacements=replacements+1 in `i'
				
			}
			
		
		}
		


	}
}

foreach L in  "á"  {

	foreach v of varlist srn {
		*cap drop `v'_scrab
		*gen `v'_scrab=0

		local N=_N
		quietly forval i = 1/`N' { 
			while strpos(`v'[`i'], "`L'")>0 {
				replace `v'=substr(`v',1,strpos(`v'[`i'], "`L'")-1)+substr(`v',strpos(`v'[`i'], "`L'")+2,.) in `i' 
				*if strpos(`v'[`i'], "ty")!=length(`v'[`i']-1)
				disp `i'		
				replace `v'_scrab=`v'_scrab+1 in `i'
				replace replacements=replacements+1 in `i'
				
			}
			
		
		}
		


	}
}

*SCORE OF 2
*2 pont: B ׳, D ׳, G ׳, Ӡ׳

foreach L in "b" "d" "g" {

	foreach v of varlist srn  {
		*cap drop `v'_scrab
		*gen `v'_scrab=0

		local N=_N
		quietly forval i = 1/`N' { 
			while strpos(`v'[`i'], "`L'")>0 {
				replace `v'=substr(`v',1,strpos(`v'[`i'], "`L'")-1)+substr(`v',strpos(`v'[`i'], "`L'")+1,.) in `i' 
				*if strpos(`v'[`i'], "ty")!=length(`v'[`i']-1)
				disp `i'		
				replace `v'_scrab=`v'_scrab+2 in `i'
				replace replacements=replacements+1 in `i'
				
			}
			
		
		}
		
	}
}

foreach L in "ó" {

	foreach v of varlist srn  {
		*cap drop `v'_scrab
		*gen `v'_scrab=0

		local N=_N
		quietly forval i = 1/`N' { 
			while strpos(`v'[`i'], "`L'")>0 {
				replace `v'=substr(`v',1,strpos(`v'[`i'], "`L'")-1)+substr(`v',strpos(`v'[`i'], "`L'")+2,.) in `i' 
				*if strpos(`v'[`i'], "ty")!=length(`v'[`i']-1)
				disp `i'		
				replace `v'_scrab=`v'_scrab+2 in `i'
				replace replacements=replacements+1 in `i'
				
			}
			
		
		}
		
	}
}
*3 pont: ɠ׳, H ײ, SZ ײ, V ײ


foreach L in "h" "v" {

	foreach v of varlist srn {
		*cap drop `v'_scrab
		*gen `v'_scrab=0

		local N=_N
		quietly forval i = 1/`N' { 
			while strpos(`v'[`i'], "`L'")>0 {
				replace `v'=substr(`v',1,strpos(`v'[`i'], "`L'")-1)+substr(`v',strpos(`v'[`i'], "`L'")+1,.) in `i' 
				*if strpos(`v'[`i'], "ty")!=length(`v'[`i']-1)
				disp `i'		
				replace `v'_scrab=`v'_scrab+3 in `i'
				replace replacements=replacements+1 in `i'
				
			}
			
		
		}
		


	}
}


foreach L in "é" {

	foreach v of varlist srn  {
		*cap drop `v'_scrab
		*gen `v'_scrab=0

		local N=_N
		quietly forval i = 1/`N' { 
			while strpos(`v'[`i'], "`L'")>0 {
				replace `v'=substr(`v',1,strpos(`v'[`i'], "`L'")-1)+substr(`v',strpos(`v'[`i'], "`L'")+2,.) in `i' 
				*if strpos(`v'[`i'], "ty")!=length(`v'[`i']-1)
				disp `i'		
				replace `v'_scrab=`v'_scrab+3 in `i'
				replace replacements=replacements+1 in `i'
				
			}
			
		
		}
		


	}
}

*4 pont: F ײ, GY ײ, J ײ, ֠ײ, P ײ, U ײ, ܠײ, Z ײ


foreach L in  "ö"  "ü"  {

	foreach v of varlist srn {
		*cap drop `v'_scrab
		*gen `v'_scrab=0

		local N=_N
		quietly forval i = 1/`N' { 
			while strpos(`v'[`i'], "`L'")>0 {
				replace `v'=substr(`v',1,strpos(`v'[`i'], "`L'")-1)+substr(`v',strpos(`v'[`i'], "`L'")+2,.) in `i' 
				*if strpos(`v'[`i'], "ty")!=length(`v'[`i']-1)
				disp `i'		
				replace `v'_scrab=`v'_scrab+4 in `i'
				replace replacements=replacements+1 in `i'
				
			}
			
		
		}
		

	}
}

foreach L in "f" "j"  "p" "u" "z" {

	foreach v of varlist srn {
		*cap drop `v'_scrab
		*gen `v'_scrab=0

		local N=_N
		quietly forval i = 1/`N' { 
			while strpos(`v'[`i'], "`L'")>0 {
				replace `v'=substr(`v',1,strpos(`v'[`i'], "`L'")-1)+substr(`v',strpos(`v'[`i'], "`L'")+1,.) in `i' 
				*if strpos(`v'[`i'], "ty")!=length(`v'[`i']-1)
				disp `i'		
				replace `v'_scrab=`v'_scrab+4 in `i'
				replace replacements=replacements+1 in `i'
				
			}
			
		
		}
		

	}
}


*5 pont: C ױ, ͠ױ, NY ױ


foreach L in "c" {

	foreach v of varlist srn {
		*cap drop `v'_scrab
		*gen `v'_scrab=0

		local N=_N
		quietly forval i = 1/`N' { 
			while strpos(`v'[`i'], "`L'")>0 {
				replace `v'=substr(`v',1,strpos(`v'[`i'], "`L'")-1)+substr(`v',strpos(`v'[`i'], "`L'")+1,.) in `i' 
				*if strpos(`v'[`i'], "ty")!=length(`v'[`i']-1)
				disp `i'		
				replace `v'_scrab=`v'_scrab+5 in `i'
				replace replacements=replacements+1 in `i'
				
			}
			
		
		}
		


	}
}
foreach L in "í" {

	foreach v of varlist srn{
		*cap drop `v'_scrab
		*gen `v'_scrab=0

		local N=_N
		quietly forval i = 1/`N' { 
			while strpos(`v'[`i'], "`L'")>0 {
				replace `v'=substr(`v',1,strpos(`v'[`i'], "`L'")-1)+substr(`v',strpos(`v'[`i'], "`L'")+2,.) in `i' 
				*if strpos(`v'[`i'], "ty")!=length(`v'[`i']-1)
				disp `i'		
				replace `v'_scrab=`v'_scrab+5 in `i'
				replace replacements=replacements+1 in `i'
				
			}
			
		
		}
		


	}
}

*7 pont


foreach L in "o" "p" "q"  "x" "w" "o" {

	foreach v of varlist srn {
		*cap drop `v'_scrab
		*gen `v'_scrab=0

		local N=_N
		quietly forval i = 1/`N' { 
			while strpos(`v'[`i'], "`L'")>0 {
				replace `v'=substr(`v',1,strpos(`v'[`i'], "`L'")-1)+substr(`v',strpos(`v'[`i'], "`L'")+1,.) in `i' 
				*if strpos(`v'[`i'], "ty")!=length(`v'[`i']-1)
				disp `i'		
				replace `v'_scrab=`v'_scrab+7 in `i'
				replace replacements=replacements+1 in `i'
				
			}
			
		
		}
		


	}
}

foreach L in "ú" "ä" "ű" "ő" "õ" "û" {

	foreach v of varlist srn {
		*cap drop `v'_scrab
		*gen `v'_scrab=0

		local N=_N
		quietly forval i = 1/`N' { 
			while strpos(`v'[`i'], "`L'")>0 {
				replace `v'=substr(`v',1,strpos(`v'[`i'], "`L'")-1)+substr(`v',strpos(`v'[`i'], "`L'")+2,.) in `i' 
				*if strpos(`v'[`i'], "ty")!=length(`v'[`i']-1)
				disp `i'		
				replace `v'_scrab=`v'_scrab+7 in `i'
				replace replacements=replacements+1 in `i'
				
			}
			
		
		}
		


	}
}



gen scrab = srn_scrab


gen rscrab = scrab/length(name)


gen scrab2 = srn_scrab^2


gen rscrab2 = scrab^2/length(name)


la var scrab "AG - Scrabble score of names"


la var scrab2 "AG - Square of Scrabble score of names"


la var rscrab "AG - Scrabble score of names / length of name"


la var rscrab2 "AG - Square of Scrabble score of names / length of name"




drop check1  replacements srn_scrab

/*
gen has_jewish=0
replace has_jewish=1 if jewish_count >0 & jewish_count!=.
*replace has_jewish=0 if births>100 & jewish_share<.5
replace has_jewish=0 if jewish_share<.33
*/

* a sulyok szamlaloja a szuletes szerint lesz, a nevezoje a nevvaltoztatasok szerint
gen weight=birth
replace weight=1 if birth==0	
egen tw=total(oldname_count)




* merge to cimjegyzek data

gen key=name
do gen_matchkey.do

merge m:1 key using "D:\Attila\browser_automation\bp_names.dta", gen(_bp) 
drop if _bp==2


gen c_missing=0
gen birth_missing = 0
replace birth_missing=1 if births==. |  births==0
replace c_missing=1 if c==.

tab birth_missing c_missing
la var c "cimjegyzek nevsor"
la var births "anyakonyv"


rename c bp_count
drop srn tw key name_key idusing _bp

merge 1:1 id using "D:\Attila\browser_automation\unique_id_dict.dta", gen(idmatch)
drop if idmatch==2

save "D:\Attila\browser_automation\total_changer_counts.dta", replace

