/* 
 * File:   EventSet.cpp
 * @author estudiante1: López Ramírez, Yeray
 * @author estudiante2: Velázquez Ortuño, Diego
 * @note To be implemented by students 
 */


#include <unordered_map>
#include "EventSet.h"
#include <fstream>
#include <iostream>
using namespace std;

int findString(const string array[], int n_array, const string & name) {
    int pos = -1;
    bool encontrado = false;
    for (int i = 0; i < n_array && !encontrado; i++)
        if (array[i] == name) {
            pos = i;
            encontrado = true;
        }

    return pos;
}

std::string EventSet::to_string() const {
    string result;
    result = std::to_string(_nEvents) + " ";
    for (int i = 0; i < _nEvents; i++)
        result += _events[i].to_string() + "\n";
    return result;
}

EventSet::EventSet() {
    _events = nullptr;
    initDefault();
}

int EventSet::size() const {
    return _nEvents;
}

void EventSet::initDefault() {
    _nEvents = 0;
    _capacity = 0;
    deallocate();
}

Event * EventSet::allocate(int capacidad) {
    Event * one = nullptr;
    if(capacidad > 0)
        one = new Event[capacidad];
    return one;
}

void EventSet::reallocate(int new_cap) {
    if(new_cap >= _capacity){
        Event *one = allocate(new_cap);
        copy(one);
        deallocate();
        _events = one;
        _capacity = new_cap;
    }
}

void EventSet::deallocate() {
    if (_events != nullptr) {
        delete [] _events;
        _events = nullptr;
    }
}
void EventSet::copy(Event *dest) const{
    for (int i = 0; i < _nEvents; i++)
        dest[i] = _events[i]; // dest[i] = at(i);
}

void EventSet::copy(const EventSet &orig) {
    _nEvents = orig.size();
    for (int i = 0; i < _nEvents; i++)
        _events[i] = orig.at(i);
}

EventSet::EventSet(const EventSet & orig) { //Contructor de copia
    _nEvents = orig.size();
    _capacity = orig.getCapacity();
    _events = allocate(_capacity);
    copy(orig);
}

EventSet::~EventSet() {
    deallocate();
}

EventSet & EventSet::operator=(const EventSet & one) {
    if (this != &one) { // si one = one no hace nada  
        initDefault();
        reallocate(one._capacity);
        _nEvents = one.size();
        copy(one);
    }
    return *this;
}

int EventSet::getCapacity() const {
    return _capacity;
}

int EventSet::add(const Event & e) {
    if (_nEvents >= _capacity)
        reallocate(2*_capacity+1);
    
    _events[_nEvents] = e;
    _nEvents++;

    return 1;
}

int EventSet::add(const std::string & line) {
    Event e(line);
    return add(e);
}

const Event & EventSet::at(int pos) const {
    if (pos >= 0 && pos < _nEvents)
        return _events[pos];
    else
        return NULL_EVENT;
}

Event & EventSet::at(int pos) {
    if (pos >= 0 && pos < _nEvents)
        return _events[pos];
    else
        return NULL_EVENT;
}

EventSet rawFilterEvents(const EventSet & es, const std::string & field, const std::string & value) {
    EventSet subSet;

    //Añade una nueva cadena a subSet cuando el valor del campo en "EventSet es" es igual al valor pasado como parámetro
    for (int i = 0; i < es.size(); i++)
        if (es.at(i).getField(field) == value)
            subSet.add(es.at(i));

    return subSet;
}

void findUnique(const EventSet & es, const std::string & field, std::string values[], int & n_values) {
    n_values = 0;
    for (int i = 0; i < es.size(); i++) {
        if (field == "DateTime") { //En el caso de ser el campo DateTime, comprueba si los dias son iguales 
            DateTime fecha = es.at(i).getDateTime();

            if (n_values == 0) //Si es 0, no se compara con el anterior
                values[n_values++] = fecha.to_string().erase(10, 25) + " 00:00:00 UTC";
            else if (!fecha.sameDay(values[n_values - 1]))
                values[n_values++] = fecha.to_string().erase(10, 25) + " 00:00:00 UTC";

        }
        if (field != "DateTime" && findString(values, n_values, es.at(i).getField(field)) == -1) {
            values[n_values++] = es.at(i).getField(field);
        }
    }
}

float sumPrice(const EventSet & evSet) {
    double total = 0;
    for (int i = 0; i < evSet.size(); i++)
        total += evSet.at(i).getPrice();
    return total;
}

void EventSet::write(ofstream & os) const {
    ostream &e = os;
    for (int i = 0; i < _nEvents; i++)
        _events[i].write(e);
}

bool EventSet::read(ifstream & is, int nelements) {
    bool is_correct = true;
    istream &a = is;
    Event one;
    initDefault();
    for (int i = 0; i < nelements && is_correct; i++) {
        one.read(is);
        if (is.eof())
            is_correct = false;
        if (!one.isEmpty())
            is_correct = add(one);
    }
    return is_correct;
}
