/**
 * @file Event.cpp
 * @author estudiante1: López Ramírez, Yeray
 * @author estudiante2: Velázquez Ortuño, Diego 
 * @note To be implemented by students 
 * 
 */

#include <string>
#include "Event.h"
#include <fstream>
using namespace std;

Event NULL_EVENT=Event();

//Funciones Privadas
void Event::initDefault() {
    set(EVENT_DEFAULT);
}

//Constructores

Event::Event() {
    initDefault();
}

Event::Event(const string & line) {
    set(line);
}

//Getters

DateTime Event::getDateTime() const {
    return _dateTime;
}

string Event::getType() const {
    return _type;
}

string Event::getProductID() const {
    return _prod_id;
}

string Event::getCategoryID() const {
    return _cat_id;
}

string Event::getCategoryCode() const {
    return _cat_cod;
}

string Event::getBrand() const {
    return _brand;
}

double Event::getPrice() const {
    return _price;
}

string Event::getUserID() const {
    return _user_id;
}

string Event::getSession() const {
    return _session;
}

//Setters

void Event::setDateTime(const string & time) {
    _dateTime.set(time);
}

void Event::setType(const string &type) {
    //Establece el tipo al defecto "view".
    _type = VALID_TYPES[0];
    
    //Comprueba si es alguno de los 4 tipos es el que nos dan y si es así lo cambia.
    if (type == "view" || type == "purchase" || type == "remove_from_cart" || type == "cart")
        _type = type;
}

void Event::setProductID(const string & prod_id) {
    //Comprueba si es el valor vacío y si no le asigna el dado.
    if (prod_id == "")
        _prod_id = EMPTY_FIELD;
    else
        _prod_id = prod_id;
 }

void Event::setCategoryID(const string & cat_id) {
    _cat_id = cat_id;
}

void Event::setCategoryCode(const string & cat_cod) {
    _cat_cod = cat_cod;
}

void Event::setBrand(const string & brand) {
    _brand = brand;
}

void Event::setPrice(double price) {
    //Comprueba si el precio dado es menor que cero y si es así le asigna el defecto.
    if(price >= 0)
        _price = price;
    else
        _price = -1.000000;
}

void Event::setUserID(const string & user_id) {
    //Comprueba si es el valor vacío y si no le asigna el dado.
    if (user_id == "")
        _user_id = EMPTY_FIELD;
    else
        _user_id = user_id;
}

void Event::setSession(const string & session) {
    //Comprueba si es el valor vacío y si no le asigna el dado.
    if (session == "")
        _session = EMPTY_FIELD;
    else
        _session = session;
}

//Asigna mediante los setters a cada variable el valor que ha sido devuelto por referencia del split. 
void Event::set(const string &line) {
  string fecha, hora, cadena;
    int pos_ini, pos_fin; // aux for the beginning of the fields

    pos_ini = 0;
    pos_fin = line.find(',', pos_ini); // comienzo del siguiente campo
    for (int i = 0; i < 8 && pos_fin != -1; i++) { //-1 si find no encuentra la ","
        cadena = line.substr(pos_ini, pos_fin - pos_ini);
        pos_ini = pos_fin + 1;
                if(i == 0)
            setDateTime(cadena);
        else if(i == 1)
            setType(cadena);
        else if(i == 2)
            setProductID(cadena);
        else if(i == 3)
            setCategoryID(cadena);
        else if(i == 4)
            setCategoryCode(cadena);
        else if(i == 5)
            setBrand(cadena);
        else if(i == 6)
            setPrice(stod(cadena));
        else if(i == 7)
            setUserID(cadena);
        
        pos_fin = line.find(',', pos_ini); // comienzo del siguiente "campo"
    }
    // el ultimo campo no tiene coma
    pos_fin = line.length();
    cadena = line.substr(pos_ini, pos_fin - pos_ini);
    setSession(cadena);
}

//Otros Metodos

bool Event::isEmpty() const {
    bool is_empty = false;
    
    //Comprueba si alguna de las 3 variables que NO deben estar vacías lo están, y si es así devuelve true.
    if (_prod_id == EMPTY_FIELD || _price < 0 || _user_id == EMPTY_FIELD || _session == EMPTY_FIELD)
        is_empty = true;
    
    return is_empty;
}

string Event::to_string() const {
    std::string salida;
    salida += _dateTime.to_string();
    salida += "," + _type;
    salida += "," + _prod_id;
    salida += "," + _cat_id;
    salida += "," + _cat_cod;
    salida += "," + _brand;
    salida += "," + std::to_string(_price);
    salida += "," + _user_id;
    salida += "," + _session;
    return salida;
}

string Event::getField(const string & field) const {
    string result = EMPTY_FIELD;
    if (field == "DateTime") {
        result = getDateTime().to_string();
    } else if (field == "Type") {
        result = getType();
    } else if (field == "ProductID") {
        result = getProductID();
    } else if (field == "CategoryID") {
        result = getCategoryID();
    } else if (field == "CategoryCode") {
        result = getCategoryCode();
    } else if (field == "Brand") {
        result = getBrand();
    } else if (field == "Price") {
        result = std::to_string(getPrice());
    } else if (field == "UserID") {
        result = getUserID();
    } else if (field == "Session") {
        result = getSession();
    }
    return result;
}
void Event::write(ostream & os) const {
    os << to_string() << endl;
}

void Event::read(istream & is) {
    char cadena[200];
    is.getline(cadena,200,'\n');
    set(cadena);
}
