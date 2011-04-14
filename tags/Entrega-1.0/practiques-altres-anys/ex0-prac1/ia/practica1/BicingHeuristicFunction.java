package ia.practica1;

import aima.search.framework.HeuristicFunction;

public class BicingHeuristicFunction implements HeuristicFunction {
	
	private static final double PESO_DEMANDA = 0.75;
	
	@Override
	public double getHeuristicValue(Object state) {
		BicingState bs = (BicingState) state;
		return fDemanda(bs)*PESO_DEMANDA + fDistancia(bs)*(1 - PESO_DEMANDA);
	}
	
	/**
	 * Heurístico de la demanda. A mayor valor mayor número de demanda no
	 * cubierta.
	 * @param bs Estado del bicing
	 * @return Heurístico de la demanda
	 */
	public double fDemanda(BicingState bs) {
		double result = 0;
		int numEst = bs.getNumEstaciones();
		for (int i = 0; i < numEst; ++i) result += Math.max(0, -bs.getCantidadBicicletasSiguienteHora(i));
		return result;
	}
	
	/**
	 * Heurístico de la distancia.
	 * Minimiza la distancia recorrida por cada furgoneta.
	 * EJ: Es mejor tener dos furgonetas que hacen 50 KM que una que hace
	 * 80 KM y otra que hace 20 KM.
	 * @param bs Estado del bicing
	 * @return Heurístico de la distancia
	 */
	public double fDistancia(BicingState bs) {
		double result = 0;
		int numFurgonetas = bs.getNumFurgonetas();
		for (int i = 0; i < numFurgonetas; ++i) result += bs.getDistancia(i);
		return result;
	}

}
