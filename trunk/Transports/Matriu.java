package Transports;

import java.util.*;
import java.io.*;

@SuppressWarnings ("unchecked")
public class Matriu {

    private ArrayList<ArrayList> matriu;
    private int files;
    private int columnes;

    /**
     * Implementació d'una matriu d'objectes.
     * Cada casella de la matriu és un objecte.
     * @params nfiles Nombre de files de la matriu
     * @params ncols Nombre de columnes de la matriu
     */
    public Matriu(int nfiles, int ncols) {
        matriu = new ArrayList<ArrayList>();
        files = nfiles - 1;
        columnes = ncols - 1;
        for (int i=0; i<nfiles; i++) {
            ArrayList<ArrayList> fila = new ArrayList<ArrayList>();
            matriu.add(i,fila);

            for (int j=0; j<ncols; j++) {
                fila.add(j,new ArrayList<Object>());
            }
        }
    }

    /**
     * Funció específica per matrius on cada casella conté un ArrayList.
     * Retorna aquest ArrayList.
     * @params fil Fila on es troba l'objecte.
     * @params col Columna on es troba l'objecte.
     * @return Retorna l'objecte que es troba a una determinada posició,
     * aplicant prèviament un casting a tipus ArrayList.
     */
    public ArrayList get(int fil, int col) {
        if (fil < 0 || fil > files || col < 0 || col > columnes) return null;
        ArrayList fila = matriu.get(fil);
        return (ArrayList) fila.get(col);
    }

    /**
     * Funció genèrica per matrius on cada casella conté un Objecte.
     * Retorna aquest objecte.
     * @params fil Fila on es troba l'objecte.
     * @params col Columna on es troba l'objecte.
     * @return Retorna l'objecte que es troba a una determinada posició.
     */
    public Object getObj(int fil, int col) {
        if (fil < 0 || fil > files || col < 0 || col > columnes) return null;
        ArrayList fila = matriu.get(fil);
        if (((ArrayList)fila.get(col)).size() == 0) return null;
        return ((ArrayList) fila.get(col)).get(0);
    }

    /**
     * Afegeix un objecte a una casella de la matriu.
     * @params fil Fila on s'ha de col·locar l'objecte.
     * @params col Columna on s'ha de col·locar l'objecte.
     */
    public void add(int fila, int col, Object o) {
        if (!(fila < 0 || fila > files || col < 0 || col > columnes)) {
            ArrayList pos = matriu.get(fila);
            pos = (ArrayList) pos.get(col);
            pos.add(o);
        }
    }

    /**
     * Elimina un objecte d'una casella de la matriu.
     * Ho fa en temps O(N), ja que no se li passa l'index. Ha de cercar la posició
     * de memòria.
     * @params fil Fila on es troba l'objecte.
     * @params col Columna on es troba objecte.
     */
    public void remove(int fila, int col, Object o) {
        if (!(fila < 0 || fila > files || col < 0 || col > columnes)) {
            ArrayList pos = matriu.get(fila);
            pos = (ArrayList) pos.get(col);
            pos.remove(o);
        }
    }

    /**
     * Mostra per pantalla ordenadament el contingut de la matriu. S'escriu per
     * cada casella, l'adreça de l'objecte que hi ha a dins.
     */
    public void print() {
        for (int i=0; i<matriu.size(); i++) {
            ArrayList fila = matriu.get(i);
            for (int j=0; j<fila.size(); j++) {
                System.out.println("F:" + i + ",C:"+j + " -> ");
                /*Debug only*/
                ArrayList objecte = (ArrayList) fila.get(j);
                for (int k=0; k<objecte.size(); k++) {
                    System.out.println(objecte.get(k) + " ");
                }
            }
        }
    }

    /*A continuació funcions específiques per mostrar per pantalla les matrius del
     problema de IA.*/
    public String printEndarreritsHtml()
    {
	String html = "<br/><h1>Endarrerits</h1><br/>\n<table border=\"1\">\n";
	int maxPets = 0;

	html = html + "<tr>\n";
	for (int nc=0; nc < Global.N_CENTRES; nc++) 
	    {
		html = html + "\t<th>Centre "+ (nc+1)+"</th>\n";		
		if (this.get(0,nc).size() > maxPets) maxPets = this.get(0,nc).size();
	    }
		
	html = html + "</tr>\n<tr>";

	/*Nombre de files a fer a la taula html*/
	for (int i = 0; i<maxPets; i++)
	    {
		/*Fem la fila i*/
		for (int j = 0; j < Global.N_CENTRES; j++)
		    {
			String tmp;
			
			if ((this.get(0,j)).size() <= i)
			    {
				tmp = "-";
			    }
			else
			    {
				Peticio p = (Peticio) (this.get(0,j)).get(i);
			        tmp = "<small>@Pet.id: "+p.getIdProducte()+" , Qtt: "+p.getQuantitat()+" , Hl: "+p.getHoraLimit()+"</small>\n";
			    }
			html = html + "\t<td>"+tmp+"</td>\n";
		    }
		html = html + "</tr>\n<tr>\n";
            }        	
	return html + "</table>";
    }

