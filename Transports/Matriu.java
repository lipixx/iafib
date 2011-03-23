package Transports;

import java.util.*;
import java.io.*;

@SuppressWarnings ("unchecked")
public class Matriu {
   
    private ArrayList<ArrayList> matriu;
    private int files;
    private int columnes;

    public Matriu(int nfiles, int ncols)
    {
	matriu = new ArrayList<ArrayList>();
	files = nfiles - 1;
	columnes = ncols - 1;
	for (int i=0; i<nfiles; i++)
	    {
		matriu.add(i,new ArrayList<ArrayList>());
		ArrayList<ArrayList> fila = matriu.get(i);

		for (int j=0; j<ncols; j++)
		    {
			fila.add(j,new ArrayList<Object>());
		    }
	    }
    }
    
    public ArrayList get(int fil, int col)
    {	
	if (fil < 0 || fil > files || col < 0 || col > columnes) return null;
	ArrayList fila = matriu.get(fil);
	return (ArrayList) fila.get(col);
    }

    public Object getObj(int fil, int col)
    {	
	if (fil < 0 || fil > files || col < 0 || col > columnes) return null;
	ArrayList fila = matriu.get(fil);
	return fila.get(col);
    }

    public void add(int fila, int col, Object o)
    {
	if (!(fila < 0 || fila > files || col < 0 || col > columnes))
	    {
		ArrayList pos = matriu.get(fila);
		pos = (ArrayList) pos.get(col);
		pos.add(o);
	    }
    }

    public void remove(int fila, int col, Object o)
    {
	if (!(fila < 0 || fila > files || col < 0 || col > columnes))
	    {
		ArrayList pos = matriu.get(fila);
		pos = (ArrayList) pos.get(col);
		pos.remove(o);
	    }
    }

    public void print()
    {
	for (int i=0; i<matriu.size(); i++)
	    {
		ArrayList fila = matriu.get(i);
		for (int j=0; j<fila.size(); j++)
		    {
			System.out.println("F:" + i + ",C:"+j + " -> ");
			/*Debug only*/
			ArrayList objecte = (ArrayList) fila.get(j);
			for (int k=0; k<objecte.size(); k++)
			    {				
				System.out.println(objecte.get(k) + " ");
			    }
		    }
	    }
    }

    public void printPeticions()
    {
	for (int nc=0; nc < Global.N_CENTRES; nc++)
	    {
		System.out.println("CENTRE: "+(nc+1));
		System.out.println("--------------");
		for (int hs=0; hs < Global.HORES_SERVEI; hs++)
		    {
			ArrayList peticions = this.get(hs,nc);
			System.out.println("  ->Hora:" + (hs+8));
			for (int j = 0; j<peticions.size(); j++)
			    {
				Peticio p = (Peticio) peticions.get(j);
				int id,qtt,h;
				id = p.getIdProducte(); qtt = p.getQuantitat(); h = p.getHoraLimit();   
				System.out.println("      ->@Pet. id: "+id+" , Qtt: "+qtt+" , Hl: "+h);
			    }	
		    }
	    }
    }

}