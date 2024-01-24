"

Purpose: Plot and Tables for Survey Results

1. Analogous fig. to fig. 1 that clearly captures concentration of certain pols. in people's minds. 

Gaurav Sood and Daniel Stone

"	
# Set Working dir.
setwd(basedir)

# Load libraries
library(lme4)
library(ggplot2)
library(grid)
library(goji)	
	
# Load data
srvy <- read.csv("media/who_how/data/survey/cleansurvey.csv")

# 1. Analogous fig. to fig. 1 that clearly captures concentration of certain pols. in people's minds. 
# Distribution of pols. recalled
table(srvy$name)

library(dplyr)
tabs <- srvy %>% group_by(name) %>% tally()
tabs$name <- reorder(tabs$name, tabs$n)

ggplot(data = tabs, aes(y = name, x=n)) + 
geom_point() +
labs(x="",y="") + 
theme_minimal() +
theme(panel.grid.major.y = element_line(colour = "#e3e3e3", linetype = "dotted"),
	  panel.grid.minor.x = element_blank(),
	  panel.grid.major.x = element_line(colour = "#f1f1f1", linetype = "solid"),
	  panel.border       = element_blank(),
	  legend.position  = "none",
	  legend.key       = element_blank(),
	  legend.key.width = unit(1,"cm"),
 	  title        = element_text(size=8),
	  axis.title   = element_text(size=8),
	  axis.text    = element_text(size=8),
	  axis.ticks.y = element_blank(),
	  axis.ticks.x = element_line(colour = '#f1f1f1'),
	  strip.text.x =  element_text(size=9),
	  legend.text=element_text(size=8)) 

ggsave(file="media/who_how/figs/survey/names_tally.pdf")

# 2. Compare mean ideology of recalled politician to congressional and senate medians using t tests
cfscores <- read.csv("media/who_how/data/politician/cfscores_output_gs_3.csv")

#  Congressional District Number (0 if Senate or President)
cf_sub  <- subset(cfscores, senate_2013==1)

# Create new vars
srvy$senate_mean_cf  <- ifelse(srvy$recall_party=="dem", -0.8746918, 0.8795078)
srvy$compare_senate  <- ifelse(srvy$recall_party=="dem", srvy$senate_mean_cf - srvy$cfscores, srvy$cfscores - srvy$senate_mean_cf)

# Proportion recalled that are more extreme than the mean
mean(srvy$compare_senate > 0)

# Avg. diff w/ s.e. + recall results
library(lme4)
srvy$in_out    <- with(srvy, ifelse((Democrat==1 & recall_party=="rep") | (Democrat==0 & recall_party=="dem"), 0, 1))

reg_sen    <- with(srvy, lmer(compare_senate ~ 1 + (1|uniqid)))
reg_sen_o  <- with(srvy, lmer(compare_senate ~ in_out*zero1(recall_order) + (1|uniqid)))

library(stargazer)
stargazer(c(reg_sen, reg_sen_o),  
	  title="Are Recalled Politicians More Extreme than the Median Senator of the Party?", 
	  align=TRUE, 
	  dep.var.caption = "Extremity Compared to Senate Mean",
	  dep.var.labels = NULL, dep.var.labels.include = FALSE,
      covariate.labels = c("Constant", "Out Party", "Recall Order", "Out Party x Recall Order"),
      no.space=TRUE, 
      intercept.bottom = FALSE, intercept.top = TRUE, 
      omit="as.factor", 
      omit.stat=c("LL","f"),
      label="tab:tab1",
      out="media/who_how/tabs/senate_compare.tex")


# Avg. estimated extremity w/ s.e. + recall results
srvy$xtreme_re <- NA
srvy$xtreme_re[srvy$recall_party=="dem"] <-  zero1(-srvy$recall_rating[srvy$recall_party=="dem"])
srvy$xtreme_re[srvy$recall_party=="rep"] <-  zero1(srvy$recall_rating[srvy$recall_party=="rep"])

reg_re    <- with(srvy, lmer(xtreme_re ~ 1 + (1|uniqid)))
reg_re_o  <- with(srvy, lmer(xtreme_re ~ in_out*zero1(recall_order) + (1|uniqid)))

stargazer(c(reg_re, reg_re_o),  
	  title="Estimated Extremity of Recalled Politicians", 
	  align=TRUE, 
	  dep.var.caption = "Estimated Extremity",
	  dep.var.labels = NULL, dep.var.labels.include = FALSE,
      covariate.labels = c("Constant", "Out Party", "Recall Order", "Out Party x Recall Order"),
      no.space=TRUE, 
      intercept.bottom = FALSE, intercept.top = TRUE, 
      omit="as.factor", 
      omit.stat=c("LL","f"),
      label="tab:tab1",
      out="media/who_how/tabs/recall.tex")

# N Cites Versus Ideology
srvy$xtreme_cf <- with(srvy, ifelse(recall_party=="dem", -cfscore, cfscore))
tabs <- srvy %.% group_by(name) %.% summarise(mean=mean(xtreme_cf), count= n())

ggplot(data = tabs, aes(y = count, x=mean)) + 
geom_point() +
geom_smooth(method=lm, se = F) + 
labs(x="",y="") + 
theme_minimal() +
theme(panel.grid.major.y = element_line(colour = "#e3e3e3", linetype = "dotted"),
	  panel.grid.minor.x = element_blank(),
	  panel.grid.major.x = element_line(colour = "#f1f1f1", linetype = "solid"),
	  panel.border       = element_blank(),
	  legend.position  = "none",
	  legend.key       = element_blank(),
	  legend.key.width = unit(1,"cm"),
 	  title        = element_text(size=8),
	  axis.title   = element_text(size=8),
	  axis.text    = element_text(size=8),
	  axis.ticks.y = element_blank(),
	  axis.ticks.x = element_line(colour = '#f1f1f1'),
	  strip.text.x =  element_text(size=9),
	  legend.text=element_text(size=8)) 