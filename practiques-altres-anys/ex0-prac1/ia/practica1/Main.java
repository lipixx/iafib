package ia.practica1;

import ia.Bicing.Bicing;

import java.util.List;

import aima.search.framework.Problem;
import aima.search.framework.SearchAgent;
import aima.search.informed.HillClimbingSearch;
import aima.search.informed.SimulatedAnnealingSearch;

public class Main {

	/* Parámetros de configuración */
	/* Bicing */
	private static final int est = 50;
	private static final int bic = 50*est;
	private static final int dem = Bicing.EQUILIBRIUM;

	
	/* Simulated Annealing */
	private int steps = 8000;
	private static int k = 64;
	private static double lambda = 0.011;
	/* ******************** */
	
	public static void main(String[] args) {
		BicingState start = new BicingState(est, bic, dem);
		Main m = new Main();
		m.BicingHillClimbingSearch(start);
		m.BicingSimulatedAnnealingSearch(start);
	}
	
	private void BicingHillClimbingSearch(BicingState bs) {
        System.out.println("HillClimbing  -->");
        try {
            Problem problem =  new Problem(bs, new BicingSuccessorFunction()
            								 , new BicingGoalTest()
            								 , new BicingHeuristicFunction());
            HillClimbingSearch search =  new HillClimbingSearch();
            SearchAgent agent = new SearchAgent(problem,search);
            printActions(agent.getActions());
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
    private void BicingSimulatedAnnealingSearch(BicingState bs) {
        System.out.println("\nSimulated Annealing  -->");
        try {
            Problem problem =  new Problem(bs, new BicingSuccessorFunctionSA()
            								 , new BicingGoalTest()
            								 ,new BicingHeuristicFunction());
            SimulatedAnnealingSearch search =  new SimulatedAnnealingSearch(steps, 1000, k, lambda);
            //search.traceOn();
            SearchAgent agent = new SearchAgent(problem,search);
            printActions(agent.getActions());
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
    @SuppressWarnings("unchecked")
	private void printActions(List actions) {
        for (int i = 0; i < actions.size(); i++) {
            String action = (String) actions.get(i);
            System.out.println(action);
        }
    }

}
