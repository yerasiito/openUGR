--Muestra n?mero de alumnos por asignatrua y curso academico ordenadas por asignatura y numero de alumnos

Select curso_academico,codasi#,count(*) from matricula group by codasi#,curso_academico order by codasi#, count(*) desc;


-- Mostrar para cada asignatura el n?mero m?ximo de alumnos que ha tenido y elcurso en que ha sido
Select curso_academico,codasi#,count(*) from matricula group by codasi#,curso_academico having
count(*)=any(select max(count(*)) from  matricula ma where matricula.CODASI# = ma.CODASI#  group by ma.codasi#,ma.curso_academico)
order by matricula.CURSO_ACADEMICO,matricula.CODASI#;