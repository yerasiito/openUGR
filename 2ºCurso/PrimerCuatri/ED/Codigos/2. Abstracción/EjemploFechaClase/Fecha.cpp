#include <stdio.h>
#include <cstring>
#include "Fecha.hpp"

using namespace std;


Fecha::Fecha(int dia, int mes, int anio){
  this->dia = dia;
  this->mes = mes;
  this->anio = anio;
}

void Fecha::lee(char * cadena){
  sscanf(cadena, "%d/%d/%d", &(dia), &(mes), &(anio));
}

int Fecha::getDia(){
  return dia;
}

int Fecha::getMes(){
  return mes;
}

int Fecha::getAnio(){
  return anio;
}

char * Fecha::Escribe (char * cadena){
  sprintf(cadena, "%2d/%2d/%4d", dia, mes, anio);
  return cadena;
}

Fecha Fecha::Siguiente(){
  Fecha sig;
  int limite_dia;
  switch (mes) {
    case 1:
    case 3:
    case 5:
    case 7:
    case 8:
    case 10:
    case 12:
      limite_dia = 31;
      break;
    case 2:
      limite_dia = 28;
      break;
    case 4:
    case 6:
    case 9:
    case 11:
      limite_dia = 30;
      break;
  }
  
  sig = *this;
  
  while ((sig.dia +1) > limite_dia){
    sig.dia -= limite_dia;
    if (sig.mes == 12){
      sig.mes = 0;
      sig.anio++;
    }
    sig.mes++;
  }
  sig.dia++;
}


void Anterior(Fecha & f){
  
}



bool menor(Fecha f1, Fecha f2){
  bool resultado;
  if (f1.anio>f2.anio)
    resultado = false;
  else if (f1.anio<f2.anio)
    resultado = true;
  else if (f1.mes>f2.mes) //Años iguales. Vemos el mes
    resultado = false;
  else if (f1.mes<f2.mes)
    resultado = true;
  else if(f1.dia>=f2.dia) //Años y meses iguales. Vemos el día
    resultado = false;
  else if(f1.dia<f2.dia)
    resultado = true;
  else
    resultado = false;
  
  return resultado;
}

bool menor_o_igual(Fecha f1, Fecha f2){
  return true;
}



