--Asignaturas que están en el último curso

select asi# from asigna where curso>= all(select curso from asigna)
/
