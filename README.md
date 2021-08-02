# Implications of Selection Bias Due to Delayed Study Entry in Clinico-Genomic Studies

## Files
- *crc_stage_iv_os_dx_data.csv:* Cohort of de-identified GENIE BPC patients with stage IV colorectal cancer at diagnosis.
- *crc_stage_iv_os_dx.R:* R code to estimate overall survival from diagnosis with and without adjustment for left truncation using the crc_stage_iv_os_dx_data.csv data file.
- *crc_stage_iv_os_dx.sas:* SAS code to estimate overall survival from diagnosis with and without adjustment for left truncation using the crc_stage_iv_os_dx_data.csv data file.

- *toy_data.csv*: Toy dataset of patients recruited to study to undergo genomic sequencing and followed until death or end of study. Patients who died before undergoing genomic sequencing are represented by cpt_status = 0 and are therefore not included in the study, resulting in missing entries for tt_cpt_report months.  Because patients needed to survive long enough from diagnosis until the genomic sequencing, the data is left truncated.
- *toy_data_os_dx.R*: Corresponding R script using the toy_data.csv data file to calculate three estimates of overall survival: 1) overall survival from diagnosis for entire population; 2) overall survival from diagnosis among those who underwent genomic sequencing, unadjusted for left truncation; 3) overall survival from diagnosis among those who underwent genomic sequencing, with left truncation adjustment. 

## Authors 
- Samantha Brown, MS
- Jessica Lavery, MS
- Katherine Panageas, DrPH

This repository serves as supplemental material to the manuscript "Implications of Selection Bias Due to Delayed Study Entry in Clinico-Genomic Studies." We provide data and code including tutorial examples to demonstrate adjusting for delayed study entry when estimating overall survival from diagnosis, as described in the manuscript. Example code scripts are provided in R and SAS.

