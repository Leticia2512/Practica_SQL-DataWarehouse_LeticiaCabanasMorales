select 
  calls_ivr_id,
  document_type,
  document_identification
from keepcoding.ivr_detail
where document_type not in ('UNKNOWN', 'DESCONOCIDO') 
and document_identification not in ('UNKNOWN', 'DESCONOCIDO') 
group by 1,2,3;

