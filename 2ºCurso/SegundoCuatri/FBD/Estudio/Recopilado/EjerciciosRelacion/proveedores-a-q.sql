--a)
Select DISTINCT codpro from ventas where codpj='J1';

--b)
Select * from ventas where cantidad >100;

--c)
Select nompro,nompie,nompj from proveedor,pieza,proyecto where 
proveedor.ciudad=pieza.ciudad and pieza.ciudad=proyecto.ciudad;

--d)
Select distinct nompie from proveedor, pieza, ventas where
proveedor.codpro=ventas.codpro and pieza.codpie=ventas.codp and proveedor.ciudad='Londres';

--e)
Select proveedor.ciudad,proyecto.ciudad from proyecto,proveedor,ventas where
proveedor.codpro=ventas.codpro and proyecto.codpj=ventas.codpj;

--f)
select codp from proveedor,ventas,proyecto where
proyecto.codpj=ventas.codpj and proveedor.codpro=ventas.codpro and proyecto.ciudad=proveedor.ciudad;

--f) pero con natural join
select codp from proveedor natural join ventas natural join proyecto;


--	Encontrar los códigos de los proyectos que tienen al menos un proveedor que no se encuentre en su misma ciudad--.

select distinct ventas.codpj from ventas,proyecto, proveedor where proyecto.codpj=ventas.codpj
and proveedor.codpro=ventas.codpro and proveedor.ciudad!=proyecto.ciudad;

select distinct proyecto.codpj from proyecto where  exists (select ventas.codpro from
ventas,proveedor where proyecto.codpj=ventas.codpj
and proveedor.codpro=ventas.codpro and proveedor.ciudad!=proyecto.ciudad) ;

--h)	Mostrar todas las ciudades de donde proceden piezas y las ciudades donde hay proyectos--

select pieza.ciudad from pieza
union
select proyecto.ciudad from proyecto;

--i)	Mostrar todas las ciudades de los proveedores en las que no fabriquen piezas.--

select proveedor.ciudad from proveedor
minus
select pieza.ciudad from pieza;

Select proveedor.ciudad from proveedor
intersect
select pieza.ciudad from pieza;

--- g) Encontrar los códigos de los proyectos que usan una pieza que vende S1.--

select distinct ventas.codpj from ventas, ventas ven where ventas.codp=ven.codp
and ven.codpro='S1' ;

select distinct ventas.codpj from ventas where
exists (select codp from  ventas ven where ventas.codp=ven.codp and ven.codpro='S1');

--l)	Encontrar la cantidad más pequeña enviada en algún suministro. --

Select ventas.cantidad from ventas
minus
Select ventas.cantidad from ventas, ventas ven where ven.cantidad<ventas.cantidad;

Select ventas.cantidad  from ventas
where ventas.cantidad<=all(select ven.cantidad from ventas ven);

--m)	Encontrar los códigos de los proyectos que no utilizan una pieza roja suministrada por un proveedor de Londres. --

select codpj from proyecto
minus
select codpj from ventas,proveedor,pieza where pieza.color='Rojo' and proveedor.ciudad='Londres' and ventas.codpro=proveedor.codpro and
ventas.codp=pieza.codpie;

select codpj from proyecto where not exists( select ventas.codpj from ventas,proveedor,pieza
where pieza.color='Rojo' and proveedor.ciudad='Londres' and ventas.codpro=proveedor.codpro and
ventas.codp=pieza.codpie and proyecto.codpj=ventas.codpj)

select codpj from proyecto where proyecto.codpj
not in( select ventas.codpj from ventas,proveedor,pieza where pieza.color='Rojo' and proveedor.ciudad='Londres' and ventas.codpro=proveedor.codpro and
ventas.codp=pieza.codpie and proyecto.codpj=ventas.codpj);

select codpj from proyecto where not(proyecto.codpj =Any( select ventas.codpj from ventas,proveedor,pieza where pieza.color='Rojo' and proveedor.ciudad='Londres' and ventas.codpro=proveedor.codpro and
ventas.codp=pieza.codpie and proyecto.codpj=ventas.codpj));

--n)	Encontrar los códigos de los proyectos que tienen como único proveedor a S1.--

Select codpj from ventas where codpro='S1'
minus
select codpj from ventas where codpro!='S1';

Select codpj from ventas where codpro='S1' and
not exists (select codpj from ventas  ven where ven.codpro!='S1' and ventas.codpj=ven.codpj);

Select codpj from ventas where codpro='S1' and codpj not in (select codpj from ventas  ven where ven.codpro!='S1' and ventas.codpj=ven.codpj);

-- ñ) Encontrar los códigos de las piezas que se suministran a todos los proyectos de París.

Select codpie from pieza where not exists (select codpj from proyecto where
ciudad='Paris' and not exists (select *from ventas where pieza.codpie=ventas.codp and ventas.codpj=proyecto.codpj))
;

Select codpie from pieza where not exists ((select codpj from proyecto where
ciudad='Paris') minus (select codpj from ventas where pieza.codpie=ventas.codp));

-- o) Encontrar los códigos de los proveedores que venden la misma pieza a todos los proyectos.

Select codpro from ventas where not exists(select * from proyecto where not exists(select * from ventas
ven where ventas.codpro=ven.codpro and ven.codp=ventas.codp and ven.codpj=proyecto.codpj));

Select codpro from ventas where not exists(select codpj from proyecto minus (select codpj from ventas
ven where ventas.codpro=ven.codpro and ven.codp=ventas.codp));

-- p) Encontrar los códigos de los proyectos a los que S1 suministra todas las piezas existentes.

Select codpj from proyecto where not exists(select * from pieza where not exists(select * from ventas ven
where codpro='S1' and ven.codp=pieza.codpie and ven.codpj=proyecto.codpj));

Select codpj from proyecto where not exists(select codpie from pieza minus (select codp from ventas ven
where codpro='S1'  and ven.codpj=proyecto.codpj)) ;



-- q) Mostrar los códigos de los proveedores que suministran todas las piezas a todos los proyectos.

Select codpro from proveedor where not exists (select codpie,codpj from pieza, proyecto where not exists
(select codp,codpj from ventas where ventas.codpro=proveedor.codpro and ventas.codp=pieza.codpie and
ventas.codpj= proyecto.codpj));

Select codpro from proveedor where not exists (select codpie,codpj from pieza, proyecto minus
(select codp,codpj from ventas where ventas.codpro=proveedor.codpro));

