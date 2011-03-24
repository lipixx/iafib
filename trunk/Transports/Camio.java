package Transports;

import java.util.*;

public class Camio {
	
	private int tipus;
	private int carrega;
	private ArrayList<Peticio> llista;
	
	//Creacio d'un camio amb un tipus i una peticio
	public Camio (int t, Peticio p)
	{
		tipus = t;
		carrega = p.getQuantitat();
		llista = new ArrayList<Peticio>();
		llista.add(p);
	}
	//Constructora per copia
	public Camio (Camio camioOrig)
	{
		tipus = camioOrig.getTipus();
		carrega = camioOrig.getCarrega();
		llista = new ArrayList<Peticio>();
		
		ArrayList<Peticio> llistaPetOrig = camioOrig.getLlistaPeticions();
		for(int pet = 0; pet < llistaPetOrig.size(); pet++)
		{
			llista.add(llistaPetOrig.get(pet));
		}
	}
	//Creacio d'un camio amb un tipus i una llista de peticions
	public Camio (int t, ArrayList<Peticio> llp)
	{
		tipus = t;
		llista = new ArrayList<Peticio>();
		for(int pet = 0; pet < llp.size(); pet++)
		{
			llista.add(llp.get(pet));
			carrega += llp.get(pet).getQuantitat();
		}
	}
	
	public int getTipus()
	{
		return tipus;
	}
	
	public int getCarrega()
	{
		return carrega;
	}
	
	public void setCarrega(int c)
	{
		carrega = c;
	}
	
	public ArrayList<Peticio> getLlistaPeticions()
	{
		return llista;
	}
	
	public void addPeticio(Peticio p)
	{
		llista.add(p);
		carrega += p.getQuantitat();
	}
	public double getBeneficis(int horaCamio)
	{
		double benefici_total = 0;
		for (int pet = 0; pet < llista.size(); pet++)
		{
			Peticio actual = llista.get(pet);
			double pMax = Global.preus_transport[actual.getQuantitat()/100-1];
			int nHoresRetras = horaCamio - actual.getHoraLimit();

			if (nHoresRetras < 0) nHoresRetras = 0;
			
			benefici_total = pMax - pMax *(nHoresRetras*0.2);	    
		}
		
		return benefici_total;
	}
	public double getHoresPerdudes(int horaCamio)
	{
	    int nHoresRetras = 0;
	    for (int i = 0 ; i < llista.size(); i++)
		{
		    Peticio actual = llista.get(i);
		    int h = horaCamio - actual.getHoraLimit();// - horaCamio;
			nHoresRetras += ((h >0) ? h : -h);
		}
	  return nHoresRetras;
	}
}