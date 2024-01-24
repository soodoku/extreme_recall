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

gen Male=(gender=="Male")


gen	 Age18_29 = (age=="18-29")
gen Age30_49 = (age=="30-49")

gen White = (race=="White/Caucasian")
	
gen College_grad = 1 if educ=="Advanced degree" | educ=="Bachelor's degree"
replace Coll = 0 if Coll==.

gen Democrat = (pid3=="Democrat")						
gen Republican = (pid3=="Republican")						
						
gen agenum = 23.5 if age=="18-29"
replace agen = 39.5 if age=="30-49"
replace agen = 60 if agen==.


/*


                         name |      Freq.     Percent        Cum.
------------------------------+-----------------------------------
                      al gore |         11        0.64        0.64
                 barack obama |        321       18.61       19.25
                 bill clinton |        137        7.94       27.19
               chris christie |         46        2.67       29.86
             elizabeth warren |         12        0.70       30.55
                  eric cantor |         18        1.04       31.59
                  george bush |         17        0.99       32.58
                george w bush |        167        9.68       42.26
                   harry reid |         84        4.87       47.13
              hillary clinton |        102        5.91       53.04
                 jimmy carter |         21        1.22       54.26
                    joe biden |         79        4.58       58.84
                 john boehner |        143        8.29       67.13
                   john kerry |         16        0.93       68.06
                  john mccain |         70        4.06       72.12
                 jon huntsman |          6        0.35       72.46
               kevin mccarthy |          5        0.29       72.75
                  marco rubio |         13        0.75       73.51
                   max baucus |          4        0.23       73.74
             michele bachmann |          8        0.46       74.20
              mitch mcconnell |         37        2.14       76.35
                  mitt romney |         89        5.16       81.51
                 nancy pelosi |        113        6.55       88.06
                newt gingrich |          7        0.41       88.46
                    paul ryan |         13        0.75       89.22
                    rand paul |         18        1.04       90.26
                   rick perry |          3        0.17       90.43
                ronald reagan |         85        4.93       95.36
                  sarah palin |         47        2.72       98.09
                     ted cruz |         33        1.91      100.00
------------------------------+-----------------------------------
                        Total |      1,725      100.00

		
		
*/

gen exec=0
gen gov=0
gen leg=0
*exec = 1 if party nominee for pres or VP


replace exec = 1 if name=="al gore"
replace exec = 1 if name=="barack obama"
replace exec = 1 if name=="bill clinton"
replace gov = 1 if name=="chris christie"
replace leg = 1 if name=="elizabeth warren"
replace leg = 1 if name=="eric cantor"
replace exec = 1 if name=="george bush"
replace exec = 1 if name=="george w bush"
replace leg = 1 if name=="harry reid"
replace exec = 1 if name=="hillary clinton"
replace exec = 1 if name=="jimmy carter"
replace exec = 1 if name=="joe biden"
replace leg = 1 if name=="john boehner"
replace exec = 1 if name=="john kerry"
replace exec = 1 if name=="john mccain"
replace gov = 1 if name=="jon huntsman"
replace leg = 1 if name=="kevin mccarthy"
replace leg = 1 if name=="marco rubio"
replace leg = 1 if name=="max baucus"
replace leg = 1 if name=="michele bachmann"
replace leg = 1 if name=="mitch mcconnell"
replace exec = 1 if name=="mitt romney"
replace leg = 1 if name=="nancy pelosi"
replace leg = 1 if name=="newt gingrich"
replace exec = 1 if name=="paul ryan"
replace leg = 1 if name=="rand paul"
replace gov = 1 if name=="rick perry"
replace exec = 1 if name=="ronald reagan"
replace exec = 1 if name=="sarah palin"
replace leg = 1 if name=="ted cruz"

gen legleader = 0
replace legl = 1 if name=="john boehner"
replace legl = 1 if name=="mitch mcconnell"
replace legl = 1 if name=="nancy pelosi"
replace legl = 1 if name=="harry reid"


save "C:\Users\dstone\Dropbox\who_how\data\survey_data\cleansurvey.dta", replace
export delimited using "C:\Users\dstone\Dropbox\who_how\data\survey_data\cleansurvey", replace						


