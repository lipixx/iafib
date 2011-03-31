package Transports;

import java.util.*;
import java.io.*;
import org.apache.commons.cli.*;
import aima.search.framework.Problem;
import aima.search.informed.HillClimbingSearch;
import aima.search.informed.SimulatedAnnealingSearch;
import aima.search.framework.SearchAgent;
import aima.search.framework.DefaultStepCostFunction;
import aima.search.framework.DefaultHeuristicFunction;



@SuppressWarnings ("unchecked")
public class Main
{
	public static boolean HTMLPrint = false;
	public static boolean successorsSwap = false;
	public static int estrEInicial = Global.LINEAL;
    public static boolean hbenef = true;
    public static boolean hhores = false;
    public static int numpet = 0;
    public static boolean random = false;
    public static void main (String args[])
	{
	    //main -html -random -s succs -hbenef -hhores -g lineal -numpet 150  -c 20 20 20

	    //Falta definir probabilitat de pesos i de hores.
		Global P = new Global();

		Options options = new Options();
		options.addOption("html",false,"Imprimeix l'output en format html");
		options.addOption("hbenef",false,"Activar heurístiques de maximització de beneficis");
		options.addOption("hhores",false,"Activar heurístiques de minimitzar diferència engre hores limit i d'entrega");
		options.addOption("random",false,"Executar una mostra no pre-definida. S'ha de definir nombre màx. de peticions.");
		options.addOption("probs",false,"Entrar a l'editor de probabilitats de les hores i del pes de les peticions.");
		
		Option s = OptionBuilder.withArgName("s")
		    .hasArgs(1)
		    .withDescription("Tipus d'estratègia de successors [swap,addrem]")
                    .create("s");

		Option numpetopt = OptionBuilder.withArgName("numpet")
		    .hasArgs(1)
		    .withDescription("Nombre de peticions màx. aleatòries a generar. Ha de ser major que 0.")
                    .create("numpet");		

		Option g = OptionBuilder.withArgName("g")
		    .hasArgs(1)
		    .withDescription("Estratègia generació estat inicial [lineal,maxcompact]")
                    .create("g");

		Option c = OptionBuilder.withArgName("nt1> <nt2> <nt3")
		    .hasArgs(3)
		    .withValueSeparator()
		    .withDescription("Nombre de camions de tipus1, tipus2 i tipus3. Han de sumar 60")
                    .create("c");

		options.addOption(s);
		options.addOption(g);
		options.addOption(c);
		options.addOption(numpetopt);

		HelpFormatter formatter = new HelpFormatter();
		CommandLineParser parser = new PosixParser();
		CommandLine cmd = null;

		try {
		    cmd = parser.parse(options,args);
		} catch (ParseException exp) {
		    System.err.println("Comanda invàlida: "+exp.getMessage());
		    formatter.printHelp("java Transports.main", options);
		    System.exit(1);
		}

		if (cmd.getArgs().length > 0)
		    {
		    formatter.printHelp("java Transports.main", options);
		    System.exit(1);
		    }

		HTMLPrint = cmd.hasOption("html");	       	       	      
		hhores = cmd.hasOption("hhores");
		hbenef = cmd.hasOption("hbenef");		
		if (!(hbenef | hhores)) hbenef = true;
		
		if (cmd.hasOption("s"))
		    {
			if (cmd.getOptionValue("s").equals("swap"))
			    {				
				successorsSwap = true;
			    }
			else
			    if (!cmd.getOptionValue("s").equals("addrem"))
				{ formatter.printHelp("java Transports.main", options); System.exit(1); }
		    }

		if (cmd.hasOption("g"))
		    {
			if (cmd.getOptionValue("g").equals("maxcompact"))
			    estrEInicial = Global.MAX_COMPACT;			    
			else
			    if (!cmd.getOptionValue("g").equals("lineal"))
				{ formatter.printHelp("java Transports.main", options); System.exit(1); }
		    }

		if (cmd.hasOption("numpet"))
		    {		       
			numpet = Integer.parseInt((String) cmd.getOptionValue("numpet"));
			if (numpet <= 0) { formatter.printHelp("java Transports.main", options); System.exit(1); }
		    }
		
		
		if (cmd.hasOption("c"))
		    {
			String sr[] = cmd.getOptionValues("c");
			
			if (sr.length != 3)
			    { formatter.printHelp("java Transports.main", options); System.exit(1); }
			
			P.nT1 = Integer.parseInt(sr[0]);
			P.nT2 = Integer.parseInt(sr[1]);
			P.nT3 = Integer.parseInt(sr[2]);
			
			if ((P.nT1 + P.nT2 + P.nT3) != 60) 
			    { formatter.printHelp("java Transports.main", options); System.exit(1); }
		    }
		random = cmd.hasOption("random");
		if (random && numpet <= 0)
		    { System.out.println("Amb la opció -random és obligatori especificar nombre de peticions (-numpet)");
			formatter.printHelp("java Transports.main", options); System.exit(1); }
	      
		if (cmd.hasOption("probs"))
		    {
			BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
			String probsH = null;
			String probsP = null;
			
			if (!HTMLPrint)
			    System.out.println("Entra 10 probabilitats per la distribució peticions entre les hores de 8 a 17h. Valors entre 0.0 i 1.0 i pitja ENTER");
			try {
			    probsH = br.readLine();
			}
			catch (IOException e){
			    System.out.println("Error "+e);
			    System.exit(1);
			}
			if (!HTMLPrint)
			System.out.println("Entra 5 probabilitats per la distribució dels pesos a les peticions de 100 a 500. Valors entre 0.0 i 1.0 i pitja ENTER");

			try{
			 probsP = br.readLine();
			}
			catch (IOException e){
			    System.out.println("Error "+e);
			    System.exit(1);
			}
			
			String ph[] = probsH.split(" ");
			if (ph.length != 10) { System.out.println("String mal introduït"); System.exit(1); }
			for (int i = 0; i < 10; i++)
			    {
				P.probabilitatsHores[i] = Double.parseDouble(ph[i]);
			    }
			
			String pp[] = probsP.split(" ");
			if (pp.length != 5) { System.out.println("String mal introduït"); System.exit(1); }
			for (int i = 0; i < 5; i++)
			    {
				P.probabilitatsPesos[i] = Double.parseDouble(pp[i]);
			    }
			
		    }
		
		P.iniciaProblemaDefault(numpet,random,P.probabilitatsHores,P.probabilitatsPesos);


		/*--------------------------------Algorismes a executar------------------------------------*/

		if (HTMLPrint){
		    String probsh = "";
		    String probsp = "";
		    
		    for (int i =0; i<10; i++)
			probsh = probsh + P.probabilitatsHores[i] + ",";
		    for (int i =0; i<5; i++)
			probsp = probsp + P.probabilitatsPesos[i] + ",";
		    
		    

		    System.out.println("<html>\n<head>\n<style type=\"text/css\">body{font-family: arial;}table{border-collapse: collapse;}td{padding: 12px;}</style>\n<title> Resultats execució IA - Practica 1</title>\n <META http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\">\n </head>\n<body> <p><b>Params. execució: </b><br/><br/>\n\t <b> Ex. Heurística Beneficis: </b> " +hbenef+"<br/>\n\t <b> Ex. Heurística Min. Hores: </b> " +hhores+"<br/>\n\t <b> Estratègia successors (swap:true, addrem: false): </b> " +successorsSwap+"<br/>\n\t <b> Estratègia estat inicial (Lineal: "+Global.LINEAL+", Max Compact: "+Global.MAX_COMPACT+") : </b> " +estrEInicial+"<br/>\n\t <b> Generació aleatòria?: </b> " +random+"<br/>\n \t <b> Num peticions a generar: </b> " +numpet+"<br/>\n\t <b> Num camions T1, T2, T3: </b> " +P.nT1+","+P.nT2+","+P.nT3+"<br/>\n\t <b>Probabilitats horàries de 08 a 17h: </b> " +probsh+"<br/>\n \t <b>Probabilitats de pesos de 100 a 500kg: </b> " +probsp+"<br/></p>");
		}

		if (hbenef) TransportsHillClimbingSearchMaxGuanys(P.PETICIONS, P.nT1, P.nT2, P.nT3, estrEInicial);
		if (hhores) TransportsHillClimbingSearchMinDifHora(P.PETICIONS, P.nT1, P.nT2, P.nT3, estrEInicial);

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
		System.out.println("Heurístic 1 - Beneficis (com major millor, pot haver-hi pèrdues):"+htmg.getHeuristicValue(estat1));
		System.out.println("Heurístic 2 - Hores desfassades (com menor millor):"+htdif.getHeuristicValue(estat1));

		//Dupliquem estat1 a estat2
		System.out.println("\n=================   ESTAT 2   ==========================");
		Estat estat2 = new Estat(estat1);
		estat2.treurePeticio(8  -8, 1  -1, 1  -1);
		//camio inexistent
		//estat2.treurePeticio(12  -8, 6  -1, 1  -1);
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
		System.out.println("Heurístic 1 - Beneficis (com major millor, pot haver-hi pèrdues):"+htmg.getHeuristicValue(estat2));
		System.out.println("Heurístic 2 - Hores desfassades (com menor millor):"+htdif.getHeuristicValue(estat2));
		*/
	}

