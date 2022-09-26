package util;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.Date;

public class DateParse {
	private static SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
	private static SimpleDateFormat strFormat = new SimpleDateFormat("yyyyMMdd");
	private static DateTimeFormatter localDateFormat = DateTimeFormatter.ofPattern("yyyyMMdd");
	private static SimpleDateFormat fulltimeFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm");
	private static SimpleDateFormat timeFormat = new SimpleDateFormat("HH:mm");
	
	// �쇅遺��뿉�꽌 媛앹껜 �깮�꽦 湲덉� 
	private DateParse() {}
	
	// yyyy-MM-dd -> yyyyMMdd	=>	DB�뿉 �꽔湲� �쐞�빐 �궗�슜
	public static String dateToStr(String date) {
		return date.replaceAll("-", "");
	}
	
	// yyyyMMdd -> yyyy-MM-dd	=>	input date value濡� �꽔湲� �쐞�빐 �궗�슜
	public static String strToDate(String str) {
		Date date;
		try {
			date = strFormat.parse(str);
			System.out.println("date"+date);
			return dateFormat.format(date);
			
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	// getTodayPlus(int) �뙆�씪誘명꽣濡� 	0 �꽔�쑝硫� �삤�뒛, 1 �꽔�쑝硫� �궡�씪
	public static String getTodayPlus(int plus) {
		LocalDate now = LocalDate.now(); 	// �쁽�옱�떆媛�
		now = now.plusDays(plus);			// �쁽�옱�떆媛� + "plus"�씪
		return now.format(localDateFormat);	// yyyyMMdd �룷留ㅽ똿
	}
	
	// �궇吏� �뜑�븯湲� (�쓬�닔�룄 媛��뒫)
	public static String datePlus(String date, int plus) {
		if(date.contains("-")) date = DateParse.dateToStr(date);
		LocalDate localDate = LocalDate.parse(date, DateTimeFormatter.BASIC_ISO_DATE);
		return localDate.plusDays(plus).format(DateTimeFormatter.BASIC_ISO_DATE);
		// return yyyyMMdd
	}
	
	// �궇吏� 李⑥씠 怨꾩궛 end - start
	public static int dateDif(String start, String end) {
		if(start.contains("-") || end.contains("-")) {
			start = DateParse.dateToStr(start);
			end = DateParse.dateToStr(end);
		}
		
		try {
			Date startDate = strFormat.parse(start);
			Date endDate = strFormat.parse(end);
			int dif = (int) ((endDate.getTime()-startDate.getTime()) / (24*60*60*1000));
			System.out.println("�궇吏� 李⑥씠 : "+dif);
			return dif+1;
			
		} catch (ParseException e) {
			e.printStackTrace();
		}
		
		return -1;
	}
	public static String time(String time) {
			
		Date date;
		try {
			date = fulltimeFormat.parse(time);
			return timeFormat.format(date);
			
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return null;
	}
	public static String day(String fullTime) {
		
		Date date;
		try {
			date = fulltimeFormat.parse(fullTime);
			return strFormat.format(date);
			
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return null;
	}
}

