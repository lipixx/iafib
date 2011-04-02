/**
 * Aquesta classe genera els successors a partir de l'estat passat de la forma següent:
 * Per cada una de les peticions existents a HCP de l'estat pare:
 * 1. Eliminem la petició i la posem a endarrerits. Afegim l'estat resultant als successors.
 * 2. Afegim una petició d'endarrerits on hi càpiga. Afegim l'estat resultant als successors.
 *
 * Per tant ens queden el següent nombre d'estats, degut al factor de ramificació:
 *    Suma de (Num de peticions a HCP + Num de peticions a endarrerits que es puguin afegir a HCP)
 */
package Transports;

import java.util.ArrayList;
import java.util.List;

import aima.search.framework.Successor;
import aima.search.framework.SuccessorFunction;

@SuppressWarnings ("unchecked")
public class TransportsSuccessorFunctionAddRem implements SuccessorFunction
{

	public List getSuccessors(Object state)
	{
		Estat estatPare = (Estat) state;
		Matriu camionsHCP = estatPare.getCamionsHCP();
		Matriu endarreritsPare = estatPare.getEndarrerits();

		List<Successor> successors = new ArrayList<Successor>();

		/**
		 * L'estratègia a seguir serà la següent:
		 * Per un centre de producció CP
		 * 1. Per cada Peticio pi de CP,
		 *     Moure la petició a endarrerits, actualitzant camió si escau.
		 * 2. Per cada Petició pi de CP
		 *     Agafar la primera petició d'endarrerits i intentar col·locar-la al primer lloc buit
		 *     de l'estat.
		 */

		//Generacio de successors: eliminar peticions, afegir peticions on capiguen, etc
		//Generem estats treient peticions una a una
		for (int cp = 0; cp < Global.N_CENTRES; cp++)
		{
			for (int h = 0; h < Global.HORES_SERVEI; h++)
			{
				Camio camioActual = (Camio) camionsHCP.getObj(h,cp);
				if(camioActual != null)
				{
					ArrayList <Peticio> llistaPeticions = camioActual.getLlistaPeticions();
					for(int pet = 0; pet < llistaPeticions.size(); pet++)
					{
						Peticio petActual = llistaPeticions.get(pet);
						Estat estatFill = new Estat(estatPare);
						estatFill.treurePeticio(h, cp, pet);
						int pesPet = petActual.getQuantitat();

						TransportsMaxGuanysHeuristicFunction htmg = new TransportsMaxGuanysHeuristicFunction();
						TransportsMinDifHoraLimitHoraEntregaHeuristicFunction htdif = new TransportsMinDifHoraLimitHoraEntregaHeuristicFunction();

						String valor = " || Max Guanys H: " + htmg.getHeuristicValue(estatFill) +
						               " || Min dif hora H: " + htdif.getHeuristicValue(estatFill);

						Successor suc = new Successor("treure Peticio de CP: " +
						                              (cp+1) + " hora: " + (8-h) + " pes: " + pesPet + valor, estatFill);
						successors.add(suc);
					}
				}
			}
		}
		//Generem estats afegint peticions no assignades (= endarrerides)
		//únicament a camions on hi capiguen
		Matriu peticionsEndarrerides = estatPare.getEndarrerits();
		for(int cpEnd = 0; cpEnd < Global.N_CENTRES; cpEnd++)
		{
			ArrayList<Peticio> llistaPeticions = peticionsEndarrerides.get(0,cpEnd);
			for (int pet = 0; pet < llistaPeticions.size(); pet++)
			{
				Peticio petActual = llistaPeticions.get(pet);
				for(int hl = 0; hl < Global.HORES_SERVEI; hl++)
				{
					Camio camioActual = (Camio) camionsHCP.getObj(hl,cpEnd);
					//Si no hi havia camió
					if(camioActual == null)
					{
						//TODO
					}
					//Si  hi havia camió
					else
					{
						if(petActual.getQuantitat()+camioActual.getCarrega() <= camioActual.getTipus())
						{
							Estat estatFill = new Estat(estatPare);
							estatFill.afegirPeticio(hl, cpEnd, petActual);
							int pesPet = petActual.getQuantitat();
							TransportsMaxGuanysHeuristicFunction htmg = new TransportsMaxGuanysHeuristicFunction();
							TransportsMinDifHoraLimitHoraEntregaHeuristicFunction htdif = new TransportsMinDifHoraLimitHoraEntregaHeuristicFunction();

							String valor = " || Max Guanys H: " + htmg.getHeuristicValue(estatFill) +
							               " || Min dif hora H: " + htdif.getHeuristicValue(estatFill);

							Successor suc = new Successor("possar Peticio a CP: " +
							                              (cpEnd+1) + " hora: " + (8-hl) + " pes: " + pesPet +
							                              valor, estatFill);
							successors.add(suc);
						}
						//Generem estats afegint peticions modificant el tipus de camió si fa falta
						else
						{
							//TODO
						}
					}
				}
			}
		}
		return successors;
	}
}