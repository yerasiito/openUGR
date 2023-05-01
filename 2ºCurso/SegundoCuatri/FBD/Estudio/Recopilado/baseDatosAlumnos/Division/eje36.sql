--Asignaturas que tiene o han tenido matriculados todos los alumnos de Almer?a

select asi#,nombreas from asigna where not exists(
(select dni from alumnos where provincia='Almeria')
minus
(select matricula.dni from matricula where asi#=codasi#))
/