	/**Creació problema amb HillClimbing amb funció heurística Max Guanys
	 * @param gen Tipus d'estratègia a utilitzar (Global.LINEAL, Global.MAX_COMPACT)
	 */
	private static void TransportsHillClimbingSearchMaxGuanys(Matriu peticions, int n1, int n2, int n3, int gen)
	{
	    long time = System.currentTimeMillis();
		try
		{
			Problem problem;

			if (successorsSwap)
			{
				problem = new Problem(
				    new Estat(peticions, n1, n2, n3, gen),
				    new TransportsSuccessorFunction(),
				    new TransportsGoalTest(),
				    new TransportsMaxGuanysHeuristicFunction());
			}
			else
			{
				problem = new Problem(
				    new Estat(peticions, n1, n2, n3, gen),
				    new TransportsSuccessorFunctionAddRem(),
				    new TransportsGoalTest(),
				    new TransportsMaxGuanysHeuristicFunction());
			}

			HillClimbingSearch search = new HillClimbingSearch();
			SearchAgent agent = new SearchAgent(problem, search);

			//Mostrem estat final
			Estat estatFinal = (Estat) search.getLastSearchState();
			time = System.currentTimeMillis() - time;
			printEstatFinal(agent, estatFinal, "HillClimbing", "Maximitzar Beneficis", ""+search.getOutcome(), ""+search.getLastSearchState(),time);
		}
		catch (Exception e)
		{
			e.printStackTrace();
		}
	}

