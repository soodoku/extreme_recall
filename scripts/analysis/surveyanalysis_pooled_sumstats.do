cd "C:\Users\dstone\Dropbox\who_how\scripts\survey\"

cap log close
log using all_sumstats.log, replace


use "C:\Users\dstone\Dropbox\who_how\data\survey\cleansurvey.dta", clear



ren recall_order order

gen outParty = 0
replace outP = 1 if Dem==1 & recall_par=="rep"
replace outP = 1 if Dem==0 & recall_par=="dem"

gen orderOut = order*out

gen extreme = -recall_rating if recall_par=="dem"
replace extreme = recall_rat if recall_par=="rep"

gen extreme2 = cfscore
replace extreme2 = -cfscore if recall_par=="dem"

gen extreme2b = cfscoresdyn
replace extreme2b = - cfscoresdyn if recall_par=="dem"


gen Rpol = (recall_par=="rep")

pca extreme2* 
predict extpca

tab age

tab gend

tab race

tab educ

tab pid3


log close
