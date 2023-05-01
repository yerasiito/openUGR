--a)Encontrar los nombres de  alumnos que provengan de Granada o Almería, hacerlo mediante selección y mediante unión.--
Select nombre,ape1,ape2 from alumnos where provincia='Granada' or provincia='Almeria' order by ape1,ape2,nombre;

(Select nombre,ape1,ape2 from alumnos where provincia='Granada'
union
Select nombre,ape1,ape2 from alumnos where provincia='Almeria') order by ape1,ape2,nombre;

--b)Encontrar aquellos alumnos matriculados en asignaturas de primer curso o segundo curso. Mediante selección y mediante unión:--

Select  distinct nombre,ape1,ape2 from alumnos, matricula, asigna where matricula.DNI=alumnos.DNI and asigna.asi#=matricula.codasi# and 
asigna.curso=1 or asigna.curso=2 order by ape1,ape2,nombre;

(Select   nombre,ape1,ape2 from alumnos, matricula, asigna where matricula.DNI=alumnos.DNI and asigna.asi#=matricula.codasi# and 
asigna.curso=1
Union 
Select   nombre,ape1,ape2 from alumnos, matricula, asigna where matricula.DNI=alumnos.DNI and asigna.asi#=matricula.codasi#
and  asigna.curso=2) order by ape1,ape2,nombre;

--c)Encontrar aquellas asignaturas de más de seis créditos que ha tenido alumnos en el curso académico 2014-2015. -

Select asi# from asigna where credt+credpr>=6
intersect
select codasi# from matricula where curso_academico='2014-2015';

select * from asigna asis where asis.asi# in (
Select asi# from asigna where credt+credpr>=6
intersect
select codasi# from matricula where curso_academico='2014-2015');

--d)Encontrar los códigos de aquellas asignaturas sin ningún alumno en el curso académico 2013-2014.

select asi# from asigna
minus
select codasi# from matricula where curso_academico='2013-2014';

select asi.* from asigna asi where asi.asi# in (
select asi# from asigna
minus
select codasi# from matricula where curso_academico='2013-2014') order by nombreas;

--e)Encontrar el DNI, nombre y apellidos de aquellos alumnos con máxima nota de corte--

select DNI, nombre,ape1,ape2 from alumnos where alumnos.DNI in (
select DNI from alumnos 
minus
select alumnos.DNI from alumnos, alumnos alu where alumnos.nota<alu.nota);

select DNI, nombre,ape1,ape2 from alumnos where alumnos.nota >=All (
select alu.nota from alumnos alu);

---f)Encontrar el DNI de aquellos alumnos a los que sólo les queda una asignatura:--

Select DNI from matricula
minus
Select matricula.DNI from matricula, matricula matri where
matricula.DNI=matri.DNI and matricula.codasi#!=matri.codasi#;

select dni from matricula where 
not exists (Select * from matricula matri, matricula mat
where matri.DNI=matricula.DNI and matri.codasi#!=mat.codasi# and matri.DNI=mat.DNI);

select dni from matricula where dni 
not in (Select matri.DNI from matricula matri, matricula mat where matri.codasi#!=mat.codasi# and matri.DNI=mat.DNI);
