package com.sunday.service;

import java.util.HashMap;
import java.util.List;

import com.sunday.model.Commodity;

public interface CommodityService {
	public Commodity getCommodity(String id);
	public HashMap<String,Object> getCommoditys(String id, String name, String type, String color, String material, String size, int page); 
	public HashMap<String,Object> getAllCommoditys(); 
	public int insertCommodity(Commodity commodity);
	public int updateCommodity(Commodity commodity);
	public int deteleCommodity(String id);
	public List<String> commdotiyList();
}
