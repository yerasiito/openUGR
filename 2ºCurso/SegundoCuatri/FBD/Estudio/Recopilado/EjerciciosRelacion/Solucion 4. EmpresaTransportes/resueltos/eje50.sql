-- Nota media y desviacion tipica de acceso de los alumnos varones
select avg(nota), stddev(nota) from alumnos where
     sexo='v'
/
