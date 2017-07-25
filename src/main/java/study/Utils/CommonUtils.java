package study.Utils;

import java.text.SimpleDateFormat;
import java.util.Date;

public class CommonUtils {
	
	public static String DateToString(Date d){
		SimpleDateFormat s = new SimpleDateFormat("yyyy-MM-dd");
		String dateString = s.format(d);
		return dateString;
	}
}
