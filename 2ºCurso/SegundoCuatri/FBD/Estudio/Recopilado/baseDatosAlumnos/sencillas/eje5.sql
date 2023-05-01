-- DNI nombre u apellidos y curso académico de los alumnos mayores de 25 matriculados de la asignatura tec1 
-- ordenados por curso académico y apellidos y nombre
select curso_academico, matricula.DNI,nombre,ape1,ape2 from alumnos, matricula  where (edad >25) 
and (alumnos.dni=matricula.dni and matricula.codasi#='tec1') order by  curso_academico, ape1,ape2,nombre;
/
