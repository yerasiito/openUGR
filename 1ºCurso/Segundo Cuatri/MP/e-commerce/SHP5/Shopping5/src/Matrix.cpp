/* 
 * File:   matrix.cpp
 * @author estudiante1: López Ramírez, Yeray
 * @author estudiante2: Velázquez Ortuño, Diego
 * @warning To be implemented by students 
 */


#include "Matrix.h"
#include <fstream>
#include <assert.h>

using namespace std;

/**
 * @brief Copies the values in a 2D matrix org with nrows and ncols to an also 2D matrix dest.
 * It is assumed that org and dest have the memory properly allocated 
 * @param dest destination matrix
 * @param org  source matrix
 * @param nrows number of rows
 * @param ncols number of cols
 */
void copy(double **dest, double **org, size_t nrows, size_t ncols) {
    for(int i = 0; i < nrows; i++)
        for(int j = 0; j < ncols;j++)
            dest[i][j] = org[i][j];
    
}

/** 
 * @brief this method reserve memory to allocate a 2D matrix of size r x c.
 * @param r number of rows
 * @param c number of cols
 * @return the pointer to the memory block containing the data
 */
double ** allocate(size_t const r,size_t const c) {
    double ** block = new double *[r];
    block[0] = new double[r*c];
    for(int i=1; i < r; i++)
        block[i] = block[i-1]+c;
    return block;
}

/**
 * @brief In this method, given an index idx it returns the key in the position i, 
 * such that i is the first position in the index such that idx.at(i).getPos()==p
 * @param idx the input index
 * @param p number of 
 * @return the key for first position i in the index such that idx.at(i).getPos()==p
 */
string labelWithValuePosInIndex(const Index & idx, size_t p) {
    string salida;

    bool enc = false;
    for (int i = 0; i < idx.size() && !enc; i++) {
        if (idx.at(i).getPos() == p) {
            salida = idx.at(i).getKey();
            enc = true;
        }
    }
    return salida;
}

void Matrix::deallocate() {
    if(_data != nullptr){
        delete[] _data[0];
        delete [] _data;
        _data = nullptr;
    }
}


Matrix::Matrix() {
    clear();
}

void Matrix::setValues(double valor) {
    for(int i = 0; i < _nrows; i++){
        for(int j = 0; j < _ncols;j++)
            _data[i][j] = valor;
    }
}



Matrix::Matrix(size_t f, size_t c, double vdef) {
    _data = allocate(f,c);
    _nrows = f;
    _ncols = c;
    setValues(vdef);
}

Matrix::Matrix(const Matrix& orig) {
    deallocate();
    _data = allocate(orig._nrows,orig._ncols);
    copy(_data, orig._data,_nrows,_ncols);
}
void Matrix::clear(){
    _nrows = 0;
    _ncols = 0;
    _data = nullptr;
    _rowLabels.initDefault();
    _colLabels.initDefault();
}

Matrix::Matrix(const std::string *rowLabels, size_t nrows, const std::string * colsLabels, size_t ncols, double value) {
    if(nrows >= 1 && ncols >= 1){
        clear();
        *this = Matrix(nrows,ncols,value);
        setLabels(_rowLabels,rowLabels, nrows);
        setLabels(_colLabels,colsLabels,ncols);
    }
}

std::string Matrix::labelAtRow(size_t row) const {
    return labelWithValuePosInIndex(_rowLabels, row);
}

std::string Matrix::labelAtCol(size_t col) const {
    return labelWithValuePosInIndex(_colLabels, col);
}

void Matrix::resize(size_t nrows, size_t ncols, double value) {
    *this = Matrix(nrows, ncols, value);
}

void Matrix::resize(const std::string * rowLabels, size_t nrows, const std::string * colLabels, size_t ncols, double value) {
    resize(nrows, ncols, value);
    setLabels(_rowLabels,rowLabels, nrows);
    setLabels(_colLabels,colLabels,ncols);
}

Matrix::~Matrix() {
    deallocate();
}

double & Matrix::at(size_t f, size_t c) {
    assert(f >= 1 && c >= 1);
    return _data[f][c];
}

