/**
 * Aquesta classe genera un únic successors de cara a ser utlitzar amb l'algorisme de Simulated Annealing. Per fer-ho es tria un del operadors de swap aleatóriament i llavors s'executa aquest operador amb paràmetres aleatoris
 */
package Transports;

import java.util.*;

import aima.search.framework.Successor;
import aima.search.framework.SuccessorFunction;

@SuppressWarnings ("unchecked")
public class TransportsSuccessorFunctionSA implements SuccessorFunction
{

	public List getSuccessors(Object state)
	{
		Random gen = new Random(System.currentTimeMillis());
		Estat estatPare = (Estat) state;
		Matriu hcpPare = estatPare.getCamionsHCP();
		Matriu endarreritsPare = estatPare.getEndarrerits();

		List<Successor> successors = new ArrayList<Successor>();

		/*S'ha de triat aleatóriament entre un dels dos operadors de swap*/
		Integer operador = (Integer)(gen.nextInt(2));
		int cp = 0;
		int fila = 0;
		Camio c = null;
		ArrayList<Peticio> llistaCamio = null;
		int i;
		Estat estatFill;


		switch(operador.intValue())
		{
		case 1:
			estatFill = new Estat(estatPare);
			while(c == null)
			{
				cp = ((Integer)(gen.nextInt(Global.N_CENTRES))).intValue();
				fila = ((Integer)(gen.nextInt(Global.HORES_SERVEI))).intValue();
				c = (Camio) hcpPare.getObj(fila,cp);
				if(c!=null)llistaCamio = c.getLlistaPeticions();
			}

			i = ((Integer)(gen.nextInt(llistaCamio.size()))).intValue();
			int filatmp = 0;
			ArrayList<Peticio> subllista = null;
			Camio subcamio = null;
			while(subcamio == null)
			{
				filatmp = fila + ((Integer)(gen.nextInt(Global.HORES_SERVEI - fila))).intValue();
				subcamio = (Camio) hcpPare.getObj(filatmp,cp);
				if(subcamio!=null)subllista = subcamio.getLlistaPeticions();
			}
			if((subllista.size() - (i+1)) <= 0) break;
			int isubllista = i + 1 + ((Integer)(gen.nextInt(subllista.size() - (i+1)))).intValue();
			if (estatFill.swap(cp,fila,i,filatmp,isubllista))
			{
				Successor suc = new Successor("",estatFill);
				successors.add(suc);
			}
			break;
		case 2:
			while(c == null)
			{
				cp = ((Integer)(gen.nextInt(Global.N_CENTRES))).intValue();
				fila = ((Integer)(gen.nextInt(Global.HORES_SERVEI))).intValue();
				c = (Camio) hcpPare.getObj(fila,cp);
				if(c!=null)llistaCamio = c.getLlistaPeticions();
			}

			i = ((Integer)(gen.nextInt(llistaCamio.size()))).intValue();
			ArrayList<Peticio> endar = endarreritsPare.get(0,cp);
			if(endar.size() <= 0) break;
			int iendar = ((Integer)(gen.nextInt(endar.size()))).intValue();;
			estatFill = new Estat(estatPare);
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
// 		for (int cp = 0; cp < Global.N_CENTRES; cp++)
// 		{
// 			for (int fila = 0; fila < Global.HORES_SERVEI; fila++)
// 			{
// 				Camio c = (Camio) hcpPare.getObj(fila,cp);
// 				if (c != null)
// 				{
// 					ArrayList<Peticio> llistaCamio = c.getLlistaPeticions();
// 					/*Del camio c, i de la i del seguent for, traurem el pi*/
// 					for (int i = 0; i < llistaCamio.size(); i++)
// 					{
// 						/*La petició pi és dins la HCP[fila][cp]->c->llistaCamio[i]*/
// 						Peticio pi = llistaCamio.get(i);
//
// 						/*A partir d'aquí, per pi, hem de fer swap amb totes les
// 						 peticions que estan per sota d'ella. Anem a trobar
// 						pj*/
//
// 						/*Del subcamió treurem pj*/
// 						Camio subcamio = c;
// 						ArrayList<Peticio> subllista = llistaCamio;
// 						int filatmp = fila;
// 						int isubllista = i+1;
//
// 						ArrayList<Peticio> endar = endarreritsPare.get(0,cp);
// 						int iendar = 0;
//
// 						while (filatmp < Global.HORES_SERVEI)
// 						{
// 							subcamio = (Camio) hcpPare.getObj(filatmp,cp);
// 							if (subcamio != null)
// 							{
// 								subllista = subcamio.getLlistaPeticions();
//
// 								while (isubllista < subllista.size())
// 								{
// 									Estat estatFill = new Estat(estatPare);
// 									if (estatFill.swap(cp,fila,i,filatmp,isubllista))
// 									{
// 										Successor suc = new Successor("",estatFill);
// 										successors.add(suc);
// 									}
// 									isubllista++;
// 								}
// 							}
//
// 							isubllista = 0;
// 							filatmp++;
// 						}
// 						/*Hem acabat de veure tots els Camions i peticions de HCP restants. Ara
// 						  falta fer el swap per tots els endarrerits*/
// 						while (iendar < endar.size())
// 						{
// 							Estat estatFill = new Estat(estatPare);
// 							if (estatFill.swapEndarrerits(cp,fila,i,iendar))
// 							{
// 								Successor suc = new Successor("",estatFill);
// 								successors.add(suc);
// 							}
// 							iendar++;
// 						}
//
// 					}
// 				}
// 			}
// 		}
		return successors;
	}
}