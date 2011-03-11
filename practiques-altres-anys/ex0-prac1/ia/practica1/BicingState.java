package ia.practica1;

import ia.Automatizador;
import ia.Bicing.Bicing;

import java.util.ArrayList;
import java.util.Random;

public class BicingState {
	private static final int CAPACIDAD_FURGO = 30;
	private static int numEst;
	private static Bicing b;
	public static int F = Automatizador.F;
	
	/**
	 * Estado
	 */
	private ArrayList<Furgoneta> furgonetas;
	
	
	/**
	 * Constructor de BicingState.
	 * @param est Número de estaciones
	 * @param bic Número de bicicletas
	 * @param dem Tipo de demanda
	 */
	public BicingState(int est, int bic, int dem) {
		numEst = est;
		b = new Bicing(est, bic, dem);
		furgonetas = new ArrayList<Furgoneta>(F);
		solucionInicial();
	}
	
	public BicingState(int est, int bic, int dem, int semilla) {
		numEst = est;
		b = new Bicing(est, bic, dem, semilla);
		furgonetas = new ArrayList<Furgoneta>(F);
		solucionInicial();
	}

	/**
	 * Constructor por copia.
	 * @param bs Objecto a copiar.
	 */
	public BicingState(BicingState bs) {
		furgonetas = new ArrayList<Furgoneta>(F);
		for (Furgoneta f : bs.furgonetas) furgonetas.add(new Furgoneta(f));
	}
	
	/**
	 * Consultar el número de furgonetas utilizadas.
	 * @return Número de furgonetas utilizadas.
	 */
	public int getNumFurgonetas() {
		return furgonetas.size();
	}
	
	/**
	 * Consultar el número de estaciones.
	 * @return Número de estaciones.
	 */
	public int getNumEstaciones() {
		return numEst;
	}
	
	/**
	 * Retorna la distancia recorrida por una furgoneta.
	 * @param furgo Índice de la furgoneta.
	 * @return Distancia recorrida por la furgoneta.
	 */
	public double getDistancia(int furgo) {
		return furgonetas.get(furgo).getDistancia(b);
	}
	
	/**
	 * Consultar el número de bicicletas que se pueden mover en una estación.
	 * @param est Estacion a consultar.
	 * @return Número de bicicletas que se pueden mover = Número de bicicletas que
	 * no serán movidas durante esa hora. El valor siempre será menor o igual
	 * a CAPACIDAD_FURGO.
	 */
	public int getNumBicicletasMovibles(int est) {
		return Math.min(CAPACIDAD_FURGO, b.getStationDoNotMove(est));
	}
	
	/**
	 * Consultar el número de bicicletas que se dispondrán a la siguiente hora.
	 * @param est Estación a consultar.
	 * @return Número de bicicletas que tendremos a la siguiente hora. Si el número
	 * es negativo representa que necesitamos esa cantidad de bicicletas.
	 */
	public int getCantidadBicicletasSiguienteHora(int est) {
		return b.getDemandNextHour(est) - b.getStationNextState(est) + modificacionTransporte(est);
	}
	
	/**
	 * Obtener una furgoneta.
	 * @param i Índice de la furgoneta.
	 * @return Furgoneta solicitada.
	 */
	public Furgoneta getFurgoneta(int i) {
		return furgonetas.get(i);
	}
	
	/**
	 * Agrega una nueva furgoneta con un inicio y un primer destino.
	 * @param inicio Estación de origen.
	 * @param dest Estación del primer destino.
	 * @param cant Cantidad de bicicletas totales que lleva la furgoneta.
	 * @return Si el operador se puede aplicar -> si se ha podido agregar la furgoneta.
	 */
	public boolean agregarFurgoneta(int inicio, int dest, int cant) {
		if (furgonetas.size() == F || tieneOrigen(inicio) || inicio == dest
			|| cant <= 0 || cant > 30 || cant > b.getStationDoNotMove(inicio)) return false;
		furgonetas.add(new Furgoneta(inicio, dest, cant));
		return true;
	}
	
	/**
	 * Modifica un trayecto de una furgoneta.
	 * @param furgoneta Índice de la furgoneta a modificar
	 * @param dest Segundo destino de la furgoneta.
	 * @param cant1 Cantidad de bicicletas que se qudarán en destino 1.
	 * @param cant2 Cantidad de bicicletas que se quedarán en destino 2.
	 * @return Si se ha efectuado la operación.
	 */
	public boolean modificarTrayecto2(int furgoneta, int dest, int cant1, int cant2) {
		Furgoneta f = furgonetas.get(furgoneta);
		if (f.getOrigen() == dest || f.getDestino1() == dest || f.getDestino2() == dest
		 	|| cant1 == 0 || cant2 == 0 || cant2 >= f.getCantidad1()) return false;
		f.setDestino2(dest);
		f.setCantidad1(cant1);
		f.setCantidad2(cant2);
		return true;
	}
	
	
	/**
	 * Quita una furgoneta.
	 * @param i Índice de la furgoneta.
	 * @return Si el operador se puede aplicar -> si el índice el correcto.
	 */
	public boolean quitarFurgoneta(int i) {
		if (i < 0 || i >= furgonetas.size()) return false;
		furgonetas.remove(i);
		return true;
	}
	
	
	
	
	/**
	 * Comprueba si una estación ya tiene una furgoneta que parte de ella.
	 * @param est Número de la estación.
	 * @return Si la estación est tiene ya una furgoneta que parte de su estación.
	 */
	public boolean tieneOrigen(int est) {
		for (int i = 0; i < furgonetas.size(); ++i)
			if (furgonetas.get(i).getOrigen() == est) return true;
		return false;
	}
	
	private int modificacionTransporte(int est) {
		int valor = 0;
		for (Furgoneta f : furgonetas) valor += f.getImpacto(est);
		return valor;
	}
	
	private void solucionInicial() {
		if (numEst < 3) return;
		ArrayList<Integer> idOrigen = new ArrayList<Integer>(numEst);
		Random randomNum = new Random();
		for (int i = 0; i < numEst; ++i) idOrigen.add(i);
		
		for (int i = 0; i < F; ++i) {
			if (i >= numEst) break;
			Furgoneta furgo = new Furgoneta();
			int ranOrigen = randomNum.nextInt(idOrigen.size());
			int idOri = idOrigen.get(ranOrigen);
			furgo.setOrigen(idOri);
			idOrigen.remove(ranOrigen);
			int cantOri = getNumBicicletasMovibles(idOri);
			if (cantOri <= 0) continue;
				
			int dest1 = idOri;
			while (dest1 == ranOrigen) dest1 = randomNum.nextInt(numEst);
			furgo.setDestino1(dest1);
			int cantD1 = Math.max(1, cantOri/2);
			furgo.setCantidad1(cantD1);
			if (cantD1 != cantOri) {
				int dest2 = dest1;
				while (dest2 == ranOrigen || dest2 == dest1) dest2 = randomNum.nextInt(numEst);
				furgo.setDestino2(dest2);
				furgo.setCantidad2(cantOri - cantD1);
			}
			furgonetas.add(furgo);
		}
	}
}