const double & Matrix::at(size_t f, size_t c) const {
    assert(f >= 1 && c >= 1);
    return _data[f][c];
}

double & Matrix::operator()(size_t f, size_t c) {
    return _data[f][c];
}

const double & Matrix::operator()(size_t f, size_t c) const {
    return _data[f][c];
}

int Matrix::rowIndexOf(const std::string & label) const {
    int pos = npos;
    bool encontrado = false;
    for(int i = 0; i < _nrows && !encontrado; i++){
       if(_rowLabels.getCapacity() != 0 &&_rowLabels.at(i).getKey() == label){
           pos = i;
           encontrado = true;
       }
    }
    return pos;
}

int Matrix::colIndexOf(const std::string & label) const {
    int pos = npos;
    bool encontrado = false;
    for(int i = 0; i < _ncols && !encontrado; i++){
       if(_rowLabels.getCapacity() != 0 && _colLabels.at(i).getKey() == label){
           pos = i;
           encontrado = true;
       }
    }
    
    return pos;
}

double & Matrix::at(const std::string & rowLabel, const std::string & colLabel) {
    return at(rowIndexOf(rowLabel), colIndexOf(colLabel));
}

double & Matrix::operator()(const std::string & rowLabel, const std::string & colLabel) {
    return _data[rowIndexOf(rowLabel)][colIndexOf(colLabel)];
}

const double & Matrix::at(const std::string & rowLabel, const std::string & colLabel)const {
    return at(rowIndexOf(rowLabel), colIndexOf(colLabel));
}

const double & Matrix::operator()(const std::string & rowLabel, const std::string & colLabel)const {
    return at(rowLabel,colLabel);
}

ostream & operator<<(ostream & flujo, const Matrix& m) {
    flujo << m._nrows << " " << m._ncols << endl; //Tamaño de la matriz
    
    for(int i = 0; i < m._rowLabels.size(); i++) //Etiquetas de la fila
        flujo << m.labelAtRow(i) << " ";
    flujo << endl;
    
    for(int i = 0; i < m._colLabels.size(); i++) //Etiquetas de la columna
        flujo << m.labelAtCol(i) << " ";
    flujo << endl;  
    
    for(int i = 0; i < m._nrows; i++){ //valores de la matriz en sí
        for(int j = 0; j < m._ncols;j++) //Las condiciones interiores son meramente esteticas
            if(j+1 < m._ncols && m._data[i][j+1] > 9)
                flujo << m._data[i][j] << " ";
            else
                flujo << m._data[i][j] << "  ";      
        flujo << endl;
    }
    return flujo;
}

Matrix & Matrix::operator=(const Matrix& m) {
    if(this != &m){ // si one = one no hace nada  
        if(_nrows < m._nrows && _ncols < m._ncols){ //No hay espacio, reservamos memoria
            deallocate();
            _data = allocate(m.rows(),m.columns());
            _nrows = m._nrows;
            _ncols = m._ncols;
        }
        copy(_data, m._data, m._nrows,m._ncols); //Copia los valores
        
        _rowLabels = m._rowLabels;
        _colLabels = m._colLabels;
    }
    return *this;
}

void Matrix::setLabels(Index & idx, const string * labels, int nlabels){
    int lb,ub;
    for (int i = 0; i < nlabels; i++){
        lb = idx.lower_bound(labels[i]);
        ub = idx.upper_bound(labels[i]);
        if (lb == ub) // it is NOT in the set
            idx.add(Pair(labels[i],i), 0); //Como no queremos que lo ordene, le pasamos un 0
        else
            idx.initDefault();
    }
    
}

int Matrix::getLabels(const Index & idx, string * labels) const {
    if (idx.size() > 0) {
        for (int i = 0; i < idx.size(); i++) {
            labels[i] = idx.at(i).getKey();
        }
    }
    return idx.size();
}

int Matrix::getRowLabels(string * labels) const {
    return getLabels(_rowLabels,labels);
}

int Matrix::getColLabels(string *labels) const {
    return getLabels(_colLabels,labels);
}

size_t Matrix::columns() const {
    return _ncols;
}

