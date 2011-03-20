package Transports;

import java.util.ArrayList;
import java.util.List;

import aima.search.framework.Successor;
import aima.search.framework.SuccessorFunction;


public class TransportsSuccessorFunction implements SuccessorFunction {
	
	public List getSuccessors(Object state) {
			List<Successor> successors = new ArrayList<Successor>();
// 			TODO, placeholder variables :P
			int centreProduccio=0;
			int hora=0;
			int pesPeticio=0;
			Estat fill = possarPeticioA(centreProduccio, hora);
			successors.add(new Successor("possarPeticioA " + centreProduccio + " " + hora + " " + pesPeticio, fill));
			successors.add(new Successor("treurePeticioDe " + centreProduccio + " " + hora + " " + pesPeticio, fill));
			
			return successors;
	}
	
	private Estat possarPeticioA(int cp, int hora)
	{
// 		TODO, placeholder return
		return new Estat(new Matriu(0,0), 1,2,3, true);
	}
}