select * from cerveza;
delete cerveza , cerveza_emb_cab , cerveza_emb_lin 
from cerveza , cerveza_emb_cab , cerveza_emb_lin  
where cer_año=cec_año 
and cer_numero_sec=cec_numero_sec 
and cec_numero=cel_numero 
and cec_fecha=cel_fecha 
and cer_año=1974 ; 


select * from cerveza;

## MSF_id_material3  +  MSF_id_levadura  +  MSF_id_material2  +  MSF_id_agua +  MSF_id_material  + MSF_id_malta + MSF_id_material1 + MSF_id_lupulo
delete mosto_sin_f,cerveza,cerveza_emb_cab , cerveza_emb_lin  from mosto_sin_f,cerveza,cerveza_emb_cab , cerveza_emb_lin  where msf_id_material3= ? and msf_id_levadura= ?
and msf_id_material2= ? 
and msf_id_agua= ? 
and msf_id_material= ? 
and msf_id_malta= ? 
and msf_id_material1= ? 
and msf_id_lupulo= ? 
and cer_id_material3=msf_id_material3 
and cer_id_levadura=msf_id_levadura 
and cer_id_material2=msf_id_material2 
and cer_id_material=msf_id_material 
and cer_id_malta=msf_id_malta 
and cer_id_material1=msf_id_material1 
and cer_id_lupulo=msf_id_lupulo 
and cer_año=cec_año  
and cer_numero_sec=cec_numero_sec  
and cec_numero=cel_numero  
and cec_fecha=cel_fecha  ; 



delete liquido_frio, mosto_sin_f, cerveza,cerveza_emb_cab , cerveza_emb_lin 
from liquido_frio, mosto_sin_f, cerveza,cerveza_emb_cab , cerveza_emb_lin 
where lif_id_material2=msf_id_agua
and lif_id_agua=msf_id_agua
and lif_id_material=msf_id_material
and lif_id_malta=msf_id_malta
and lif_id_material1=msf_id_material1
and lif_id_lupulo=msf_id_lupulo
and cer_id_material3=msf_id_material3
and cer_id_levadura=msf_id_levadura
and cer_id_material2=msf_id_material2
and cer_id_material=msf_id_material
and cer_id_malta=msf_id_malta
and cer_id_material1=msf_id_material1
and cer_id_lupulo=msf_id_lupulo
and cer_año=cec_año 
and cer_numero_sec=cec_numero_sec 
and cec_numero=cel_numero 
and cec_fecha=cel_fecha 


select * from mosto_sin_f;

update cerveza , cerveza_emb_cab , cerveza_emb_lin 
set cer_año= ? , cec_año= ? 
where cer_año=cec_año 
and cer_numero_sec=cec_numero_sec 
and cec_numero=cel_numero 
and cec_fecha=cel_fecha 
and cer_año= ? 
and cer_numero_sec= ? ; 

update mosto_sin_f
set msf_tiempo_oxidacion = 11111.111
where
msf_id_material3 = 1
and msf_id_levadura = 1
and msf_id_material2 = 1 
and msf_id_agua = 1
and msf_id_material = 1
and msf_id_malta= 2
and msf_id_material1= 2 
and msf_id_lupulo= ? 1 ;

update cerveza 
set cer_tiempo_trasvase= ? 
where cer_año= ? 
and cer_numero_sec= ? ; 

update liquido_frio
set lif_metodo= ? 
where lif_id_material2= ? 
and lif_id_agua= ? 
and lif_id_material= ?
and lif_id_malta= ?
and lif_id_material1= ? 
and lif_id_lupulo= ? ;

select * from liquido_frio;
  

update cerveza , mosto_sin_f, liquido_frio 
set cer_id_malta=8,cer_id_material1=8,msf_id_malta=8,msf_id_material1=8,lif_id_malta=8,lif_id_material1=8
where 
lif_id_material2=1
and lif_id_agua=1
and lif_id_material=1
and lif_id_malta=2
and lif_id_material1=2
and lif_id_lupulo=1

and msf_id_material2=1
and msf_id_agua=1
and msf_id_material=1
and msf_id_malta=2
and msf_id_material1=2
and msf_id_lupulo=1
  
and cer_id_material2=1
and cer_id_agua=1
and cer_id_material=1
and cer_id_malta=2
and cer_id_material1=2
and cer_id_lupulo=1
;

  
update 

  
select * from cerveza;
