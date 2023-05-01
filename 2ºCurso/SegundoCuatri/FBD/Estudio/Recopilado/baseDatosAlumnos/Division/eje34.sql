-- Asignaturas que tienen alumnos matriculados en todos los cursos academicos

Select asi#,nombreas from asigna where not exists
(select matricula.curso_academico from matricula where 
not exists (select * from matricula ma where asi#=ma.codasi# and matricula.curso_academico=ma.curso_academico))
/
