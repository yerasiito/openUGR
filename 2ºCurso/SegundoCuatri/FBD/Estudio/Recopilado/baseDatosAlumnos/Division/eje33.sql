--Alumnos becarios matriculados de todas las asignaturas de mas de seis cr?ditos

select ape1,ape2,nombre from alumnos where beca='si' and not exists
 (select asi# from asigna where credt+credpr>6 and 
not exists (select * from matricula where alumnos.dni=matricula.dni and asi#=codasi#))
/
