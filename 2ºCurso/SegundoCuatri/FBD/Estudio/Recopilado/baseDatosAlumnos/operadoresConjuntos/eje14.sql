-- DNI nombre y apellidos de alumnos matriculados de la asignatura 'mabd1'

select dni,ape1,ape2,nombre from alumnos
   where exists (select * from matricula  where alumnos.dni=matricula.dni and codasi#='mab1')
/

-- DNI nombre y apellidos de alumnos  no matriculados de la asignatura 'mabd1'

select dni,ape1,ape2,nombre from alumnos
   where  not exists (select * from matricula  where alumnos.dni=matricula.dni and codasi#='mab1')
/