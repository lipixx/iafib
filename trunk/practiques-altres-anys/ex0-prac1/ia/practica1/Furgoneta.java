package ia.practica1;

import ia.Bicing.Bicing;

public class Furgoneta {
	private int origen;
	private int destino1;
	private int cantidad1;
	private int destino2;
	private int cantidad2;
	
	/**
	 * Constructor por defecto.
	 */
	public Furgoneta() {
		origen = -1;
		destino1 = -1;
		destino2 = -1;
		cantidad1 = 0;
		cantidad2 = 0;
	}
	
	/**
	 * Constructor por copia
	 * @param f Furgoneta que se copiará.
	 */
	public Furgoneta(Furgoneta f) {
		origen = f.origen;
		destino1 = f.destino1;
		destino2 = f.destino2;
		cantidad1 = f.cantidad1;
		cantidad2 = f.cantidad2;
	}
	
	public Furgoneta(int origen, int destino, int cantidad) {
		this.origen = origen;
		this.destino1 = destino;
		this.destino2 = -1;
		this.cantidad1 = cantidad;
		this.cantidad2 = 0;
	}
	
	/**
	 * Calcula la distancia recorrida por la furgoneta en un escenario de Bicing.
	 * @param b El escenario de Bicing
	 * @return La distancia recorrida por la furgoneta
	 */
	public double getDistancia(Bicing b) {
		double distancia = 0;
		if (destino1 != -1) {
			distancia += b.getStationsDistance(origen, destino1);
			if (destino2 != -1) distancia += b.getStationsDistance(destino1, destino2);
		}
		return distancia;
	}
	
	/**
	 * Calcula el impacto de la furgoneta respecto a una estación.
	 * @param est Estación a comprobar.
	 * @return Retorna el impacto de la furgoneta sobre la estación.
	 * Si la furgoneta se lleva bicicletas de la estación retornatrá el número
	 * de bicicletas que se lleva (negativo), si es una estación destino retornará
	 * el número de bicicletas que le deja (positivo). Si esta furgoneta no afecta
	 * a esa estación retornará 0.
	 */
	public int getImpacto(int est) {
		if (origen == est) return -(cantidad1 + cantidad2);
		if (destino1 == est) return cantidad1;
		if (destino2 == est) return cantidad2;
		return 0;
	}
	
	
	
	/* Consultoras y modificadoras (getters y setters) */
	
	/**
	 * Consultar origen.
	 * @return Estación de origen.
	 */
	public int getOrigen() {
		return origen;
	}
	
	/**
	 * Establecer origen.
	 * @param estOrigen Estación de origen.
	 */
	public void setOrigen(int estOrigen) {
		this.origen = estOrigen;
	}
	
	/**
	 * Consultar primer destino.
	 * @return Primer destino.
	 */
	public int getDestino1() {
		return destino1;
	}
	
	/**
	 * Establecer primer destino.
	 * @param estDestino1 Primer destino.
	 */
	public void setDestino1(int estDestino1) {
		this.destino1 = estDestino1;
	}
	
	/**
	 * Consultar segundo destino.
	 * @return Segundo destino.
	 */
	public int getDestino2() {
		return destino2;
	}
	
	/**
	 * Establecer segundo destino.
	 * @param estDestino2 Segundo destino.
	 */
	public void setDestino2(int estDestino2) {
		this.destino2 = estDestino2;
	}
	
	/**
	 * Consulta si tiene un segundo destino asignado.
	 * @return Si la furgoneta realiza un destino con dos trayectos.
	 */
	public boolean hasDestino2() {
		return destino2 != -1;
	}
	
	/**
	 * Consultar el número de bicicletas que se llevan al primer destino.
	 * @return cantidad Número de bicicletas que se llevan al primer destino.
	 */
	public int getCantidad1() {
		return cantidad1;
	}
	
	/**
	 * Establecer el número de bicicletas que se llevan al primer destino.
	 * @param cantidad Número de bicicletas que se llevan al primer destino.
	 */
	public void setCantidad1(int cantidad) {
		this.cantidad1 = cantidad;
	}
	
	/**
	 * Consultar el número de bicicletas que se llevan al segundo destino.
	 * @return Número de bicicletas que se llevan al segundo destino.
	 */
	public int getCantidad2() {
		return cantidad2;
	}
	
	/**
	 * Establecer cantidad de bicicletas que se llevan al segundo destino.
	 * @param cantidad Bicicletas que se llevan al segundo destino.
	 */
	public void setCantidad2(int cantidad) {
		this.cantidad2 = cantidad;
	}
	
	public boolean traspasar(int cantidad) {
		if (cantidad >= cantidad1) return false;
		cantidad1 -= cantidad;
		cantidad2 = cantidad;
		return true;
	}
}
