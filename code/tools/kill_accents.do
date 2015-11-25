foreach var of varlist _all {
	disp "`var'"

	foreach i in "á" "é" "í" "ó" "ú" "ű" "ü" "ö" "ő" {
		local var2=subinstr("`var'","`i'", "",.)
		rename `var'  `var2'
		local var = "`var2'"
	}

}
