cd "C:\Users\dstone\Dropbox\who_how\scripts\survey\"

cap log close
log using pres.log, replace


*gen legislator only

use "C:\Users\dstone\Dropbox\who_how\scripts\survey\standardnames.dta", clear
keep libcon_1 libcon_2 repX1 demX1 pid3 uniq educ ideo state  age
keep if demX1 == "barack obama" | demX1 =="joe biden" 
gen dem = demX1
gen rep = repX1
gen dr = libcon_1
gen rr = libcon_2
gen order = 1
save "C:\Users\dstone\Dropbox\who_how\scripts\survey\leg1d.dta", replace


use "C:\Users\dstone\Dropbox\who_how\scripts\survey\standardnames.dta", clear
keep libcon_3 libcon_4 repX2 demX2 pid3 uniq educ ideo state  age
keep if demX2 == "barack obama" | demX2 =="joe biden" 
gen dem = demX
gen rep = repX
gen dr = libcon_3
gen rr = libcon_4
gen order = 2
save "C:\Users\dstone\Dropbox\who_how\scripts\survey\leg2d.dta", replace


use "C:\Users\dstone\Dropbox\who_how\scripts\survey\standardnames.dta", clear
keep libcon_5 libcon_6 repX3 demX3 pid3 uniq educ ideo state  age
keep if demX3 == "barack obama" | demX3 =="joe biden" 
gen dem = demX
gen rep = repX
gen dr = libcon_5
gen rr = libcon_6
gen order = 3
save "C:\Users\dstone\Dropbox\who_how\scripts\survey\leg3d.dta", replace


append using "C:\Users\dstone\Dropbox\who_how\scripts\survey\leg1d.dta"
append using "C:\Users\dstone\Dropbox\who_how\scripts\survey\leg2d.dta"

gen Dem = (pid3=="Democrat")

gen orderDem = order*Dem

gen extreme = -dr

egen rud = group(un)

xtset rud

xi: reg extreme Dem order orderDem, robust
xi: xtreg extreme Dem order orderDem, re


xi: reg extreme Dem order orderDem i.dem, robust
xi: xtreg extreme Dem order orderDem i.dem, re


xi: reg extreme Dem order orderDem i.dem i.educ, robust
xi: xtreg extreme Dem order orderDem i.dem i.educ, re

xi: reg extreme Dem order orderDem i.dem i.educ i.ideo, robust
xi: xtreg extreme Dem order orderDem i.dem i.educ i.ideo, re






****


use "C:\Users\dstone\Dropbox\who_how\scripts\survey\standardnames.dta", clear
keep libcon_1 libcon_2 repX1 demX1 pid3 uni educ ideo state  age
keep if repX1=="george w bush" | repX1=="dick cheney" 
gen dem = demX1
gen rep = repX1
gen dr = libcon_1
gen rr = libcon_2
gen order = 1
save "C:\Users\dstone\Dropbox\who_how\scripts\survey\leg1.dta", replace


use "C:\Users\dstone\Dropbox\who_how\scripts\survey\standardnames.dta", clear
keep libcon_3 libcon_4 repX2 demX2 pid3 uni educ ideo state  age
keep if repX2=="george w bush" | repX2=="dick cheney" 
gen dem = demX
gen rep = repX
gen dr = libcon_3
gen rr = libcon_4
gen order = 2
save "C:\Users\dstone\Dropbox\who_how\scripts\survey\leg2.dta", replace


use "C:\Users\dstone\Dropbox\who_how\scripts\survey\standardnames.dta", clear
keep libcon_5 libcon_6 repX3 demX3 pid3 uni educ ideo state  age
keep if repX3=="george w bush" | repX3=="dick cheney" 
gen dem = demX
gen rep = repX
gen dr = libcon_5
gen rr = libcon_6
gen order = 3
save "C:\Users\dstone\Dropbox\who_how\scripts\survey\leg3.dta", replace


append using "C:\Users\dstone\Dropbox\who_how\scripts\survey\leg1.dta"
append using "C:\Users\dstone\Dropbox\who_how\scripts\survey\leg2.dta"

gen Dem = (pid3=="Democrat")

gen orderDem = order*Dem

gen extreme = rr


egen rud = group(un)

xtset rud

xi: reg extreme Dem order orderDem, robust
xi: xtreg extreme Dem order orderDem, re


xi: reg extreme Dem order orderDem i.rep, robust
xi: xtreg extreme Dem order orderDem i.rep, re

xi: reg extreme Dem order orderDem i.rep i.educ, robust
xi: xtreg extreme Dem order orderDem i.rep i.educ, re

xi: reg extreme Dem order orderDem i.dem i.educ i.ideo, robust
xi: xtreg extreme Dem order orderDem i.dem i.educ i.ideo, re
