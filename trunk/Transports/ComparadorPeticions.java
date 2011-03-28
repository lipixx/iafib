package Transports;

import java.util.*;

public class ComparadorPeticions implements Comparator<Peticio> {
    /**
     *Compara dues peticions en ordre, primer per Hora i després per quantitat.
     *@param p1 Petició 1 a comparar amb Petició 2
     *@param p2 Petició 2 a comparar amb Petició 1
     *@returns A negative integer, zero, or a positive integer as this object is less than, equal to,
     *or greater than the specified object.
     */
    public int compare(Peticio p1, Peticio p2) {
        if (p1.getHoraLimit() < p2.getHoraLimit()) return -1;
        if (p1.getHoraLimit() > p2.getHoraLimit()) return 1;
        if (p1.getQuantitat() < p2.getQuantitat()) return -1;
        if (p1.getQuantitat() > p2.getQuantitat()) return 1;
        return 0;
    }
}