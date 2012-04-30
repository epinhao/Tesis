import java.math.BigDecimal;
import java.util.Date;

public class Orden implements Comparable<Orden> {
	public int id;
	public int folio;
	public int folioAnt;
	public int casa_bolsa;
	public Date date;
	public Mov tipomov;
	public Op tipoop;
	public Ord tipoord;
	public BigDecimal precio;
	public int volumen;
	public Orden(String[] args) {
		id = Integer.parseInt(args[0]);
		folio = Integer.parseInt(args[2]);
		folioAnt = Integer.parseInt(args[4]);
		casa_bolsa = Integer.parseInt(args[7]);
		date = new Date(Long.parseLong(args[1]));
		tipomov = Mov.valueOf(args[6]);
		tipoop = Op.valueOf(args[8]);
		if (args[9].compareTo("") == 0)
				args[9] = "NA";
		tipoord = Ord.valueOf(args[9]);
		precio = new BigDecimal(args[13]);
		precio = precio.abs();
		precio = precio.setScale(2);
		volumen = Integer.parseInt(args[14]);
	}
	public enum Mov {AH, CA, CH, CO, MO, MH, VE}; 
	public enum Op {CO, DC, HC, OP, OR, PI, SA, SR};
	public enum Ord {LP, PQ, VO, MA, MC, DC, MP, LO, HC, NA};
	public String toString() {
		return tipomov + " " + precio + " " + volumen;
	}
	public Object[] toRow() {
		Object[] temp = new Object[8];
		temp[0] = tipomov;
		temp[1] = precio;
		temp[2] = volumen;
		temp[3] = date;
		temp[4] = folio;
		temp[5] = folioAnt;
		temp[6] = casa_bolsa;
		temp[7] = tipoord;
		return temp;
	}
	@Override
	public int compareTo(Orden otherOrden) {
		Orden anotherOrden = (Orden) otherOrden;
		Integer f = new Integer(folio);
		return f.compareTo(anotherOrden.folio);
	}
}
