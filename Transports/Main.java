package Transports;

import java.util.*;

import aima.search.framework.Problem;
import aima.search.informed.HillClimbingSearch;
import aima.search.framework.SearchAgent;
import aima.search.framework.DefaultStepCostFunction;
import aima.search.framework.DefaultHeuristicFunction;



@SuppressWarnings ("unchecked")
public class Main {
    public static boolean HTMLPrint = false;

    public static void main (String args[]) {
        Global P = new Global();
        P.iniciaProblemaDefault(10,false);

	if (args.length > 1)
	    {
		System.out.println("\tUs: java Transports.Main <options>\n\tOptions: --html  Mostra l'output en format html.");
		System.exit(0);
	    }
	else
	    if (args.length == 1)
		if (args[0].equals("--html")) HTMLPrint = true;

	if (HTMLPrint)
	    System.out.println("<html>\n<title>Resultats execucio : IA - Practica 1 - Q2 2010-2011</title>\n<body>");	
	/*--------------------------------Algorismes a executar------------------------------------*/



	TransportsHillClimbingSearchMaxGuanys(P.PETICIONS, P.nT1, P.nT2, P.nT3, Global.LINEAL);
        TransportsHillClimbingSearchMinDifHora(P.PETICIONS, P.nT1, P.nT2, P.nT3, Global.MAX_COMPACT);



	/*------------------------------------------------------------------------------------------*/

	if (HTMLPrint)
	    System.out.println("</body></html>");

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
        System.out.println("Heuristic 2 - Hores desfassades (com menor millor):"+htdif.getHeuristicValue(estat1));

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
        System.out.println("Heuristic 2 - Hores desfassades (com menor millor):"+htdif.getHeuristicValue(estat2));
        */
    }

