--Numero de instacias de matricula que tienen notas no nulas (es decir se han presentados los alumnos)

Select count(notas) from matricula

/
-- Otra forma de calcular

select count(*) from matricula where calificacion<>'np'

/