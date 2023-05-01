/* 
 * File:   Pair.cpp
 * @author estudiante1: López Ramírez, Yeray
 * @author estudiante2: Velázquez Ortuño, Diego
 * @warning To be implemented by students
 */
#include <string>

#include "Pair.h"

using namespace std;

Pair NULL_PAIR = Pair();

Pair::Pair()  {
    initDefault();
}

Pair::Pair(const std::string & key, int pos) {
    if (!isEmpty()){
        _key = key;
        _pos = pos;
    }
    else
        initDefault();
}

bool Pair::isEmpty() const{
    return _key==EMPTY_FIELD && _pos==-1;
}

const std::string & Pair::getKey() const {
    return _key;
}

const int Pair::getPos() const {
    return _pos;
}

void Pair::setKey(const std::string & key) {
    _key = key;
}

void Pair::setPos(int pos) {
    _pos = pos;
}

void Pair::set(const string & key, int pos) {
    if (key == EMPTY_FIELD && pos>-1)
        initDefault();
    else{
        setKey(key);
        setPos(pos);
    }
}

string Pair::to_string() const { 
    string _pair = _key + " " + std::to_string(_pos); //el to_string() en pos es diferente. Pasa la posicion a string
    return _pair;
}

void Pair::initDefault() {
    _key = EMPTY_FIELD;
    _pos = -1;
}

bool equalKey(const Pair & left, const Pair & right) {
    return left.getKey() == right.getKey();
}
