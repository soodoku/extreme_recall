*see 'survey_data.txt' for explanation


cd "C:\Users\dstone\Dropbox\who_how\scripts\survey\"

use "C:\Users\dstone\Dropbox\who_how\scripts\survey\clean_names.dta", clear
gen name = demX1
gen recall_party = "dem"
gen recall_order = 1
gen recall_rating = libcon_1
save "C:\Users\dstone\Dropbox\who_how\scripts\survey\auxil\d1.dta", replace

use "C:\Users\dstone\Dropbox\who_how\scripts\survey\clean_names.dta", clear
gen name = demX2
gen recall_party = "dem"
gen recall_order = 2
gen recall_rating = libcon_3

save "C:\Users\dstone\Dropbox\who_how\scripts\survey\auxil\d2.dta", replace

use "C:\Users\dstone\Dropbox\who_how\scripts\survey\clean_names.dta", clear
gen name = demX3
gen recall_party = "dem"
gen recall_order = 3
gen recall_rating = libcon_5

save "C:\Users\dstone\Dropbox\who_how\scripts\survey\auxil\d3.dta", replace




use "C:\Users\dstone\Dropbox\who_how\scripts\survey\clean_names.dta", clear
gen name = repX1
gen recall_party = "rep"
gen recall_order = 1
gen recall_rating = libcon_2

save "C:\Users\dstone\Dropbox\who_how\scripts\survey\auxil\r1.dta", replace

use "C:\Users\dstone\Dropbox\who_how\scripts\survey\clean_names.dta", clear
gen name = repX2
gen recall_party = "rep"
gen recall_order = 2
gen recall_rating = libcon_4

save "C:\Users\dstone\Dropbox\who_how\scripts\survey\auxil\r2.dta", replace

use "C:\Users\dstone\Dropbox\who_how\scripts\survey\clean_names.dta", clear
gen name = repX3
gen recall_party = "rep"
gen recall_order = 3
gen recall_rating = libcon_6

save "C:\Users\dstone\Dropbox\who_how\scripts\survey\auxil\r3.dta", replace



append using "C:\Users\dstone\Dropbox\who_how\scripts\survey\auxil\r2.dta"
append using "C:\Users\dstone\Dropbox\who_how\scripts\survey\auxil\r1.dta"

append using "C:\Users\dstone\Dropbox\who_how\scripts\survey\auxil\d3.dta"
append using "C:\Users\dstone\Dropbox\who_how\scripts\survey\auxil\d2.dta"
append using "C:\Users\dstone\Dropbox\who_how\scripts\survey\auxil\d1.dta"


sort name

merge m:m name using "C:\Users\dstone\Dropbox\who_how\scripts\survey\names_scores.dta"
*note: some names repeated in 'names_scores' but neary all not in survey names and/or scores are very similar for different rows (in 'names_scores')
*names from survey not merged: 
/*

. tab name if _m==1

                         name |      Freq.     Percent        Cum.
------------------------------+-----------------------------------
                  dick cheney |         14       24.14       24.14
                          jfk |         14       24.14       48.28
                      lincoln |         12       20.69       68.97
                        nixon |         18       31.03      100.00
------------------------------+-----------------------------------
                        Total |         58      100.00


						*/

keep if _m==3
keep uniqid dem_ex_1 dem_ex_2 dem_ex_3 rep_ex_1 rep_ex_2 rep_ex_3 gender state age educ race hispanic pship pship_text dem_branch rep_branch ind_branch demlead4 replead4 libcon* media* pid* ideo name recall* cf* dw*

save "C:\Users\dstone\Dropbox\who_how\scripts\survey\cleansurvey.dta", replace
export delimited using "cleansurvey", replace						


gen male=(gender=="Male")


gen	 young = (age=="18-29")
gen middle_age = (age=="30-49")

gen white = (race=="White/Caucasian")
	
gen college_plus = 1 if educ=="Advanced degree" | educ=="Bachelor's degree"
replace coll = 0 if coll==.

gen Democrat = (pid3=="Democrat")						
gen Republican = (pid3=="Republican")						
						
gen agenum = 23.5 if age=="18-29"
replace agen = 39.5 if age=="30-49"
replace agen = 60 if agen==.
