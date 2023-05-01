-- Encontrar los nombres de las asignaturas y n?mero de alumnos de las asignaturas que se han impartido en el curso 2014-2015
select nombreas,count(*) from asigna, matricula where asigna.asi#=matricula.codasi# and
curso_academico='2014-2015' group by nombreas;

-- Encontrar los nombres de las asignaturas que tienen mayor n?mero de alumnos en el 2014-2015
select nombreas,count(*) from asigna,matricula where asigna.asi#=matricula.codasi# and
curso_academico='2014-2015' group by nombreas having count(*)>=all(select count(*) from matricula ma
where ma.curso_academico='2014-2015' group by ma.codasi#);