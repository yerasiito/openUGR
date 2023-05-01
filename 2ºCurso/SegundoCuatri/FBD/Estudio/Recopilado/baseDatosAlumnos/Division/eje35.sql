
-- Alumnos matriculados de todas las asignaturas optativas (otra version)

select ape1,ape2,nombre from alumnos where not exists (
(select asi# from asigna where caracter='op')
minus
(select codasi# from matricula where alumnos.dni=matricula.dni))
/
