import java.io.BufferedReader;
import java.io.DataInputStream;
import java.io.FileInputStream;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.util.ArrayList;


public class FileReader {
	public String file;
	public FileReader(String f) {
		file = f;
	}
	public ArrayList<Orden> read() {
		ArrayList<Orden> ordenes = new ArrayList<Orden>();
		try {
			//create BufferedReader to read csv file
			FileInputStream fstream = new FileInputStream(file);
			// Get the object of DataInputStream
			DataInputStream in = new DataInputStream(fstream);
			BufferedReader br = new BufferedReader(new InputStreamReader(in));
			String strLine;
			//read comma separated file line by line
			while( (strLine = br.readLine()) != null)
			{
				strLine = strLine.replace("\"", "");
				ordenes.add(new Orden(strLine.split(";")));
			}
		}
		catch(Exception e)
		{
			System.out.println("Exception while reading csv file: " + e);			
		}
		return ordenes;
	}
	public ArrayList<Orden> readTextFromJar(String s) {
		ArrayList<Orden> ordenes = new ArrayList<Orden>();
		try {
			InputStream is = getClass().getResourceAsStream(s);
			BufferedReader br = new BufferedReader
			(new InputStreamReader(is));
			String strLine;
			while ((strLine = br.readLine()) != null) {
				strLine = strLine.replace("\"", "");
				ordenes.add(new Orden(strLine.split(";")));
				System.out.println(strLine);
			}
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		return ordenes;
	}
}