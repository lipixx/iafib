/* Aquesta classe conté les variables de l'enunciat*/
package Transports;

import java.util.*;

public class Global
{

	/*Enunciat del problema*/
	public static int H_INI = 8;
	public static int H_FI = 17;
	public static int HORES_SERVEI = H_FI - H_INI + 1;
	public static int N_CENTRES = 6;

	/*Tipus i nombre de Transports*/
	public static final int T1 = 500;
	public static final int T2 = 1000;
	public static final int T3 = 2000;
	public static int nT1 = 20;
	public static int nT2 = 20;
	public static int nT3 = 20;

	/*Preus calculats per cada pes possible de peticions*/
	public static double preus_transport[] = { 100, 200, 300*1.5, 400*1.5, 500*2 };

	/*Probabilitats de que toqui una petició a una hora determinada. Probabilitat uniforme, valors entre 0 i 1.0*/
        public static double probabilitatsHores[] = { 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0 };
        public static double probabilitatsPesos[] = { 1.0, 1.0, 1.0, 1.0, 1.0 };
	/*Tipus d'estratègies de generació inicial que tenim*/
	public static final int LINEAL = 0;
	public static final int MAX_COMPACT = 1;

	/*Vector de peticions, conté N_CENTRES vectors, on
	a cada vector hi ha les peticions del centre*/
	public static Matriu PETICIONS;

	public Global()
	{
		PETICIONS = new Matriu(HORES_SERVEI,N_CENTRES);
	}

