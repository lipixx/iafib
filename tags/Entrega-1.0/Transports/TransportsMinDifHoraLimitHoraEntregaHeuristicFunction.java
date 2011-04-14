package Transports;

import aima.search.framework.HeuristicFunction;
import java.util.*;

@SuppressWarnings ("unchecked")
public class TransportsMinDifHoraLimitHoraEntregaHeuristicFunction implements HeuristicFunction
{
	/**
	 * Aquesta funció retorna la suma d'hores desfassades per un estat determinat.
	 * Una hora desfassada és el valor abs. de la diferència entre hora limit d'una petició
	 * i hora efectiva d'entrega.
	 * @params st L'estat apartir del que es calcularan el nombre d'hores desfassades.
	 */
	public double getHeuristicValue(Object st)
	{
		Estat state = (Estat) st;
		int horesPerdudes = 0;

		/*Obtenim les dues matrius de l'estat*/
		Matriu camionsHCP = state.getCamionsHCP();
		Matriu endarrerits = state.getEndarrerits();

		/*Explorem tots els centres de la graella HCP*/
		for (int nc = 0; nc < Global.N_CENTRES; nc++)
		{
			/*Per cada centre, explorem totes les hores, n'obtenim el camió
			  i li demanem a ell quantes hores té desfassades.*/
			for (int h = 0; h < Global.HORES_SERVEI; h++)
			{
				Camio c = (Camio) camionsHCP.getObj(h,nc);
				if (c!=null)
					horesPerdudes += c.getHoresPerdudes(h+Global.H_INI);
			}

			/*Ens queda explorar les peticions que no estan assignades a cap
			  camió. El vector endarrerits només té una fila, la 0.*/
			ArrayList<Peticio> llistaEndar = endarrerits.get(0,nc);

			for (int pet = 0; pet < llistaEndar.size(); pet++)
			{
				Peticio p = llistaEndar.get(pet);
				/*Les hores perdudes en aquest cas, són la diferència entre la hora límit
				 d'entrega i les 8h del dia següent (+14h).*/
				horesPerdudes += (14 + (Global.H_FI - p.getHoraLimit()));
			}
		}
		return horesPerdudes;
	}
}