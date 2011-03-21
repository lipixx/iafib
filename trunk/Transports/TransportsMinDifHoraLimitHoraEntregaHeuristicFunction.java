package Transports;

import aima.search.framework.HeuristicFunction;
import java.util.*;

@SuppressWarnings ("unchecked")
public class TransportsMinDifHoraLimitHoraEntregaHeuristicFunction implements HeuristicFunction {
    
	public double getHeuristicValue(Object st)
	{
	Estat state = (Estat) st;
	Matriu camionsHCP = state.getCamionsHCP();
	Matriu endarrerits = state.getEndarrerits();
	int horesPerdudes = 0;

	/*Explorem tota la graella HCP, i per cada casella, obtenim el valor
	  que ens aporta el transport que hi ha associat*/	
	for (int nc = 0; nc < Global.N_CENTRES; nc++)
	    {
		for (int h = 0; h < Global.HORES_SERVEI; h++)
		    {
			Camio c = (Camio) camionsHCP.getObj(h,nc);
			if (c!=null)
			    horesPerdudes += c.getHoresPerdudes(h);
		    }
		
		//El vector endarrerits només té una fila, la 0.
		ArrayList<Peticio> llistaEndar = endarrerits.get(0,nc);
		
		for (int pet = 0; pet < llistaEndar.size(); pet++)
		    {
			Peticio p = llistaEndar.get(pet);
			horesPerdudes += 14 + (17 - p.getHoraLimit());
	    }	
	}
	return horesPerdudes;
    }
}


// /*
// 
// /*Graella HCP*/
// Transport HCP[HORES_SERVEI][N_CENTRES];
// 
// /*Graella Peticions, dins cada casella, hi ha un vector de Peticions.*/
// Vector <Vector<Peticio>> PETICIONS[HORES_SERVEI][N_CENTRES];
// 
// /*Aquesta funció ens calcula l'heurística
//  * h: Hora d'inici (per defecte les 08h)
//  * nc: Nombre de centres
//  */
// public int heuristica()
// {
//   int h = H_INIC;
//   int nc = 0;
//   int horesPerdudes = 0;
// 
// /*Explorem tota la graella HCP, i per cada casella, obtenim el valor
// que ens aporta el transport que hi ha associat*/
// while (nc < N_CENTRES)
// {
//  while (h < HORES_SERVEI)
//  {
//    Transport t = HCP[h][nc];
//    horesPerdudes += t.getHoresPerdudes(h);
//   }
//  }
// 
// 
// while (nc < N_CENTRES)
// {
//  while (h < HORES_SERVEI)
//  {
//    Vector<Peticio> pet = PETICIONS[h][nc];
//    for (int i = 0; i<pet.size(); i++)
//       horesPerdudes -= preus_transport[pet[i].pes/100 - 1]; //Resta als horesPerdudes, el preu de transport de la petició
//   }
//  }
// 
//  return horesPerdudes;
// }
// 
// 
// 
// public class Peticio {
// 
//   	int pes;
//   	int hora_limit;
// 
// 	public Peticio()
// 	{
// 	   pes = 0;
// 	   hora_limit = 0;
// 	}
// };
// 
// 
// public class Transport {
// 
// 	/*Aquesta classe representa un Transport, que pot ser de T1=500, T2=1000 o T3=2000.*/
// 	private Vector<Peticio> peticions;
// 	private int tipus;
// 
// 	public Transport()
// 	{
// 	  peticions = new Vector<Peticio>;
// 	  tipus = 0;
// 	}
// 
// 	/**
// 	 * Retorna els horesPerdudes que dona un Transport carregat de peticions
// 	 * a una determinada hora d'entrega.
// 	 * @pre El Transport ha d'estar carregat de peticions.
// 	 * @param hora_entrega Hora d'entrega d'aquest transport.
// 	 * @return benefici El benefici que aportarà aquest transport.
// 	 */
// 	public int get_horesPerdudes(int hora_entrega)
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
