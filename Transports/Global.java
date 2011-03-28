/* Aquesta classe conté les variables de l'enunciat*/
package Transports;

import java.util.*;

public class Global {

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

	public static double preus_transport[] = { 100, 200, 300*1.5, 400*1.5, 500*2 };

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

	/*@descr Genera peticions i les inserta dins la matriu PETICIONS.
	*@params numPeticions Nombre de peticions a generar de forma aleatoria per cada centre
	i hora límit. Si no és aleatoria, es genera un problema predeterminat.
	*@params aleatori Determina si es genera el problema de forma aleatoria o predeterminada.     
	*@post S'ha omplert la matriu PETICIONS amb peticions.
	*/
	public void iniciaProblemaDefault(int numPeticions,boolean aleatori)
	{
	Random generator = new Random(System.currentTimeMillis());
	int g = generator.nextInt();
	
	if (aleatori)
		{
		//Problema generat de manera aleatoria amb numPeticions
		/*
		* En aquest cas les HORES_SERVEI de la graella PETICIONS venen a ser
		* les hores límit. La info està duplicada a la graella i a la petició,
		* però ja ens va bé perquè així podem accedir de forma directe a la graella
		* i a la vegada quan tenim una petició a un altre lloc, saber on està.
		*/
		int id = 0;
		for (int nc = 0; nc < N_CENTRES; nc++)
			for (int hslimit = 0; hslimit < HORES_SERVEI; hslimit++)
			{
				//Definim el num. de peticions que generarem per aquest centre i hora limit
				int numPetCentre = generator.nextInt()%numPeticions + 1;
				//Les generem
				for (int numP = 0; numP < numPetCentre; numP++)
				{				    
					int pes = ((generator.nextInt()%500 + 100) / 100) * 100;
					if (pes < 0) pes = pes*-1;
					if (pes == 0) pes = 500;
					Peticio pi = new Peticio(++id,pes,hslimit+8);
					//PETICIONS.add(Hora_limit,Centre,Peticio)
					this.PETICIONS.add(hslimit,nc,pi);
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
