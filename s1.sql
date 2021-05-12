select year(cec_fecha) as 'Año embotellamiento', msf_tiempo_fermentacion as 'Tiempo Fermentacion',
mos_tiempo_maceracion as 'Tiempo Maceracion', agu_denominacion as 'Nombre Agua' 
from cerveza_emb_cab inner join cerveza	on	cec_año=cer_año 
and cec_numero_sec=cer_numero_sec
inner join mosto_sin_f	on	cer_id_material3=msf_id_material3 
and cer_id_levadura=msf_id_levadura and cer_id_material2=msf_id_material2 and cer_id_agua=msf_id_agua 
and cer_id_material=msf_id_material and cer_id_malta=msf_id_malta and cer_id_material1=msf_id_material1
 and cer_id_lupulo=msf_id_lupulo 
and msf_tiempo_fermentacion > 12
inner join levadura	on	msf_id_levadura=lev_id_levadura and
lev_tipo_lev like 'L'
inner join liquido_frio	on	msf_id_material2=lif_id_material2 and
msf_id_agua=lif_id_agua and msf_id_material=lif_id_material and msf_id_malta=lif_id_malta
 and msf_id_material1=lif_id_material1 and msf_id_lupulo=lif_id_lupulo
inner join liquido_dulce	on	lif_id_agua=lid_id_agua and
lif_id_material=lid_id_material and lif_id_malta=lid_id_malta and lif_id_material1=lid_id_material1
 and lif_id_lupulo=lid_id_lupulo
inner join lupulo	on	lid_id_lupulo = lup_id_lupulo and
lup_denominacion like 'Hellertaur Perle' inner join mosto	on	mos_id_agua=lid_id_agua and
mos_id_material=lid_id_material and mos_id_malta=lid_id_malta and mos_id_material1=lid_id_material1
inner join agua	on	mos_id_agua=agu_id_agua and agu_cal<3
 inner join malta_molida	on	mos_id_malta=mam_id_malta and
mos_id_material1=mam_id_material inner join malta	on	mal_id_malta=mam_id_malta and
mal_denominacion like 'Trigo'
where cec_fecha <'2014/05/03' order by 1 asc, 4 desc;

select * from cerveza_emb_cab;