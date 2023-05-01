/* 
 * File:   Index.cpp
 * @author estudiante1: López Ramírez, Yeray
 * @author estudiante2: Velázquez Ortuño, Diego
 * @warning To be implemented by students 
 */
#include <string>
#include <iostream>
#include <cassert>
#include <fstream>
#include "Index.h"

using namespace std;

void Index::copy(Pair *dest){
    for(int i = 0; i < size(); i++)
        dest[i] = _entries[i];   
}

void Index::copy(const Index &orig){
    for (int i=0; i<orig._nEntries;i++)
        at(i) = orig.at(i);
}


Index::Index(int onBrand) {
    _entries = nullptr;
    initDefault(onBrand);
}

void Index::setIOnWhich(int val) {
    if(val == 2 || val == 1 || val == 0)
        _onBrand = val;
}


Pair * Index::allocate(int capacidad){
    Pair * one = nullptr;
    if(capacidad > 0)
         one = new Pair[capacidad];
    return one;
}

void Index::reallocate(int new_cap){
    if(new_cap >= _capacity){
        Pair * one = allocate(new_cap);
        copy(one);
        deallocate();
        _entries = one;
        _capacity = new_cap;
    }
}
    
void Index::deallocate(){
    if(_entries != nullptr){
        delete [] _entries;
        _entries = nullptr;
    }
}
    
Index::Index(const Index & orig){ //copy constructor
    _nEntries = orig._nEntries;
    _capacity = orig._capacity;
    _onBrand = orig._onBrand;
    _entries = allocate(_capacity);
    copy(orig._entries);
}

//Consults methods

int Index::size() const{
    return _nEntries;
}

int Index::getIOnWhich() const {
    return _onBrand;
}

string Index::getSOnWhich(int onBrand) const {
    string SBrand;
    if(onBrand == -1)
        onBrand = _onBrand;
    
    if(onBrand == 2)
        SBrand = "Session";
    else if(onBrand == 1)
        SBrand = "Brand";
    else
        SBrand = "UserID";
    
    return SBrand;
}

const Pair & Index::at(int pos) const {
    if(pos > -1){
        return _entries[pos];
    }
    else
        return NULL_PAIR;
}

/**
 * @brief Returns the position to the first element in the Index
 * which is not considered to go before key (i.e., either it is equivalent is the first one
 * or it goes after), look at the example.
 * @param key the searching key a string
 * example: // 10 20 30 30 40 50 60 70
 * low_bound(30) ....^
 * low_bound(35) ..........^
 * @return a position in the Index
 */
int Index::lower_bound(const string & key) const{
    int lowerBound = upper_bound(key);
    while(!at(lowerBound-1).isEmpty() && at(lowerBound-1).getKey() == key) //Mientras sea la misma key disminuye lower
        lowerBound--;
    
    return lowerBound;
}

/**
 * @brief Returns the position to the first element in the Index which is considered to go after val.
 * look at the example.
 * example: // 10 20 30 30 40 50 60 70
 * upper_bound(30) ........^
 * upper_bound(35) ........^
 * @param key the searching key a string
 * @return a position in the Index
 */
int Index::upper_bound(const string & key) const{
    int upperBound = BusquedaBinaria(_entries,key,_nEntries);
    while(upperBound < _nEntries && at(upperBound).getKey() == key){ //Mientras sea la misma key aumenta upper
        upperBound++;
    }

    if(upperBound < _nEntries && !at(upperBound).isEmpty())
        if(at(upperBound).getKey() < key) //si está entre un menor y un mayor, coge el mayor. Ej: insertar 5 en: 4 6 . Coge el 6
            upperBound++;
    
    return upperBound;
}

void Index::print()const {
    for(int i = 0; i < _nEntries; i++)
        cout << _entries[i].getPos() << " : " << _entries[i].getKey() << endl;
}

//Modifier methods

/**
 * @brief Build the index using the Brand o the userID as searching key
 * @param evSet origin
 */
