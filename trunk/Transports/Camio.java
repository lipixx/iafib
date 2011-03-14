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
}