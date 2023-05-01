#ifndef fecha_h
#define fecha_h

#include <stdio.h>
using namespace std;

class Fecha{
private:
  int dia;
  int mes;
  int anio;
public:


/*
 TDA Fecha
 Fecha: constructor, dia, mes, año, siguiente, anterior,
 escribe, lee, menor, menor o igual
 
 Definición:
 Fecha representa fechas según el calendario occidental
 Son objetos mutables
 Residen en memoria estática
 
 Operaciones:
 */

/**
 @brief Constructor con parámetros.
 @param dia dia de la fecha. 0 < dia <= 31.
 @param mes mes de la fecha. 0 < mes <= 12.
 @param anio año de la fecha.
 @pre Los tres argumentos deben representar una fecha válida
 según el calendario occidental.
 @return Objeto Fecha correspondiente a la fecha dada por los argumentos.
 @doc
 Crea un objeto Fecha a partir de los argumentos.
 Devuelve el objeto creado sobre f.
 */
 Fecha(int dia, int mes, int anio);


/**
 @brief Lee una fecha de una cadena.
 @param cadena Cadena de caracteres que representa
 una fecha en formato dd/mm/aaaa.
 @post El objeto *this contiene la fecha leída en cadena.
 */
 void lee(char cadena[]);

/**
 @brief Obtiene el día del objeto sobre el que se instancia.
 @return Día del objeto *this.
 */
 int getDia();

/**
 @brief Obtiene el mes del objeto sobre el que se instancia.
 @return  Mes del objeto *this.
 */
 int getMes();

/**
 @brief Obtiene el año del objeto sobre el que se instancia.
 @return Año del objeto *this.
 */
 int getAnio();

/**
 @brief Escribe el objeto receptor en una cadena.
 @param cadena Cadena que recibe la expresión de f.
 Debe tener suficiente espacio.
 Es MODIFICADO.
 @return Cadena escrita.
 @doc
 Sobre ’cadena’ se escribe una representación en formato ’dd/mm/aaaa’
 del objeto f. Devuelve la dirección de la cadena escrita.
 */
 char * Escribe (char * cadena);

/**
 @brief Devuelve la fecha siguiente a la que representa el objeto.
 */
  Fecha Siguiente();

/**
 @brief Cambia f por la fecha anterior a la que representa.
 @param f Objeto receptor. Es MODIFICADO.
 */
void Anterior(Fecha & f);

/**
 @brief Decide si f1 es anterior a f2.
 @param f1
 @param f2 Fechas que se comparan.
 @return
 true, si f1 es una fecha estrictamente anterior a f2.
 false, en otro caso.
 */
bool menor(Fecha f1, Fecha f2);

/**
 @brief Decide si f1 es anterior o igual que f2.
 @param f1
 @param f2 Fechas que se comparan.
 @return
 true, si f1 es una fecha anterior o igual a f2.
 false, en otro caso.
 */
bool menor_o_igual(Fecha f1, Fecha f2);
};
#endif /* fecha_h */