void Index::build(const EventSet & evSet, int onBrand) {
    Pair one;
    bool ok;
    string key, field;
    field = getSOnWhich(onBrand);
    initDefault();
    setIOnWhich(onBrand);

    for (int i = 0; i < evSet.size(); i++) {
        key = evSet.at(i).getField(field);
        if (key != "") { // in order not to include NULL in the index, possible in Brand
            one.set(key, i);
            add(one);
        }
    }
}

void Index::initDefault(int onBrand) {
    _nEntries = 0;
    _capacity = 0;
    _onBrand = onBrand;
    deallocate();
}

Pair & Index::at(int pos){
    if(pos > -1){
        return _entries[pos];
    }
    else
        return NULL_PAIR;
}

int Index::add(const Pair & pair, bool orden) {
    string key = pair.getKey();
    int is_valid = 1, pos = 0;
    
    if(_nEntries >= _capacity)
        reallocate(2*_capacity+1);
    
    if(key=="")
        is_valid = false;
    else{
        if(orden){
            pos = upper_bound(key);
            for(int i = _nEntries; i > pos; i--)
                _entries[i] = _entries[i-1];
            _entries[pos]= pair;
        }
        else
            _entries[_nEntries] = pair;

        _nEntries++;
    }
    return is_valid;
}

//New methods

int Index::getCapacity() const{
    return _capacity;
}

Index & Index::operator=(const Index &one){
    if(this != &one){ // si one = one no hace nada
        initDefault();
        _entries = allocate(one._capacity); //reservamos
        _nEntries = one._nEntries;
        _capacity = one._capacity;
        _onBrand = one._onBrand;
        copy(one);
    }
    return *this;
}

Index::~Index(){
    deallocate();
}

// external functions


int BusquedaBinaria (const Pair pair[],string a_buscar, const int util){
      int izda = 0, dcha = util - 1;
      int centro = (izda + dcha) / 2;
      bool encontrado = false;

      while (izda <= dcha  &&  !encontrado){
         if (pair[centro].getKey() == a_buscar)
            encontrado = true;
         else if (a_buscar < pair[centro].getKey())
            dcha = centro - 1;
         else
            izda = centro + 1;

         centro = (izda + dcha) / 2;
      }
      return centro;
}

Event getEvent(const EventSet& evSet,const Index & indx, int pos) {
    int event_pos = indx.at(pos).getPos();
    return evSet.at(event_pos);    
}

void write(ofstream & os, const EventSet& evSet, const Index& indx) {
    int ipos = 0;
    for(int i = 0; i < indx.size(); i++){
        ipos = indx.at(i).getPos();
        os << evSet.at(ipos).to_string() << endl;
    }
}

Index rawFilterIndex(const EventSet & evSet, const Index & indx, const std::string & field, const std::string & value) {
    string IndxField;
    int ini_pos = 0, fin_pos = 0, contador = 0;
    Event one;
    Index sub_indx(indx.getIOnWhich()); // indexa el subindex igual que el principal
    IndxField = indx.getSOnWhich(); //Obtenemos el campo de index en string para comparar
    if (field == IndxField) { // si coinciden podemos aprovecharlo para buscar eficientemente
        ini_pos = indx.lower_bound(value);
        fin_pos = indx.upper_bound(value);
        for (int i = ini_pos; i < fin_pos; i++)
            sub_indx.add(indx.at(i));
    } else {
        for (int i = 0; i < indx.size(); i++) {
            one = getEvent(evSet, indx, i);
            if (one.getField(field) == value || one.getDateTime().sameDay(value)){ //Si es DateTime comprueba si son el mismo dia
                sub_indx.add(indx.at(i));
            }
        }
    }
    
    return sub_indx;
}

float sumPrice(const EventSet& evSet, const Index& indx) {
    float price = 0;

    for (int i = 0; i < indx.size(); i++)
        price += getEvent(evSet, indx, i).getPrice();
    
    return price;
}