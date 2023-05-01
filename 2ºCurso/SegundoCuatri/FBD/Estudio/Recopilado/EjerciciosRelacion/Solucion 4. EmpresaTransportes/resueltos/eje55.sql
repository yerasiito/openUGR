-- Alumnos de edad minima (compara con ejercicio eje17

select ape1,ape2,nombre,edad from alumnos where
 edad=any(select min(edad) from alumnos)
/
