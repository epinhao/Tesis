import java.text.SimpleDateFormat;
import java.util.TimeZone;

import javax.swing.table.DefaultTableCellRenderer;

public class DateRenderer2 extends DefaultTableCellRenderer.UIResource {
	SimpleDateFormat formatter;
	public DateRenderer2() { super(); }

	public void setValue(Object value) {
		if (formatter==null) {
			TimeZone tz = TimeZone.getTimeZone("America/Mexico_City");
			formatter = new SimpleDateFormat("EEE, d MMM yyyy HH:mm:ss z");
			formatter.setTimeZone(tz);
		}
		setText((value == null) ? "" : formatter.format(value));
	}
}