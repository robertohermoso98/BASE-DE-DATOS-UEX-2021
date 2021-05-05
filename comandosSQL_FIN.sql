
create database b3egw3goupxrzhhztdav;

use b3egw3goupxrzhhztdav;

create table agua( agu_id_agua int not null, agu_denominacion varchar(80) not null, agu_dureza decimal (8,3) not null, agu_cal decimal(8,3) not null, agu_cloro decimal(8,3) not null, agu_precio decimal(8,3) not null, primary key (agu_id_agua));

create table agua_min(agm_id_auga int not null, agm_mineral varchar(40) not null, primary key(agm_id_auga, agm_mineral), foreign key(agm_id_auga) references agua( agu_id_agua));

create table malta (mal_id_malta int not null, mal_denominacion varchar(80) not null, mal_tipo varchar(20) not null, mal_color varchar(20) not null, mal_tueste varchar(20) not null, mal_sabor varchar(20) not null,  mal_ahumado varchar(20), mal_precio decimal(8,3) not null, primary key (mal_id_malta));

create table paises( pai_id_pais int not null, pai_nombre_pais varchar(80) not null );

alter table paises add (primary key (pai_id_pais));

create table lupulo (lup_id_lupulo int not null, lup_denominacion varchar(80) not null, lup_amargor varchar(20) not null, lup_sabor varchar(20) not null, lup_aroma varchar(20) not null,  lup_id_pais int not null, primary key(lup_id_lupulo), foreign key(lup_id_pais) references paises (pai_id_pais));

create table materiales(mat_id_material int not null, mat_denominacion varchar(80) not null, mat_texto varchar(400), primary key(mat_id_material));
drop table levadura;
create table levadura( lev_id_levadura int not null, lev_denominacion varchar(80) not null, lev_formato varchar(30) not null, lev_perfil varchar(30), lev_tipo_lev varchar(1) not null, lev_temperatura decimal(8,3) not null, primary key(lev_id_levadura) );

create table malta_molida(mam_id_malta int not null, mam_id_material int not null, mam_veces int not null, primary key (mam_id_malta, mam_id_material), foreign key (mam_id_malta) references malta(mal_id_malta), foreign key (mam_id_material) references materiales (mat_id_material));

create table mosto( mos_id_agua int not null, mos_id_material int not null, mos_id_malta int not null,mos_id_material1 int not null,mos_tiempo_maceracion decimal(8,3) not null, mos_temperatura decimal(8,3) not null, mos_veces int not null, primary key (mos_id_agua, mos_id_material, mos_id_malta, mos_id_material1), foreign key(mos_id_agua) references agua( agu_id_agua), foreign key(mos_id_material) references materiales (mat_id_material), foreign key (mos_id_malta, mos_id_material1) references malta_molida(mam_id_malta, mam_id_material));

create table liquido_dulce(lid_id_agua int not null, lid_id_material int not null, lid_id_malta int not null, lid_id_material1 int not null, lid_id_lupulo int not null, lid_tiempo_coccion decimal(8,3) not null, primary key(lid_id_agua, lid_id_material , lid_id_malta , lid_id_material1, lid_id_lupulo), foreign key(lid_id_lupulo) references lupulo(lup_id_lupulo), foreign key(lid_id_agua,lid_id_material, lid_id_malta,lid_id_material1) references mosto(mos_id_agua, mos_id_material, mos_id_malta, mos_id_material1));

create table liquido_frio( lif_id_material2 int not null, lif_id_agua int not null, lif_id_material int not null, lif_id_malta int not null, lif_id_material1 int not null, lif_id_lupulo int not null, lif_metodo varchar(40) not null, lif_temperatura decimal(8,3) not null, primary key (lif_id_material2, lif_id_agua, lif_id_material, lif_id_malta, lif_id_material1, lif_id_lupulo), foreign key(lif_id_material2) references materiales (mat_id_material), foreign key(lif_id_agua, lif_id_material, lif_id_malta, lif_id_material1, lif_id_lupulo ) references liquido_dulce(lid_id_agua, lid_id_material, lid_id_malta, lid_id_material1, lid_id_lupulo)); 

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
foreign key(msf_id_levadura) references levadura(lev_id_levadura),
foreign key(msf_id_material2 ,msf_id_agua,msf_id_material ,msf_id_malta,msf_id_material1, msf_id_lupulo) references 
liquido_frio(lif_id_material2 ,lif_id_agua,lif_id_material ,lif_id_malta,lif_id_material1, lif_id_lupulo)
);

