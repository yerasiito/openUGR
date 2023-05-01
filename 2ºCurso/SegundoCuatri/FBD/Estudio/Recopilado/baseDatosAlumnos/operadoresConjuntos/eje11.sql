--Alumnos matriculados de alguna asignatura optativa

select distinct alumnos.dni,ape1,ape2,nombre from matricula,alumnos where
    codasi# in (select asi# from asigna where caracter='op') and
    alumnos.dni=matricula.dni order by ape1,ap2,nombre	
/
