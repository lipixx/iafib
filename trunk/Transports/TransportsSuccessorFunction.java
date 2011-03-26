package Transports;

import java.util.ArrayList;
import java.util.List;

import aima.search.framework.Successor;
import aima.search.framework.SuccessorFunction;


public class TransportsSuccessorFunction implements SuccessorFunction {
	
	public List getSuccessors(Object state) {
		Estat estat = (Estat) state;
		Matriu camionsHCP = estat.getCamionsHCP();
		Matriu endarrerits = estat.getEndarrerits();
		List<Successor> successors = new ArrayList<Successor>();
		//TODO, placeholder variables
		int centreProduccio=0;
		int hora=0;
		int pesPeticio=0;
		Estat estatFillProva = possarPeticioA(estat, centreProduccio, hora);
		successors.add(new Successor("possar Peticio A " + centreProduccio + " " + hora + " " + pesPeticio, estatFillProva));
		successors.add(new Successor("treure Peticio De " + centreProduccio + " " + hora + " " + pesPeticio, estatFillProva));
		//final placeholder
		
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
						Estat estatFill = treurePeticioDe(estat, h, cp, pet);
						int pesPet = llistaPeticions.get(pet).getQuantitat();
						Successor suc = new Successor("treure Peticio de CP: " +
								cp + " hora: " + h + " pes: " + pesPet, estatFill);
						successors.add(suc);
					}
				}
			}
		}
		//TODO: Generem estats afegint peticions només a camions on hi capiguen
		
		//TODO: Generem estats afegint peticions modificant el tipus de camió si fa falta
		
		return successors;
	}
	
	//TODO, placeholder return
	private Estat possarPeticioA(Estat estatPare, int cp, int hora)
	{
		Estat estatFill = new Estat(estatPare);
		return new Estat(new Matriu(0,0), 1,2,3, true);
	}
	
	private Estat treurePeticioDe(Estat estatPare, int hora, int cp, int posicioPeticio)
	{
		Estat estatFill = new Estat(estatPare);
		estatFill.treurePeticio(hora, cp, posicioPeticio);
		return estatFill;
	}
}