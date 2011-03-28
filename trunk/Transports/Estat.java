/**
 * L'objecte Estat conté totes les variables necessàries per representar l'estat del nostre problema.
 * Concretament tenim:
 * 
 * camionsHCP : Matriu per assignar camions a una hora i un c.p. determinat
 * endarrerits: Matriu amb una fila i N_CENTRES columnes, on es guarden llistes de peticions
 * endarrerides més d'un dia.
 * numCamionsTipusi : Nombre de camions que queden del tipus i:{1,2,3};
 * @author Jordi Llamas Pons
 * @author Felip Moll Marquès
 */
package Transports;

import java.util.*;

@SuppressWarnings ("unchecked")
public class Estat {
    private Matriu camionsHCP;
    private Matriu endarrerits;
    private int numCamionsTipus1;
    private int numCamionsTipus2;
    private int numCamionsTipus3;

    /**Constructora que genera l'estat inicial. Els paràmetres que se li passen són únicament aquells que l'usuari pot variar.
    *@params peticions Matriu de peticions. Aquestes peticions són la llista que ens passen els Centres de Producció
    * a final de dia.
    *@params n1 Nombre de camions de tipus 1 dels que disposem.
    *@params n2 Nombre de camions de tipus 2 dels que disposem.
    *@params n3 Nombre de camions de tipus 3 dels que disposem.
    *@params gen Estratègia de generació de l'estat inicial, definida a Global.
    */
    public Estat(Matriu peticions, int n1, int n2, int n3, int gen) {
        camionsHCP = new Matriu(Global.HORES_SERVEI, Global.N_CENTRES);
        endarrerits = new Matriu(1,Global.N_CENTRES);
        numCamionsTipus1 = n1;
        numCamionsTipus2 = n2;
        numCamionsTipus3 = n3;

        if(gen == Global.LINEAL) {           
            for(int hl=0; hl<Global.HORES_SERVEI; hl++) {
                for(int ncp=0; ncp<Global.N_CENTRES; ncp++) {
                    /*Agafem llista de peticions per: Hora limit h, centre de producció ncp */
                    ArrayList<Peticio> llistaPeticions = peticions.get(hl,ncp);

                    for (int peticioActual=0; peticioActual<llistaPeticions.size(); peticioActual++) {
                        Peticio petActual = llistaPeticions.get(peticioActual);
                        boolean peticioColocada = false;
                        /*Recorrem les hores de cada cp (matriu camionsHCP) amb:
                         *Hora d'entrega: hHCP
                         *Centre de producció: ncp
                         */
                        for(int hHCP=0; (hHCP < Global.HORES_SERVEI) && (peticioColocada==false); hHCP++) {

                            Camio camioActual = (Camio) camionsHCP.getObj(hHCP,ncp);

                            /*Si no hi ha cap camió a la casella de la matriu HCP, es crea un nou Camio i se li assigna la peticio i el tipus*/
                            if(camioActual == null ) {
                                if(numCamionsTipus1 > 0) {
                                    numCamionsTipus1--;
                                    camioActual = new Camio(Global.T1, petActual);                                  
                                } else if (numCamionsTipus2 > 0) {
                                    numCamionsTipus2--;
                                    camioActual = new Camio(Global.T2, petActual);
                                } else if(numCamionsTipus3 > 0) {
                                    numCamionsTipus3--;
                                    camioActual = new Camio(Global.T3, petActual);                                    
                                } else {
                                    /*No s'hauria d'entrar mai aquí, ja que si hi ha un forat
                                     *a la graella (null) significa que algun tipus de camió
                                     *no ha estat assignat, n1, n2 o n3 > 0
                                     */
                                }
				if (camioActual != null)   
				    {
					camionsHCP.add(hHCP,ncp,camioActual);
					peticioColocada = true;
				    }
                            }
			    //Si hi havia camió assignat 
			    else 
				{
				    //Si la càrrega de la petició cap dins el camió, afegir-li.
				    if(petActual.getQuantitat()+camioActual.getCarrega() <= camioActual.getTipus()) {
					camioActual.addPeticio(petActual);
					peticioColocada = true; }
				    //Si la carrega de la peticio NO HI CAP dins el camio
				    else {
					/*Si queden camions de capacitat superior lliures, eliminar camio actual
					 *crear camio nou i possar la petició (junt amb les peticions que ja tenia
					 *el camio. SINO queden camions de capacitat superior lliures seguim buscant
					 *dins les hores del dia del c.p. ncp
					 */
					peticioColocada = afegeixPeticionsCanviantCamio(petActual,camioActual,hHCP,ncp);
				    }
				}

			    /*Si arribem aquí (sortim del bucle) i no s'ha pogut assignar peticio,
			      per tant la possem al vector endarrerits*/			    
			    if(peticioColocada == false) endarrerits.add(0, ncp, petActual);			  
			}
		    }
		}
	    }
	}
        /**Estrageia 2 de generacio d'estat inicial
	 * És gairebé igual que el primer però aquesta evita posar la petició dins una hora qualsevol. Beneficia a la condició
	 * de tenir totes les peticions amb el mínim de hores efectives d'entrega en diferència respecte la hora limit.
	 */
        else if (gen == Global.MAX_COMPACT) {
            for(int hl=0; hl<Global.HORES_SERVEI; hl++) {
                for(int ncp=0; ncp<Global.N_CENTRES; ncp++) {
                    ArrayList<Peticio> llistaPeticions = peticions.get(hl,ncp);

                    for (int peticioActual=0; peticioActual<llistaPeticions.size(); peticioActual++) {
                        Peticio petActual = llistaPeticions.get(peticioActual);
                        boolean peticioColocada = false;

                        int hHCP = hl;

                        Camio camioActual = (Camio) camionsHCP.getObj(hHCP,ncp);
                        if(camioActual == null ) {
                            if(numCamionsTipus1 > 0) {
                                numCamionsTipus1--;
                                camioActual = new Camio(Global.T1, petActual);                               
                            } else if (numCamionsTipus2 > 0) {
                                numCamionsTipus2--;
                                camioActual = new Camio(Global.T2, petActual);
			    } else if(numCamionsTipus3 > 0) {
                                numCamionsTipus3--;
                                camioActual = new Camio(Global.T3, petActual);
			    }
			    if (camioActual != null)
				{
				    camionsHCP.add(hHCP,ncp,camioActual);
				    peticioColocada = true;
				}
                        } else if(petActual.getQuantitat()+camioActual.getCarrega() <= camioActual.getTipus()) {
                            camioActual.addPeticio(petActual);
                            peticioColocada = true;
                        } else {
                            peticioColocada = afegeixPeticionsCanviantCamio(petActual,camioActual,hHCP,ncp);
                        }
                        if(peticioColocada == false) {
                            endarrerits.add(0, ncp, petActual);
                        }
                    }
                }
            }
        }
    }

