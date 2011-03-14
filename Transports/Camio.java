package Transports;

import java.util.*;

public class Camio {
    
    private int tipus;
    private int carrega;
    private ArrayList<Peticio> llista;
    
    public Camio (int t, int c, Peticio p)
    {
	tipus = t;
	carrega = c;
	llista = new ArrayList<Peticio>();
	llista.add(p);
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
}