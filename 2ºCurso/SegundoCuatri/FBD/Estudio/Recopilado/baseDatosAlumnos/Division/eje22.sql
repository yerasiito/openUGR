-- Alumnos que han aprobado todas las asignaturas del grado en Inform?tica


 Select ape1,ape2,nombre from alumnos where
 not exists (select asi# from asigna where curriculum='Grado Informatica'  and
 not exists (select * from matricula where alumnos.dni=matricula.dni and codasi#=asi# and 
 calificacion in ('ap','no','sb','mh')))
/