	/** Genera peticions i les inserta dins la matriu PETICIONS.
	 *@params maxPeticions Nombre de peticions màximes a generar de forma aleatoria en total.
	 *Si no és aleatoria, es genera un problema predeterminat.
	 *@params aleatori Determina si es genera el problema de forma aleatoria o predeterminada.
	 *@post S'ha omplert la matriu PETICIONS amb peticions.
	*/
    public void iniciaProblemaDefault(int maxPeticions,boolean aleatori, double probsH[], double probsP[])
	{
	    if (aleatori)
		{
		    Random generator = new Random(System.currentTimeMillis());
		    int g = generator.nextInt();
		    if (g < 0) g *= -1;	
		    while (g % maxPeticions == 0)
			{		
			    if (g < 0) g *= -1;	
			    g = generator.nextInt();
			}
		    maxPeticions = g % maxPeticions;
		    System.out.println("Problema generat amb "+maxPeticions+" peticions aleatòries.");
		       /*Problema generat de manera aleatoria amb maxPeticions.
			* En aquest cas les HORES_SERVEI de la graella PETICIONS venen a ser
			* les hores límit. La info està duplicada a la graella i a la petició,
			* però ja ens va bé perquè així podem accedir de forma directe a la graella
			* i a la vegada quan tenim una petició a un altre lloc, saber on està.
			*/
			int id = 0;
			for (int nc = 0; nc < N_CENTRES; nc++)
			    {	   	
				int peticionsCentre = maxPeticions / N_CENTRES;

				for (int hslimit = 0; hslimit < HORES_SERVEI && peticionsCentre > 0; hslimit++)
				    {
					double numPetHora = (peticionsCentre/HORES_SERVEI) * (probsH[hslimit]);
					
					/*Com que tenim probabilitats uniformes hi haurà el nombre
					  seg. de peticions de cada tipus:*/
						int petTipus1 = (int)(numPetHora/5 * probsP[0]);
						int petTipus2 = (int)(numPetHora/5 * probsP[1]);
						int petTipus3 = (int)(numPetHora/5 * probsP[2]);				   
						int petTipus4 = (int)(numPetHora/5 * probsP[3]);
						int petTipus5 = (int)(numPetHora/5 * probsP[4]);
					if (numPetHora < 5)
					    {
						switch (generator.nextInt() % 5)
						    {
						    case 0: 
							petTipus1 =(int) numPetHora;
							break;
						    case 1:
							petTipus2 = (int) numPetHora;
							break;
						    case 2:
							petTipus3 = (int) numPetHora;
							break;
						    case 3:
							petTipus4 = (int) numPetHora;
							break;
						    case 4:
							petTipus5 = (int) numPetHora;
							break;
						    default:
							break;							
						    }
					    }

					/*Les generem*/
					for (int i=0; i<petTipus1; i++)
					    {
					    Peticio pi = new Peticio(++id,100,hslimit+8);
					    this.PETICIONS.add(hslimit,nc,pi);
					    }
					for (int i=0; i<petTipus2; i++)
					    {
					    Peticio pi = new Peticio(++id,200,hslimit+8);
					    this.PETICIONS.add(hslimit,nc,pi);
					    }
					for (int i=0; i<petTipus3; i++)
					    {
					    Peticio pi = new Peticio(++id,300,hslimit+8);
					    this.PETICIONS.add(hslimit,nc,pi);
					    }			   	
					for (int i=0; i<petTipus4; i++)
					    {
					    Peticio pi = new Peticio(++id,400,hslimit+8);
					    this.PETICIONS.add(hslimit,nc,pi);
					    }			   	
					for (int i=0; i<petTipus5; i++)
					    {
					    Peticio pi = new Peticio(++id,500,hslimit+8);
					    this.PETICIONS.add(hslimit,nc,pi);
					    }			   					
					
				    }		    
			    }
		}
		else
		{
			//Problema generat de forma estàtica i per defecte
			this.PETICIONS.add(0,0,new Peticio(1,500,8));
			this.PETICIONS.add(0,0,new Peticio(2,300,8));
			this.PETICIONS.add(2,0,new Peticio(3,100,10));
			this.PETICIONS.add(3,0,new Peticio(4,400,11));
			this.PETICIONS.add(5,0,new Peticio(5,100,13));
			this.PETICIONS.add(6,0,new Peticio(6,200,14));
			this.PETICIONS.add(6,0,new Peticio(7,500,14));
			this.PETICIONS.add(6,0,new Peticio(8,200,14));
			this.PETICIONS.add(7,0,new Peticio(9,500,15));
			this.PETICIONS.add(7,0,new Peticio(10,300,15));
			this.PETICIONS.add(7,0,new Peticio(11,200,15));
			this.PETICIONS.add(8,0,new Peticio(12,500,16));
			this.PETICIONS.add(8,0,new Peticio(13,200,16));
			this.PETICIONS.add(9,0,new Peticio(14,400,17));


			/*
			this.PETICIONS.add(0,0,new Peticio(111,500,8));
			this.PETICIONS.add(0,0,new Peticio(112,500,8));
			this.PETICIONS.add(0,0,new Peticio(113,500,8));
			this.PETICIONS.add(0,0,new Peticio(114,500,8));
			this.PETICIONS.add(0,0,new Peticio(114,500,8));
			this.PETICIONS.add(0,0,new Peticio(114,500,8));
			this.PETICIONS.add(0,0,new Peticio(114,500,8));
			this.PETICIONS.add(0,0,new Peticio(112,500,8));
			this.PETICIONS.add(0,0,new Peticio(113,500,8));
			this.PETICIONS.add(0,0,new Peticio(114,500,8));
			this.PETICIONS.add(0,0,new Peticio(114,500,8));
			this.PETICIONS.add(0,0,new Peticio(114,500,8));
			this.PETICIONS.add(0,0,new Peticio(114,500,8));
			this.PETICIONS.add(0,0,new Peticio(112,500,8));
			this.PETICIONS.add(0,0,new Peticio(113,500,8));
			this.PETICIONS.add(0,0,new Peticio(114,500,8));
			this.PETICIONS.add(0,0,new Peticio(114,500,8));
			this.PETICIONS.add(0,0,new Peticio(114,500,8));
			this.PETICIONS.add(0,0,new Peticio(114,500,8));
			this.PETICIONS.add(0,0,new Peticio(112,500,8));
			this.PETICIONS.add(0,0,new Peticio(113,500,8));
			this.PETICIONS.add(0,0,new Peticio(114,500,8));
			this.PETICIONS.add(0,0,new Peticio(114,500,8));
			this.PETICIONS.add(0,0,new Peticio(114,500,8));
			this.PETICIONS.add(0,0,new Peticio(114,500,8));
			this.PETICIONS.add(0,0,new Peticio(112,500,8));
			this.PETICIONS.add(0,0,new Peticio(113,500,8));
			this.PETICIONS.add(0,0,new Peticio(114,500,8));
			this.PETICIONS.add(0,0,new Peticio(114,500,8));
			this.PETICIONS.add(0,0,new Peticio(114,500,8));
			this.PETICIONS.add(0,0,new Peticio(114,500,8));
			this.PETICIONS.add(0,0,new Peticio(112,500,8));
			this.PETICIONS.add(0,0,new Peticio(113,500,8));
			this.PETICIONS.add(0,0,new Peticio(114,500,8));
			this.PETICIONS.add(0,0,new Peticio(114,500,8));
			this.PETICIONS.add(0,0,new Peticio(114,500,8));
			this.PETICIONS.add(0,0,new Peticio(114,500,8));
			this.PETICIONS.add(0,0,new Peticio(112,500,8));
			this.PETICIONS.add(0,0,new Peticio(113,500,8));
			this.PETICIONS.add(0,0,new Peticio(114,500,8));
			this.PETICIONS.add(0,0,new Peticio(114,500,8));
			this.PETICIONS.add(0,0,new Peticio(114,500,8));
			this.PETICIONS.add(0,0,new Peticio(114,500,8));
			this.PETICIONS.add(0,0,new Peticio(112,500,8));
			this.PETICIONS.add(0,0,new Peticio(113,500,8));
			this.PETICIONS.add(0,0,new Peticio(114,500,8));
			this.PETICIONS.add(0,0,new Peticio(114,500,8));
			this.PETICIONS.add(0,0,new Peticio(114,500,8));
			this.PETICIONS.add(0,0,new Peticio(114,500,8));
			*/


			this.PETICIONS.add(0,1,new Peticio(15,300,8));
			this.PETICIONS.add(3,1,new Peticio(16,300,11));
			this.PETICIONS.add(4,1,new Peticio(17,300,12));
			this.PETICIONS.add(5,1,new Peticio(18,400,13));
			this.PETICIONS.add(7,1,new Peticio(19,500,15));
			this.PETICIONS.add(7,1,new Peticio(20,500,15));
			this.PETICIONS.add(8,1,new Peticio(21,500,16));
			this.PETICIONS.add(8,1,new Peticio(22,300,16));
			this.PETICIONS.add(9,1,new Peticio(23,100,17));
			this.PETICIONS.add(2,2,new Peticio(24,200,10));
			this.PETICIONS.add(3,2,new Peticio(25,100,11));
			this.PETICIONS.add(4,2,new Peticio(26,200,12));
			this.PETICIONS.add(5,2,new Peticio(27,500,13));
			this.PETICIONS.add(8,2,new Peticio(28,300,16));
			this.PETICIONS.add(8,2,new Peticio(29,200,16));
			this.PETICIONS.add(8,2,new Peticio(30,300,16));
			this.PETICIONS.add(9,2,new Peticio(31,300,17));
			this.PETICIONS.add(9,2,new Peticio(32,500,17));
			this.PETICIONS.add(0,3,new Peticio(33,500,8));
			this.PETICIONS.add(1,3,new Peticio(34,300,9));
			this.PETICIONS.add(1,3,new Peticio(35,400,9));
			this.PETICIONS.add(1,3,new Peticio(36,300,9));
			this.PETICIONS.add(6,3,new Peticio(37,500,14));
			this.PETICIONS.add(6,3,new Peticio(38,500,14));
			this.PETICIONS.add(6,3,new Peticio(39,300,14));
			this.PETICIONS.add(7,3,new Peticio(40,100,15));
			this.PETICIONS.add(7,3,new Peticio(41,500,15));
			this.PETICIONS.add(7,3,new Peticio(42,500,15));
			this.PETICIONS.add(8,3,new Peticio(43,500,16));
			this.PETICIONS.add(9,3,new Peticio(44,500,17));
			this.PETICIONS.add(0,4,new Peticio(45,200,8));
			this.PETICIONS.add(0,4,new Peticio(46,300,8));
			this.PETICIONS.add(1,4,new Peticio(47,100,9));
			this.PETICIONS.add(2,4,new Peticio(48,500,10));
			this.PETICIONS.add(3,4,new Peticio(49,100,11));
			this.PETICIONS.add(3,4,new Peticio(50,300,11));
			this.PETICIONS.add(4,4,new Peticio(51,300,12));
			this.PETICIONS.add(4,4,new Peticio(52,100,12));
			this.PETICIONS.add(7,4,new Peticio(53,500,15));
			this.PETICIONS.add(7,4,new Peticio(54,300,15));
			this.PETICIONS.add(7,4,new Peticio(55,500,15));
			this.PETICIONS.add(8,4,new Peticio(56,200,16));
			this.PETICIONS.add(9,4,new Peticio(57,500,17));
			this.PETICIONS.add(9,4,new Peticio(58,400,17));
			this.PETICIONS.add(9,4,new Peticio(59,500,17));
			this.PETICIONS.add(0,5,new Peticio(60,200,8));
			this.PETICIONS.add(1,5,new Peticio(61,200,9));
			this.PETICIONS.add(1,5,new Peticio(62,500,9));
			this.PETICIONS.add(2,5,new Peticio(63,200,10));
			this.PETICIONS.add(3,5,new Peticio(64,100,11));
			this.PETICIONS.add(4,5,new Peticio(65,500,12));
			this.PETICIONS.add(6,5,new Peticio(66,400,14));
			this.PETICIONS.add(8,5,new Peticio(67,500,16));
			this.PETICIONS.add(9,5,new Peticio(68,300,17));
		}
	}
}
