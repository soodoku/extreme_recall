
*see 'survey_data.txt' for explanation

import delimited C:\Users\dstone\Dropbox\who_how\data\survey_data\PartyExemplarsRecode.csv, clear 

bysort dem_ex_1: egen ctd1 = count(v1)
bysort dem_ex_2: egen ctd2 = count(v1)
bysort dem_ex_3: egen ctd3 = count(v1)

/*

. tab dem_ex_1 if ctd1>=3

              dem_ex_1 |      Freq.     Percent        Cum.
-----------------------+-----------------------------------
         BARRACK OBAMA |          3        1.00        1.00
          Barack Obama |        117       39.13       40.13
           Barak Obama |          8        2.68       42.81
         Barrack Obama |          8        2.68       45.48
          Bill Clinton |         18        6.02       51.51
            Harry Reid |          5        1.67       53.18
        Hilary Clinton |          5        1.67       54.85
          Nancy Pelosi |          9        3.01       57.86
                 OBAMA |          3        1.00       58.86
                 Obama |         61       20.40       79.26
                Pelosi |          4        1.34       80.60
President Barack Obama |          4        1.34       81.94
       President Obama |         11        3.68       85.62
          barack obama |          6        2.01       87.63
          bill clinton |          5        1.67       89.30
               clinton |          4        1.34       90.64
          nancy pelosi |          3        1.00       91.64
                 obama |         25        8.36      100.00
-----------------------+-----------------------------------
                 Total |        299      100.00

				 
				 obama, bill, reid, hillary, pelosi
				 
				 
 tab dem_ex_2 if ctd2>=3

                dem_ex_2 |      Freq.     Percent        Cum.
-------------------------+-----------------------------------
            Barack Obama |         17        6.54        6.54
                   Biden |          5        1.92        8.46
            Bill Clinton |         40       15.38       23.85
                 Clinton |         15        5.77       29.62
        Elizabeth Warren |          3        1.15       30.77
              Harry Reid |         23        8.85       39.62
          Hilary Clinton |         13        5.00       44.62
         Hillary Clinton |         26       10.00       54.62
            Jimmy Carter |          4        1.54       56.15
               Joe Biden |         30       11.54       67.69
                 Kennedy |          3        1.15       68.85
              Max Baucus |          4        1.54       70.38
            Nancy Pelosi |         30       11.54       81.92
                   Obama |          5        1.92       83.85
                  Pelosi |         10        3.85       87.69
                 al gore |          3        1.15       88.85
                   biden |          5        1.92       90.77
            bill clinton |          3        1.15       91.92
                 clinton |          5        1.92       93.85
            jimmy carter |          3        1.15       95.00
               joe biden |          3        1.15       96.15
            john kennedy |          3        1.15       97.31
            nancy pelosi |          3        1.15       98.46
                   obama |          4        1.54      100.00
-------------------------+-----------------------------------
                   Total |        260      100.00

				   
				  new names: biden, warren, carter, baucus, gore, jfk




. tab dem_ex_3 if ctd3>=3

              dem_ex_3 |      Freq.     Percent        Cum.
-----------------------+-----------------------------------
               Al Gore |          5        2.16        2.16
          Barack Obama |          8        3.45        5.60
                 Biden |          7        3.02        8.62
          Bill Clinton |         21        9.05       17.67
               Clinton |         12        5.17       22.84
      Elizabeth Warren |          7        3.02       25.86
            Harry Reid |         31       13.36       39.22
        Hilary Clinton |         15        6.47       45.69
       Hillary Clinton |         21        9.05       54.74
          Jimmy Carter |          5        2.16       56.90
             Joe Biden |         17        7.33       64.22
        John F Kennedy |          3        1.29       65.52
       John F. Kennedy |          4        1.72       67.24
            John Kerry |          7        3.02       70.26
          Nancy Pelosi |         37       15.95       86.21
                 Obama |          5        2.16       88.36
                Pelosi |          3        1.29       89.66
                  Reid |          5        2.16       91.81
          bill clinton |          3        1.29       93.10
               clinton |          6        2.59       95.69
       hillary clinton |          4        1.72       97.41
                 obama |          3        1.29       98.71
                pelosi |          3        1.29      100.00
-----------------------+-----------------------------------
                 Total |        232      100.00

				 
			new names:	 kerry
				 
*/


replace dem_ex_1 = lower(dem_ex_1)

split dem_ex_1, p(" ")


gen demX1 = ""
replace demX1 = "barack obama" if dem_ex_11=="obama"
replace demX1 = "barack obama" if dem_ex_12=="obama"
replace demX1 = "barack obama" if dem_ex_13=="obama"
replace demX1 = "barack obama" if dem_ex_11=="oboma"
replace demX1 = "barack obama" if dem_ex_12=="oboma"
replace demX1 = "barack obama" if dem_ex_13=="oboma"