    //Constructora d'estat per copia
    public Estat(Estat st) {
        camionsHCP = new Matriu(Global.HORES_SERVEI, Global.N_CENTRES);
        endarrerits = new Matriu(1,Global.N_CENTRES);
        Matriu camionsHCPOrig = st.getCamionsHCP();
        Matriu endarreritsOrig = st.getEndarrerits();

        //Copia de la graella camionsHCP
        for(int h=0; h<Global.HORES_SERVEI; h++) {
            for(int ncp=0; ncp<Global.N_CENTRES; ncp++) {
                Camio camioOrig = (Camio) camionsHCPOrig.getObj(h,ncp);
                if(camioOrig != null) {
                    Camio camioActual = new Camio(camioOrig);
                    camionsHCP.add(h,ncp,camioActual);
                }
            }
        }

        //Copia de les peticions endarrerides
        for(int cpend=0; cpend<Global.N_CENTRES; cpend++) {
            ArrayList<Peticio> llPetEndarOrig = endarreritsOrig.get(0,cpend);
            for(int pet = 0; pet < llPetEndarOrig.size(); pet++) {
                endarrerits.add(0, cpend, llPetEndarOrig.get(pet));
            }
        }
    }

    /**Operador per assignar una peticio pet a hora hora  i c.p. cp
     * només si cap a dins del camió
     */
    public void afegirPeticio(int hora, int cp, Peticio pet) {
        Camio camioActual = (Camio) camionsHCP.getObj(hora,cp);

        if(pet.getQuantitat()+camioActual.getCarrega() <= camioActual.getTipus()) {
            camioActual.addPeticio(pet);
        }
    }


    /**
     * Operador per assignar una peticio d'endarrerits a un camió.
     * @params ultima Petició que no re-assignarem al camió.
     */
    public void endarreritsACamions(int h, int cp, Peticio ultima) {
        ArrayList<Peticio> llistaEndar = endarrerits.get(0,cp);
        Camio camioActual = (Camio) camionsHCP.getObj(h,cp);
        for (int i = 0; i != -1 && i < llistaEndar.size(); i++) {
            Peticio pet = llistaEndar.get(i);
            if (pet != ultima) {
                afegeixPeticionsCanviantCamio(pet,camioActual, h, cp);
                i = -1;
            }
        }
    }