size_t Matrix::rows() const {
    return _nrows;
}

void Matrix::save(const string & nf) const{
    ofstream fsal(nf);
    if (fsal.is_open()) {
        fsal << "#matrix "; 
        if (_rowLabels.size()==0)
            fsal << "unlabeled"<< endl;
        else fsal << "labeled" << endl;
        fsal << *this;
        fsal.close();
    } else cerr << "Fail creating " << nf << " file" <<endl;
}

void Matrix::load(const string & nf) {
    ifstream fent(nf);
    string labeled, cad;
    clear();
    if (fent.is_open()) {
         fent >> cad >> labeled;
         fent >> _nrows >> _ncols;
         if (labeled == "labeled"){
            for (int i=0;i<_nrows;i++){
                fent >> cad;
                _rowLabels.add(Pair(cad,i));
            }
             for (int i=0;i<_ncols;i++){
                fent >> cad;
                _colLabels.add(Pair(cad,i));
            }
        }
        _data = allocate(_nrows,_ncols); 
        for (int i = 0; i < _nrows; i++) {
            for (int j = 0; j < _ncols; j++) {
                fent >> _data[i][j];
            }
        }
        fent.close();
    } else cerr << "Fail reading " << nf << " file" <<endl;
}

Matrix & Matrix::operator*=(double val) {
    for(int i = 0; i < _nrows; i++)
        for(int j = 0; j < _ncols;j++)
            _data[i][j] *= val;   
    
    return *this;
}

Matrix & Matrix::operator+=(double val) {
    for(int i = 0; i < _nrows; i++)
        for(int j = 0; j < _ncols;j++)
            _data[i][j] += val;     
    
    return *this;
}

Matrix Matrix::operator*(const Matrix & m) const {
    Matrix one(_nrows,m._ncols);
    assert(_ncols == m._nrows);
    double suma = 0;
    for(int i = 0; i < m.columns(); i++){
        for(int j = 0; j < _nrows; j++){
            suma = 0;
            for(int h = 0; h < _ncols; h++)
                suma += _data[j][h] * m._data[h][i];
            one._data[j][i] = suma;
        }
    }
    one._rowLabels = m._rowLabels;
    one._colLabels = m._colLabels;
    
    return one;
}

Matrix Matrix::operator+(double val) const {
    Matrix one(_nrows,_ncols);
    for(int i = 0; i < _nrows; i++)
        for(int j = 0; j < _ncols;j++)
            one._data[i][j] = _data[i][j] + val;   
    
    return one;
}

Matrix Matrix::operator*(double val) const {
    Matrix one;
    for(int i = 0; i < _nrows; i++)
        for(int j = 0; j < _ncols;j++)
            one._data[i][j] = _data[i][j] * val;   
    
    return one;    
}

Matrix operator+(double ival, const Matrix & dch) {
    Matrix one;
    for(int i = 0; i < dch._nrows; i++)
        for(int j = 0; j < dch._ncols; j++)
            one._data[i][j] = dch._data[i][j] + ival;   
    
    return one; 
}

Matrix operator*(double ival, const Matrix & dch) {
    Matrix one(dch._nrows,dch._ncols);
    for(int i = 0; i < dch._nrows; i++)
        for(int j = 0; j < dch._ncols; j++)
            one._data[i][j] = ival * dch._data[i][j];   
    return one;    
}

void Matrix::normalize(){
    double suma = 0.0;
    for(int i = 0; i < _nrows; i++){
        for(int j = 0; j < _ncols;j++)
            suma += _data[i][j]; 
        if(suma == 0){
            suma = _ncols;
            for(int j = 0; j < _ncols;j++)
                _data[i][j]= 1.0/suma;             
        }
        else
            for(int j = 0; j < _ncols;j++){
                _data[i][j]/= suma; 
        }
        suma = 0;
    }
}

double Matrix::Vabs(const Matrix & anterior){
    double total = 0;
    for(int i = 0; i < _nrows; i++)
        for(int j = 0; j < _ncols; j++)
            total += abs(_data[i][j] - anterior._data[i][j]);
    return total;
}
            
            
            
            