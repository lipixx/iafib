package ia;

import java.text.DecimalFormat;
import java.text.DecimalFormatSymbols;

import ia.Bicing.Bicing;
import ia.practica1.BicingGoalTest;
import ia.practica1.BicingHeuristicFunction;
import ia.practica1.BicingState;
import ia.practica1.BicingSuccessorFunction;
import ia.practica1.BicingSuccessorFunctionSA;
import aima.search.framework.Problem;
import aima.search.framework.SearchAgent;
import aima.search.informed.HillClimbingSearch;
import aima.search.informed.SimulatedAnnealingSearch;

/**
 * Modificación de "Main.java" en el que los buscadores retornan el estado final
 * para poder consultar su estado y calcular su heurístico. Además el main
 * automatiza la ejecución sistemática de las búsquedas y compara los resultados
 * en función del heurístico. Da el resultado en un formato que permite ser copiado
 * en una hoja de cálculos para su análisis.
 * @author David García Villalba
 *
 */
public class Automatizador {

	/* Parámetros de configuración */
	/* Bicing */
	private static int est = 50;
	private static int bic = 50*est;
	private static final int dem = Bicing.EQUILIBRIUM;
	public static int F = 20;
	
	/* Simulated Annealing */
	private static int steps = 8000;
	private static int k = 64;
	private static double lambda = 0.011;
	/* ******************** */
	
	public static void main(String[] args) {
		BicingHeuristicFunction bhf = new BicingHeuristicFunction();
		Automatizador m = new Automatizador();
		
		// Ejeción sistemática
		System.out.println("Start	HC	<HC	SA	<SA	HC<SA");
		for (int i = 0; i < 40; ++i) {
			BicingState start = new BicingState(est, bic, dem, i);
			double hStart = bhf.getHeuristicValue(start);
			System.out.print(writeDouble(hStart));
			BicingState end = m.BicingHillClimbingSearch(start);
			double hHC = bhf.getHeuristicValue(end);
			System.out.print("	" + writeDouble(hHC) + "	" + writeDouble(hStart - hHC));
			end = m.BicingSimulatedAnnealingSearch(start);
			double hSA = bhf.getHeuristicValue(end);
			System.out.println("	" + writeDouble(hSA) + "	" + writeDouble(hStart - hSA) + "	" + writeDouble(hHC - hSA));
		}
		
		
		// Influencia de F
		/*System.out.println("Start	HC	<HC	SA	<SA	HC<SA	F");
		for (F = 0; F <= est; ++F) {
			BicingState.F = F;
			BicingState start = new BicingState(est, bic, dem);
			double hStart = bhf.getHeuristicValue(start);
			System.out.print(writeDouble(hStart));
			BicingState end = m.BicingHillClimbingSearch(start);
			double hHC = bhf.getHeuristicValue(end);
			System.out.print("	" + writeDouble(hHC) + "	" + writeDouble(hStart - hHC));
			end = m.BicingSimulatedAnnealingSearch(start);
			double hSA = bhf.getHeuristicValue(end);
			System.out.println("	" + writeDouble(hSA) + "	" + writeDouble(hStart - hSA) + "	" + writeDouble(hHC - hSA) + "	" + F);
		}*/
		
		// Influencia de est
		/*System.out.println("Start	HC	<HC	SA	<SA	HC<SA	est");
		for (est = F; est <= 100; ++est) {
			BicingState start = new BicingState(est, 50*est, dem);
			double hStart = bhf.getHeuristicValue(start);
			System.out.print(writeDouble(hStart));
			BicingState end = m.BicingHillClimbingSearch(start);
			double hHC = bhf.getHeuristicValue(end);
			System.out.print("	" + writeDouble(hHC) + "	" + writeDouble(hStart - hHC));
			end = m.BicingSimulatedAnnealingSearch(start);
			double hSA = bhf.getHeuristicValue(end);
			System.out.println("	" + writeDouble(hSA) + "	" + writeDouble(hStart - hSA) + "	" + writeDouble(hHC - hSA) + "	" + est);
		}*/
		
		// Eleccion de K y Lambda
		/*System.out.println("Start	SA	<SA	K	Lambda");
		BicingState start = new BicingState(est, bic, dem);
		double hStart = bhf.getHeuristicValue(start);
		for (k = 1; k <= 200; ++k) {
			for (lambda = 0.001; lambda <= 0.1; lambda += 0.01) {
				double media = 0;
				for (int i = 0; i < 10; ++i) {
					BicingState end = m.BicingSimulatedAnnealingSearch(start);
					media += bhf.getHeuristicValue(end);
				}
				media /= 10;
				System.out.print(writeDouble(hStart));
				System.out.println("	" + writeDouble(media) + "	" + writeDouble(hStart - media) + "	" + k + "	" + lambda);
			}
		}*/
		
		/*System.out.println("Start	SA	<SA	K	steps");
		BicingState start = new BicingState(est, bic, dem);
		double hStart = bhf.getHeuristicValue(start);
		for (steps = 1000; steps <= 10000; steps += 500) {
			double media = 0;
			for (int i = 0; i < 40; ++i) {
				BicingState end = m.BicingSimulatedAnnealingSearch(start);
				media += bhf.getHeuristicValue(end);
			}
			media /= 40;
			System.out.print(writeDouble(hStart));
			System.out.println("	" + writeDouble(media) + "	" + writeDouble(hStart - media) + "	" + k + "	" + steps);
		}*/
	}
		
	private BicingState BicingHillClimbingSearch(BicingState bs) {
        //System.out.println("HillClimbing  -->");
        try {
            Problem problem =  new Problem(bs, new BicingSuccessorFunction()
            								 , new BicingGoalTest()
            								 , new BicingHeuristicFunction());
            HillClimbingSearch search =  new HillClimbingSearch();
            new SearchAgent(problem,search);
            return (BicingState) search.getLastSearchState();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }
    
    private BicingState BicingSimulatedAnnealingSearch(BicingState bs) {
        //System.out.println("\nSimulated Annealing  -->");
        try {
            Problem problem =  new Problem(bs, new BicingSuccessorFunctionSA()
            								 , new BicingGoalTest()
            								 ,new BicingHeuristicFunction());
            SimulatedAnnealingSearch search =  new SimulatedAnnealingSearch(steps, 1000, k, lambda);
            //search.traceOn();
            new SearchAgent(problem,search);
            return (BicingState) search.getLastSearchState();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }
    
    public static String writeDouble(double nummero) {
		DecimalFormat df = new DecimalFormat();
		df.setGroupingUsed(false);
		DecimalFormatSymbols dfs = new DecimalFormatSymbols();
		dfs.setDecimalSeparator(',');
		df.setDecimalFormatSymbols(dfs);
		return df.format(nummero);
	}

}
