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
// 			TODO, placeholder variables :P
		int centreProduccio=0;
		int hora=0;
		int pesPeticio=0;
		Estat estatFill = possarPeticioA(estat, centreProduccio, hora);
		successors.add(new Successor("possar Peticio A " + centreProduccio + " " + hora + " " + pesPeticio, estatFill));
		successors.add(new Successor("treure Peticio De " + centreProduccio + " " + hora + " " + pesPeticio, estatFill));
		
		//Generacio de successors: eliminar peticions, afegir peticions, etc
		//primer generem estats sorgits d'eliminar peticions
		for (int nc = 0; nc < Global.N_CENTRES; nc++)
		{
			for (int h = 0; h < Global.HORES_SERVEI; h++)
			{
				
			}
		}
		
		return successors;
	}
	
	private Estat possarPeticioA(Estat estatPare, int cp, int hora)
	{
		Estat estatFill = new Estat(estatPare);
// 		TODO, placeholder return
		return new Estat(new Matriu(0,0), 1,2,3, true);
	}
	
	private Estat treurePeticioDe(Estat estatPare, int cp, int hora, int horaLimitPeticio)
	{
		Estat estatFill = new Estat(estatPare);
// 		TODO, placeholder return
		return new Estat(new Matriu(0,0), 1,2,3, true);
	}
}