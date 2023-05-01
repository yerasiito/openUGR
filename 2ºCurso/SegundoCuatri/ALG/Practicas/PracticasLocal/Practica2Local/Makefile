CPP=$(wildcard *.cpp)
EXE=$(basename $(CPP))

# Modifica aquí para ajustar el nivel de optimización (de 0 a 3):
CPPFLAGS=-O0 -std=gnu++0x
DAT=compraVentaTrivial.dat

.PHONY: default clean tiempos

default: $(EXE)

clean:
	rm -f $(EXE) $(DAT)

# Modifica aquí para cambiar los puntos de inicio, fin y los saltos:
ini_trivial=1000
fin_trivial=25000
incremento_trivial=1000

tiempos: $(DAT)

all_tiempos: $(ALL_DAT)

# Calculo de tiempos. NO MODIFICAR
.SILENT:
compraVentaTrivial.dat: compraVentaTrivial
	for (( i=$(ini_trivial); i <= $(fin_trivial); i+=$(incremento_trivial) )); do \
		./genera-compraventa
		cmd="./$< $$i"; \
		echo -en "\r$$cmd"; \
		$$cmd >> $@; \
	done

