
select 
  calls_ivr_id,
  customer_phone 
from keepcoding.ivr_detail
where customer_phone != 'UNKNOWN' 
group by 1,2;