replace demX1 = "hillary clinton" if dem_ex_1=="hillary clinton"
replace demX1 = "hillary clinton" if dem_ex_1=="hillary clinton"
replace demX1 = "hillary clinton" if dem_ex_1=="hilary clinton"
replace demX1 = "hillary clinton" if substr(dem_ex_11,1,1)=="h" & dem_ex_12=="clinton"
replace demX1 = "hillary clinton" if substr(dem_ex_11,1,1)=="h" & substr(dem_ex_12,1,2)=="cl"


replace demX1 = "bill clinton" if dem_ex_1=="bill clinton"
replace demX1 = "bill clinton" if dem_ex_1=="clinton"
*questionable

replace demX1 = "nancy pelosi" if dem_ex_1 == "nancy pelosi"
replace demX1 = "nancy pelosi" if dem_ex_11=="pelosi"
replace demX1 = "nancy pelosi" if dem_ex_12=="pelosi"
replace demX1 = "nancy pelosi" if dem_ex_13=="pelosi"

replace demX1 = "harry reid" if dem_ex_11 == "reid"
replace demX1 = "harry reid" if dem_ex_12 == "reid"
replace demX1 = "harry reid" if dem_ex_13 == "reid"
replace demX1 = "harry reid" if dem_ex_11 == "reed"
replace demX1 = "harry reid" if dem_ex_12 == "reed"
replace demX1 = "harry reid" if dem_ex_13 == "reed"

replace demX1 = "jfk" if dem_ex_1 == "jfk"
replace demX1 = "jfk" if dem_ex_1 == "john f. kennedy"
replace demX1 = "jfk" if dem_ex_1 == "john kennedy"


replace demX1 = "max baucus" if dem_ex_11=="baucus"
replace demX1 = "max baucus" if dem_ex_12=="baucus"
replace demX1 = "max baucus" if dem_ex_13=="baucus"

replace demX1 = "joe biden" if dem_ex_11=="biden"
replace demX1 = "joe biden" if dem_ex_12=="biden"
replace demX1 = "joe biden" if dem_ex_13=="biden"

replace demX1 = "al gore" if dem_ex_11=="gore"
replace demX1 = "al gore" if dem_ex_12=="gore"
replace demX1 = "al gore" if dem_ex_13=="gore"

replace demX1 = "jimmy carter" if dem_ex_11=="carter"
replace demX1 = "jimmy carter" if dem_ex_12=="carter"
replace demX1 = "jimmy carter" if dem_ex_13=="carter"



replace dem_ex_2 = lower(dem_ex_2)

split dem_ex_2, p(" ")


gen demX2 = ""
replace demX2 = "barack obama" if dem_ex_21=="obama"
replace demX2 = "barack obama" if dem_ex_22=="obama"
replace demX2 = "barack obama" if dem_ex_23=="obama"
replace demX2 = "barack obama" if dem_ex_21=="oboma"
replace demX2 = "barack obama" if dem_ex_22=="oboma"
replace demX2 = "barack obama" if dem_ex_23=="oboma"

replace demX2 = "hillary clinton" if dem_ex_2=="hillary clinton"
replace demX2 = "hillary clinton" if dem_ex_2=="hillary clinton"
replace demX2 = "hillary clinton" if dem_ex_2=="hilary clinton"
replace demX2 = "hillary clinton" if substr(dem_ex_21,1,1)=="h" & dem_ex_22=="clinton"
replace demX2 = "hillary clinton" if substr(dem_ex_21,1,1)=="h" & substr(dem_ex_22,1,2)=="cl"


replace demX2 = "bill clinton" if dem_ex_2=="bill clinton"
replace demX2 = "bill clinton" if dem_ex_2=="clinton"
*questionable

replace demX2 = "nancy pelosi" if dem_ex_2 == "nancy pelosi"
replace demX2 = "nancy pelosi" if dem_ex_21=="pelosi"
replace demX2 = "nancy pelosi" if dem_ex_22=="pelosi"
replace demX2 = "nancy pelosi" if dem_ex_23=="pelosi"

replace demX2 = "harry reid" if dem_ex_21 == "reid"
replace demX2 = "harry reid" if dem_ex_22 == "reid"
replace demX2 = "harry reid" if dem_ex_23 == "reid"
replace demX2 = "harry reid" if dem_ex_21 == "reed"
replace demX2 = "harry reid" if dem_ex_22 == "reed"
replace demX2 = "harry reid" if dem_ex_23 == "reed"

replace demX2 = "jfk" if dem_ex_2 == "jfk"
replace demX2 = "jfk" if dem_ex_2 == "john f. kennedy"
replace demX2 = "jfk" if dem_ex_2 == "john kennedy"


