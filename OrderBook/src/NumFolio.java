
public class NumFolio implements Comparable<NumFolio> {
	public int num;
	public int folio;
	public NumFolio(int n, int f) {
		num = n;
		folio = f;
	}
	public String toString() {
		return "num: " + num + " folio: " + folio;
	}
	@Override
	public int compareTo(NumFolio otherNumFolio) {
		NumFolio anotherNumFolio = (NumFolio) otherNumFolio;
		Integer f = new Integer(folio);
		return f.compareTo(anotherNumFolio.folio);
	}
}
