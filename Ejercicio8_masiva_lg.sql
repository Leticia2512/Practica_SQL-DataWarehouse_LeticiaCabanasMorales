select 
    calls_ivr_id, 
    case when module_name = 'AVERIA_MASIVA' then 1 
    	else 0 
    end as masiva_lg
from `keepcoding.ivr_detail`
group by 1,2;