replace demX2 = "joe biden" if dem_ex_21=="biden"
replace demX2 = "joe biden" if dem_ex_22=="biden"
replace demX2 = "joe biden" if dem_ex_23=="biden"

replace demX2 = "al gore" if dem_ex_21=="gore"
replace demX2 = "al gore" if dem_ex_22=="gore"
replace demX2 = "al gore" if dem_ex_23=="gore"

replace demX2 = "jimmy carter" if dem_ex_21=="carter"
replace demX2 = "jimmy carter" if dem_ex_22=="carter"
replace demX2 = "jimmy carter" if dem_ex_23=="carter"

replace demX2 = "john kerry" if dem_ex_21=="kerry"
replace demX2 = "john kerry" if dem_ex_22=="kerry"
replace demX2 = "john kerry" if dem_ex_23=="kerry"

replace demX2 = "elizabeth warren" if dem_ex_21=="warren"
replace demX2 = "elizabeth warren" if dem_ex_22=="warren"
replace demX2 = "elizabeth warren" if dem_ex_23=="warren"

replace demX2 = "max baucus" if dem_ex_21=="baucus"
replace demX2 = "max baucus" if dem_ex_22=="baucus"
replace demX2 = "max baucus" if dem_ex_23=="baucus"



replace dem_ex_3 = lower(dem_ex_3)

split dem_ex_3, p(" ")


gen demX3 = ""
replace demX3 = "barack obama" if dem_ex_31=="obama"
replace demX3 = "barack obama" if dem_ex_32=="obama"
replace demX3 = "barack obama" if dem_ex_33=="obama"
replace demX3 = "barack obama" if dem_ex_31=="oboma"
replace demX3 = "barack obama" if dem_ex_32=="oboma"
replace demX3 = "barack obama" if dem_ex_33=="oboma"

replace demX3 = "hillary clinton" if dem_ex_3=="hillary clinton"
replace demX3 = "hillary clinton" if dem_ex_3=="hillary clinton"
replace demX3 = "hillary clinton" if dem_ex_3=="hilary clinton"
replace demX3 = "hillary clinton" if substr(dem_ex_31,1,1)=="h" & dem_ex_32=="clinton"
replace demX3 = "hillary clinton" if substr(dem_ex_31,1,1)=="h" & substr(dem_ex_32,1,2)=="cl"


replace demX3 = "bill clinton" if dem_ex_3=="bill clinton"
replace demX3 = "bill clinton" if dem_ex_3=="clinton"
*questionable

replace demX3 = "nancy pelosi" if dem_ex_3 == "nancy pelosi"
replace demX3 = "nancy pelosi" if dem_ex_31=="pelosi"
replace demX3 = "nancy pelosi" if dem_ex_32=="pelosi"
replace demX3 = "nancy pelosi" if dem_ex_33=="pelosi"

replace demX3 = "harry reid" if dem_ex_31 == "reid"
replace demX3 = "harry reid" if dem_ex_32 == "reid"
replace demX3 = "harry reid" if dem_ex_33 == "reid"
replace demX3 = "harry reid" if dem_ex_31 == "reed"
replace demX3 = "harry reid" if dem_ex_32 == "reed"
replace demX3 = "harry reid" if dem_ex_33 == "reed"

replace demX3 = "jfk" if dem_ex_3 == "jfk"
replace demX3 = "jfk" if dem_ex_3 == "john f. kennedy"
replace demX3 = "jfk" if dem_ex_3 == "john kennedy"



replace demX3 = "joe biden" if dem_ex_31=="biden"
replace demX3 = "joe biden" if dem_ex_32=="biden"
replace demX3 = "joe biden" if dem_ex_33=="biden"

replace demX3 = "al gore" if dem_ex_31=="gore"
replace demX3 = "al gore" if dem_ex_32=="gore"
replace demX3 = "al gore" if dem_ex_33=="gore"

replace demX3 = "jimmy carter" if dem_ex_31=="carter"
replace demX3 = "jimmy carter" if dem_ex_32=="carter"
replace demX3 = "jimmy carter" if dem_ex_33=="carter"

replace demX3 = "john kerry" if dem_ex_31=="kerry"
replace demX3 = "john kerry" if dem_ex_32=="kerry"
replace demX3 = "john kerry" if dem_ex_33=="kerry"


replace demX3 = "elizabeth warren" if dem_ex_31=="warren"
replace demX3 = "elizabeth warren" if dem_ex_32=="warren"
replace demX3 = "elizabeth warren" if dem_ex_33=="warren"

replace demX3 = "max baucus" if dem_ex_31=="baucus"
replace demX3 = "max baucus" if dem_ex_32=="baucus"
replace demX3 = "max baucus" if dem_ex_33=="baucus"

