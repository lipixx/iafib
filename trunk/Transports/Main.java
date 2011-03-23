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
	P.iniciaProblemaDefault(-1,false);
	
	P.PETICIONS.printPeticions();	      
    }
   
    /**Creacio problema amb HC amb funcio heuristica Max Guanys
     * @param gen1 Es true si fem servir estragia num 1 de generacio d'estat inicial, false si num 2
     */
    private static void TransportsHillClimbingSearchMaxGuanys(Matriu peticions, int n1, int n2, int n3, boolean gen1) {
	System.out.println("\nTransports HillClimbing  -->");
	try {
		Problem problem = new Problem(
			new Estat(peticions, n1, n2, n3, gen1),
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
	
	private static void TransportsHillClimbingSearchMinDifHora(Matriu peticions, int n1, int n2, int n3, boolean gen1) {
	System.out.println("\nTransports HillClimbing  -->");
	try {
		Problem problem = new Problem(
			new Estat(peticions, n1, n2, n3, gen1),
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