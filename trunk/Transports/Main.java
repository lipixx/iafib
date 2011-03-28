package Transports;

import java.util.*;

import aima.search.framework.Problem;
import aima.search.informed.HillClimbingSearch;
import aima.search.framework.SearchAgent;
import aima.search.framework.DefaultStepCostFunction;
import aima.search.framework.DefaultHeuristicFunction;



@SuppressWarnings ("unchecked")
public class Main
{
    public static void main (String args[])
    {
		Global P = new Global();
		P.iniciaProblemaDefault(8,true);
		
		TransportsHillClimbingSearchMaxGuanys(P.PETICIONS, P.nT1, P.nT2, P.nT3, Global.LINEAL);
		//		TransportsHillClimbingSearchMinDifHora(P.PETICIONS, P.nT1, P.nT2, P.nT3, Global.MAX_COMPACT);
		

		//Init del problema
		//Global P = new Global();
		//P.iniciaProblemaDefault(20,false);
		/*
		System.out.println("\n#############      PETICIONS      #############");
		P.PETICIONS.printPeticions();
		
		//creem estat1
		Estat estat1 = new Estat(P.PETICIONS,P.nT1,P.nT2,P.nT3,Global.MAX_COMPACT);
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
		estat2.treurePeticio(8  -8, 1  -1, 1  -1);
		//camio inexistent
	// 	estat2.treurePeticio(12  -8, 6  -1, 1  -1);
		//petició inexistent
	// 	estat2.treurePeticio(9  -8, 6  -1, 4  -1);
		estat2.treurePeticio(9  -8, 6  -1, 2  -1);
		estat2.afegirPeticio(9  -8, 6  -1, new Peticio(666,500,9));
		Matriu chcp2 = estat2.getCamionsHCP();
		System.out.println("\n#############      ESTAT (Graella HCP)      #############");
		chcp2.printGraellaHCP();
		System.out.println("\n~~~~Endarrerits~~~~");
		Matriu endar2 = estat2.getEndarrerits();
		endar2.printEndarrerits();
		

		System.out.println("\n#############      Heurístiques ESTAT 2      #############");
		System.out.println("Heuristic 1 - Beneficis (com major millor, pot haver-hi pèrdues):"+htmg.getHeuristicValue(estat2));
		System.out.println("Heuristic 2 - Hores perdudes (com menor millor):"+htdif.getHeuristicValue(estat2));
		*/
    }
   
    /**Creacio problema amb HillClimbing amb funcio heuristica Max Guanys
     * @param gen Tipus d'estratègia a utilitzar (Global.LINEAL, Global.MAX_COMPACT)
     */
    private static void TransportsHillClimbingSearchMaxGuanys(Matriu peticions, int n1, int n2, int n3, int gen) {
		System.out.println("\nTransports HillClimbing Maximitzar Beneficis -->");
		try {
			Problem problem = new Problem(
				new Estat(peticions, n1, n2, n3, gen),
				new TransportsSuccessorFunction(),
				new TransportsGoalTest(),
				new TransportsMaxGuanysHeuristicFunction());
			HillClimbingSearch search = new HillClimbingSearch();
			SearchAgent agent = new SearchAgent(problem, search);

			System.out.println();
			printActions(agent.getActions());
			System.out.println("Search Outcome=" + search.getOutcome());
			System.out.println("Final State=\n" + search.getLastSearchState());
			printInstrumentation(agent.getInstrumentation());
			
			//Mostrem estat final
			Estat estatFinal = (Estat) search.getLastSearchState();
			Matriu chcp = estatFinal.getCamionsHCP();
			System.out.println("\n#############      ESTAT FINAL (Graella Hores-CP)      #############");
			chcp.printGraellaHCP();
			System.out.println("\n#############      Endarrerits      #############");
			Matriu endarrerits = estatFinal.getEndarrerits();
			endarrerits.printEndarrerits();
			
			TransportsMaxGuanysHeuristicFunction htmg = new TransportsMaxGuanysHeuristicFunction();
			TransportsMinDifHoraLimitHoraEntregaHeuristicFunction htdif = new TransportsMinDifHoraLimitHoraEntregaHeuristicFunction();
			System.out.println("\n#############      Heurístiques ESTAT FINAL      #############");
			System.out.println("Heuristic 1 - Beneficis (com major millor, pot haver-hi pèrdues):"+htmg.getHeuristicValue(estatFinal)*-1);
			System.out.println("Heuristic 2 - Hores perdudes (com menor millor):"+htdif.getHeuristicValue(estatFinal));
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
    /**Creacio problema amb HillClimbing amb funcio heuristica Min Dif Hora
     * @param gen Tipus d'estratègia a utilitzar (Global.LINEAL, Global.MAX_COMPACT)     
     */
	private static void TransportsHillClimbingSearchMinDifHora(Matriu peticions, int n1, int n2, int n3, int gen) {
		System.out.println("\nTransports HillClimbing Min Dif Hora  -->");
		try {
			Problem problem = new Problem(
				new Estat(peticions, n1, n2, n3, gen),
				new TransportsSuccessorFunction(),
				new TransportsGoalTest(),
				new TransportsMinDifHoraLimitHoraEntregaHeuristicFunction());
			HillClimbingSearch search = new HillClimbingSearch();
			SearchAgent agent = new SearchAgent(problem, search);

			System.out.println();
			printActions(agent.getActions());
			System.out.println("Search Outcome=" + search.getOutcome());
			System.out.println("Final State=\n" + search.getLastSearchState());
			printInstrumentation(agent.getInstrumentation());

			Estat estatFinal = (Estat) search.getLastSearchState();
			Matriu chcp = estatFinal.getCamionsHCP();
			System.out.println("\n#############      ESTAT FINAL (Graella Hores-CP)      #############");
			chcp.printGraellaHCP();
			System.out.println("\n#############      Endarrerits      #############");
			Matriu endarrerits = estatFinal.getEndarrerits();
			endarrerits.printEndarrerits();

			TransportsMaxGuanysHeuristicFunction htmg = new TransportsMaxGuanysHeuristicFunction();
			TransportsMinDifHoraLimitHoraEntregaHeuristicFunction htdif = new TransportsMinDifHoraLimitHoraEntregaHeuristicFunction();
			System.out.println("\n#############      Heurístiques ESTAT FINAL      #############");
			System.out.println("Heuristic 1 - Beneficis (com major millor, pot haver-hi pèrdues):"+htmg.getHeuristicValue(estatFinal)*-1);
			System.out.println("Heuristic 2 - Hores perdudes (com menor millor):"+htdif.getHeuristicValue(estatFinal));

		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	private static void printInstrumentation(Properties properties) {
		Iterator keys = properties.keySet().iterator();
		while (keys.hasNext()) {
				String key = (String) keys.next();
				String property = properties.getProperty(key);
				System.out.println(key + " : " + property);
		}
	}

	private static void printActions(List actions) {
		for (int i = 0; i < actions.size(); i++) {
			String action = (String) actions.get(i);
			System.out.println(action);
		}
	}

}