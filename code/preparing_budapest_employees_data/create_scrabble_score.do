*use C:\Users\Administrator\Desktop\attila_work\education-bp_match\Budapest_panel.dta, clear

split fn, gen(nparts)

replace nparts1=substr(nparts1,5,.) if substr(nparts1,1,4)=="özv" | substr(nparts1,1,4)=="Özv"
replace nparts1=substr(nparts1,4,.) if substr(nparts1,1,3)=="ifj" | substr(nparts1,1,3)=="Ifj"

replace nparts1=substr(nparts1,1,length(nparts1)-1) if substr(nparts1,-1,1)=="."
gen s = length(nparts1)
replace nparts1=nparts2 if s<3 & nparts1!="Fa"
drop s
gen s = length(nparts1)
replace nparts1=nparts3 if s<3 & nparts1!="Fa"
drop s

gen check1=nparts1 if changer==0
replace check1=oldname if changer==1
gen check2=newname if changer==1
*drop nparts*


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

replace check1=subinstr(check2,"Á", "á", 1) if substr(check2,1,2)=="Á"
replace check1=subinstr(check2,"É", "é", 1) if substr(check2,1,2)=="É"
replace check1=subinstr(check2,"Í", "í", 1) if substr(check2,1,2)=="Í"
replace check1=subinstr(check2,"Ö", "ö", 1) if substr(check2,1,2)=="Ö"
replace check1=subinstr(check2,"Ő", "ő", 1) if substr(check2,1,2)=="Ő"
replace check1=subinstr(check2,"Ü", "ü", 1) if substr(check2,1,2)=="Ü"
replace check1=subinstr(check2,"Ű", "ű", 1) if substr(check2,1,2)=="Ű"
replace check1=subinstr(check2,"Ú", "ú", 1) if substr(check2,1,2)=="Ú"
replace check1=subinstr(check2,"Ó", "ó", 1) if substr(check2,1,2)=="Ó"


cap drop srn old
gen srn=lower(check2)
gen old=lower(check1)

cap drop replacements
gen replacements=0

cap drop srn_scrab old_scrab
gen srn_scrab=0
gen old_scrab=0

*stop


* SZ, VALUE:3
foreach v of varlist srn old {
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
foreach v of varlist srn old {
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
foreach v of varlist srn old {
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
foreach v of varlist srn old {
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
foreach v of varlist srn old {
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
foreach v of varlist srn old {

replace `v'=substr(`v',1,length(`v')-1)+"i" if substr(`v',-1,1)=="y"

}
	
* LY,VALUE: 8
foreach v of varlist srn old {
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
foreach v of varlist srn old {
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
foreach v of varlist srn old {
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

	foreach v of varlist srn old {
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

	foreach v of varlist srn old {
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
*2 pont: B �3, D �3, G �3, � �3

foreach L in "b" "d" "g" {

	foreach v of varlist srn old {
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

	foreach v of varlist srn old {
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
*3 pont: � �3, H �2, SZ �2, V �2


foreach L in "h" "v" {

	foreach v of varlist srn old {
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

	foreach v of varlist srn old {
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

*4 pont: F �2, GY �2, J �2, � �2, P �2, U �2, � �2, Z �2


foreach L in  "ö"  "ü"  {

	foreach v of varlist srn old {
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

	foreach v of varlist srn old {
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


*5 pont: C �1, � �1, NY �1


foreach L in "c" {

	foreach v of varlist srn old {
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

	foreach v of varlist srn old {
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

*7 pont: CS �1, O �1, � �1, hosszu U �1


foreach L in "o" "p" "q"  "x" "w" "o" {

	foreach v of varlist srn old {
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

	foreach v of varlist srn old {
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



gen unchanged_scrab = old_scrab
gen changed_scrab = srn_scrab

gen unchanged_rscrab = unchanged_scrab/length(old)
gen changed_rscrab = changed_scrab/length(srn)

gen unchanged_scrab2 = old_scrab^2
gen changed_scrab2 = srn_scrab^2

gen unchanged_rscrab2 = unchanged_scrab^2/length(old)
gen changed_rscrab2 = changed_scrab^2/length(srn)

la var unchanged_scrab "AG - Scrabble score of non-changers and old names"
la var changed_scrab "AG - Scrabble score of new names"

la var unchanged_scrab2 "AG - Square of Scrabble score of non-changers and old names"
la var changed_scrab2 "AG - Square of Scrabble score of new names"

la var unchanged_rscrab "AG - Scrabble score of non-changers and old names / length of name"
la var changed_rscrab "AG - Scrabble score of new names / length of name"

la var unchanged_rscrab2 "AG - Square of Scrabble score of non-changers and old names / length of name"
la var changed_rscrab2 "AG - Square of Scrabble score of new names / length of name"

foreach v of varlist changed_scrab changed_rscrab changed_scrab2 changed_rscrab2 {

	replace `v'=. if changer==0 


}


drop nparts1 nparts2 nparts3 nparts4 nparts5 nparts6 nparts7 check1 check2 srn old replacements srn_scrab old_scrab
