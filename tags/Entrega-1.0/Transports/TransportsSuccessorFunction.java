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
public class TransportsSuccessorFunction implements SuccessorFunction
{

	public List getSuccessors(Object state)
	{
		Estat estatPare = (Estat) state;
		Matriu hcpPare = estatPare.getCamionsHCP();
		Matriu endarreritsPare = estatPare.getEndarrerits();

		List<Successor> successors = new ArrayList<Successor>();

		/**
		 * L'estratègia a seguir serà la següent:
		 * Per un centre de producció CP
		 * 1. Per cada Peticio pi de CP, que es troba a HCP
		 *      Per totes les demés peticions pj tals que j > i (en ordre a la matriu HCP)
		 *        swap (pi,pj);
		 * 2. Per cada Petició pi de CP, que es troba a HCP
		 *      Per totes les peticions pj de la matriu endarrerits (en ordre a la matriu)
		 *	  swap (pi,pj);
		 *
		 * La condició de que j > i en (1), implica que no es repeteixen estats.
		 */

		for (int cp = 0; cp < Global.N_CENTRES; cp++)
		{
			for (int fila = 0; fila < Global.HORES_SERVEI; fila++)
			{
				Camio c = (Camio) hcpPare.getObj(fila,cp);
				if (c != null)
				{
					ArrayList<Peticio> llistaCamio = c.getLlistaPeticions();
					/*Del camio c, i de la i del seguent for, traurem el pi*/
					for (int i = 0; i < llistaCamio.size(); i++)
					{
						/*La petició pi és dins la HCP[fila][cp]->c->llistaCamio[i]*/
						Peticio pi = llistaCamio.get(i);

						/*A partir d'aquí, per pi, hem de fer swap amb totes les
						 peticions que estan per sota d'ella. Anem a trobar
						pj*/

						/*Del subcamió treurem pj*/
						Camio subcamio = c;
						ArrayList<Peticio> subllista = llistaCamio;
						int filatmp = fila;
						int isubllista = i+1;

						ArrayList<Peticio> endar = endarreritsPare.get(0,cp);
						int iendar = 0;

						while (filatmp < Global.HORES_SERVEI)
						{
							subcamio = (Camio) hcpPare.getObj(filatmp,cp);
							if (subcamio != null)
							{
								subllista = subcamio.getLlistaPeticions();

								while (isubllista < subllista.size())
								{
									Estat estatFill = new Estat(estatPare);
									if (estatFill.swap(cp,fila,i,filatmp,isubllista))
									{
										Successor suc = new Successor("",estatFill);
										successors.add(suc);
									}
									isubllista++;
								}
							}

							isubllista = 0;
							filatmp++;
						}
						/*Hem acabat de veure tots els Camions i peticions de HCP restants. Ara
						  falta fer el swap per tots els endarrerits*/
						while (iendar < endar.size())
						{
							Estat estatFill = new Estat(estatPare);
							if (estatFill.swapEndarrerits(cp,fila,i,iendar))
							{
								Successor suc = new Successor("",estatFill);
								successors.add(suc);
							}
							iendar++;
						}

					}
				}
			}
		}
		return successors;
	}
}