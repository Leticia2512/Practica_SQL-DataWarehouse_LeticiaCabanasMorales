select 
    calls_ivr_id, 
    case when step_name = 'CUSTOMERINFOBYDNI.TX'and step_result = 'OK' then 1 
       	else 0 
    end as info_by_dni_lg
from `keepcoding.ivr_detail`
group by 1,2;