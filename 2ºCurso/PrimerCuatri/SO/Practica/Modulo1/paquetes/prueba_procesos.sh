#!/bin/bash
#prueba procesos
contador=0
a=0
for i in $(seq 1 $1)
do
	a=$[$i * 2]
	sleep 3
	contador=$[$contador + $a]
done
echo "el valor de la variable es $contador"
