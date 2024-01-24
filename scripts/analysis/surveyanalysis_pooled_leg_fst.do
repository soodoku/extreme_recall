cd "C:\Users\dstone\Dropbox\who_how\scripts\survey\"

cap log close
log using leg_pooled_fst.log, replace


use "C:\Users\dstone\Dropbox\who_how\data\survey_data\cleansurvey.dta", clear


keep if leg==1

ren recall_order order

gen outParty = 0
replace outP = 1 if Dem==1 & recall_par=="rep"
replace outP = 1 if Dem==0 & recall_par=="dem"

gen orderOut = order*out

gen extreme = -recall_rating  if recall_par=="dem"
replace extreme = recall_rat  if recall_par=="rep"

gen extreme2 = cfscore
replace extreme2 = -cfscore  if recall_par=="dem"

gen extreme2b = cfscoresdyn
replace extreme2b = - cfscoresdyn  if recall_par=="dem"


gen Rpol = (recall_par=="rep")

pca extreme2* 
predict extpca

egen id = group(uniqid)

xtset id


gen first = (order==1)
gen firstOut = first*out


xi: qui reg extreme outParty first  Rpol, robust cluster(id)
est store a
xi: qui reg extreme outParty first firstOut  Rpol, robust cluster(id)
est store b

xi: qui reg extreme outParty first  i.name  Rpol, robust cluster(id)
est store c
xi: qui reg extreme outParty first firstOut i.name  Rpol, robust cluster(id)
est store d

xi: qui reg extreme outParty first  i.name i.educ i.age Whi Rpol, robust cluster(id)
est store e
xi: qui reg extreme outParty first firstOut i.name i.educ i.age Whi  Rpol, robust cluster(id)
est store f

xi: qui reg extreme outParty first  i.name i.educ i.ideo i.age Whi  Rpol, robust cluster(id)
est store g
xi: qui reg extreme outParty first firstOut i.name i.educ i.ideo i.age Whi  Rpol, robust cluster(id)
est store h

estout a b c d e f g h, keep ( outParty first firstOut ) style(tex) cells(b(star fmt(3)) se(par)) stats(r2_a N, fmt(%9.3f %9.0g)) starlevels(* 0.10 ** 0.05 *** 0.01)



****

xi: qui reg extreme2 outParty first  Rpol exec leg legl , robust cluster(name)
est sto a
xi: qui reg extreme2 outParty first firstOut  Rpol exec leg legl , robust cluster(name)
est sto b

xi: qui reg extreme2 outParty first     Rpol exec leg legl , robust cluster(name)
est sto c
xi: qui reg extreme2 outParty first firstOut    Rpol exec leg legl , robust cluster(name)
est sto d

xi: qui reg extreme2 outParty first    i.educ i.age Whi Rpol exec leg legl , robust cluster(name)
est sto e
xi: qui reg extreme2 outParty first firstOut   i.educ i.age Whi  Rpol exec leg legl , robust cluster(name)
est sto f


estout a b c d e f , keep ( outParty first firstOut ) style(tex) cells(b(star fmt(3)) se(par)) stats(r2_a N, fmt(%9.3f %9.0g)) starlevels(* 0.10 ** 0.05 *** 0.01)





xi: qui reg extreme2b outParty first  Rpol exec leg legl , robust cluster(name)
est sto a
xi: qui reg extreme2b outParty first firstOut  Rpol exec leg legl , robust cluster(name)
est sto b

xi: qui reg extreme2b outParty first     Rpol exec leg legl , robust cluster(name)
est sto c
xi: qui reg extreme2b outParty first firstOut    Rpol exec leg legl , robust cluster(name)
est sto d

xi: qui reg extreme2b outParty first    i.educ i.age Whi Rpol exec leg legl , robust cluster(name)
est sto e
xi: qui reg extreme2b outParty first firstOut   i.educ i.age Whi  Rpol exec leg legl , robust cluster(name)
est sto f


estout a b c d e f , keep ( outParty first firstOut ) style(tex) cells(b(star fmt(3)) se(par)) stats(r2_a N, fmt(%9.3f %9.0g)) starlevels(* 0.10 ** 0.05 *** 0.01)












**************************




xi: qui reg extpca outParty first  Rpol exec leg legl , robust cluster(name)
est sto a
xi: qui reg extpca outParty first firstOut  Rpol exec leg legl , robust cluster(name)
est sto b

xi: qui reg extpca outParty first     Rpol exec leg legl , robust cluster(name)
est sto c
xi: qui reg extpca outParty first firstOut    Rpol exec leg legl , robust cluster(name)
est sto d

xi: qui reg extpca outParty first    i.educ i.age Whi Rpol exec leg legl , robust cluster(name)
est sto e
xi: qui reg extpca outParty first firstOut   i.educ i.age Whi  Rpol exec leg legl , robust cluster(name)
est sto f


estout a b c d e f , keep ( outParty first firstOut ) style(tex) cells(b(star fmt(3)) se(par)) stats(r2_a N, fmt(%9.3f %9.0g)) starlevels(* 0.10 ** 0.05 *** 0.01)


log close
