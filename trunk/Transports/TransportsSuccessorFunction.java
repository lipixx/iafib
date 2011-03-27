package Transports;

import java.util.ArrayList;
import java.util.List;

import aima.search.framework.Successor;
import aima.search.framework.SuccessorFunction;

@SuppressWarnings ("unchecked")
public class TransportsSuccessorFunction implements SuccessorFunction {
	
	public List getSuccessors(Object state) {
		Estat estatPare = (Estat) state;
		Matriu camionsHCP = estatPare.getCamionsHCP();
		Matriu endarrerits = estatPare.getEndarrerits();
		List<Successor> successors = new ArrayList<Successor>();
		
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
						Estat estatFill = treurePeticioDe(estatPare, h, cp, pet);
						Peticio petActual = llistaPeticions.get(pet);
						int pesPet = petActual.getQuantitat();
						Successor suc = new Successor("treure Peticio de CP: " +
								cp + " hora: " + h + " pes: " + pesPet, estatFill);
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
			ArrayList<Peticio> llistaPeticions = Global.PETICIONS.get(0,cpEnd);
			for (int pet = 0; pet < llistaPeticions.size(); pet++)
			{
				Peticio petActual = llistaPeticions.get(pet);
				for(int hl = 0; hl < Global.HORES_SERVEI; hl++)
				{
					Camio camioActual = (Camio) camionsHCP.getObj(hl,cpEnd);
					if(petActual.getQuantitat()+camioActual.getCarrega() <= camioActual.getTipus())
					{
						Estat estatFill = possarPeticioA(estatPare, hl, cpEnd, petActual);
						int pesPet = llistaPeticions.get(pet).getQuantitat();
						Successor suc = new Successor("possar Peticio a CP: " +
								cpEnd + " hora: " + hl + " pes: " + pesPet, estatFill);
						successors.add(suc);
					}
					//Generem estats afegint peticions modificant el tipus de camió si fa falta
					else
					{
						
					}
				}
			}
		}
		
		
		
		return successors;
	}
	
	//TODO, placeholder return
	private Estat possarPeticioA(Estat estatPare, int hora, int cp, Peticio pet)
	{
		Estat estatFill = new Estat(estatPare);
		estatFill.afegirPeticio(hora, cp, pet);
		return estatFill;
	}
	
	private Estat treurePeticioDe(Estat estatPare, int hora, int cp, int posicioPeticio)
	{
		Estat estatFill = new Estat(estatPare);
		estatFill.treurePeticio(hora, cp, posicioPeticio);
		return estatFill;
	}
}