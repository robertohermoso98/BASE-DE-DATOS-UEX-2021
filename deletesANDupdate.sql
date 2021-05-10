
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
  

update cerveza , mosto_sin_f, liquido_frio 
set cer_id_agua=88, msf_id_agua=88, lif_id_agua=88
where 
lif_id_material2=1
and lif_id_agua=1
and lif_id_material=1
and lif_id_malta=2
and lif_id_material1=2
and lif_id_lupulo=1

and msf_id_agua=1
and msf_id_material=1
and msf_id_malta=2
and msf_id_material1=2
and msf_id_lupulo=1
   
and cer_id_agua=1
and cer_id_material=1
and cer_id_malta=2
and cer_id_material1=2
and cer_id_lupulo=1
;

  
update 

  
select * from cerveza;