create table cerveza (cer_año int not null, cer_numero_sec bigint not null, cer_id_material4 int not null, cer_id_material3 int not null,  cer_id_levadura int not null,  cer_id_material2 int not null,  cer_id_agua int not null,  cer_id_material int not null,  cer_id_malta int not null,  cer_id_material1 int not null,  cer_id_lupulo int not null,  cer_tiempo_trasvase decimal(8,3) not null, primary key (cer_año, cer_numero_sec), foreign key (cer_id_material4) references materiales(mat_id_material), foreign key( cer_id_material3,  cer_id_levadura,  cer_id_material2,  cer_id_agua,  cer_id_material,  cer_id_malta,  cer_id_material1,  cer_id_lupulo) references mosto_sin_f (msf_id_material3,msf_id_levadura , msf_id_material2, msf_id_agua, msf_id_material,msf_id_malta,msf_id_material1, msf_id_lupulo));

create table cerveza_emb_cab(cec_fecha date not null, cec_numero bigint not null, cec_año int not null, cec_numero_sec bigint not null, primary key(cec_fecha, cec_numero), FOREIGN KEY (cec_año,cec_numero_sec) references cerveza(cer_año, cer_numero_sec));

create table cerveza_emb_lin(
    cel_fecha date not null,
    cel_numero bigint not null,
    cel_id_material int not null,
    primary key(cel_fecha,cel_numero,cel_id_material),
    foreign key (cel_id_material) references materiales (mat_id_material),
    foreign key (cel_fecha,cel_numero) references cerveza_emb_cab (cec_fecha, cec_numero));


insert agua values( 1,'agua1',12345.123,12345.123,12345.123,12345.123);
insert agua values(2,'agua2',12345.123,12345.123,12345.123,12345.123);
insert agua values(3,'agua3',12345.123,12345.123,12345.123,12345.123);
insert agua values(4,'agua4',12345.123,12345.123,12345.123,12345.123);
insert agua values(5,'agua5',12345.123,12345.123,12345.123,12345.123);
insert agua values(6,'agua6',12345.123,12345.123,12345.123,12345.123);

insert agua_min values(1,'aguaMIn1');
insert agua_min values(2,'aguaMIn3');
insert agua_min values(3,'agua2');
insert agua_min values(4,'aguafgsdfg');
insert agua_min values(5,'agua del risco');
insert agua_min values(6,'agua del pantano de tu puto pueblo');

insert malta values(1,'malta','malta','malta','malsdfgta','malta','madfglta',12344.123);
insert malta values(2,'maltafg','malsdfgta','maltsdgfa','malta','masdfglta','malta',12545.123);
insert malta values(3,'malta','malta','malta','malta','malta','malta',12345.193);
insert malta values(4,'malta','malta','malsdgfta','malsdfgta','maltsdfga','malta',12445.123);
insert malta values(5,'malta','malta','malta','malta','malta','malta',12345.423);
insert malta values(6,'malta','mfdgalta','malta','malta','masdfglta','malta',12445.123);

insert paises values(1,'Catalá');
insert paises  values(2,'Gabacholandia');
insert paises  values(3,'Andorra-PaisDeYoutubers');
insert paises  values(4,'MetallicaLnadia');
insert paises  values(5,'Girilandia');
insert paises  values(6,'Suiza');

insert lupulo values(2,'franchute','mucho','malisimogg','ha meao deBurro',2);
insert lupulo values(1,'O dè merdä','poggco','Bunisismo','Camiseta del madrid',1);
insert lupulo values(3,'andorrino','a yotube','CAroo','A dinerrito fresco',1);
insert lupulo values(4,'EnterSadman','BlackAlbum','NothingElseMatters','TrashMetaaaaal',1);
insert lupulo values(5,'potage','enorme','potachst','tremend',5);
insert lupulo values(6,'Paraiso fical','Eso es de pobres','Refinado','Gente de bien :D',1);

insert materiales values (1,'madera','Esto es madera');
insert materiales values (2,'metal','Esto es metal');
insert materiales values (3,'ebano','Esto es ebano');
insert materiales values (4,'caoba','Esto es la madera');
insert materiales values (5,'fresno de pantano','Esto es fdp');
insert materiales values (6,'tilo','Esto es tilo');
insert materiales values (7,'palo rosa','Esto es palo rosa');
insert materiales values (8,'arce','Esto es arce');
insert materiales values (9,'sapeli','Esto es sapeli');
insert materiales values (10,'pino','Esto es pino');
insert materiales values (11,'arroz','Esto es arroz');
insert materiales values (12,'maiz','Esto es maiz');
insert materiales values (13,'pan','Pan sin pan');


