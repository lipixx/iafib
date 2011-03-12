package Transports;

import java.util.*;

@SuppressWarnings ("unchecked")
public class Main
{
    public static void main (String args[])
    {
	//Init del problema
	Global P = new Global();
	
	Peticio p = new Peticio(100);
	Peticio p1 = new Peticio(200);
	Peticio p2 = new Peticio (1000);
	Peticio p3 = new Peticio (500);
	
	//PETICIONS.add(Hora_limit,Centre,Peticio)
	P.PETICIONS.add(6,5,p2);
	P.PETICIONS.add(7,5,p1);
	P.PETICIONS.add(5,5,p);
	P.PETICIONS.add(5,5,p3);	
	P.PETICIONS.print();	
	
	//Agafar llista de peticions d'una Hora i un Centre
	ArrayList<Peticio> llista = P.PETICIONS.get(5,5);

	System.out.println("Llista 5,5");
	for (int i=0; i<llista.size(); i++)
	    {
		System.out.println(llista.get(i).getQuantitat());
	    }
    }
}