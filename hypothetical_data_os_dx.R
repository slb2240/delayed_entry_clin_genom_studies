#############################################################################################
######### Evaluating Delayed Study Entry & the Effect of Left Truncation Adjustment ######### 
######### in Overall Survival from Diagnosis from a Hypotheical Data Set ####################
#############################################################################################

## Load libraries
library(tidyverse)
library(survival)
library(survminer)

## Load data
hyp_data = read.csv(here::here("hypothetical_data.csv"))

## Variables of interest
## os_status_dx = patient's overall survival status (1 = dead; 0 = censored)
## tt_os_dx_mos = time (months) from date of cancer diagnosis to overall survival, either death or last follow-up
## cpt_status = genomic sequencing indicator (1 = patient underwent genomic sequencing; 0 = patient did not undergo genomic sequencing)
## tt_cpt_report_mos = time (months) from date of cancer diagnosis to date of genomic sequencing

## Calculate median overall survival from diagnosis for total population
survfit(Surv(tt_os_dx_mos, os_status_dx) ~ 1, data = hyp_data)

## Subset data on those who underwent genomic sequencing
hyp_data_subset = hyp_data %>% 
  filter(cpt_status == 1)

## Calculate unadjusted median overall survival from diagnosis for subsetted population
survfit(Surv(tt_os_dx_mos, os_status_dx) ~ 1, data = hyp_data)

## Calculate median overall survival from diagnosis for subsetted population after left truncation adjustment
survfit(Surv(time = tt_cpt_report_mos, time2 = tt_os_dx_mos, os_status_dx) ~ 1, data = hyp_data)

