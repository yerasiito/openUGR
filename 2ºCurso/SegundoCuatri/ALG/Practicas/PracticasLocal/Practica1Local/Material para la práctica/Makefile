CPP=$(wildcard *.cpp)
EXE=$(basename $(CPP))

# Modifica aquí para ajustar el nivel de optimización (de 0 a 3):
CPPFLAGS=-O0 -std=gnu++0x
DAT=quicksort.dat fibonacci.dat

.PHONY: default clean tiempos

default: $(EXE)

clean:
	rm -f $(EXE) $(DAT)

# Modifica aquí para cambiar los puntos de inicio, fin y los saltos:
ini_cuadratico=5000
fin_cuadratico=125000
incremento_cuadratico=5000

ini_log=50000
fin_log=1250000
incremento_log=50000

ini_cubico=50
fin_cubico=1250
incremento_cubico=50

ini_fibonacci=2
fin_fibonacci=50
incremento_fibonacci=2

ini_hanoi=3
fin_hanoi=33
incremento_hanoi=1

tiempos: $(DAT)

all_tiempos: $(ALL_DAT)

# Calculo de tiempos. NO MODIFICAR
burbuja.dat: burbuja
	for (( i=$(ini_cuadratico); i <= $(fin_cuadratico); i+=$(incremento_cuadratico) )); do \
		cmd="./$< $$i"; \
		echo -en "\r$$cmd"; \
		$$cmd >> $@; \
	done

insercion.dat: insercion
	for (( i=$(ini_cuadratico); i <= $(fin_cuadratico); i+=$(incremento_cuadratico) )); do \
		cmd="./$< $$i"; \
		echo -en "\r$$cmd"; \
		$$cmd >> $@; \
	done

mergesort.dat: mergesort
	for (( i=$(ini_log); i <= $(fin_log); i+=$(incremento_log) )); do \
		cmd="./$< $$i"; \
		echo -en "\r$$cmd"; \
		$$cmd >> $@; \
	done

quicksort.dat: quicksort
	for (( i=$(ini_log); i <= $(fin_log); i+=$(incremento_log) )); do \
		cmd="./$< $$i"; \
		echo -en "\r$$cmd"; \
		$$cmd >> $@; \
	done

floyd.dat: floyd
	for (( i=$(ini_cubico); i <= $(fin_cubico); i+=$(incremento_cubico) )); do \
		cmd="./$< $$i"; \
		echo -en "\r$$cmd"; \
		$$cmd >> $@; \
	done

dijkstra.dat: dijkstra-iterado
	for (( i=$(ini_cubico); i <= $(fin_cubico); i+=$(incremento_cubico) )); do \
		cmd="./$< $$i"; \
		echo -en "\r$$cmd"; \
		$$cmd >> $@; \
	done

fibonacci.dat: fibonacci
	for (( i=$(ini_fibonacci); i <= $(fin_fibonacci); i+=$(incremento_fibonacci) )); do \
		cmd="./$< $$i"; \
		echo -en "\r$$cmd"; \
		$$cmd >> $@; \
	done

hanoi.dat: hanoi
	for (( i=$(ini_hanoi); i <= $(ini_hanoi); i+=$(incremento_hanoi) )); do \
		cmd="./$< $$i"; \
		echo -en "\r$$cmd"; \
		$$cmd >> $@; \
	done
