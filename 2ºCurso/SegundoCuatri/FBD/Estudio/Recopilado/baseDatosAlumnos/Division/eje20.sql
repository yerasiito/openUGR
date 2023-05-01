-- Alumnos matriculados de todas las asignaturas optativas

Select ape1,ape2,nombre from alumnos where
not exists (select asi# from asigna where caracter='op'
and not exists(select * from matricula where matricula.dni=alumnos.dni and codasi#=asi#))

/
