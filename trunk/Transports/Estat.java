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
						boolean peticioColocada = false;
						
						//Recorrem les hores de cada cp (matriu camionsHCP) amb:
						//hora hHCP 
						//c.p. ncp
						for(int hHCP=0; hHCP < Global.HORES_SERVEI && !peticioColocada; hHCP++)
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
									peticioColocada = true;
								}
								else if (n2 > 0)
								{
									n2--;
									camioActual = new Camio(Global.T2, petActual);
									camionsHCP.add(hHCP,ncp,camioActual);
									peticioColocada = true;
								}
								else if(n3 > 0)
								{
									n3--;
									camioActual = new Camio(Global.T3, petActual);
									camionsHCP.add(hHCP,ncp,camioActual);
									peticioColocada = true;
								}
								else
								{
									//No s'hauria d'entrar mai aquí, ja que si hi ha un forat
									//a la graella (null) significa que algun tipus de camió
									//no ha estat assignat, n1, n2 o n3 > 0
								}
							}
							//Si hi havia camio assignat i si la carrega de la peticio cap dins el camió
							else if(petActual.getQuantitat() < camioActual.getCarrega())
							{
								camioActual.addPeticio(petActual);
								peticioColocada = true;
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
											
											peticioColocada = true;
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
											
											peticioColocada = true;
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
											
											peticioColocada = true;
											n2++;
											n3--;
										}
										break;
									default:
										break;
								}
							}
						}
						//Si arribem aquí (sortim del bucle) vol que no s'ha pogut assignar peticio,
						//per tant la possem al vector endarrerits
						ArrayList <Peticio> peticionsEndarrerides = (Camio) endarrerits.getObj(0, ncp);
						endarrerits.add(petActual);
						
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
	
	//Operador per assignar una peticio a hora hora  i c.p. cp
	public void afegirPeticio(int hora, int cp)
	{
		camionsHCP.add(hora, cp, c);
	}
	
	//Quan s'elimina un transport s'ha de fer un remove (Matriu.java) del camio
	public void treurePeticio(int hora, int cp)
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