    /**
     * Afegeix peticions a la posició del camió actual, i si no hi caben, intenta crear un nou
     * camió de la capacitat possible mínima necessària.
     * @params pet Petició que hi ha que afegir
     * @params camioActual Camió que estem mirant actualment, i que possiblement s'hagi de substituïr.
     * @params fila Fila de la matriu HCP on està el camió. (Hores d'entrega).
     * @params columna Columna de la matriu HCP on està el camió. (Centres de producció).
     * @return Cert si s'ha pogut afegir. Fals altrament.
     */
    public boolean afegeixPeticionsCanviantCamio(Peticio pet, Camio camioActual, int fila, int columna) {
	/*Si la petició hi cap dins el camió actual, s'afegeix i es retorna cert.*/
        if (pet.getQuantitat()+camioActual.getCarrega() <= camioActual.getTipus()) {
            camioActual.addPeticio(pet);
            return true;
        } else {
            Camio camioMesGranTemp = null;
            switch (camioActual.getTipus()) {
		/*Si el camió que tenim és de Tipus 1, haurem de crear-ne un de nou amb més capacitat
		  de tipus 2 o 3.*/
            case Global.T1:
                if(numCamionsTipus2 > 0) {
		    /*Agafem la llista de peticions del camió actual, i creem un nou camió copiant
		     tota aquesta llista*/
                    ArrayList <Peticio> llistaPeticionsTemp = camioActual.getLlistaPeticions();
                    camioMesGranTemp = new Camio(Global.T2, llistaPeticionsTemp);
                    numCamionsTipus1++;
                    numCamionsTipus2--;
                } else if(numCamionsTipus3 > 0) {
                    ArrayList <Peticio> llistaPeticionsTemp = camioActual.getLlistaPeticions();
                    camioMesGranTemp = new Camio(Global.T3, llistaPeticionsTemp);
                    numCamionsTipus1++;
                    numCamionsTipus3--;
                }
                break;
            case Global.T2:
                if(numCamionsTipus3 > 0) {
                    ArrayList <Peticio> llistaPeticionsTemp = camioActual.getLlistaPeticions();
                    camioMesGranTemp = new Camio(Global.T3, llistaPeticionsTemp);
                    numCamionsTipus2++;
                    numCamionsTipus3--;
                }
                break;
            default:
                break;
            }
	    /*Si hem pogut crear un nou camioMesGran, provem de posar-li la petició i eliminem l'antic camió*/
            if (camioMesGranTemp != null) {
                camioMesGranTemp.addPeticio(pet);
                camionsHCP.remove(fila, columna, camionsHCP.getObj(fila, columna));
                camionsHCP.add(fila, columna, camioMesGranTemp);
                return true;
            } else /*Si no hem pogut fer res*/
                return false;
        }
    }

    /**Ordena el vector d'endarrerits en funció de la <horalimit,pes>*/
    public void ordenaEndarrerits(int cp) {
        ArrayList<Peticio> llistaEndar = endarrerits.get(0,cp);
        Collections.sort(llistaEndar,new ComparadorPeticions());
    }

    /**Operador per eliminar una petició que es troba a la posicioPeticio de la llista de peticions d'un camió.
     * El camió és aquell que està a la matriu a la fila hora, i a la columna cp.
     * Es posa la remoguda a "endarrerits" i si el camió queda buit, s'elimina.
     * @params hora Fila de la matriu HCP. (Hora en format normalitzat (Global.H_INI -> 0, de 0 a 10 a l'enunciat estàndard))
     * @params cp Columna de la matriu HCP. (ID. del centre de producció)
     * @params posicioPeticio Posició de la petició dins la llista de peticions del camió que es troba a HCP(hora,cp).
     */
    public void treurePeticio(int hora, int cp, int posicioPeticio) {
        Camio camioActual = (Camio) camionsHCP.getObj(hora,cp);
        if(camioActual == null) return;

        ArrayList<Peticio> llistaPeticions = camioActual.getLlistaPeticions();

        Peticio peticioPerEsborrar = llistaPeticions.get(posicioPeticio);
        endarrerits.add(0, cp, peticioPerEsborrar);

        //Suposem posicio dins dels limits de la llista
        camioActual.removePeticio(posicioPeticio);

        if(camioActual.getLlistaPeticions().isEmpty()) {
            camionsHCP.remove(hora, cp, camioActual);
            switch (camioActual.getTipus()) {
            case Global.T1:
                numCamionsTipus1++;
                break;
            case Global.T2:
                numCamionsTipus2++;
                break;
            case Global.T3:
                numCamionsTipus3++;
                break;
            }
        }
    }

    /**
     * Funció auxiliar per obtenir els valors heurístics de l'estat.
     */
    public String getValorsHeuristics() {
        TransportsMaxGuanysHeuristicFunction htmg = new TransportsMaxGuanysHeuristicFunction();
        TransportsMinDifHoraLimitHoraEntregaHeuristicFunction htdif = new TransportsMinDifHoraLimitHoraEntregaHeuristicFunction();

        String valor = " || Max Guanys H: " + htmg.getHeuristicValue(this) +
                       " || Min dif hora H: " + htdif.getHeuristicValue(this);
        return valor;
    }

    /*Getters i setters*/
    public Matriu getCamionsHCP() {
        return camionsHCP;
    }

    public Matriu getEndarrerits() {
        return endarrerits;
    }
}