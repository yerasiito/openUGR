-- Asignaturas que tienen o han tenido matriculados m?s de 25 alumnos, con independencia del curso academico

select asi#,nombreas from asigna where 25<any(select count(*) from matricula where asi#=codasi#)
/
