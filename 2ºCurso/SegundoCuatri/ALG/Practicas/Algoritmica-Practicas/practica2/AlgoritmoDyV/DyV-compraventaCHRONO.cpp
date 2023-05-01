#include <iostream>
#include <vector>
#include <algorithm> 
#include <chrono>
#include <ctime>

using namespace std::chrono;
using namespace std;

high_resolution_clock::time_point tantes, tdespues;
duration<double> transcurrido;

 int indice_min;
 int indice_max;

int encontrarMinimo_izq(vector<int> &sentencia, int l, int r, int &dC){
	int minimo = sentencia[l];
	dC = l;
	for(int i = l; i <= r; i++){
		if(sentencia[i] < minimo){
			minimo = sentencia[i];
			dC= i;
		}
	}
	return minimo;
}

int encontrarMaximo_der(vector<int> &sentencia, int l, int r, int &dV){
	int maximo = sentencia[l];
	dV=l;
	for( int i = l; i <= r; i++){
		if(sentencia[i] > maximo){
			maximo = sentencia[i];
			dV = i;
		}
	}
	return maximo;
}


int maxDiferencia(vector<int> &sentencia, int minimo, int maximo, int &dC, int &dV){
	
  if (minimo>= maximo){
  	dC = dV = minimo;
  	return -9999; 
  }
  int maxDiff = -99999, diaC, diaV;
  int mitad = (maximo + minimo) / 2;
  int izq_maxDiff = maxDiferencia(sentencia, minimo, mitad, dC, dV);
  diaC = dC;
  diaV = dV;
  int der_maxDiff = maxDiferencia(sentencia, mitad+1, maximo, dC, dV);
  if (izq_maxDiff > der_maxDiff){
  	maxDiff = izq_maxDiff;
  }else{
  	diaC = dC;
  	diaV = dV;
  	maxDiff = der_maxDiff;
  }
  int minimo_izq = encontrarMinimo_izq(sentencia, minimo, mitad, dC);
  int maximo_der = encontrarMaximo_der(sentencia, mitad + 1, maximo, dV);

  if ((maximo_der - minimo_izq) > maxDiff){
  	maxDiff = maximo_der - minimo_izq;
  	diaC = dC;
  	diaV = dV;
  }
  dC = diaC;
  dV = diaV;
  return maxDiff;
  
}



int main(int argc, char** argv){
	vector<int> sentencia;
	int valor_neto_obtenido;
	int diaCompra, diaVenta; 
	
	if (argc != 2)
   	{
        cerr << "Formato " << argv[0] << " <num_elem>" << endl;
        return -1;
    	}

    	srandom(time(0));
    	int n = atoi(argv[1]);

    	for (int i = 0; i < n; i++)
    	{
        	sentencia.push_back(random()%500);
    	}
	
	tantes = high_resolution_clock::now();
	
	valor_neto_obtenido = maxDiferencia(sentencia, 0, sentencia.size()-1, diaCompra, diaVenta);

    	tdespues = high_resolution_clock::now();
    	transcurrido = duration_cast<duration<double>>(tdespues - tantes);
    	cout << n << " " << transcurrido.count() << endl;
}
	
