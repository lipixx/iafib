package Transports;

import java.util.*;

@SuppressWarnings ("unchecked")
public class Estat {
	
	//Graella per assignar camions a una hora i un c.p. determinat
	private Matriu camionsHCP;
	private Matriu endarrerits;
	
	//Generació de l'estat inicial
	public Estat(Matriu peticions, int n1, int n2, int n3, boolean gen1)
	{
		camionsHCP = new Matriu(Global.HORES_SERVEI, Global.N_CENTRES);
		endarrerits = new Matriu(1,Global.N_CENTRES);
		
		//Estrageia 1 de generacio d'estat inicial
		if(gen1)
		{
			for(int h=0; h<Global.HORES_SERVEI; h++)
			{
				for(int ncp=0; ncp<Global.N_CENTRES; ncp++)
				{
					//Agafem llista de peticions per:
					//	Hora limit h
					//	Centre de producció ncp
					
					ArrayList<Peticio> llistaPeticions = peticions.get(h,ncp);
					
					for (int peticioActual=0; peticioActual<llistaPeticions.size(); peticioActual++)
					{
						Peticio petActual = llistaPeticions.get(peticioActual);
						//Recorrem les hores de cada cp (matriu camionsHCP) amb:
						//hora hHCP 
						//c.p. ncp
						for(int hHCP=0; hHCP < Global.HORES_SERVEI; hHCP++)
						{
							Camio camioActual = (Camio) camionsHCP.getObj(hHCP,ncp);
							
							//Si no hi ha tipus de camio assignat (no serà carrega=0 pq els eliminarem abans)
							//es crea un nou camio i se li assigna la peticio i el tipus
							if(camioActual == null ) {
								if(n1 > 0)
								{
									n1--;
									camioActual = new Camio(Global.T1, petActual);
									camionsHCP.add(hHCP,ncp,camioActual);
									return;
								}
								else if (n2 > 0)
								{
									n2--;
									camioActual = new Camio(Global.T2, petActual);
									camionsHCP.add(hHCP,ncp,camioActual);
									return;
								}
								else if(n3 > 0)
								{
									n3--;
									camioActual = new Camio(Global.T3, petActual);
									camionsHCP.add(hHCP,ncp,camioActual);
									return;
								}
							}
							//Si hi havia camio assignat i si la carrega de la peticio cap dins el camió
							else if(petActual.getQuantitat() < camioActual.getCarrega())
							{
								camioActual.addPeticio(petActual);
							}
							//Si la carrega de la peticio NO CAP dins el camio
							else
							{
								//Si queden camions de capacitat superior lliures, eliminar camio actual
								//crear camio nou i possar la petició (junt amb les peticions que ja tenia
								//el camio. SINO queden camions de capacitat superior lliures seguim buscant
								//dins les hores del dia del c.p. ncp
								switch (camioActual.getTipus())
								{
									case Global.T1:
										if(n2 > 0)
										{
											ArrayList <Peticio> llistaPeticionsTemp = camioActual.getLlistaPeticions();
											Camio camioMesGranTemp = new Camio(Global.T2, llistaPeticionsTemp);
											camioMesGranTemp.addPeticio(petActual);
											camionsHCP.remove(hHCP, ncp, camionsHCP.getObj(hHCP, ncp));
											camionsHCP.add(hHCP, ncp, camioMesGranTemp);
											n1++;
											n2--;
										}
										else if(n3 > 0)
										{
											ArrayList <Peticio> llistaPeticionsTemp = camioActual.getLlistaPeticions();
											Camio camioMesGranTemp = new Camio(Global.T3, llistaPeticionsTemp);
											camioMesGranTemp.addPeticio(petActual);
											camionsHCP.remove(hHCP, ncp, camionsHCP.getObj(hHCP, ncp));
											camionsHCP.add(hHCP, ncp, camioMesGranTemp);
											n1++;
											n3--;
										}
										break;
									case Global.T2:
										if(n3 > 0)
										{
											ArrayList <Peticio> llistaPeticionsTemp = camioActual.getLlistaPeticions();
											Camio camioMesGranTemp = new Camio(Global.T3, llistaPeticionsTemp);
											camioMesGranTemp.addPeticio(petActual);
											camionsHCP.remove(hHCP, ncp, camionsHCP.getObj(hHCP, ncp));
											camionsHCP.add(hHCP, ncp, camioMesGranTemp);
											n2++;
											n3--;
										}
										break;
								}
							}
						}
						//Si arribem aquí (sortim del bucle) vol que no s'ha pogut assignar peticio,
						//per tant la possem al vector endarrerits, fent servir un camio virtual
						Camio camioVirtualEndarrerits = (Camio) endarrerits.getObj(0, ncp);
						if(camioVirtualEndarrerits == null)
						{
							camioVirtualEndarrerits = new Camio(0, petActual);
							endarrerits.add(0, ncp, camioVirtualEndarrerits);
						}
						else
						{
							camioVirtualEndarrerits.addPeticio(petActual);
							endarrerits.add(0, ncp, camioVirtualEndarrerits);
						}
						
					}
				}
			}
		}
		//Estrageia 2 de generacio d'estat inicial
		else
		{
			//TODO:
			//un voraz!
		}
	}
	
	//Operador per assignar un camio (que conté una llista de peticions amb el
	//mateix cp desti)  a hora hora  i c.p. cp
	public void afegirNouTransport(Camio c, int hora, int cp)
	{
		camionsHCP.add(hora, cp, c);
	}
	
	//Quan s'elimina un transport s'ha de fer un remove (Matriu.java) del camio
	public void treureTransport(int hora, int cp)
	{
		//TODO
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