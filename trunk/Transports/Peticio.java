/*Representació d'una petició.
 *Només tindrem mètodes de lectura (get's), ja que
 *no volem tocar les dades mai, excepte quan es construeix.
 */
package Transports;

public class Peticio {
    private int quantitat;
    
    public Peticio(int qtt)
    {
	quantitat = qtt;
    }
    
    public int getQuantitat()
    {
	return quantitat;
    }
}