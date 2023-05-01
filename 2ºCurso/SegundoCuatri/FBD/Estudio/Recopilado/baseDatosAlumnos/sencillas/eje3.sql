---Alumnos entre 20 y 30 años provinientes de las provincias de Granada, Jaen o Almería

select dni,nombre,ape1,ape2 from alumnos
    where    edad between 20 and 30 and   
     provincia in  ('Jaen','Granada','Almeria') order by ape1,ape2,nombre
/
