package com.sunday.service;

import java.util.HashMap;

import com.sunday.model.Sales;

public interface SalesService {
	public Sales getSale (String id);
	public HashMap<String,Object> getSales(String commodity, String customer, String state, String id, String minTime, String maxTime, int page); 
	public int insertSales(Sales sales);
	public int updateSales(Sales sales);
	public int updateSalesState(String id, String state);
	public int updateSalesOrderState(String id, String state);
	public HashMap<String,Object> salesStatistics();
	public HashMap<String,Object> typeSales(String type, String dateFormate);
}