**reps

bysort rep_ex_1: egen ctr1 = count(v1)
bysort rep_ex_2: egen ctr2 = count(v1)
bysort rep_ex_3: egen ctr3 = count(v1)

/*

. tab rep_ex_1 if ctr1>=3

                       rep_ex_1 |      Freq.     Percent        Cum.
--------------------------------+-----------------------------------
                    Abe Lincoln |          3        1.24        1.24
                Abraham Lincoln |          3        1.24        2.48
                        Boehner |         13        5.37        7.85
                           Bush |         10        4.13       11.98
                 Chris Christie |          5        2.07       14.05
                    Eric Cantor |          3        1.24       15.29
                    GEORGE BUSH |          3        1.24       16.53
                    George Bush |         26       10.74       27.27
                  George W Bush |          7        2.89       30.17
                 George W. Bush |         16        6.61       36.78
                   John Boehner |         44       18.18       54.96
                    John Boener |          3        1.24       56.20
                    John Bohner |          3        1.24       57.44
                    John McCain |          5        2.07       59.50
                    John Mccain |          3        1.24       60.74
                Mitch McConnell |          3        1.24       61.98
                    Mitt Romney |         23        9.50       71.49
                      Rand Paul |          3        1.24       72.73
                         Reagan |          6        2.48       75.21
                         Romney |          3        1.24       76.45
                  Ronald Reagan |         12        4.96       81.40
                    Sarah Palin |          4        1.65       83.06
                       Ted Cruz |         10        4.13       87.19
                        boehner |          5        2.07       89.26
                    george bush |          7        2.89       92.15
                  george w bush |          3        1.24       93.39
                   john boehner |          5        2.07       95.45
                    mitt romney |          5        2.07       97.52
                         reagan |          3        1.24       98.76
                         romney |          3        1.24      100.00
--------------------------------+-----------------------------------
                          Total |        242      100.00

. 

lincoln, boehner, bush, christie, cantor, w bush, mccain, mcconnell, romney, rand paul, reagan, palin, cruz

 tab rep_ex_2 if ctr2>=3

                  rep_ex_2 |      Freq.     Percent        Cum.
---------------------------+-----------------------------------
                      Bush |          5        2.44        2.44
            Chris Christie |          9        4.39        6.83
                  Christie |          3        1.46        8.29
               Dick Cheney |          4        1.95       10.24
               Eric Cantor |          7        3.41       13.66
               George Bush |         16        7.80       21.46
             George W Bush |          4        1.95       23.41
            George W. Bush |          9        4.39       27.80
              John Boehner |         23       11.22       39.02
               John McCain |         13        6.34       45.37
              Jon Huntsman |          6        2.93       48.29
               Marco Rubio |          4        1.95       50.24
                    McCain |          4        1.95       52.20
            Mitch McConnel |          3        1.46       53.66
           Mitch McConnell |         11        5.37       59.02
               Mitt Romney |         15        7.32       66.34
                     Palin |          4        1.95       68.29
                 Paul Ryan |          6        2.93       71.22
                 Rand Paul |          4        1.95       73.17
                    Romney |          9        4.39       77.56
             Ronald Reagan |         11        5.37       82.93
              Ronald Regan |          5        2.44       85.37
               Sarah Palin |          9        4.39       89.76
                  Ted Cruz |          6        2.93       92.68
            chris christie |          4        1.95       94.63
               george bush |          4        1.95       96.59
                    reagan |          3        1.46       98.05
             ronald reagan |          4        1.95      100.00
---------------------------+-----------------------------------
                     Total |        205      100.00

. 

new names: cheney, huntsman, rubio, paul ryan

tab rep_ex_3 if ctr3>=3

                   rep_ex_3 |      Freq.     Percent        Cum.
----------------------------+-----------------------------------
            Abraham Lincoln |          3        1.51        1.51
                    Boehner |          3        1.51        3.02
                       Bush |          7        3.52        6.53
             Chris Christie |         12        6.03       12.56
                Dick Cheney |          3        1.51       14.07
                Eric Cantor |          4        2.01       16.08
                George Bush |          3        1.51       17.59
              George W Bush |          3        1.51       19.10
             George W. Bush |          7        3.52       22.61
               John Boehner |          8        4.02       26.63
                John McCain |         24       12.06       38.69
                John Mccain |          3        1.51       40.20
             Kevin McCarthy |          3        1.51       41.71
                Marco Rubio |          5        2.51       44.22
                     McCain |          4        2.01       46.23
            Mitch McConnell |          6        3.02       49.25
                Mitt Romney |         18        9.05       58.29
              Newt Gingrich |          5        2.51       60.80
                      Palin |          5        2.51       63.32
                  Paul Ryan |          7        3.52       66.83
                  Rand Paul |          6        3.02       69.85
                     Reagan |          5        2.51       72.36
              Richard Nixon |          4        2.01       74.37
                 Rick Perry |          3        1.51       75.88
              Ronald Reagan |         14        7.04       82.91
                Sarah Palin |         12        6.03       88.94
                   Ted Cruz |          9        4.52       93.47
                       bush |          3        1.51       94.97
                      nixon |          3        1.51       96.48
                     romney |          4        2.01       98.49
                sarah palin |          3        1.51      100.00
----------------------------+-----------------------------------
                      Total |        199      100.00

. 
new names: mccarthy, gingrich, perry, nixon
*/

