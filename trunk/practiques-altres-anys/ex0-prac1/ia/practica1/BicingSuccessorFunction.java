package ia.practica1;

import java.util.ArrayList;
import java.util.List;
import aima.search.framework.Successor;
import aima.search.framework.SuccessorFunction;

public class BicingSuccessorFunction implements SuccessorFunction {

	@Override
	public List<Successor> getSuccessors(Object state) {
		ArrayList<Successor> sucesores = new ArrayList<Successor>();
		BicingState bs = (BicingState) state;
		BicingHeuristicFunction bh = new BicingHeuristicFunction();
		BicingState bnew;
		int numEstaciones = bs.getNumEstaciones();
		int numFurgonetas = bs.getNumFurgonetas();
		
		// Aregar furgonetas
		for (int i = 0; i < numEstaciones; ++i) {
			if (!bs.tieneOrigen(i)) {
				int cantidad = bs.getNumBicicletasMovibles(i);
				while (cantidad > 0) {
					for (int dest = 0; dest < numEstaciones; ++dest) {
						bnew = new BicingState(bs);
						if (bnew.agregarFurgoneta(i, dest, cantidad)) {
							String frase = "Mover: " + i + " -(" + cantidad + ")-> " + dest + " [H: " + bh.getHeuristicValue(bnew) + "]";
							sucesores.add(new Successor(frase, bnew));
						}
					}
					--cantidad;
				}
			}
		}
		
		
		
		// Modificar trayecto 2
		// Por cada furgoneta
		for (int i = 0; i < numFurgonetas; ++i) {
			Furgoneta f = bs.getFurgoneta(i);
			
			int ori = f.getOrigen();
			int cantD1 = f.getCantidad1();
			int dest1 = f.getDestino1();
			// Modificamos el destino2
			
			// Eliminamos el segundo destino
			bnew = new BicingState(bs);
			int cant = f.getCantidad1() + f.getCantidad2(); // Si enviabamos bicis a dest2 tendremos que devolvérselas a dest1
			if (bnew.modificarTrayecto2(i, -1, cant, 0)) {
				String frase = "Modificar trayecto: " + ori + " -(" + cant + ")-> " + dest1 + "[H: " + bh.getHeuristicValue(bnew) + "]";
				sucesores.add(new Successor(frase, bnew));
			}
			
			// Probamos con todas las demás estaciones
			for (int dest = 0; dest < numEstaciones; ++dest) {
				for (cant = cantD1 - 1; cant > 0; --cant){
					bnew = new BicingState(bs);
					int cant1New = cantD1 - cant;
					if (bnew.modificarTrayecto2(i, dest, cant1New, cant)) {
						String frase = "Modificar trayecto: " + ori + " -(" + cant1New + ")-> " + dest1 + " -(" + cant + ")-> "  + dest + " [H: " + bh.getHeuristicValue(bnew) + "]";
						sucesores.add(new Successor(frase, bnew));
					}
				}
			}
		}
		
		// Quitar furgonetas
		for (int i = 0; i < numFurgonetas; ++i) {
			bnew = new BicingState(bs);
			bnew.quitarFurgoneta(i);
			String frase = "Quitar furgoneta con origen en " + bs.getFurgoneta(i).getOrigen() + " [H: " + bh.getHeuristicValue(bnew) + "]";
			sucesores.add(new Successor(frase, bnew));
		}
		
		return sucesores;
	}

}
