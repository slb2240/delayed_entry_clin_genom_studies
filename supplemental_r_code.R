#################################################
###### Accounting for left truncation in R ######
## Calculating overall survival from diagnosis ## 
#################################################

## Load libraries
library(survival)
library(survminer)

## Load data
crc_data = read.csv(here::here("crc_stage_iv_os_dx_data.csv"))

## Variables of interest
## os_status_dx = patient's overall survival status, can take values 1 or 0
## tt_cpt_report_mos = time (months) from date of cancer diagnosis to date of genomic sequencing
## tt_os_dx_mos = time (months) from date of cancer diagnosis to overall survival, either death or last follow-up

## Traditional approach - does not account for left truncation
traditional_model = survfit(Surv(event = os_status_dx, time = tt_os_dx_mos) ~ 1, 
                            data = crc_data)
print(traditional_model)
summary(traditional_model)


## Model adjusting for delayed entry
delayed_entry_model = survfit(Surv(event = os_status_dx, time = tt_cpt_report_mos, time2 = tt_os_dx_mos) ~ 1, 
                              data = crc_data)
print(traditional_model)
summary(delayed_entry_model)

## Plot survival curves
ggsurvplot(
  fit = list(traditional_fit = survfit(Surv(event = os_status_dx, time = tt_os_dx_mos) ~ 1, 
                                 data = crc_data), 
             delayed_entry_fit = survfit(Surv(event = os_status_dx, time = tt_cpt_report_mos, time2 = tt_os_dx_mos) ~ 1, 
                                         data = crc_data)),
  combine = TRUE,
  data = crc_data,
  xlab = "Time (Months) from Stage IV Diagnosis",
  ylab = "Survival Probability",
  censor = FALSE,
  conf.int = FALSE,
  risk.table = TRUE,
  risk.table.y.text = TRUE,
  risk.table.height = 50, 
  tables.theme = clean_theme(), 
  legend = "top",
  xlim = c(0, 60),
  break.x.by = 6,
  legend.labs = c("Unadjusted", "Adjusted for Delayed Entry")
) + 
  labs(title = "Overall Survival from Diagnosis", 
       subtitle = "Among Stage IV CRC Diagnosis")
