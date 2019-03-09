package com.sunday.service;

import java.util.HashMap;

import com.sunday.model.Order;

public interface OrderService {
	public Order getOrder (String id);
	public HashMap<String,Object> getOrders(String commodity, String supplier, String state, String id, String minTime, String maxTime, int page); 
	public int insertOrder(Order order);
	public int updateOrder(Order order);
	public int updateOrderState(String id, String state);
	public int updatePurchaseState(String id, String state);
	public HashMap<String,Object> salesStatistics();
}