replace rep_ex_1 = lower(rep_ex_1)

split rep_ex_1, p(" ")


gen repX1 = ""
replace repX1 = "john boehner" if substr(rep_ex_11,1,3)=="boe"|substr(rep_ex_11,1,3)=="boh"
replace repX1 = "john boehner" if substr(rep_ex_12,1,3)=="boe"|substr(rep_ex_12,1,3)=="boh"
replace repX1 = "john boehner" if substr(rep_ex_13,1,3)=="boe"|substr(rep_ex_13,1,3)=="boh"

replace repX1 = "ronald reagan" if substr(rep_ex_11,1,3)=="rea" | substr(rep_ex_11,1,3)=="reg"
replace repX1 = "ronald reagan" if substr(rep_ex_12,1,3)=="rea" | substr(rep_ex_12,1,3)=="reg"
replace repX1 = "ronald reagan" if substr(rep_ex_13,1,3)=="rea"

replace repX1 = "sarah palin" if substr(rep_ex_11,1,6)=="palin"
replace repX1 = "sarah palin" if substr(rep_ex_12,1,6)=="palin"
replace repX1 = "sarah palin" if substr(rep_ex_13,1,6)=="palin"

replace repX1 = "mitt romney" if substr(rep_ex_11,1,4)=="romn"
replace repX1 = "mitt romney" if substr(rep_ex_12,1,4)=="romn"
replace repX1 = "mitt romney" if substr(rep_ex_13,1,4)=="romn"

replace repX1 = "chris christie" if substr(rep_ex_11,1,6)=="christ"
replace repX1 = "chris christie" if substr(rep_ex_12,1,6)=="christ"
replace repX1 = "chris christie" if substr(rep_ex_13,1,6)=="christ"

replace repX1 = "mitch mcconnell" if substr(rep_ex_11,1,4)=="mcco"
replace repX1 = "mitch mcconnell" if substr(rep_ex_12,1,4)=="mcco"
replace repX1 = "mitch mcconnell" if substr(rep_ex_13,1,4)=="mcco"


replace repX1 = "lincoln" if rep_ex_11=="lincoln"
replace repX1 = "lincoln" if rep_ex_12=="lincoln"
replace repX1 = "lincoln" if rep_ex_13=="lincoln"

replace repX1 = "john mccain" if rep_ex_11=="mccain"
replace repX1 = "john mccain" if rep_ex_12=="mccain"
replace repX1 = "john mccain" if rep_ex_13=="mccain"


replace repX1 = "george bush" if rep_ex_11=="bush" & substr(rep_ex_12,1,1)=="s"
replace repX1 = "george bush" if rep_ex_12=="bush" & substr(rep_ex_13,1,1)=="s"
replace repX1 = "george bush" if rep_ex_13=="bush" & substr(rep_ex_14,1,1)=="s"
replace repX1 = "george bush" if rep_ex_13=="bush" & substr(rep_ex_15,1,1)=="s"
replace repX1 = "george bush" if rep_ex_12=="bush" & substr(rep_ex_11,1,1)=="h"
replace repX1 = "george bush" if rep_ex_13=="bush" & substr(rep_ex_12,1,1)=="h"
replace repX1 = "george bush" if rep_ex_14=="bush" & substr(rep_ex_13,1,1)=="h"

replace repX1 = "george w bush" if rep_ex_11=="bush" & repX1==""
replace repX1 = "george w bush" if rep_ex_12=="bush" & repX1==""
replace repX1 = "george w bush" if rep_ex_13=="bush" & repX1==""


replace repX1 = "ted cruz" if rep_ex_11=="cruz"
replace repX1 = "ted cruz" if rep_ex_12=="cruz"
replace repX1 = "ted cruz" if rep_ex_13=="cruz"

replace repX1 = "eric cantor" if rep_ex_11=="cantor"
replace repX1 = "eric cantor" if rep_ex_12=="cantor"
replace repX1 = "eric cantor" if rep_ex_13=="cantor"

