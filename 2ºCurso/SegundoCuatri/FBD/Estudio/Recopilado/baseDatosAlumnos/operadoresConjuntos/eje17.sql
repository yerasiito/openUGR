-- Alumnos de edad minima

select dni from alumnos
minus
   select alumnos.dni from alumnos, alumnos al
    where (al. edad < alumnos.edad)

/
