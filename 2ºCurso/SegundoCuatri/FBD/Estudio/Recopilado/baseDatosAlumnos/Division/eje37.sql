-- Alumnos que han aprobado todas las asignaturas del grado en Informatica (otra version)

select ape1,ape2,nombre from alumnos where not exists
 ((select asi# from asigna where 
 curriculum ='Grado Informatica')  minus
 (select codasi# from matricula where alumnos.dni=matricula.dni
 and calificacion in ('ap','no','sb','mh')))
/
