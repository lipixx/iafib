package Transports;

import aima.search.framework.HeuristicFunction;
import java.util.*;

@SuppressWarnings ("unchecked")
public class TransportsMaxGuanysHeuristicFunction implements HeuristicFunction 
{
    public double getHeuristicValue(Object st) 
    {
	Estat state = (Estat) st;
	int beneficis = 0;
	Matriu camionsHCP = state.getCamionsHCP();
	Matriu endarrerits = state.getEndarrerits();

	/*Explorem tota la graella HCP, i per cada casella, obtenim el valor
	  que ens aporta el transport que hi ha associat*/	
	for (int nc = 0; nc < Global.N_CENTRES; nc++)
	    {
		for (int h = 0; h < Global.HORES_SERVEI; h++)
		    {
			Camio c = (Camio) camionsHCP.getObj(h,nc);
			if (c!=null)
			    beneficis += c.getBeneficis(h+Global.H_INI);
		    }
		
		//El vector endarrerits només té una fila, la 0.
		ArrayList<Peticio> llistaEndar = endarrerits.get(0,nc);
		
		for (int pet = 0; pet < llistaEndar.size(); pet++)
		    {
			Peticio p = llistaEndar.get(pet);
			
			beneficis -= Global.preus_transport[p.getQuantitat()/100 -1] * (Global.H_FI - p.getHoraLimit()) * 0.2;
			beneficis -= Global.preus_transport[p.getQuantitat()/100 -1];
		    }
	    }	
	return beneficis * -1;       
    }
}