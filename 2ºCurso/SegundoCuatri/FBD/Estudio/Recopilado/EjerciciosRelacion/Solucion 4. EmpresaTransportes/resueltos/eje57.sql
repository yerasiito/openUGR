
--Alumnos matriculados de mas 4 asignaturas en el curso academico 2016-2017

select ape1,ape2,nombre,edad from alumnos where 4<any(select count(*) from matricula where alumnos.dni=matricula.dni
and curso_academico='2016-2017')
/
