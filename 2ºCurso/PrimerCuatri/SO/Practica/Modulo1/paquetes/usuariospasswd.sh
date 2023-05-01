#!/bin/bash
for line in $(sudo cat /etc/passwd)
do
	usuario=$(echo $line | cut --d : -f1)
	echo $usuario
done
