#!/bin/bash
i=5000
max=125000
while [ $i -le $max ] 
do
	./trivial $i >> compraventatrivial.dat
	echo $i
	i=$((i+5000))
done
