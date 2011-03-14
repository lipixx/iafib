package Transports;

import java.util.*;

public class Camio {
	
	private int tipus;
	private int carrega;
	private ArrayList<Peticio> llista;
	
	public Camio (int t, int c, ArrayList<Peticio> ll)
	{
		tipus = t;
		carrega = c;
		llista = ll;
	}
}