insert levadura values (1,'Levadura del jerte','comprimido .zip','bajo','1',99999.99);
insert levadura values (2,'Levadura de merida','emeritenses','alto','2',99989.99);
insert levadura values (3,'Levadura de caceres','comprimido .rar','feo','3',99978.99);
insert levadura values (4,'Levadura de panadero','comprimido .tar','adinerado','4',99399.99);
insert levadura values (5,'Levadura de pancese','rastrero','bajo','5',99911.99);
insert levadura values (6,'Levadura del todo por la patri','barato','ajo','6',16969.69);

insert malta_molida values(1,1,1);
insert malta_molida values(2,2,2);
insert malta_molida values(3,3,3);
insert malta_molida values(4,4,4);
insert malta_molida values(5,5,5);
insert malta_molida values(6,6,6);


insert mosto values (1,1,2,2,12345.123,12345.123,1);
insert mosto values (2,3,4,4,12345.123,12346.123,1);
insert mosto values (3,5,6,6,12345.123,12347.123,1);
insert mosto values (4,7,5,5,12345.123,12348.123,1);
insert mosto values (5,9,3,3,12345.123,12349.123,1);
insert mosto values (6,11,1,1,12345.123,12322.123,1);

insert liquido_dulce values(1,1,2,2,1,12345.123);
insert liquido_dulce values(2,3,4,4,2,12344.123);
insert liquido_dulce values(3,5,6,6,3,12335.23);
insert liquido_dulce values(4,7,5,5,4,12234.123);
insert liquido_dulce values(5,9,3,3,5,99999.999);
insert liquido_dulce values(6,11,1,1,6,12121.121);

insert liquido_frio values(1,1,1,2,2,1,'Del pita pita del, Del pita pita del', 11111.111);
insert liquido_frio values(2,2,3,4,4,2,'Yameri humbo Yarameridá',22222.222);
insert liquido_frio values(3,3,5,6,6,3,'humbo pita del humbo, humbo Yarameridá',33333.333);
insert liquido_frio values(4,4,7,5,5,4,' humbo pita del Yarameridá humbo pita',44444.444);
insert liquido_frio values(5,5,9,3,3,5,' hum! Del pita pita del Pita del pita',55555.555);
insert liquido_frio values(6,6,11,1,1,6,' humbo Del pita pita del Del pita Hum',66666.666);



insert mosto_sin_f values(1,1,1,1,1,2,2,1,12345.213,12343.444,11111.111);
insert mosto_sin_f values(2,2,2,2,3,4,4,2,12745.213,17343.444,17111.111);
insert mosto_sin_f values(3,3,3,3,5,6,6,3,16345.213,16343.444,11161.111);
insert mosto_sin_f values(4,4,4,4,7,5,5,4,12145.213,11343.444,11311.111);
insert mosto_sin_f values(5,5,5,5,9,3,3,5,12445.213,15343.444,11551.111);
insert mosto_sin_f values(6,6,6,6,11,1,1,6,16645.213,66343.444,16611.111);


insert cerveza values(1990, 1234, 1,1,1,1,1,1,2,2,1,12345.123 );
insert cerveza values(1990, 1235, 2,2,2,2,2,3,4,4,2, 22222.222);
insert cerveza values(1993, 1236, 3,3,3,3,3,5,6,6,3, 33333.333);
insert cerveza values(1996, 1237, 4,4,4,4,4,7,5,5,4, 44444.444);
insert cerveza values(1974, 1238, 5,5,5,5,5,9,3,3,5, 55555.555);
insert cerveza values(1969, 1239, 6,6,6,6,6,11,1,1,6,66666.666 );



insert cerveza_emb_cab values ('1999/05/03', 1, 1990, 1234);
insert cerveza_emb_cab values ('1969/05/04', 2, 1990, 1235);
insert cerveza_emb_cab values ('1970/05/05', 3, 1993, 1236);
insert cerveza_emb_cab values ('1971/05/03', 4, 1996, 1237);
insert cerveza_emb_cab values ('1973/05/03', 5, 1974, 1238);
insert cerveza_emb_cab values ('1975/05/03', 6, 1969, 1239);


insert cerveza_emb_lin values('1969/05/04', 2,7);
insert cerveza_emb_lin values('1970/05/05', 3,8); 
insert cerveza_emb_lin values('1971/05/03', 4,9);
insert cerveza_emb_lin values('1973/05/03', 5,10);
insert cerveza_emb_lin values('1975/05/03', 6,11);
insert cerveza_emb_lin values('1999/05/03', 1,12);

