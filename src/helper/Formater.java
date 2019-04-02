package helper;

import java.text.DecimalFormat;
import java.text.DecimalFormatSymbols;
import java.text.NumberFormat;
import java.util.Locale;

public class Formater {

	public static String valor(Double valor) {

		NumberFormat formatter = new DecimalFormat("#,##0.00", new DecimalFormatSymbols(new Locale("pt", "BR")));
		String result = formatter.format(valor);

		return result;

	}
}
