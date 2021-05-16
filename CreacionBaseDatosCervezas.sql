drop database  cervezas;
create database cervezas;
use cervezas;

create table agua(
 agu_id_agua int not null,
 agu_denominacion varchar(80) not null,
 agu_dureza decimal (8,3) not null, 
 agu_cal decimal(8,3) not null, 
 agu_cloro decimal(8,3) not null, 
 agu_precio decimal(8,3) not null,
 primary key (agu_id_agua)
 );

create table agua_min(
agm_id_auga int not null, 
agm_mineral varchar(40) not null, 
primary key(agm_id_auga, agm_mineral),
foreign key(agm_id_auga) references agua( agu_id_agua)
on delete cascade
on update cascade
);

create table malta (
mal_id_malta int not null,
 mal_denominacion varchar(80) not null,
 mal_tipo varchar(20) not null, 
 mal_color varchar(20) not null,
 mal_tueste varchar(20) not null, 
 mal_sabor varchar(20) not null,  
 mal_ahumado varchar(20), 
 mal_precio decimal(8,3) not null,
 primary key (mal_id_malta)
 );

create table paises( 
pai_id_pais int not null, 
pai_nombre_pais varchar(80) not null,
primary key (pai_id_pais)
);


create table lupulo (
lup_id_lupulo int not null, 
lup_denominacion varchar(80) not null,
 lup_amargor varchar(20) not null,
 lup_sabor varchar(20) not null,
 lup_aroma varchar(20) not null,
 lup_id_pais int not null, primary key(lup_id_lupulo),
 foreign key(lup_id_pais) 
 references paises (pai_id_pais)
  on delete cascade
    on update cascade

 );

create table materiales(
mat_id_material int not null, 
mat_denominacion varchar(80) not null, 
mat_texto varchar(400), 
primary key(mat_id_material)

);

create table levadura(
 lev_id_levadura int not null,
 lev_denominacion varchar(80) not null,
 lev_formato varchar(30) not null, 
 lev_perfil varchar(30),
 lev_tipo_lev varchar(1) not null, 
 lev_temperatura decimal(8,3) not null ,
 primary key (lev_id_levadura)

 );

create table malta_molida(
mam_id_malta int not null,
 mam_id_material int not null,
 mam_veces int not null, 
 primary key (mam_id_malta, mam_id_material),
 foreign key (mam_id_malta) references malta(mal_id_malta),
 foreign key (mam_id_material) references materiales (mat_id_material)
 on delete cascade
on update cascade);

create table mosto( 
mos_id_agua int not null,
 mos_id_material int not null,
 mos_id_malta int not null,
 mos_id_material1 int not null,
 mos_tiempo_maceracion decimal(8,3) not null,
 mos_temperatura decimal(8,3) not null, 
 mos_veces int not null,
 primary key (mos_id_agua, mos_id_material, mos_id_malta, mos_id_material1), 
 foreign key(mos_id_agua) references agua( agu_id_agua), 
 foreign key(mos_id_material) references materiales (mat_id_material), 
 foreign key (mos_id_malta, mos_id_material1) references malta_molida(mam_id_malta, mam_id_material)
 on delete cascade
    on update cascade
 );

create table liquido_dulce(
lid_id_agua int not null,
 lid_id_material int not null,
 lid_id_malta int not null, 
 lid_id_material1 int not null,
 lid_id_lupulo int not null, 
 lid_tiempo_coccion decimal(8,3) not null,
 primary key(lid_id_agua, lid_id_material , lid_id_malta , lid_id_material1, lid_id_lupulo),
 foreign key(lid_id_lupulo) references lupulo(lup_id_lupulo), 
 foreign key(lid_id_agua,lid_id_material, lid_id_malta,lid_id_material1)
 references mosto(mos_id_agua, mos_id_material, mos_id_malta, mos_id_material1)
  on delete cascade
    on update cascade

 );

