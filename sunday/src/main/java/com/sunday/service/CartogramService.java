package com.sunday.service;

import java.util.HashMap;

public interface CartogramService {
	public HashMap<String,Object> profitStatistics();
	public HashMap<String,Object> sizeStatistics(String name);
}
