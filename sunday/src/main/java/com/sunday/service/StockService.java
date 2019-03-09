package com.sunday.service;

import java.util.HashMap;

import com.sunday.model.Stock;

public interface StockService {
	public Stock getStock (String id);
	public HashMap<String,Object> getStocks(String type, String name, String number, String supplier, String minQuantity, String maxQuantity, String minTime, String maxTime, int page); 
	public HashMap<String,Object> getAllStocks(); 
	public int insertStock(Stock stock);
	public int updateStock(Stock stock);
	public int updateStockState(String id, String state);
}
