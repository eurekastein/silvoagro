-- 2.1 Principal actividad productiva 
create table act_pro as 
select ac.*, a.p13701011, a.p13701012, a.p13701013
from trd_actividad_problematica_principal a 
join ac_iica as ac
on a.clave = ac.clave;

-- 2.2 Agricultura Familiar 
create table agricultura_fam as
select ac.*, a.p03301011, a.p03301012, a.p03301013
from trd_destino_prod a 
join ac_iica as ac
on a.clave= ac.clave;


-- Diversidad, producción y rendimientos de cultivos de temporal perennes (análisis de cambio entre superficies)
create table divprodrent_perennes as
select ac.geom, a.*
from
(select a.id_ac as clave, a.p0080102, a.p008n06, a.p008n14, b.p0090110, c.nom_cult, c.sup_plan, d.p0130110
from trd_agricultura_pv a, trd_intercalados_pv b, trd_agricultura_perennes c, trd_intercalados_perennes d) as a
join ac_iica as ac
on a.clave= ac.clave

--Manejo de los componentes del sistema
create table manejo_comp_sist as
select ac.geom, a.*
from
(select a.clave, a.p0231001, b.p0160005, c.p0480101, 
       c.p0510004, d.p0520205, d.p0521101,
	   e.p0400005, e.p0400301
from trd_tec_agricola a, trd_no_semb_superf_causa b,
     trd_sup_bosque_selva c, trd_tec_forestal d, 
	 trd_otras_sup e) a 
join ac_iica ac 
on a.clave = ac.clave;

-- Producción maderable
create table prod_maderable as
select ac.geom, a.* 
from
(select a.clave, a.p0560304, a.p0560404, c.p0620106 
from trd_prod_maderable a, trd_venta_forestal b, trd_recoleccion c) a 
join ac_iica ac
on a.clave = ac.clave;

-- Destino de la producción maderable y no maderable
create table dest_prod_maderable_nomade as
select ac.geom, a.*
from 
(select a.clave, a.p0570101, a.p0570102, a.p0570103, b.p0630001
from trd_venta_forestal a, trd_forestal_no_maderable b) as a
join ac_iica ac
on a.clave = ac.clave;

-- Tipo de Ganado
create table tipo_ganado as 
select ac.*, a.*
from 
(select a.clave, a.p0900101, a.p0950101, a.p0980201
from trd_cria_explotacion_otras a) as a
join ac_iica ac
on a.clave = ac.clave;

-- Destino de la produccion agricola 
create table destino_prod_agricola as 
select ac.*, a.*
from 
(select a.clave, a.p03401011, a.p03401012
from trd_destino_prod a) as a
join ac_iica ac
on a.clave = ac.clave;

-- Manejo del ganado 
create table manejo_ganado as
select ac.geom, a.*
from
(select a.clave, a.p0710101, a.p0710201
from trd_cria_explotacion_bovinos a) as a
join ac_iica ac
on a.clave = ac.clave;

-- Organización entre unidades de producción 
select ac.geom, a.*
from
(select a.clave, a.p1280901, a.p1280903, a.p1281001, 
a.p1281003, a.p1281301, a.p1300201
from trd_org_entre_productores a) as a
join ac_iica ac
on a.clave = ac.clave;

