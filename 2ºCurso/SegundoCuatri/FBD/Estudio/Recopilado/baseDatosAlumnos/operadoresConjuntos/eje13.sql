--Alumnos matriculados en asignaturas del último curso

select distinct dni from matricula where codasi# in (select asi# from asigna where
curso >=all (select asi.curso from asigna asi))
/

-- Asignaturas del último curso
select asi# from asigna where curso>=all(Select asi.curso from asigna asi)
/

---Alumnos amtriculados en asignaturas del último curso una vez que se sabe cuales son.  (Mal enfoque para resolver la consulta. Se necesitan dos sentencias)
Select distinct dni from matricula where codasi# in ('alg','bda','mab2')
/