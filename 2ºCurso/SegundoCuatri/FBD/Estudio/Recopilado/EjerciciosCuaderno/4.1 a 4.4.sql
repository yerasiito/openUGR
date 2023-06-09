drop view ejemplo3;

drop view compleja;

--Ejercicio 4.1 Crear una vista con los proveedores de Londres. �Qu� sucede si insertamos
--en dicha vista la tupla (�S11�,�Jose Suarez�,3,�Granada�)?. Estudiar la clausula with check option

create view ejemplo as select * from proveedor where ciudad='Londres';
insert into ejemplo values('S11','Jose Suarez',3,'Granada');
Select * from ejemplo where codpro='S11';

create view ejemplo1 as select * from proveedor where ciudad='Londres' with check option;
insert into ejemplo1 values('S13','Jose Lopez',3,'Granada');

--Ejercicio 4.2 Crear una vista con los nombres de los proveedores y sus ciudades. Inserta
--sobre ella una fila y explica cu�l es el problema que se plantea. �Habr�a problemas de actualizaci�n?

create view ejemplo2 as select nompro,ciudad from proveedor;

Select * from ejemplo2;

insert into ejemplo2 values('Antonio Lopez','Madrid');

-- Ejercicio 4.3 Crear una vista donde aparezcan el c�digo de proveedor, el nombre de proveedor
--y el c�digo del proyecto tales que la pieza sumistrada sea gris. Sobre esta vista realiza
--alguna consulta y enumera todos los motivos por los que ser�a imposible realizar una inserci�n.

create view compleja as select proveedor.codpro,nompro,codpj from proveedor,ventas,pieza where
proveedor.codpro=ventas.codpro and codpie=codp and pieza.color='Gris';


Select * from compleja;


--Ejercicio 5.1 Ver la descripci�n de la vista del cat�logo USER_TABLES.

describe user_tables;

select table_name from user_tables;