    /**Creacio problema amb HillClimbing amb funcio heuristica Max Guanys
     * @param gen Tipus d'estratègia a utilitzar (Global.LINEAL, Global.MAX_COMPACT)
     */
    private static void TransportsHillClimbingSearchMaxGuanys(Matriu peticions, int n1, int n2, int n3, int gen) {
        try {
            Problem problem = new Problem(
                new Estat(peticions, n1, n2, n3, gen),
                new TransportsSuccessorFunction(),
                new TransportsGoalTest(),
                new TransportsMaxGuanysHeuristicFunction());
            HillClimbingSearch search = new HillClimbingSearch();
            SearchAgent agent = new SearchAgent(problem, search);

	    TransportsMaxGuanysHeuristicFunction htmg = new TransportsMaxGuanysHeuristicFunction();
            TransportsMinDifHoraLimitHoraEntregaHeuristicFunction htdif = new TransportsMinDifHoraLimitHoraEntregaHeuristicFunction();
	   	    
            //Mostrem estat final
            Estat estatFinal = (Estat) search.getLastSearchState();
            Matriu chcp = estatFinal.getCamionsHCP();
            Matriu endarrerits = estatFinal.getEndarrerits();

	    String outcome = ""+ search.getOutcome();
	    String lastst = ""+ search.getLastSearchState();
	    
	    if (HTMLPrint) printHTML("Transports HillClimbing - Maximitzar Beneficis",outcome,lastst,agent.getInstrumentation());
	    else
		{
		    System.out.println("\nTransports HillClimbing Maximitzar Beneficis -->");
		    System.out.println("Heuristic 2 - Hores desfassades (com menor millor):"+htdif.getHeuristicValue(estatFinal));
		    System.out.println();
		    printActions(agent.getActions());
		    System.out.println("Search Outcome=" + search.getOutcome());
		    System.out.println("Final State=\n" + search.getLastSearchState());
		    printInstrumentation(agent.getInstrumentation());
		}

	    if (HTMLPrint)
		{
		    System.out.println("<p><b>Heuristic 1 - Beneficis (com major millor, pot haver-hi perdues): </b>"
				       +(htmg.getHeuristicValue(estatFinal)*-1)+"</p>"+
				       "<p><b>Heuristic 2 - Hores desfassades (com menor millor): </b>"
				       +(htdif.getHeuristicValue(estatFinal))+"</p>");
		    System.out.println(chcp.printGraellaHCPHtml());
		    System.out.println(endarrerits.printEndarreritsHtml());
		}
	    else
		{
		    System.out.println("\n#############      ESTAT FINAL (Graella Hores-CP)      #############");
		    chcp.printGraellaHCP();
		    System.out.println("\n#############      Endarrerits      #############");
		    endarrerits.printEndarrerits();
		       
		    System.out.println("\n#############      Heurístiques ESTAT FINAL      #############");
		    System.out.println("Heuristic 1 - Beneficis (com major millor, pot haver-hi pèrdues):"+htmg.getHeuristicValue(estatFinal)*-1);
		    System.out.println("Heuristic 2 - Hores desfassades (com menor millor):"+htdif.getHeuristicValue(estatFinal));		    
	}	    
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    /**Creacio problema amb HillClimbing amb funcio heuristica Min Dif Hora
     * @param gen Tipus d'estratègia a utilitzar (Global.LINEAL, Global.MAX_COMPACT)
     */
    private static void TransportsHillClimbingSearchMinDifHora(Matriu peticions, int n1, int n2, int n3, int gen) {

        try {
            Problem problem = new Problem(
                new Estat(peticions, n1, n2, n3, gen),
                new TransportsSuccessorFunction(),
                new TransportsGoalTest(),
                new TransportsMinDifHoraLimitHoraEntregaHeuristicFunction());
            HillClimbingSearch search = new HillClimbingSearch();
            SearchAgent agent = new SearchAgent(problem, search);


	    TransportsMaxGuanysHeuristicFunction htmg = new TransportsMaxGuanysHeuristicFunction();
            TransportsMinDifHoraLimitHoraEntregaHeuristicFunction htdif = new TransportsMinDifHoraLimitHoraEntregaHeuristicFunction();
	   	    
            //Mostrem estat final
            Estat estatFinal = (Estat) search.getLastSearchState();
            Matriu chcp = estatFinal.getCamionsHCP();
            Matriu endarrerits = estatFinal.getEndarrerits();

	    String outcome = ""+ search.getOutcome();
	    String lastst = ""+ search.getLastSearchState();
	    
	    if (HTMLPrint) printHTML("Transports HillClimbing - Minimitzar diferencia absoluta de hores",outcome,lastst,agent.getInstrumentation());
	    else
		{
		    System.out.println("\nTransports HillClimbing Min Dif Hora  -->");
		    System.out.println("Heuristic 2 - Hores desfassades (com menor millor):"+htdif.getHeuristicValue(estatFinal));
		    System.out.println();
		    printActions(agent.getActions());
		    System.out.println("Search Outcome=" + search.getOutcome());
		    System.out.println("Final State=\n" + search.getLastSearchState());
		    printInstrumentation(agent.getInstrumentation());
		}

	    if (HTMLPrint)
		{
		    System.out.println("<p><b>Heuristic 1 - Beneficis (com major millor, pot haver-hi perdues): </b>"
				       +(htmg.getHeuristicValue(estatFinal)*-1)+"</p>"+
				       "<p><b>Heuristic 2 - Hores desfassades (com menor millor): </b>"
				       +(htdif.getHeuristicValue(estatFinal))+"</p>");
		    System.out.println(chcp.printGraellaHCPHtml());
		    System.out.println(endarrerits.printEndarreritsHtml());
		}
	    else
		{
		    System.out.println("\n#############      ESTAT FINAL (Graella Hores-CP)      #############");
		    chcp.printGraellaHCP();
		    System.out.println("\n#############      Endarrerits      #############");
		    endarrerits.printEndarrerits();
		       
		    System.out.println("\n#############      Heurístiques ESTAT FINAL      #############");
		    System.out.println("Heuristic 1 - Beneficis (com major millor, pot haver-hi pèrdues):"+htmg.getHeuristicValue(estatFinal)*-1);
		    System.out.println("Heuristic 2 - Hores desfassades (com menor millor):"+htdif.getHeuristicValue(estatFinal));		    
	}	    
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
    private static void printHTML(String header,String outcome, String lastSState, Properties properties)
    {
	String tmp = "";
	Iterator keys = properties.keySet().iterator();
        while (keys.hasNext()) {
            String key = (String) keys.next();
            String property = properties.getProperty(key);
            tmp = "<b>"+ key + ": </b>" + property;
        }

	System.out.println("<h1>"+header+"</h1>\n"+"\t<p><b>Search Outcome:</b> "+outcome
			   +"</p><p><b>Final State:</b> "+lastSState+"</p>\n"
			   +"<p>"+tmp+"</p>\n");	
    }
}