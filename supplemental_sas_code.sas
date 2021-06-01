*Accounting for left truncation in SAS;
*Calculating overall survival from diagnosis;

*Load data;
proc import out=work.crc_data
datafile="crc_stage_iv_os_dx_data.csv"
DBMS=csv;
OPTIONS MSGLEVEL=I;
run;

*Variables of interest;
*os_status_dx = patient's overall survival status, can take values 1 or 0;
*tt_cpt_report_mos = time (months) from date of cancer diagnosis to date of genomic sequencing;
*tt_os_dx_mos = time (months) from date of cancer diagnosis to overall survival, either death or last follow-up;

*Traditional method - does not account for left truncation;
proc lifetest data=crc_data;
 time tt_os_dx_mos*os_status_dx(0); 
run;

*Model adjusting for delayed entry;
proc phreg data = crc_data;
 model tt_os_dx_mos*os_status_dx(0) = / entrytime = tt_cpt_report_mos;
 baseline out = outsurv survival = survival / method = pl;
run;
