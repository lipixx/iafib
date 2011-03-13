package Transports;

import java.util.*;

import aima.search.framework.Problem;
import aima.search.informed.HillClimbingSearch;
import aima.search.framework.SearchAgent;


@SuppressWarnings ("unchecked")
public class Main
{
    public static void main (String args[])
    {
	//Init del problema
	Global P = new Global();
	
	Peticio p = new Peticio(100);
	Peticio p1 = new Peticio(200);
	Peticio p2 = new Peticio (1000);
	Peticio p3 = new Peticio (500);
	
	//PETICIONS.add(Hora_limit,Centre,Peticio)
	P.PETICIONS.add(6,5,p2);
	P.PETICIONS.add(7,5,p1);
	P.PETICIONS.add(5,5,p);
	P.PETICIONS.add(5,5,p3);	
	P.PETICIONS.print();	
	
	//Agafar llista de peticions d'una Hora i un Centre
	ArrayList<Peticio> llista = P.PETICIONS.get(5,5);

	System.out.println("Llista 5,5");
	for (int i=0; i<llista.size(); i++)
	    {
		System.out.println(llista.get(i).getQuantitat());
	    }
    }
    
    private static void TransportsHillClimbingSearchMaxGuanys() {
	System.out.println("\nTransports HillClimbing  -->");
	try {
		Problem problem = new Problem(
			new Global(),
			new TransportsSuccessorFunction(),
			new TransportsGoalTest(),
			new TransportsMaxGuanysHeuristicFunction());
		HillClimbingSearch search = new HillClimbingSearch();
		SearchAgent agent = new SearchAgent(problem, search);

		System.out.println();
// 		printActions(agent.getActions());
		System.out.println("Search Outcome=" + search.getOutcome());
		System.out.println("Final State=\n" + search.getLastSearchState());
// 		printInstrumentation(agent.getInstrumentation());
	} catch (Exception e) {
		e.printStackTrace();
	}
	}
	
	private static void TransportsHillClimbingSearchMinDifHora() {
	System.out.println("\nTransports HillClimbing  -->");
	try {
		Problem problem = new Problem(
			new Global(),
			new TransportsSuccessorFunction(),
			new TransportsGoalTest(),
			new TransportsMinDifHoraLimitHoraEntregaHeuristicFunction());
		HillClimbingSearch search = new HillClimbingSearch();
		SearchAgent agent = new SearchAgent(problem, search);

		System.out.println();
// 		printActions(agent.getActions());
		System.out.println("Search Outcome=" + search.getOutcome());
		System.out.println("Final State=\n" + search.getLastSearchState());
// 		printInstrumentation(agent.getInstrumentation());
	} catch (Exception e) {
		e.printStackTrace();
	}
	}

}