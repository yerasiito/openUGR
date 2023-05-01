--Numero de alumnos en cada asignatura en cada curso acad?mico 

select curso_academico,codasi#,count(*)  from matricula group by curso_academico,codasi# order by curso_academico,codasi# ;

--Numero de alumnos en cada asignatura en cada curso acad?mico para aquellos cursos/asignaturas con m?s de 10 alumnos
select curso_academico,codasi#,count(*)  from matricula group by curso_academico,codasi# having count(*)>=10
order by curso_academico,codasi# ;

