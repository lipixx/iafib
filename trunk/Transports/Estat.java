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
						//Si no hi ha tipus de camio assignat, o sigui carrega=0
						if(camionsHCP.get(hHCP,ncp) == null) {
							
						}
						//Si la carrega de la peticio cap dins el camió
						if(actual.getQuantitat() < camionsHCP.get(hHCP,ncp))
						{
							
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
}