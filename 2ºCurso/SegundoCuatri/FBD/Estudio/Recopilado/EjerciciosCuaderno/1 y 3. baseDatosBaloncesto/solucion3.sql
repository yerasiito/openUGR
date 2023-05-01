--Ejercicio 3.71 Para cada equipo muestra el número de encuentros que ha disputado como local

SELECT nombreE, count(*) FROM equipos,encuentros WHERE code=Elocal GROUP BY nombreE ORDER BY nombreE;

--Ejercicio 3.72 Muestra los encuentros en los que se alcanzó mayor diferencia.

SELECT equipos.nombreE, eq.nombreE, abs(Plocal-PVisitante) FROM equipos, equipos eq , encuentros
WHERE equipos.code=Elocal AND eq.code=EVisitante AND abs(Plocal-Pvisitante)=  (SELECT max(abs(en.Plocal-en.Pvisitante)) FROM encuentros en);

--Ejercicio 3.73 Muestra los jugadores que no han superado 3 faltas acumuladas.

SELECT nombreJ, sum(num) FROM jugadores,faltas WHERE faltas.codj=jugadores.codj GROUP BY nombreJ HAVING  sum(num)<=3  ORDER BY nombreJ;

--Ejercicio 3.74 Muestra los equipos con mayores puntuaciones en los partidos jugados fuera de casa. 

SELECT EVisitante, PVisitante FROM encuentros WHERE PVisitante=(SELECT max(en.PVisitante) FROM encuentros en);

--Ejercicio 3.75 Muestra todas las victorias de cada equipo, jugando como local o como visitante.

SELECT nombreE, code, Elocal, EVisitante FROM equipos, encuentros WHERE
(code=Elocal AND Plocal>Pvisitante)or(code=EVisitante AND PVisitante>Plocal) ORDER BY nombree;

