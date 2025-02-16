create table keepcoding.ivr_summary as
select
	calls_ivr_id as ivr_detail,
 	calls_phone_number as phone_number,
  	calls_ivr_result as ivr_result,
  	case
    	when calls_vdn_label like 'ATC%' then 'FRONT'
     	when calls_vdn_label like 'TECH%' then 'TECH'
     	when calls_vdn_label = 'ABSORPTION' then 'ABSORPTION'
     	else 'RESTO'
	end as vdn_aggregation,
    calls_start_date as start_date,
    calls_end_date as end_date,
    calls_total_duration as total_duration,
    calls_customer_segment as customer_segment,
    calls_ivr_language as ivr_language,
    calls_steps_module as steps_module,
    calls_module_aggregation as module_aggregation,
    where document_type not in ('UNKNOWN', 'DESCONOCIDO') as document_type,
    where document_identification not in ('UNKNOWN', 'DESCONOCIDO') as document_identification,
	where customer_phone != 'UNKNOWN' as customer_phone,
    where billing_account_id != 'UNKNOWN' as billing_account_id,
	case 
		when module_name = 'AVERIA_MASIVA' then 1 
		else 0 
	end as masiva_lg,
	case 
		when step_name = 'CUSTOMERINFOBYPHONE.TX' and step_result = 'OK' then 1 
		else 0 
	end as info_by_phone_lg,
   	case 
   		when step_name = 'CUSTOMERINFOBYDNI.TX' and step_result = 'OK' then 1 
   		else 0 
   	end as info_by_dni_lg,
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