package util;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

public class FechaUtil {

	public static String getFechaFormateadaYYYYMMdd(java.sql.Date fecha) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd"); //Brinda formato a la fecha
		return sdf.format(fecha);
	}
	
	public static Date toFecha(String fecha) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date fec = null;
		try {
			fec = new Date(sdf.parse(fecha).getTime());
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return fec;
	}
	
	public static String getFechaActualYYYYMMdd() {
		Date fechaActual = new Date(); // Fecha Actual o fecha del sistema
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd"); //Brinda formato a la fecha
		return sdf.format(fechaActual);
	}
	
	public static String getFechaActualddMMyyyy() {
		Date fechaActual = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy"); 
		return sdf.format(fechaActual);
	}
	
	public static String getFechaPrimeroEneroYYYYMMdd() {
		Date fechaActual = new Date();
		
		Calendar calendar = Calendar.getInstance(); //Permite modificar fecha
		calendar.setTime(fechaActual);
		calendar.set(Calendar.MONTH, Calendar.JANUARY);
		calendar.set(Calendar.DAY_OF_MONTH, 1);
		Date  fechaModificada = calendar.getTime();
				
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		return sdf.format(fechaModificada);
	}
	
	public static String getFechaUltimoDiciembreYYYYMMdd() {
		Date fechaActual = new Date();
		
		Calendar calendar = Calendar.getInstance(); //Permite modificar fecha
		calendar.setTime(fechaActual);
		calendar.set(Calendar.MONTH, Calendar.DECEMBER);
		calendar.set(Calendar.DAY_OF_MONTH, 31);
		Date  fechaModificada = calendar.getTime();
				
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		return sdf.format(fechaModificada);
	}
	
	//La fecDos no es superior a la fecUno
	public static boolean isNotSuperiorFechaYYYYMMdd(String fecUno, String fecDos) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		try {
			Date dateUno = sdf.parse(fecUno);
			Date dateDos = sdf.parse(fecDos);
			return dateDos.before(dateUno);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}
	
	public static boolean isNotSuperiorSeisMesesFechaYYYYMMdd(String fecUno, String fecDos) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		try {
			Date dateUno = sdf.parse(fecUno);
			Date dateDos = sdf.parse(fecDos);
			
			//Aumentar la fecha 1 en seis meses (180 d�as)
			Calendar calendar = Calendar.getInstance();
			calendar.setTime(dateUno);
			int diasAnio = calendar.get(Calendar.DAY_OF_YEAR);
			calendar.set(Calendar.DAY_OF_YEAR, diasAnio + 180);
			Date  dateAumentado = calendar.getTime();
			
			//System.out.println(sdf.format(dateAumentado));
			return dateAumentado.before(dateDos);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}

	public static void main(String[] args) {
		System.out.println(FechaUtil.getFechaActualYYYYMMdd());
		System.out.println(FechaUtil.getFechaActualddMMyyyy());
		System.out.println(FechaUtil.getFechaPrimeroEneroYYYYMMdd());
		System.out.println(FechaUtil.getFechaUltimoDiciembreYYYYMMdd());
		
		System.out.println(FechaUtil.isNotSuperiorFechaYYYYMMdd("2022-02-01", "2022-02-01"));
		System.out.println(FechaUtil.isNotSuperiorFechaYYYYMMdd("2022-02-01", "2022-03-01"));
		System.out.println(FechaUtil.isNotSuperiorFechaYYYYMMdd("2022-05-01", "2022-02-01"));
		
		System.out.println(FechaUtil.isNotSuperiorSeisMesesFechaYYYYMMdd("2022-02-01", "2022-02-01"));
		System.out.println(FechaUtil.isNotSuperiorSeisMesesFechaYYYYMMdd("2022-02-01", "2022-03-01"));
		System.out.println(FechaUtil.isNotSuperiorSeisMesesFechaYYYYMMdd("2022-02-01", "2022-09-01"));
		
		
	}
	
}


