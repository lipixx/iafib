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
	P.iniciaProblemaDefault(20,false);
	
	System.out.println("\n#############      PETICIONS      #############");
	P.PETICIONS.printPeticions();
	
	//creem estat1
	Estat estat1 = new Estat(P.PETICIONS,P.nT1,P.nT2,P.nT3,true);
	Matriu chcp1 = estat1.getCamionsHCP();
	System.out.println("\n#############      ESTAT (Graella HCP)      #############");
	chcp1.printGraellaHCP();
	System.out.println("\n~~~~Endarrerits~~~~");
	Matriu endar1 = estat1.getEndarrerits();
	endar1.printEndarrerits();
	
	TransportsMaxGuanysHeuristicFunction htmg = new TransportsMaxGuanysHeuristicFunction();
	TransportsMinDifHoraLimitHoraEntregaHeuristicFunction htdif = new TransportsMinDifHoraLimitHoraEntregaHeuristicFunction();

	System.out.println("\n#############      Heurístiques      #############");
	System.out.println("Heuristic 1 - Beneficis (com major millor, pot haver-hi pèrdues):"+htmg.getHeuristicValue(estat1));
	System.out.println("Heuristic 2 - Hores perdudes (com menor millor):"+htdif.getHeuristicValue(estat1));
	
	//Dupliquem estat1 a estat2
	System.out.println("\n=================   ESTAT 2   ==========================");
	Estat estat2 = new Estat(estat1);
// 	estat2.treurePeticio(8,1,1);
	Matriu chcp2 = estat2.getCamionsHCP();
	System.out.println("\n#############      ESTAT (Graella HCP)      #############");
	chcp2.printGraellaHCP();
	System.out.println("\n~~~~Endarrerits~~~~");
	Matriu endar2 = estat2.getEndarrerits();
	endar2.printEndarrerits();
	

	System.out.println("\n#############      Heurístiques ESTAT 2      #############");
	System.out.println("Heuristic 1 - Beneficis (com major millor, pot haver-hi pèrdues):"+htmg.getHeuristicValue(estat2));
	System.out.println("Heuristic 2 - Hores perdudes (com menor millor):"+htdif.getHeuristicValue(estat2));
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