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
