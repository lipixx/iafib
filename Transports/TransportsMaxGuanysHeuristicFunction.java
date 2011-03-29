package Transports;

import aima.search.framework.HeuristicFunction;
import java.util.*;

@SuppressWarnings ("unchecked")
public class TransportsMaxGuanysHeuristicFunction implements HeuristicFunction {
    /**
     * Aquesta funció retorna el valor dels beneficis que s'obtenen per un estat
     * determinat.
     * @params st L'estat apartir del que es calcularan els beneficis.
     */
    public double getHeuristicValue(Object st) {
        Estat state = (Estat) st;
        int beneficis = 0;

        /*Obtenim les dues matrius de l'estat*/
        Matriu camionsHCP = state.getCamionsHCP();
        Matriu endarrerits = state.getEndarrerits();

        /*Explorem tots els centres de la graella HCP*/
        for (int nc = 0; nc < Global.N_CENTRES; nc++) {
            /*Per cada centre, explorem totes les hores, n'obtenim el camió
              i li demanem a ell quin benefici porta.*/
            for (int h = 0; h < Global.HORES_SERVEI; h++) {
                Camio c = (Camio) camionsHCP.getObj(h,nc);
                if (c!=null) beneficis += c.getBeneficis(h+Global.H_INI);
            }

            /*Ens queda explorar les peticions que no estan assignades a cap
            	      camió. El vector endarrerits només té una fila, la 0.*/
            ArrayList<Peticio> llistaEndar = endarrerits.get(0,nc);

            for (int pet = 0; pet < llistaEndar.size(); pet++) {
                Peticio p = llistaEndar.get(pet);
                /*Segons l'enunciat, hem de decrementar els beneficis una vegada pel benefici
                 màxim que obtindriem amb la petició i un 20% sobre aquest preu tantes vegades
                com hores de retràs.*/
                beneficis -= (Global.preus_transport[p.getQuantitat()/100 -1] *
                              (Global.H_FI - p.getHoraLimit()) * 0.2)
                             + Global.preus_transport[p.getQuantitat()/100 -1];
            }
        }
        /*L'algorisme final es basa en les pèrdues, multipliquem per tant per -1.*/
        return beneficis * -1;
    }
}