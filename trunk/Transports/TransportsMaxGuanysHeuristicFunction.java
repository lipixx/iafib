package Transports;

import aima.search.framework.HeuristicFunction;
import java.util.*;

@SuppressWarnings ("unchecked")
public class TransportsMaxGuanysHeuristicFunction implements HeuristicFunction 
{
    public double getHeuristicValue(Object st) 
    {
	Estat state = (Estat) st;
	int beneficis = 0;
	Matriu camionsHCP = state.getCamionsHCP();
	Matriu endarrerits = state.getEndarrerits();

	/*Explorem tota la graella HCP, i per cada casella, obtenim el valor
	  que ens aporta el transport que hi ha associat*/	
	for (int nc = 0; nc < Global.N_CENTRES; nc++)
	    {
		for (int h = 0; h < Global.HORES_SERVEI; h++)
		    {
			Camio c = (Camio) camionsHCP.getObj(h,nc);
			if (c!=null)
			    beneficis += c.getBeneficis(h+8);
		    }
		
		//El vector endarrerits només té una fila, la 0.
		ArrayList<Peticio> llistaEndar = endarrerits.get(0,nc);
		
		for (int pet = 0; pet < llistaEndar.size(); pet++)
		    {
			Peticio p = llistaEndar.get(pet);
			
			beneficis -= Global.preus_transport[p.getQuantitat()/100 -1] * (17 - p.getHoraLimit()) * 0.2;
			beneficis -= Global.preus_transport[p.getQuantitat()/100 -1];
		    }
	    }	
	return beneficis*-1;
	
    }
}

// 	public int get_beneficis(int hora_entrega)
// 	{
// 	  int benefici = 0;
// 	  /*Explorem totes les peticions que porta el Transport*/
// 	  for (int i = 0; i<peticions.size(); i++)
// 	    {
// 	      /*Obtenir el benefici màxim d'aquesta petició segons el pes i la taula de preus
// 		* Si l'hora d'entrega no és del dia, el benefici que aporta aquesta petició és el
// 		* benefici_maxim en negatiu. Ho sabem perquè l'hora d'entrega va de 8 a 17h, i si no és del
// 		* dia pot valer de 17h a infinit.
// 		*/
//               Peticio p = peticions.get(i);
//               int benef_max_pet = preus_transport[p.pes/100 - 1];
// 	      if (hora_entrega > 17)
// 		benefici -= benef_max_pet;
// 	      else
// 	      {
// 		/*Si la petició va amb retras, s'ha de restar 20% del màxim possible, per cada hora retrassada*/
//               	int retras = hora_entrega - hora_limit;
// 	      	if (retras > 0)
// 		  benefici += benef_max_pet - (-0.2 * benef_max_pet * retras);
// 	 	else
// 		  benefici += benef_max_pet;
// 	      }
// 	  return benefici;
// 	}
// };
// */
