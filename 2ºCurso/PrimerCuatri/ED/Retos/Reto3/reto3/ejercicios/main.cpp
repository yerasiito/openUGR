/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/* 
 * File:   main.cpp
 * Author: yerasito
 *
 * Created on 28 de noviembre de 2021, 22:49
 */

#include <cstdlib>
#include <iostream>
#include <list>
#include <assert.h>
using namespace std;

void enunciado(){
    cout << "\n********************************************************************************" << endl;
    cout << "Ejercicio 24:" << endl;
    cout << "  Implementar una función " << endl
            << "    void postintercalar(list<int> & L1, list<int> & L2);" << endl
            << "que permita 'postintercalar' dos listas de enteros (intercalar alternativamente" << endl
            << "todos los elementos que las integran de final a principio), con los siguientes" << endl
            << "requisitos:" << endl
            << "(a) Hay que comprobar que las dos listas L1 y L2 no son vacías" << endl
            << "(b) Se empieza por el primer elemento de la primera lista L1" << endl
            << "(c) La segunda lista L2 contendrá el resultado final y la primera quedará vacía." << endl
            << "(d) Si una de ellas tiene un menor número de elementos que la otra, el exceso de" << endl
            << "nodos se incorporará a la lista resultante." << endl
            << "Ejemplo:" << endl
            << "Primera lista, L1 : (100,200); Segunda lista. L2: (1,2,3,4,5,6)" << endl
            << "Despues de aplicar la función:" << endl
            << "L2: (1,2,3,4,200,5,100,6); L1: vacia" << endl;
    cout << "********************************************************************************\n" << endl;
}

void introduce(list<int> & L1, list<int> & L2){
    int dato;
    
    cout << "Introduce los valores de la primera lista:(0 para terminar) " << endl;
    cin >> dato;
    while(dato != 0){
        L1.push_front(dato);
        cin >> dato;
    }
    
    cout << "Introduce los valores de la segunda lista:(0 para terminar) " << endl;
    cin >> dato;
    while(dato != 0){
        L2.push_front(dato);
        cin >> dato;
    }
}


void imprimir(const list<int> & L1, const list<int> & L2){
    list<int> aux1 = L1, aux2 = L2;
    cout << "\nL1 contiene:";
    while(!aux1.empty()){
        cout << " " << aux1.back();
        aux1.pop_back();
    }
    
    cout << "\nL2 contiene:";
    while(!aux2.empty()){
        cout << " " << aux2.back();
        aux2.pop_back();
    }
    cout << endl;
}


void posintercalar(list<int> & L1, list<int> & L2){
    list<int>::iterator it;
    list<int> aux1 = L1, aux2 = L2;
    
    //Que no esten vacias
    assert(!L1.empty());
    assert(!L2.empty());
    
    it = L2.begin();
    it++;
    for(;!L1.empty() && L2.front() != *it; ++it){ //se sale si L1 vacia o L2 vuelve al principio
        L2.insert(it,L1.back());  
        L1.pop_back();
    }
    
    if(*it == L2.front()){ //Mete el resto de L1 en L2
        it = L2.end();
        while(!L1.empty()){
            L2.insert(it,L1.back());  
            L1.pop_back();  
        }
    }
}


int main (){
    enunciado();
    list<int> L1, L2;
    
    introduce(L1,L2);
    imprimir(L1, L2);
    posintercalar(L1,L2);
    imprimir(L1, L2);
  

  return 0;
}