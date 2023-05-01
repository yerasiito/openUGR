-- Alumnos menores de 25 años ordenados por edad (descendente) y nombre y apellidos

select nombre,ape1,ape2 from alumnos  where
   edad <=25 order by edad desc, ape1,ape2,nombre
/