create table liquido_frio( 
lif_id_material2 int not null, 
lif_id_agua int not null, 
lif_id_material int not null, 
lif_id_malta int not null, 
lif_id_material1 int not null, 
lif_id_lupulo int not null, 
lif_metodo varchar(40) not null, 
lif_temperatura decimal(8,3) not null, 
primary key (lif_id_material2, lif_id_agua, lif_id_material, lif_id_malta, lif_id_material1, lif_id_lupulo), 
foreign key(lif_id_material2) references materiales (mat_id_material), 
foreign key(lif_id_agua, lif_id_material, lif_id_malta, lif_id_material1, lif_id_lupulo ) 
references liquido_dulce(lid_id_agua, lid_id_material, lid_id_malta, lid_id_material1, lid_id_lupulo)
 on delete cascade
    on update cascade

); 

create table mosto_sin_f (
msf_id_material3 int not null,
msf_id_levadura int not null,
msf_id_material2 int not null,
msf_id_agua int not null,
msf_id_material int not null,
msf_id_malta int not null,
msf_id_material1 int not null,
msf_id_lupulo int not null,
msf_tiempo_oxidacion  decimal(8,3) not null,
msf_tiempo_fermentacion decimal(8,3) not null,
msf_temperatura decimal(8,3) not null,
primary key(msf_id_material3 ,msf_id_levadura,msf_id_material2 ,msf_id_agua,msf_id_material ,msf_id_malta,msf_id_material1, msf_id_lupulo) ,
foreign key(msf_id_material3) references materiales (mat_id_material),
foreign key(msf_id_levadura) references levadura (lev_id_levadura),
foreign key(msf_id_material2 ,msf_id_agua,msf_id_material ,msf_id_malta,msf_id_material1, msf_id_lupulo) 
references liquido_frio(lif_id_material2 ,lif_id_agua,lif_id_material ,lif_id_malta,lif_id_material1, lif_id_lupulo)
 on delete cascade
    on update cascade
);

create table cerveza (
cer_año int not null,
 cer_numero_sec bigint not null,
 cer_id_material4 int not null,
 cer_id_material3 int not null,
 cer_id_levadura int not null,
 cer_id_material2 int not null,
 cer_id_agua int not null,
 cer_id_material int not null,
 cer_id_malta int not null,
 cer_id_material1 int not null,
 cer_id_lupulo int not null,
 cer_tiempo_trasvase decimal(8,3) not null,
 primary key (cer_año, cer_numero_sec),
 foreign key (cer_id_material4) references materiales(mat_id_material),
 foreign key( cer_id_material3,  cer_id_levadura,  cer_id_material2,  cer_id_agua,  cer_id_material,  cer_id_malta,  cer_id_material1,  cer_id_lupulo) 
 references mosto_sin_f (msf_id_material3,msf_id_levadura , msf_id_material2, msf_id_agua, msf_id_material,msf_id_malta,msf_id_material1, msf_id_lupulo)
on delete cascade
on update cascade
 );

create table cerveza_emb_cab(
cec_fecha date not null, 
cec_numero bigint not null, 
cec_año int not null, 
cec_numero_sec bigint not null, 
primary key(cec_fecha, cec_numero),
FOREIGN KEY (cec_año,cec_numero_sec) 
references cerveza(cer_año, cer_numero_sec)
on delete cascade
on update cascade
);

create table cerveza_emb_lin(
    cel_fecha date not null,
    cel_numero bigint not null,
    cel_id_material int not null,
    primary key(cel_fecha,cel_numero,cel_id_material),
    foreign key (cel_id_material) references materiales (mat_id_material),
    foreign key (cel_fecha,cel_numero) references cerveza_emb_cab (cec_fecha, cec_numero)
    on delete cascade
    on update cascade
    );


insert agua values( 1,'agua1',00000.100,00000.100,00000.100,00000.100);
insert agua_min values(1,'aguaMIn1');
insert malta values(1,'Trigo','Trigo','Trigo','Trigo','malta','madfglta',12344.123);
insert paises values(1,'Catalá');
insert lupulo values(1,'Hellertaur Perle','Hellertaur Perle','Hellertaur Perle','Hellertaur Perle',1);
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
insert levadura values (1,'Larger','Larger .zip','bajo','L',99999.99);
insert malta_molida values(1,1,1);
insert mosto values (1,1,1,1,00013.99,12345.123,1);
insert liquido_dulce values(1,1,1,1,1,12345.123);
insert liquido_frio values(1,1,1,1,1,1,'Del pita pita del, Del pita pita del', 11111.111);
insert mosto_sin_f values(1,1,1,1,1,1,1,1,12345.213,99999.99,11111.111);
insert cerveza values(1990, 1234, 1,1,1,1,1,1,1,1,1,12345.123 );
insert cerveza_emb_cab values ('1999/05/03', 1, 1990, 1234);
insert cerveza_emb_lin values('1999/05/03', 1,7);