replace repX1 = "dick cheney" if rep_ex_11=="cheney"
replace repX1 = "dick cheney" if rep_ex_12=="cheney"
replace repX1 = "dick cheney" if rep_ex_13=="cheney"

replace repX1 = "rand paul" if rep_ex_1=="rand paul"

replace repX1 = "nixon" if rep_ex_11=="nixon"
replace repX1 = "nixon" if rep_ex_12=="nixon"
replace repX1 = "nixon" if rep_ex_13=="nixon"


replace repX1 = "jon huntsman" if rep_ex_11=="huntsman"
replace repX1 = "jon huntsman" if rep_ex_12=="huntsman"
replace repX1 = "jon huntsman" if rep_ex_13=="huntsman"

replace repX1 = "kevin mccarthy" if rep_ex_11=="mccarthy"
replace repX1 = "kevin mccarthy" if rep_ex_12=="mccarthy"
replace repX1 = "kevin mccarthy" if rep_ex_13=="mccarthy"


replace repX1 = "rick perry" if rep_ex_11=="perry"
replace repX1 = "rick perry" if rep_ex_12=="perry"
replace repX1 = "rick perry" if rep_ex_13=="perry"


replace rep_ex_2 = lower(rep_ex_2)

split rep_ex_2, p(" ")


gen repX2 = ""
replace repX2 = "john boehner" if substr(rep_ex_21,1,3)=="boe"|substr(rep_ex_21,1,3)=="boh"
replace repX2 = "john boehner" if substr(rep_ex_22,1,3)=="boe"|substr(rep_ex_22,1,3)=="boh"
replace repX2 = "john boehner" if substr(rep_ex_23,1,3)=="boe"|substr(rep_ex_23,1,3)=="boh"
replace repX2 = "john boehner" if substr(rep_ex_21,1,3)=="bae"|substr(rep_ex_21,1,3)=="ban"
replace repX2 = "john boehner" if substr(rep_ex_22,1,3)=="bae"|substr(rep_ex_22,1,3)=="ban"
replace repX2 = "john boehner" if substr(rep_ex_23,1,3)=="bae"|substr(rep_ex_23,1,3)=="ban"

replace repX2 = "ronald reagan" if substr(rep_ex_21,1,3)=="rea" | substr(rep_ex_21,1,3)=="reg"
replace repX2 = "ronald reagan" if substr(rep_ex_22,1,3)=="rea" | substr(rep_ex_22,1,3)=="reg"
replace repX2 = "ronald reagan" if substr(rep_ex_23,1,3)=="rea"

replace repX2 = "sarah palin" if substr(rep_ex_21,1,6)=="palin"
replace repX2 = "sarah palin" if substr(rep_ex_22,1,6)=="palin"
replace repX2 = "sarah palin" if substr(rep_ex_23,1,6)=="palin"

replace repX2 = "mitt romney" if substr(rep_ex_21,1,4)=="romn"
replace repX2 = "mitt romney" if substr(rep_ex_22,1,4)=="romn"
replace repX2 = "mitt romney" if substr(rep_ex_23,1,4)=="romn"

replace repX2 = "chris christie" if substr(rep_ex_21,1,6)=="christ"
replace repX2 = "chris christie" if substr(rep_ex_22,1,6)=="christ"
replace repX2 = "chris christie" if substr(rep_ex_23,1,6)=="christ"

replace repX2 = "mitch mcconnell" if substr(rep_ex_21,1,4)=="mcco"
replace repX2 = "mitch mcconnell" if substr(rep_ex_22,1,4)=="mcco"
replace repX2 = "mitch mcconnell" if substr(rep_ex_23,1,4)=="mcco"


replace repX2 = "lincoln" if rep_ex_21=="lincoln"
replace repX2 = "lincoln" if rep_ex_22=="lincoln"
replace repX2 = "lincoln" if rep_ex_23=="lincoln"

replace repX2 = "john mccain" if rep_ex_21=="mccain"
replace repX2 = "john mccain" if rep_ex_22=="mccain"
replace repX2 = "john mccain" if rep_ex_23=="mccain"


replace repX2 = "george bush" if rep_ex_21=="bush" & substr(rep_ex_22,1,1)=="s"
replace repX2 = "george bush" if rep_ex_22=="bush" & substr(rep_ex_23,1,1)=="s"
replace repX2 = "george bush" if rep_ex_23=="bush" & substr(rep_ex_24,1,1)=="s"
*replace repX2 = "george bush" if rep_ex_23=="bush" & substr(rep_ex_25,1,1)=="s"
*no 5th word
replace repX2 = "george bush" if rep_ex_22=="bush" & substr(rep_ex_21,1,1)=="h"
replace repX2 = "george bush" if rep_ex_23=="bush" & substr(rep_ex_22,1,1)=="h"
replace repX2 = "george bush" if rep_ex_24=="bush" & substr(rep_ex_23,1,1)=="h"

