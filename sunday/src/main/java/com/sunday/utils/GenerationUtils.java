package com.sunday.utils;

import java.text.SimpleDateFormat;
import java.util.Date;

public class GenerationUtils {
	public static String orderGeneration(){
        Date date = new Date();
        SimpleDateFormat sdf = new SimpleDateFormat("HHmmss");
        String createdate = sdf.format(date);
		return "OD"+createdate;
	}
	
	public static String salesGeneration(){
        Date date = new Date();
        SimpleDateFormat sdf = new SimpleDateFormat("HHmmss");
        String createdate = sdf.format(date);
		return "SL"+createdate;
	}
	
	public static String supplierGeneration(){
        Date date = new Date();
        SimpleDateFormat sdf = new SimpleDateFormat("HHmmss");
        String createdate = sdf.format(date);
		return "SP"+createdate;
	}
	
	public static String customerGeneration(){
        Date date = new Date();
        SimpleDateFormat sdf = new SimpleDateFormat("HHmmss");
        String createdate = sdf.format(date);
		return "CT"+createdate;
	}
}
