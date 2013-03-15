import java.sql.*;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.GregorianCalendar;

public class Sql {
	public ArrayList<Orden> readIniciales(String emisora, String serie, Calendar cal) {
		Connection con = null;
		// Local
		/*String url = "jdbc:mysql://192.168.1.102:3306/";
		String db = "test";
		String opt = "?zeroDateTimeBehavior=convertToNull";
		String driver = "com.mysql.jdbc.Driver";
		String user = "remote";
		String pass = "test";*/
		// Remote
		String url = "jdbc:mysql://tesis.ci9ubv2adbti.us-east-1.rds.amazonaws.com:3306/";
		String db = "tesis";
		String opt = "?zeroDateTimeBehavior=convertToNull";
		String driver = "com.mysql.jdbc.Driver";
		String user = "tesis";
		String pass = Password.password;
		ArrayList<Orden> ordenes = new ArrayList<Orden>();
		try{
			Class.forName(driver).newInstance();
			con = DriverManager.getConnection(url+db+opt, user, pass);
			try{
				Statement st = con.createStatement();
				String date = cal.get(Calendar.YEAR) + "-" + (cal.get(Calendar.MONTH)+1) + "-"  + cal.get(Calendar.DATE);
				String query;
				if(serie.compareTo("") == 0)
					query = "SELECT id, orig_timestamp, folio, fecha_vig, '0', '0000-00-00', tipo_mov, casabolsa, tipo_op, tipo_ord, tipo_val, emisora, serie, precio, volumen FROM `inicial` where fecha = '" + date + "' and emisora = '" + emisora + "' and tipo_op <> 'PI' and tipo_op <> 'HC'";
				else
					query = "SELECT id, orig_timestamp, folio, fecha_vig, '0', '0000-00-00', tipo_mov, casabolsa, tipo_op, tipo_ord, tipo_val, emisora, serie, precio, volumen FROM `inicial` where fecha = '" + date + "' and emisora = '" + emisora + "' and serie = '" + serie + "' and tipo_op <> 'PI' and tipo_op <> 'HC'";
				System.out.println(query);
				ResultSet res = st.executeQuery(query);
				while (res.next()) {
					String[] str = new String[15];
					for (int i = 1; i <= 15; i++) {
						str[i-1] = res.getString(i);
					}
					ordenes.add(new Orden(str));
				}
				con.close();
			}
			catch (SQLException s){
				System.out.println("SQL code does not execute.");
			}  
		}
		catch (Exception e){
			e.printStackTrace();
		}
		return ordenes;
	}
	public void read(ArrayList<Orden> ordenes, String emisora, String serie, Calendar cal) {
		Connection con = null;
		//Local
		/*String url = "jdbc:mysql://192.168.1.102:3306/";
		String db = "test";
		String opt = "?zeroDateTimeBehavior=convertToNull";
		String driver = "com.mysql.jdbc.Driver";
		String user = "remote";
		String pass = "test";*/
		// Remote
		String url = "jdbc:mysql://tesis.ci9ubv2adbti.us-east-1.rds.amazonaws.com:3306/";
		String db = "tesis";
		String opt = "?zeroDateTimeBehavior=convertToNull";
		String driver = "com.mysql.jdbc.Driver";
		String user = "tesis";
		String pass = Password.password;
		try{
			Class.forName(driver).newInstance();
			con = DriverManager.getConnection(url+db+opt, user, pass);
			try{
				Statement st = con.createStatement();
				Long startDate = cal.getTimeInMillis();
				Long endDate = startDate + 24*3600*1000;
				String query;
				if(serie.compareTo("") == 0)
					query = "SELECT * FROM `tesis` where emisora = '" + emisora + "' and timestamp between " + startDate + " and " + endDate + " and tipo_op <> 'PI' and tipo_op <> 'HC' order by timestamp, tipo_mov DESC";
				else
					query = "SELECT * FROM `tesis` where emisora = '" + emisora + "' and serie = '" + serie +"' and timestamp between " + startDate + " and " + endDate + " and tipo_op <> 'PI' and tipo_op <> 'HC' order by timestamp, tipo_mov DESC";
				System.out.println(query);
				ResultSet res = st.executeQuery(query);
				while (res.next()) {
					String[] str = new String[15];
					for (int i = 1; i <= 15; i++) {
						str[i-1] = res.getString(i);
					}
					ordenes.add(new Orden(str));
				}
				con.close();
			}
			catch (SQLException s){
				System.out.println("SQL code does not execute.");
			}  
		}
		catch (Exception e){
			e.printStackTrace();
		}
	}
}