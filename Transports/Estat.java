package Transports;

import java.util.*;

@SuppressWarnings ("unchecked")
public class Estat {
	
	//Graella per assignar camions a una hora i un c.p. determinat
	private Matriu camionsHCP;
	private Matriu endarrerits;
	
	//Generació de l'estat inicial
	public Estat(Matriu peticions, int n1, int n2, int n3)
	{
		camionsHCP = new Matriu(Global.HORES_SERVEI, Global.N_CENTRES);
		endarrerits = new Matriu(1,Global.N_CENTRES);
		
		for(int h=0; h<Global.HORES_SERVEI; h++)
		{
			for(int ncp=0; ncp<Global.N_CENTRES; ncp++)
			{
				//Agafem llista de peticions per:
				//	Hora limit h
				//	Centre de producció ncp
				
				ArrayList<Peticio> llista = peticions.get(h,ncp);
				
				for (int peticioActual=0; peticioActual<llista.size(); peticioActual++)
				{
					Peticio actual = llista.get(peticioActual);
					//Recorrem les hores de camionsHCP amb:
					//hora hHCP 
					//c.p. ncp
					for(int hHCP=0; hHCP < Global.HORES_SERVEI; hHCP++)
					{
						Camio camio = (Camio) camionsHCP.getObj(hHCP,ncp);
						//Si no hi ha tipus de camio assignat (no serà carrega=0 pq els eliminarem abans)
						if(camio == null ) {
							Camio camioActual;
							if(n1 > 0)
							{
								n1--;
								camioActual = new Camio(Global.T1, actual.getQuantitat(), actual);
							} else if (n2 > 0)
							{
								n2--;
								camioActual = new Camio(Global.T2, actual.getQuantitat(), actual);
							} else if(n3 > 0)
							{
								n3--;
								camioActual = new Camio(Global.T3, actual.getQuantitat(), actual);
							} else {
								return;
							}
							camionsHCP.add(hHCP,ncp,camioActual);
						}
						//Si la carrega de la peticio cap dins el camió
						if(actual.getQuantitat() < camio.getCarrega())
						{
							camio.addPeticio(actual);
						}
						//Si la carrega de la peticio NO CAP dins el camio
						else
						{
							
						}
					}
					
					//si no s'ha pogut assignar el fotem a vector endarrerits
				}
			}
		}
	}
	
	//Operador per assignar un camio (que conté una llista de peticions amb el
	//mateix cp desti)  a hora hora  i c.p. cp
	public void afegirNouTransport(Camio c, int hora, int cp)
	{
		camionsHCP.add(hora, cp, c);
	}
	
	//Quan s'elimina un transport s'ha de fer un remove (Matriu.java) del camio
	public void treureTransport()
	{
		
	}
	
	public Matriu getCamionsHCP()
	{
		return camionsHCP;
	}
	
	public Matriu getEndarrerits()
	{
		return endarrerits;
	}
}