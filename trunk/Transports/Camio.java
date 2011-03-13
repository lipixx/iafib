package Transports;

import java.util.*;

public class Camio {
	
	private int tipus;
	private int capacitat;
	private ArrayList<Peticio> llista;
	
	public Camio (int t, int c, ArrayList<Peticio> ll)
	{
		tipus = t;
		capacitat = c;
		llista = ll;
	}
}