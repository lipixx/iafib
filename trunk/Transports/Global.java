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

    /*Vector de peticions, conté N_CENTRES vectors, on
     a cada vector hi ha les peticions del centre*/
    public static Matriu PETICIONS;

    public Global()
    {
	PETICIONS = new Matriu(HORES_SERVEI,N_CENTRES);
    }
}
