--c�digo y nombre de asignaturas en las que no hay ning�n alumno matriculado

select asi#,nombreas from asigna where not exists (select * from matricula where asi#=codasi#)
/
