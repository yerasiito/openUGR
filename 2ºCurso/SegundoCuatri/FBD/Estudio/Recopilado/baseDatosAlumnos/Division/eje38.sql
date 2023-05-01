--Alumnos becarios matriculados de todas las asignaturas de seis o m?s cr?ditos (otra version)

select ape1,ape2,nombre from alumnos where beca='si' and 
not exists ((select asi# from asigna where credt+credpr>6)
minus
(select codasi# from matricula where matricula.dni=alumnos.dni))
/