    public void printPeticions() {
        for (int nc=0; nc < Global.N_CENTRES; nc++) {
            System.out.println("CENTRE: "+(nc+1));
            System.out.println("--------------");
            for (int hs=0; hs < Global.HORES_SERVEI; hs++) {
                ArrayList peticions = this.get(hs,nc);
                System.out.println("  ->Hora:" + (hs+8));
                for (int j = 0; j<peticions.size(); j++) {
                    Peticio p = (Peticio) peticions.get(j);
                    int id,qtt,h;
                    id = p.getIdProducte();
                    qtt = p.getQuantitat();
                    h = p.getHoraLimit();
                    System.out.println("      ->@Pet. id: "+id+" , Qtt: "+qtt+" , Hl: "+h);
                }
            }
        }
    }

    public void printEndarrerits() {
        for (int nc=0; nc < Global.N_CENTRES; nc++) {
            System.out.println("CENTRE: "+(nc+1));
            System.out.println("--------------");
            int hs = 0;
            ArrayList peticions = this.get(hs,nc);
            System.out.println("  ->Hora del dia següent que s'ha d'entregar:" + (hs+8)+"h");
            for (int j = 0; j<peticions.size(); j++) {
                Peticio p = (Peticio) peticions.get(j);
                int id,qtt,h;
                id = p.getIdProducte();
                qtt = p.getQuantitat();
                h = p.getHoraLimit();
                System.out.println("      ->@Pet. id: "+id+" , Qtt: "+qtt+" , Hl: "+h);
            }
        }
    }

    public String printGraellaHCPHtml()
    {
	String html = "<br/><h1>Graella HCP</h1><br/>\n<table border=\"1\">\n";
	int maxPets = 0;

	/*Feim la primera fila, de capçeleres*/
	html = html + "<tr>\n" + "\t<th>HCP</th>\n";
	for (int nc=0; nc < Global.N_CENTRES; nc++) 
	    {
		html = html + "\t<th>Centre "+ (nc+1)+"</th>\n";
	    }
	html = html + "</tr>\n";

	/*Feim la resta de files*/
	for (int files = 0; files < Global.HORES_SERVEI; files++)
	    {
		html = html + "<tr>\n";
		/*Per cada fila, hem de fer totes les columnes, i també la de la hora*/
		html = html + "\t<td><b>"+(files+8)+"h</b></td>\n";
		for (int nc=0; nc < Global.N_CENTRES; nc++)
		    {
			Camio c = (Camio) this.getObj(files,nc);
			if (c == null) html = html + "\t<td> - </td>\n";
			else 
			    {
				html = html + "\t<td>\n";
				/*Crear el codi html per pintar el contingut del camió*/
				String tmp = "\t<small>";
				tmp = tmp + "<b>T:</b> "+c.getTipus()+"Kg<br/>"+"<b>Carrega:</b> "+c.getCarrega()+
				    "Kg<br/><b>Pets:</b><br/>";
				ArrayList<Peticio> ps = c.getLlistaPeticions();
				for (int k=0; k<ps.size(); k++)
				    {
					Peticio p = ps.get(k);
					tmp = tmp + "@Pet.id: "+p.getIdProducte()+", Qtt: "
					    +p.getQuantitat()+" , Hl: "+p.getHoraLimit()+"<br/>";				
				    }
				html = html + "\t<small/>\n"+ tmp + "</td>\n";
			    }
		    }
		html = html + "</tr>\n";
	    }
       
	return html + "</table>";
    }
    
    public void printGraellaHCP() {
        for (int nc=0; nc < Global.N_CENTRES; nc++) {
            System.out.println("CENTRE: "+(nc+1));
            System.out.println("--------------");
            for (int hs=0; hs < Global.HORES_SERVEI; hs++) {
                ArrayList camions = this.get(hs,nc);
                System.out.println("  ->Hora:" + (hs+8));
                for (int j = 0; j<camions.size(); j++) {
                    Camio c = (Camio) camions.get(j);
                    ArrayList<Peticio> llista = c.getLlistaPeticions();
                    System.out.println("      ->Camió: "+c.getTipus()+"kg , carregat amb: "+c.getCarrega()+"kg");
                    for (int l=0; l<llista.size(); l++) {
                        Peticio p = llista.get(l);
                        int id,qtt,h;
                        id = p.getIdProducte();
                        qtt = p.getQuantitat();
                        h = p.getHoraLimit();
                        System.out.println("           ->@Pet. id: "+id+" , Qtt: "+qtt+" , Hl: "+h);
                    }
                }
            }
        }
    }
}