	/**Creació problema amb HillClimbing amb funció heurística Min Dif Hora
	 * @param gen Tipus d'estratègia a utilitzar (Global.LINEAL, Global.MAX_COMPACT)
	 */
	private static void TransportsHillClimbingSearchMinDifHora(Matriu peticions, int n1, int n2, int n3, int gen)
	{
	    long time = System.currentTimeMillis();
		try
		{
			Problem problem = new Problem(
			    new Estat(peticions, n1, n2, n3, gen),
			    new TransportsSuccessorFunction(),
			    new TransportsGoalTest(),
			    new TransportsMinDifHoraLimitHoraEntregaHeuristicFunction());
			HillClimbingSearch search = new HillClimbingSearch();
			SearchAgent agent = new SearchAgent(problem, search);

			//Mostrem estat final
			Estat estatFinal = (Estat) search.getLastSearchState();
			time = System.currentTimeMillis() - time;
			printEstatFinal(agent, estatFinal, "HillClimbing", "Minimitzar diferència absoluta de hores", ""+search.getOutcome(), ""+search.getLastSearchState(),time);
		}
		catch (Exception e)
		{
			e.printStackTrace();
		}
	}

	/**Creació problema amb Simulated Annealing amb funció heurística Max Guanys
	 * @param gen Tipus d'estratègia a utilitzar (Global.LINEAL, Global.MAX_COMPACT)
	 */
	private static void TransportsSimulatedAnnealingSearchMaxGuanys(Matriu peticions, int n1, int n2, int n3, int gen, int steps, int stiter, int k, double lamb)
	{
	    long time = System.currentTimeMillis();
		try
		{
			Problem problem;
			
			if (successorsSwap)
			{
				problem = new Problem(
				new Estat(peticions, n1, n2, n3, gen),
				new TransportsSuccessorFunction(),
				new TransportsGoalTest(),
				new TransportsMaxGuanysHeuristicFunction());
			}
			else
			{
				problem = new Problem(
				new Estat(peticions, n1, n2, n3, gen),
				new TransportsSuccessorFunctionAddRem(),
				new TransportsGoalTest(),
				new TransportsMaxGuanysHeuristicFunction());
			}
			
			SimulatedAnnealingSearch search = new SimulatedAnnealingSearch(steps, stiter, k, lamb);
			SearchAgent agent = new SearchAgent(problem, search);
			
			//Mostrem estat final
			time = System.currentTimeMillis() - time;
			Estat estatFinal = (Estat) search.getLastSearchState();
			printEstatFinal(agent, estatFinal, "Simulated Annealing", "Maximitzar beneficis", ""+search.getOutcome(), ""+search.getLastSearchState(),time);
			
		}
		catch (Exception e)
		{
			e.printStackTrace();
		}
	}
	
