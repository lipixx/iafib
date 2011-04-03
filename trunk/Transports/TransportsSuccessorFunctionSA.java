/**
 * Aquesta classe genera un únic successors de cara a ser utlitzar amb l'algorisme de Simulated Annealing. Per fer-ho es tria un del operadors de swap aleatóriament i llavors s'executa aquest operador amb paràmetres aleatoris
 */
package Transports;

import java.util.ArrayList;
import java.util.List;

import aima.search.framework.Successor;
import aima.search.framework.SuccessorFunction;

@SuppressWarnings ("unchecked")
public class TransportsSuccessorFunctionSA implements SuccessorFunction
{

	public List getSuccessors(Object state)
	{
		Random generator = new Random(System.currentTimeMillis());
		Estat estatPare = (Estat) state;
		Matriu hcpPare = estatPare.getCamionsHCP();
		Matriu endarreritsPare = estatPare.getEndarrerits();

		List<Successor> successors = new ArrayList<Successor>();

		/*S'ha de triat aleatóriament entre un dels dos operadors de swap*/
		Integer operador = (Integer)(generator.nextInt(2));

		switch(operador.intValue())
		{
		case 1:
			Estat estatFill = new Estat(estatPare);
			if (estatFill.swap(cp,fila,i,filatmp,isubllista))
			{
				Successor suc = new Successor("",estatFill);
				successors.add(suc);
			}
			break;
		case 2:
			Estat estatFill = new Estat(estatPare);
			if (estatFill.swapEndarrerits(cp,fila,i,iendar))
			{
				Successor suc = new Successor("",estatFill);
				successors.add(suc);
			}
			break;
		default:
			break;
		}

		////Codi d'aquí cap a sota s'ha d'agafar aleatoriament...////
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