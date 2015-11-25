preserve
clear
import delimited "../data/budapest_employees/raw/matched_namechangers_1815-1913_20140828.csv", delimiter(";")

keep  if surname_qual>0.90 & (name1_qual>0.90 | name2_qual>0.90)
gen id=_n
*további szabály:
egen type=group(match_type)
drop if type==2 & change_year<1904
*- kidobás: oldname alapján van a match, de a change_year<1904
drop if type==1 & change_year>year & change_year!=.
*- kidobas: newname alapjan van a match, de a change_year>year
*- 1904 és 1912 közötti matcheket mindkét oldalról meg kellene találni
count if change_year>1903 & change_year<1913

*- válaszd ki ahol a byear gap a legkisebb
*- válaszd ki ahol a change_place az pest


egen g=group(unique_id)
egen gap=min(byear_gap), by(g)
drop if gap!=byear_gap
cap drop c
egen c=count(id), by(unique_id)
tab c
sort g
tab changeplace_using if c>1
drop if c>1 & changeplace_using!="Budapest" & changeplace_using!="Újpest" & changeplace_using!="Pest" & changeplace_using!="Rákospalota" & changeplace_using!="Dunaföldvár" & changeplace_using!="Diósd" & changeplace_using!="Buda"
drop c
egen c=count(id), by(unique_id)
tab c

gen nfit=surname_qual
replace nfit=nfit*name1_qual if name1_qual!=0 
replace nfit=nfit*name2_qual if name2_qual!=0 

egen bestfit=max(nfit),by(unique_id)
drop if bestfit!=. & bestfit!=nfit & c>1

*drop if c>1 & job_using=="n.a."
*drop c
*egen c=count(id), by(unique_id)
*tab c

drop if c>1
drop year birthyear_master key1 key2 key3
tempfile treatment
save `treatment'

restore

merge m:1 unique_id using `treatment', gen(mtreat)

*stop***
*drop match_type match_quality surname_qual name1_qual name2_qual  fname1 v15 v17 macse_id macse_doc d1 d2 d3 d4 d5 d6 d7 d8 newname_using oldname_using fname1_using fname2_using job_using changeplace_using birthplace_using birthyear_using d9 v41 v42 v43 v44 v45 id type g gap c cc fit nfit bestfit
keep match_type idmaster-id_1909 byear_gap oldname newname change_year macse_id change_age change_year2 mtreat religion 

gen changer=0
replace changer=1 if mtreat==3
drop mtreat

preserve
collapse (firstnm) oldname newname change_year religion change_age change_year2 match_type (max)changer, by(idmaster) 
save `treatment', replace
restore
merge m:1 idmaster using `treatment', update gen(mtreat)


*once a changer, always a changer

la var match_type "NCD - which name was the match based upon"
la var changer "NCD - 1 if the person is a name changer, 0 if not"
la var byear_gap "NCD&BPP - Difference between birth year in the BPP and in the NCD"
la var oldname "NCD - Name before changing"
la var newname "NCD - Name after changing"
la var change_year "NCD - Year of change"
la var religion "NCD - Religion of the changer"
la var change_age "NCD - Age at the time of name change"
la var change_year2 "NCD - Alternative year of change" 