replace repX2 = "george w bush" if rep_ex_21=="bush" & repX2==""
replace repX2 = "george w bush" if rep_ex_22=="bush" & repX2==""
replace repX2 = "george w bush" if rep_ex_23=="bush" & repX2==""


replace repX2 = "ted cruz" if rep_ex_21=="cruz"
replace repX2 = "ted cruz" if rep_ex_22=="cruz"
replace repX2 = "ted cruz" if rep_ex_23=="cruz"

replace repX2 = "eric cantor" if rep_ex_21=="cantor"
replace repX2 = "eric cantor" if rep_ex_22=="cantor"
replace repX2 = "eric cantor" if rep_ex_23=="cantor"

replace repX2 = "dick cheney" if rep_ex_21=="cheney"
replace repX2 = "dick cheney" if rep_ex_22=="cheney"
replace repX2 = "dick cheney" if rep_ex_23=="cheney"

replace repX2 = "marco rubio" if rep_ex_21=="rubio"
replace repX2 = "marco rubio" if rep_ex_22=="rubio"
replace repX2 = "marco rubio" if rep_ex_23=="rubio"


replace repX2 = "rand paul" if rep_ex_2=="rand paul"

replace repX2 = "michele bachmann" if substr(rep_ex_21,1,4)=="bach"
replace repX2 = "michele bachmann" if substr(rep_ex_22,1,4)=="bach"
replace repX2 = "michele bachmann" if substr(rep_ex_23,1,4)=="bach"

replace repX2 = "paul ryan" if rep_ex_2=="paul ryan"

replace repX2 = "newt gingrich" if substr(rep_ex_21,1,4)=="ging"
replace repX2 = "newt gingrich" if substr(rep_ex_22,1,4)=="ging"
replace repX2 = "newt gingrich" if substr(rep_ex_23,1,4)=="ging"

replace repX2 = "nixon" if rep_ex_21=="nixon"
replace repX2 = "nixon" if rep_ex_22=="nixon"
replace repX2 = "nixon" if rep_ex_23=="nixon"

replace repX2 = "jon huntsman" if rep_ex_21=="huntsman"
replace repX2 = "jon huntsman" if rep_ex_22=="huntsman"
replace repX2 = "jon huntsman" if rep_ex_23=="huntsman"

replace repX2 = "kevin mccarthy" if rep_ex_21=="mccarthy"
replace repX2 = "kevin mccarthy" if rep_ex_22=="mccarthy"
replace repX2 = "kevin mccarthy" if rep_ex_23=="mccarthy"


replace repX2 = "rick perry" if rep_ex_21=="perry"
replace repX2 = "rick perry" if rep_ex_22=="perry"
replace repX2 = "rick perry" if rep_ex_23=="perry"


**

replace rep_ex_3 = lower(rep_ex_3)

split rep_ex_3, p(" ")


gen repX3 = ""
replace repX3 = "john boehner" if substr(rep_ex_31,1,3)=="boe"|substr(rep_ex_31,1,3)=="boh"
replace repX3 = "john boehner" if substr(rep_ex_32,1,3)=="boe"|substr(rep_ex_32,1,3)=="boh"
replace repX3 = "john boehner" if substr(rep_ex_33,1,3)=="boe"|substr(rep_ex_33,1,3)=="boh"
replace repX3 = "john boehner" if substr(rep_ex_31,1,3)=="bae"|substr(rep_ex_31,1,3)=="ban"
replace repX3 = "john boehner" if substr(rep_ex_32,1,3)=="bae"|substr(rep_ex_32,1,3)=="ban"
replace repX3 = "john boehner" if substr(rep_ex_33,1,3)=="bae"|substr(rep_ex_33,1,3)=="ban"

replace repX3 = "ronald reagan" if substr(rep_ex_31,1,3)=="rea" | substr(rep_ex_31,1,3)=="reg"
replace repX3 = "ronald reagan" if substr(rep_ex_32,1,3)=="rea" | substr(rep_ex_32,1,3)=="reg"
replace repX3 = "ronald reagan" if substr(rep_ex_33,1,3)=="rea"

replace repX3 = "sarah palin" if substr(rep_ex_31,1,6)=="palin"
replace repX3 = "sarah palin" if substr(rep_ex_32,1,6)=="palin"
replace repX3 = "sarah palin" if substr(rep_ex_33,1,6)=="palin"

replace repX3 = "mitt romney" if substr(rep_ex_31,1,4)=="romn"
replace repX3 = "mitt romney" if substr(rep_ex_32,1,4)=="romn"
replace repX3 = "mitt romney" if substr(rep_ex_33,1,4)=="romn"

