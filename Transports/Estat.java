package Transports;

import java.util.*;

public class Estat {
	
	//Graella per assignar camions a una hora i un c.p. determinat
	private static Matriu Camions_HCP;
	//Numero de camions de cada tipus que tenim (ens ho diu l'usuari
	private int nT1, nT2, nT3;
	
	//Generació de l'estat inicial
	public Estat(Matriu peticions, int n1, int n2, int n3)
	{
		Camions_HCP = new Matriu(Global.HORES_SERVEI, Global.N_CENTRES);
		nT1 = n1; nT2 = n2; nT3 = n3;
		
		for(int i=0; i<Global.HORES_SERVEI; i++)
		{
			for(int j=0; j<Global.N_CENTRES; j++)
			{
				//Agafem llista de peticions per:
				//	Hora limit i
				//	Centre de producció j
				
				//aqui dona warning al compilar, amb i sense casting...
				ArrayList<Peticio> llista = peticions.get(i,j);
				
				for (int k=0; k<llista.size(); k++)
				{
					//On possem cada petició?
					
				}
			}
		}
	}
	
	//Operador per assignar un camio (que conté una llista de peticions amb el
	//mateix cp desti)  a hora hora  i c.p. cp
	public void afegirNouTransport(Camio c, int hora, int cp)
	{
		Camions_HCP.add(hora, cp, c);
	}
}