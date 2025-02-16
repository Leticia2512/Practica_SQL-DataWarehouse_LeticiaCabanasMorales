select 
  calls_ivr_id,
  billing_account_id
from keepcoding.ivr_detail
where billing_account_id != 'UNKNOWN'
group by 1,2;