insert agua values( 2,'agua1',00000.100,00000.100,00000.100,00000.100);
insert agua_min values(2,'aguaMIn1');
insert malta values(2,'Trigo','Trigo','Trigo','Trigo','malta','madfglta',12344.123);
insert paises values(2,'Catalá');
insert lupulo values(2,'Hellertaur Perle','Hellertaur Perle','Hellertaur Perle','Hellertaur Perle',2);
insert levadura values (2,'Larger','Larger .zip','bajo','A',99999.99);
insert malta_molida values(2,8,2);
insert mosto values (2,8,2,8,00013.99,12345.123,2);
insert liquido_dulce values(2,8,2,8,2,12345.123);
insert liquido_frio values(2,2,8,2,8,2,'Del pita pita del, Del pita pita del', 11111.111);
insert mosto_sin_f values(7,2,2,2,8,2,8,2,12345.213,99999.99,11111.111);
insert cerveza values(2015, 1234, 2,7,2,2,2,8,2,8,2,12345.123 );
insert cerveza_emb_cab values ('2015/05/03', 301, 2015, 1234);
insert cerveza_emb_lin values('2015/05/03', 301,8);


select year(cec_fecha) as 'Año embotellamiento', msf_tiempo_fermentacion as 'Tiempo Fermentacion' , mos_tiempo_maceracion as 'Tiempo Maceracion', agu_denominacion as 'Nombre Agua' from cerveza_emb_cab inner join cerveza on cec_año=cer_año and cec_numero_sec=cer_numero_sec inner join mosto_sin_f on cer_id_material3=msf_id_material3 and cer_id_levadura=msf_id_levadura and cer_id_material2=msf_id_material2 and cer_id_agua=msf_id_agua and cer_id_material=msf_id_material and cer_id_malta=msf_id_malta and cer_id_material1=msf_id_material1 and cer_id_lupulo=msf_id_lupulo and msf_tiempo_fermentacion > 12 inner join levadura on msf_id_levadura=lev_id_levadura and lev_tipo_lev like 'L' inner join liquido_frio on msf_id_material2=lif_id_material2 and msf_id_agua=lif_id_agua and msf_id_material=lif_id_material and msf_id_malta=lif_id_malta and msf_id_material1=lif_id_material1 and msf_id_lupulo=lif_id_lupulo inner join liquido_dulce on lif_id_agua=lid_id_agua and lif_id_material=lid_id_material and lif_id_malta=lid_id_malta and lif_id_material1=lid_id_material1 and lif_id_lupulo=lid_id_lupulo inner join lupulo on lid_id_lupulo = lup_id_lupulo and lup_denominacion like 'Hellertaur Perle' inner join mosto on mos_id_agua=lid_id_agua and mos_id_material=lid_id_material and mos_id_malta=lid_id_malta and mos_id_material1=lid_id_material1 inner join agua on mos_id_agua=agu_id_agua and agu_cal<3 inner join malta_molida on mos_id_malta=mam_id_malta and mos_id_material1=mam_id_material                          inner join malta on mal_id_malta=mam_id_malta and mal_denominacion like 'Trigo' where cec_fecha <'2014/05/03' order by 1 asc, 4 desc;

update malta, mosto, malta_molida 
set mal_precio=mal_precio * 1.05 
where mos_temperatura>80 
and mos_id_malta=mam_id_malta 
and mos_id_material1=mam_id_material 
and mam_id_malta=mal_id_malta;
update mosto, agua set agu_precio=agu_precio*1.05 
where mos_temperatura>80 and mos_id_agua=agu_id_agua;


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