replace repX3 = "chris christie" if substr(rep_ex_31,1,6)=="christ"
replace repX3 = "chris christie" if substr(rep_ex_32,1,6)=="christ"
replace repX3 = "chris christie" if substr(rep_ex_33,1,6)=="christ"

replace repX3 = "mitch mcconnell" if substr(rep_ex_31,1,4)=="mcco"
replace repX3 = "mitch mcconnell" if substr(rep_ex_32,1,4)=="mcco"
replace repX3 = "mitch mcconnell" if substr(rep_ex_33,1,4)=="mcco"

replace repX3 = "michele bachmann" if substr(rep_ex_31,1,4)=="bach"
replace repX3 = "michele bachmann" if substr(rep_ex_32,1,4)=="bach"
replace repX3 = "michele bachmann" if substr(rep_ex_33,1,4)=="bach"

replace repX3 = "newt gingrich" if substr(rep_ex_31,1,4)=="ging"
replace repX3 = "newt gingrich" if substr(rep_ex_32,1,4)=="ging"
replace repX3 = "newt gingrich" if substr(rep_ex_33,1,4)=="ging"


replace repX3 = "lincoln" if rep_ex_31=="lincoln"
replace repX3 = "lincoln" if rep_ex_32=="lincoln"
replace repX3 = "lincoln" if rep_ex_33=="lincoln"

replace repX3 = "john mccain" if rep_ex_31=="mccain"
replace repX3 = "john mccain" if rep_ex_32=="mccain"
replace repX3 = "john mccain" if rep_ex_33=="mccain"


replace repX3 = "george bush" if rep_ex_31=="bush" & substr(rep_ex_32,1,1)=="s"
replace repX3 = "george bush" if rep_ex_32=="bush" & substr(rep_ex_33,1,1)=="s"
replace repX3 = "george bush" if rep_ex_33=="bush" & substr(rep_ex_34,1,1)=="s"
replace repX3 = "george bush" if rep_ex_33=="bush" & substr(rep_ex_35,1,1)=="s"
replace repX3 = "george bush" if rep_ex_32=="bush" & substr(rep_ex_31,1,1)=="h"
replace repX3 = "george bush" if rep_ex_33=="bush" & substr(rep_ex_32,1,1)=="h"
replace repX3 = "george bush" if rep_ex_34=="bush" & substr(rep_ex_33,1,1)=="h"

replace repX3 = "george w bush" if rep_ex_31=="bush" & repX3==""
replace repX3 = "george w bush" if rep_ex_32=="bush" & repX3==""
replace repX3 = "george w bush" if rep_ex_33=="bush" & repX3==""


replace repX3 = "ted cruz" if rep_ex_31=="cruz"
replace repX3 = "ted cruz" if rep_ex_32=="cruz"
replace repX3 = "ted cruz" if rep_ex_33=="cruz"

replace repX3 = "eric cantor" if rep_ex_31=="cantor"
replace repX3 = "eric cantor" if rep_ex_32=="cantor"
replace repX3 = "eric cantor" if rep_ex_33=="cantor"

replace repX3 = "dick cheney" if rep_ex_31=="cheney"
replace repX3 = "dick cheney" if rep_ex_32=="cheney"
replace repX3 = "dick cheney" if rep_ex_33=="cheney"

replace repX3 = "rand paul" if rep_ex_3=="rand paul"

replace repX3 = "paul ryan" if rep_ex_3=="paul ryan"

replace repX3 = "marco rubio" if rep_ex_31=="rubio"
replace repX3 = "marco rubio" if rep_ex_32=="rubio"
replace repX3 = "marco rubio" if rep_ex_33=="rubio"

replace repX3 = "nixon" if rep_ex_31=="nixon"
replace repX3 = "nixon" if rep_ex_32=="nixon"
replace repX3 = "nixon" if rep_ex_33=="nixon"


replace repX3 = "jon huntsman" if rep_ex_31=="huntsman"
replace repX3 = "jon huntsman" if rep_ex_32=="huntsman"
replace repX3 = "jon huntsman" if rep_ex_33=="huntsman"

replace repX3 = "kevin mccarthy" if rep_ex_31=="mccarthy"
replace repX3 = "kevin mccarthy" if rep_ex_32=="mccarthy"
replace repX3 = "kevin mccarthy" if rep_ex_33=="mccarthy"

replace repX3 = "rick perry" if rep_ex_31=="perry"
replace repX3 = "rick perry" if rep_ex_32=="perry"
replace repX3 = "rick perry" if rep_ex_33=="perry"


save "C:\Users\dstone\Dropbox\who_how\scripts\survey\clean_names.dta", replace