	/**Creació problema amb Simulated Annealing amb funció heurística Min Dif Hora
	 * @param gen Tipus d'estratègia a utilitzar (Global.LINEAL, Global.MAX_COMPACT)
	 */
	private static void TransportsSimulatedAnnealingSearchMinDifHora(Matriu peticions, int n1, int n2, int n3, int gen, int steps, int stiter, int k, double lamb)
	{
	    long time = System.currentTimeMillis();
		try
		{
			Problem problem;
			
			if (successorsSwap)
			{
				problem = new Problem(
				new Estat(peticions, n1, n2, n3, gen),
				new TransportsSuccessorFunction(),
				new TransportsGoalTest(),
				new TransportsMinDifHoraLimitHoraEntregaHeuristicFunction());
			}
			else
			{
				problem = new Problem(
				new Estat(peticions, n1, n2, n3, gen),
				new TransportsSuccessorFunctionAddRem(),
				new TransportsGoalTest(),
				new TransportsMinDifHoraLimitHoraEntregaHeuristicFunction());
			}
			
			SimulatedAnnealingSearch search = new SimulatedAnnealingSearch(steps, stiter, k, lamb);
			SearchAgent agent = new SearchAgent(problem, search);
			
			//Mostrem estat final
			time = System.currentTimeMillis() - time;
			Estat estatFinal = (Estat) search.getLastSearchState();
			printEstatFinal(agent, estatFinal, "Simulated Annealing", "Maximitzar beneficis", ""+search.getOutcome(), ""+search.getLastSearchState(),time);
			
		}
		catch (Exception e)
		{
			e.printStackTrace();
		}
	}



	private static void printInstrumentation(Properties properties)
	{
		Iterator keys = properties.keySet().iterator();
		while (keys.hasNext())
		{
			String key = (String) keys.next();
			String property = properties.getProperty(key);
			System.out.println(key + " : " + property);
		}
	}

	private static void printActions(List actions)
	{
		for (int i = 0; i < actions.size(); i++)
		{
			String action = (String) actions.get(i);
			System.out.println(action);
		}
	}
    private static void printHTML(String header,String outcome, String lastSState, Properties properties, long time)
	{
		String tmp = "";
		Iterator keys = properties.keySet().iterator();
		while (keys.hasNext())
		{
			String key = (String) keys.next();
			String property = properties.getProperty(key);
			tmp = "<b>"+ key + ": </b>" + property;
		}

		System.out.println("<h1>"+header+"</h1>\n"
				   +"\t<p><b>Search Outcome:</b> "+outcome
		                   +"</p><p><b>Final State:</b> "+lastSState+"</p>\n"
		                   +"<p>"+tmp+"</p>\n"
				   +"<p><b>Temps d'execució: </b>"+time+" milisegons</p>\n");
	}
	
    private static void printEstatFinal(SearchAgent agent, Estat estatFinal, String algorisme, String heuristica, String outcome, String lastSState, long time)
	{
		TransportsMaxGuanysHeuristicFunction htmg = new TransportsMaxGuanysHeuristicFunction();
			TransportsMinDifHoraLimitHoraEntregaHeuristicFunction htdif = new TransportsMinDifHoraLimitHoraEntregaHeuristicFunction();
		
		Matriu chcp = estatFinal.getCamionsHCP();
		Matriu endarrerits = estatFinal.getEndarrerits();

// 		String outcome = ""+ search.getOutcome();
// 		String lastst = ""+ search.getLastSearchState();
		
		
		if (HTMLPrint) printHTML("Transports " + algorisme + " - " + heuristica, outcome,lastSState,agent.getInstrumentation(),time);
		else
		{
			System.out.println("\nTransports " + algorisme + heuristica + " -->");
			printActions(agent.getActions());
			System.out.println("Search Outcome=" + outcome);
			System.out.println("Final State=\n" + lastSState);
			printInstrumentation(agent.getInstrumentation());
		}

		if (HTMLPrint)
		{
			System.out.println("<p><b>Heurístic 1 - Beneficis (com major millor, pot haver-hi perdues): </b>"
								+(htmg.getHeuristicValue(estatFinal)*-1)+"</p>"+
								"<p><b>Heurístic 2 - Hores desfassades (com menor millor): </b>"
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
			System.out.println("Heurístic 1 - Beneficis (com major millor, pot haver-hi pèrdues):"+htmg.getHeuristicValue(estatFinal)*-1);
			System.out.println("Heurístic 2 - Hores desfassades (com menor millor):"+htdif.getHeuristicValue(estatFinal));
		}
	}
}