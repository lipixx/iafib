/*Representació d'una petició.
 *Només tindrem mètodes de lectura (get's), ja que
 *no volem tocar les dades mai, excepte quan es construeix.
 */
package Transports;

public class Peticio {
    private int quantitat;
    private int hora_limit;

    public Peticio(int qtt, int h)
    {
	quantitat = qtt;
	hora_limit = h;
    }
    
    public int getQuantitat()
    {
	return quantitat;
    }

    public int getHoraLimit()
    {
	return hora_limit;
    }
}