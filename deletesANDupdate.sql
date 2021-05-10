
delete cerveza , cerveza_emb_cab , cerveza_emb_lin 
from cerveza , cerveza_emb_cab , cerveza_emb_lin  
where cer_año=cec_año 
and cer_numero_sec=cec_numero_sec 
and cec_numero=cel_numero 
and cec_fecha=cel_fecha 
and cer_año=1974 ; 

update cerveza , cerveza_emb_cab , cerveza_emb_lin 
set cer_año=1974 , cec_año=1974
where cer_año=cec_año 
and cer_numero_sec=cec_numero_sec 
and cec_numero=cel_numero 
and cec_fecha=cel_fecha 
and cer_año=1969; 
  
  
  
update 

  
select * from cerveza;