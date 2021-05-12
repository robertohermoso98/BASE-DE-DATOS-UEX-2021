



insert agua values( 2,'agua1',00000.100,00000.100,00000.100,00000.100);
insert agua_min values(2,'aguaMIn1');
insert malta values(2,'Trigo','Trigo','Trigo','Trigo','malta','madfglta',12344.123);
insert paises values(2,'Catalá');
insert lupulo values(2,'Hellertaur Perle','Hellertaur Perle','Hellertaur Perle','Hellertaur Perle',2);
insert materiales values (1,'madera','Esto es madera');
insert materiales values (2,'metal','Esto es metal');
insert materiales values (3,'ebano','Esto es ebano');
insert materiales values (4,'caoba','Esto es la madera');
insert materiales values (5,'fresno de pantano','Esto es fdp');
insert materiales values (6,'tilo','Esto es tilo');
insert materiales values (7,'Barril Lacado','Barril Lacado');
insert materiales values (8,'Botella de cristal negro ahumado','Botella de cristal negro ahumado');
insert materiales values (9,'sapeli','Esto es sapeli');
insert materiales values (10,'pino','Esto es pino');
insert materiales values (11,'arroz','Esto es arroz');
insert materiales values (12,'maiz','Esto es maiz');
insert materiales values (13,'pan','Pan sin pan');
insert levadura values (2,'Larger','Larger .zip','bajo','A',99999.99);
insert malta_molida values(2,8,2);
insert mosto values (2,8,2,8,00013.99,12345.123,2);
insert liquido_dulce values(2,8,2,8,2,12345.123);
insert liquido_frio values(2,2,8,2,8,2,'Del pita pita del, Del pita pita del', 11111.111);
insert mosto_sin_f values(7,2,2,2,8,2,8,2,12345.213,99999.99,11111.111);
insert cerveza values(2015, 1234, 2,7,2,2,2,8,2,8,2,12345.123 );
insert cerveza_emb_cab values ('2015/05/03', 301, 2015, 1234);
insert cerveza_emb_lin values('2015/05/03', 301,8);

select lup_denominacion as 'Nombre lupulo', count(*) as 'Nº Cervezas embotelladas' 
from cerveza_emb_cab inner join cerveza	on	cec_año=cer_año and
cec_numero_sec=cer_numero_sec
inner join mosto_sin_f	on	cer_id_material3=msf_id_material3 and
cer_id_levadura=msf_id_levadura and cer_id_material2=msf_id_material2 
and cer_id_agua=msf_id_agua and cer_id_material=msf_id_material 
and cer_id_malta=msf_id_malta and cer_id_material1=msf_id_material1 and cer_id_lupulo=msf_id_lupulo
inner join materiales as a on	a.mat_id_material=msf_id_material3 and
a.mat_denominacion like 'Barril Lacado' 
inner join levadura	on	msf_id_levadura=lev_id_levadura and
lev_tipo_lev like 'A'
inner join liquido_frio	on	msf_id_material2=lif_id_material2 and
msf_id_agua=lif_id_agua and msf_id_material=lif_id_material 
and msf_id_malta=lif_id_malta and msf_id_material1=lif_id_material1 and msf_id_lupulo=lif_id_lupulo
inner join liquido_dulce	on	lif_id_agua=lid_id_agua and
lif_id_material=lid_id_material and lif_id_malta=lid_id_malta 
and lif_id_material1=lid_id_material1 and lif_id_lupulo=lid_id_lupulo
inner join lupulo	on	lid_id_lupulo = lup_id_lupulo 
inner join cerveza_emb_lin on	cel_fecha=cec_fecha and
cel_numero=cec_numero
inner join materiales as b on	cel_id_material=b.mat_id_material 
and b.mat_denominacion like 'Botella de cristal negro ahumado'
where year(cec_fecha) = 2015 group by lup_denominacion having count(*) >0
order by 1 asc, 2 asc ;



