--Ejercicio 3.65: Muestra todos los encuentros posibles de la liga.

select e1.nombree,e2.nombree
from equipos e1,equipos e2
where e1.code<>e2.code

--Ejercicio 3.66: Muestra los equipos que han ganado algún encuentro jugando como local.

select distinct equipos.code
from equipos, encuentros
where equipos.code=encuentros.elocal and plocal>pvisitante

--Ejercicio 3.67: Muestra los equipos que han ganado algún encuentro.

select distinct equipos.code
from equipos, encuentros
where equipos.code=encuentros.elocal and plocal>pvisitante
union
select distinct equipos.code
from equipos,encuentros
where equipos.code=encuentros.evisitante and pvisitante>plocal


--Ejercicio 3.68: Muestra los equipos que todos los encuentros que han ganado lo han hecho como equipo local.


select distinct code
from equipos,encuentros
where (plocal>pvisitante and elocal=code) or (plocal<pvisitante and evisitante=code)
minus
select  code
from equipos,encuentros
where (plocal<pvisitante and evisitante=code)

--Ejercicio 3.69: Muestra los equipos que han ganado todos los encuentros jugando como equipo local.


select code
from equipos
where not exists(
(select * from encuentros where code=elocal)
minus
(select * from encuentros where plocal>pvisitante and code=elocal)
)

--Ejercicio 3.70: Muestra los encuentros que faltan para terminar la liga. Suponiendo que en la tabla Encuentros sólo se almacenan los encuentros celebrados hasta la fecha.


(select e1.code, e2.code
from equipos e1, equipos e2
where e1.code<>e2.code)
minus
(select elocal,evisitante
from encuentros)

--Ejercicio 3.71: Muestra los encuentros que tienen lugar en la misma localidad.

select elocal,evisitante,fecha,localidad
from equipos,encuentros
where code=elocal
order by equipos.localidad

--Ejercicio 3.72 Para cada equipo muestra el número de encuentros que ha disputado como local

SELECT nombreE, count(*) FROM equipos,encuentros WHERE code=Elocal GROUP BY nombreE ORDER BY nombreE;

--Ejercicio 3.73 Muestra los encuentros en los que se alcanzó mayor diferencia.

SELECT equipos.nombreE, eq.nombreE, abs(Plocal-PVisitante) FROM equipos, equipos eq , encuentros
WHERE equipos.code=Elocal AND eq.code=EVisitante AND abs(Plocal-Pvisitante)=  (SELECT max(abs(en.Plocal-en.Pvisitante)) FROM encuentros en);

--Ejercicio 3.74 Muestra los jugadores que no han superado 3 faltas acumuladas.

SELECT nombreJ, sum(num) FROM jugadores,faltas WHERE faltas.codj=jugadores.codj GROUP BY nombreJ HAVING  sum(num)<=3  ORDER BY nombreJ;

--Ejercicio 3.75 Muestra los equipos con mayores puntuaciones en los partidos jugados fuera de casa.

SELECT EVisitante, PVisitante FROM encuentros WHERE PVisitante=(SELECT max(en.PVisitante) FROM encuentros en);

--Ejercicio 3.76 Muestra todas las victorias de cada equipo, jugando como local o como visitante.

SELECT nombreE, code, Elocal, EVisitante FROM equipos, encuentros WHERE
(code=Elocal AND Plocal>Pvisitante)or(code=EVisitante AND PVisitante>Plocal) ORDER BY nombree;

-- Ejercicio 3.77: Muestra el equipo con mayor número de victorias.

select code, count(plocal)
from equipos,encuentros
where (code=evisitante and pvisitante>plocal) or (code=elocal and plocal>pvisitante)
group by code
having count(plocal)= (select max(count(plocal)) from equipos,encuentros
where (code=evisitante and pvisitante>plocal) or (code=elocal and plocal>pvisitante)
group by code
)

--Ejercicio 3.78: Muestra el promedio de puntos por equipo en los encuentros de ida.

select code, avg(plocal)
from equipos,encuentros
where (elocal=code)
group by code


