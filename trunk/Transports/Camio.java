package Transports;

import java.util.*;

public class Camio {

    private int tipus;
    private int carrega;
    private ArrayList<Peticio> llista;

    /*Creacio d'un camio amb un tipus i una peticio
     *@params t Tipus del camió. Definit a Global.
     *@params p Primera petició a afegir al camió.
     */
    public Camio (int t, Peticio p) {
        tipus = t;
        carrega = p.getQuantitat();
        llista = new ArrayList<Peticio>();
        llista.add(p);
    }

    /*Constructora d'un camio per copia.
     *@params camioOrig Camió original del que es copiarà tot.
     */
    public Camio (Camio camioOrig) {
        tipus = camioOrig.getTipus();
        carrega = camioOrig.getCarrega();
        llista = new ArrayList<Peticio>();

        ArrayList<Peticio> llistaPetOrig = camioOrig.getLlistaPeticions();
        for(int pet = 0; pet < llistaPetOrig.size(); pet++) {
            llista.add(llistaPetOrig.get(pet));
        }
    }

    /*Creacio d'un camio amb un tipus i una llista de peticions
     *@params t Tipus del camió
     *@params llp Llista de peticions inicial a afegir al camió. Es copia
     la llista.
     */
    public Camio (int t, ArrayList<Peticio> llp) {
        tipus = t;
        llista = new ArrayList<Peticio>();
        for(int pet = 0; pet < llp.size(); pet++) {
            llista.add(llp.get(pet));
            carrega += llp.get(pet).getQuantitat();
        }
    }

    /**Afegeix una petició a la llista de peticions del camió. S'actualitza
     * la càrrega del camió.
     * @params p Petició a afegir a la llista.
     */
    public void addPeticio(Peticio p) {
        llista.add(p);
        carrega += p.getQuantitat();
    }

    /**Donada una posició de la llista de peticions, s'elimina aquesta de la llista i
     * s'actualitza la càrrega del camió.
     * @params posicioPeticio Posició que s'eliminarà de la llista.
     */
    public void removePeticio(int posicioPeticio) {
        Peticio peticioPerEsborrar = llista.get(posicioPeticio);
        carrega -= peticioPerEsborrar.getQuantitat();
        llista.remove(posicioPeticio);
    }

    /*Recorre la llista de peticions del camió i en calcula els beneficis en funció del
     *retràs i el pes de cada petició.
     *@params horaCamio Hora en format 24h en que el camió fa el servei.
     *@return El benefici total que obté aquest camió per la llista de peticions que du.
     */
    public double getBeneficis(int horaCamio) {
        double benefici_total = 0;

        for (int pet = 0; pet < llista.size(); pet++) {
            Peticio actual = llista.get(pet);
            double pMax = Global.preus_transport[actual.getQuantitat()/100-1];

            int nHoresRetras = horaCamio - actual.getHoraLimit();
            if (nHoresRetras < 0) nHoresRetras = 0;

            benefici_total += pMax - pMax *(nHoresRetras*0.2);
        }

        return benefici_total;
    }

    /*Recorre la llista de peticions del camió i en calcula les hores que es perden per cada petició.
     *@params horaCamio Hora en format 24h en que el camió fa el servei.
     *@return La suma de horas perdudes del total de peticions.
     */
    public double getHoresPerdudes(int horaCamio) {
        int nHoresRetras = 0;
        for (int i = 0 ; i < llista.size(); i++) {
            Peticio actual = llista.get(i);
            int h = actual.getHoraLimit() - horaCamio;
            nHoresRetras += ((h >0) ? h : -h);
        }
        return nHoresRetras;
    }

    public int getTipus() {
        return tipus;
    }

    public int getCarrega() {
        return carrega;
    }

    public void setCarrega(int c) {
        carrega = c;
    }

    public Peticio getPeticio(int i) {
        return llista.get(i);
    }
    public ArrayList<Peticio> getLlistaPeticions() {
        return llista;
    }
}