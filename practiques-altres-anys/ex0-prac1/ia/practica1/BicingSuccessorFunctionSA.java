package ia.practica1;

import java.util.ArrayList;
import java.util.List;
import java.util.Random;

import aima.search.framework.Successor;
import aima.search.framework.SuccessorFunction;

public class BicingSuccessorFunctionSA implements SuccessorFunction {

	@Override
	public List<Successor> getSuccessors(Object state) {
		ArrayList<Successor> sucesor = new ArrayList<Successor>();
		BicingState bs = (BicingState) state;
		BicingHeuristicFunction bh = new BicingHeuristicFunction();
		BicingState bnew;
		Random randomNum = new Random();
		int numEstaciones = bs.getNumEstaciones();
		int numFurgonetas = bs.getNumFurgonetas();
		if (BicingState.F == 0) return sucesor;
		
		int evitarBuclesInfinitos = 0;
		
		while (sucesor.isEmpty()) {
			if (evitarBuclesInfinitos++ == 10) return sucesor;
			
			Furgoneta f = null;
			int estOri = -1;
			int estDest1 = -1;
			int estDest2 = -1;
			int cantD1 = 0;
			
			int numFurgo = -1;
			if (numFurgonetas > 0) {
				numFurgo = randomNum.nextInt(numFurgonetas);
				f = bs.getFurgoneta(numFurgo);
				estOri = f.getOrigen();
				estDest1 = f.getDestino1();
				estDest2 = f.getDestino2();
				cantD1 = f.getCantidad1();
			}
			
			int caso = 0;
			if (numFurgo != -1) {
				caso = randomNum.nextInt(3);
				if (BicingState.F == numFurgonetas) caso = (caso%2) + 1;
			}
			switch (caso) {
				case 0:
					// Agregar furgoneta a destino
					estOri = randomNum.nextInt(numEstaciones);
					while (bs.tieneOrigen(estOri)) estOri = randomNum.nextInt(numEstaciones);
					int dest = estOri;
					while (dest == estOri) dest = randomNum.nextInt(numEstaciones);
					int cantidad = 0;
					int numMovibles = bs.getNumBicicletasMovibles(cantidad + 1);
					if (numMovibles > 0) {
						while (cantidad == 0) cantidad = randomNum.nextInt(numMovibles + 1);
					
						bnew = new BicingState(bs);
						if (bnew.agregarFurgoneta(estOri, dest, cantidad)) {
							String frase = "Mover: " + estOri + " -(" + cantidad + ")-> " + dest + " [H: " + bh.getHeuristicValue(bnew) + "]";
							sucesor.add(new Successor(frase, bnew));
						}
					}
					break;
				case 1:
					// Modificar destino 2 de una furgoneta
					estDest2 = randomNum.nextInt(numEstaciones + 1);
					if (estDest2 == numEstaciones) estDest2 = -1;
					
					bnew = new BicingState(bs);
					if (estDest2 == -1) {
						int cant = cantD1 + f.getCantidad2();
						
						if (bnew.modificarTrayecto2(numFurgo, -1, cant, 0)) {
							String frase = "Modificar trayecto: " + estOri + " -(" + cant + ")-> " + f.getDestino1() + "[H: " + bh.getHeuristicValue(bnew) + "]";
							sucesor.add(new Successor(frase, bnew));
						}
					}
					else {
						if (cantD1 <= 1) break;
						int cantD2 = f.getCantidad1();
						cantD2 = 1 + randomNum.nextInt(cantD1 - 1);
						int cant1New = cantD1 - cantD2;
						
						if (bnew.modificarTrayecto2(numFurgo, estDest2, cant1New, cantD2)) {
							String frase = "Modificar trayecto: " + estOri + " -(" + cant1New + ")-> " + estDest1 + " -(" + cantD2 + ")-> "  + estDest2 + " [H: " + bh.getHeuristicValue(bnew) + "]";
							sucesor.add(new Successor(frase, bnew));
						}
					}
					
					break;
				case 2:
					// Quitar furgoneta
					bnew = new BicingState(bs);
					if (bnew.quitarFurgoneta(numFurgo)) {
						String frase = "Quitar furgoneta con origen en " + bs.getFurgoneta(numFurgo).getOrigen() + " [H: " + bh.getHeuristicValue(bnew) + "]";
						sucesor.add(new Successor(frase, bnew));
					}
			}
		}
		return sucesor;
	}

}
