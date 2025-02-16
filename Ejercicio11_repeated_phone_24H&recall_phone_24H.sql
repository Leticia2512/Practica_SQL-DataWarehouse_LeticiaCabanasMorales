select
  calls_phone_number,
case 
  when calls_start_date between DATE_SUB(calls_start_date, interval 24 HOUR) and calls_start_date then 1
    else 0
     end as repeated_phone_24H,
case 
  when calls_start_date between calls_start_date and DATE_ADD(calls_start_date, interval 24 HOUR) then 1
    else 0
     end as cause_recall_phone_24H
from keepcoding.ivr_detail
;