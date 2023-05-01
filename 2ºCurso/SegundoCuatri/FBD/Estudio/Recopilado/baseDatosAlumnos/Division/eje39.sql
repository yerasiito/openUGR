--Asignaturas que tienen alumnos matriculados en todos los cursos academico (otra version)

Select asi#,nombreas from asigna where not exists (
(select matricula.curso_academico from matricula)
minus
(select ma.curso_academico from matricula ma where asi#=ma.codasi#))
/
