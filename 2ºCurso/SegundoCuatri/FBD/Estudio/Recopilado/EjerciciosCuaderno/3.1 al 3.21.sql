--Ejercicio 3.1
Select ciudad from proyecto;
Select DISTINCT ciudad from proyecto;

--Ejercicio 3.2
Select codpro,codp,codpj from ventas;

--Ejercicio 3.3
Select * from pieza where (color='Gris' or color='Rojo') and ciudad='Madrid';

--Ejercicio 3.4
select * from ventas where cantidad between 200 and 300;

--Ejercicio 3.5
select * from pieza where nompie like '_ornillo';

--Ejercicio 3.6
select table_name from ALL_TABLES where table_name like '%VENTAS';

--Ejercicio 3.8
Select codpj from ventas where codpro='S1'
minus
Select codpj from ventas where codpro!='S1';

--Ejercicio 3.9
SELECT ciudad from proyecto
Union
select ciudad from pieza
union
select ciudad from proyecto

--Ejercicio 3.10
SELECT ciudad from proyecto
Union all
select ciudad from pieza
union all
select ciudad from proyecto;

--Ejercicio 3.11
select count(*) from proveedor,ventas

--Faltan 3.12 a 3.18

-- 3.19
Select DISTINCT codp from ventas where
ventas.codpro in (select proveedor.codpro from proveedor where ciudad='Madrid');

-- 3.20
Select * from proyecto where
proyecto.ciudad= Any(Select pieza.ciudad from pieza);

-- 3.21

select codpj from proyecto where not exists( select codpj from ventas,proveedor,pieza where pieza.color='Rojo' and proveedor.ciudad='Londres' and ventas.codpro=proveedor.codpro and
ventas.codp=pieza.codpie and proyecto.codpj=ventas.codpj)

select codpj from proyecto where proyecto.codpj not in( select codpj from ventas,proveedor,pieza where pieza.color='Rojo' and proveedor.ciudad='Londres' and ventas.codpro=proveedor.codpro and
ventas.codp=pieza.codpie and proyecto.codpj=ventas.codpj);

select codpj from proyecto where not(proyecto.codpj =Any( select codpj from ventas,proveedor,pieza where pieza.color='Rojo' and proveedor.ciudad='Londres' and ventas.codpro=proveedor.codpro and
ventas.codp=pieza.codpie and proyecto.codpj=ventas.codpj));
