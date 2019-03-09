package com.sunday.controller;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sunday.model.Commodity;
import com.sunday.service.CommodityService;

@Controller
public class CommdityController{
	@Autowired
    private CommodityService commodityService;
	  
	@RequestMapping(value="/querycommodity.do",method = RequestMethod.POST)
    @ResponseBody	
	public Commodity queryCommodity(@RequestBody HashMap<String,String> map){
		String id = map.get("id");
		return commodityService.getCommodity(id);
	}
	
	@RequestMapping(value="/querycommoditys.do",method = RequestMethod.POST)
    @ResponseBody	
	public HashMap<String,Object> queryCommoditys(@RequestBody HashMap<String,String> map){
		String id = map.get("id");
		String name = map.get("name");
		String type = map.get("type");
		String color = map.get("color");
		String material = map.get("material");
		String size = map.get("size");
		int page = Integer.parseInt(map.get("page"));;
		return commodityService.getCommoditys(id, name, type, color, material, size, page);
	}
	
	@RequestMapping(value="/queryallcommoditys.do",method = RequestMethod.POST)
    @ResponseBody	
	public HashMap<String,Object> queryAllCommoditys(@RequestBody HashMap<String,String> map){
		return commodityService.getAllCommoditys();
	}
	
	@RequestMapping(value="/insertcommodity.do",method = RequestMethod.POST)
    @ResponseBody	
	public int insertCommodity(@RequestBody HashMap<String,String> map){
		Commodity commodity = new Commodity();
		commodity.setmId(map.get("id"));
		commodity.setmName(map.get("name"));
		commodity.setmType(map.get("type"));
		commodity.setmColor(map.get("color"));
		commodity.setmMaterial(map.get("material"));
		commodity.setmSize(map.get("size"));
		commodity.setmInPrice(Double.parseDouble(map.get("inprice")));
		commodity.setmOutPrice(Double.parseDouble(map.get("outprice")));
		
		return commodityService.insertCommodity(commodity);
	}
	
    @RequestMapping(value="/updatecommodity.do",method = RequestMethod.POST)
    @ResponseBody		
    public int updateCommodity(@RequestBody HashMap<String,String> map){
    	Commodity commodity = new Commodity();
    	commodity.setmId(map.get("id"));
		commodity.setmName(map.get("name"));
		commodity.setmType(map.get("type"));
		commodity.setmColor(map.get("color"));
		commodity.setmMaterial(map.get("material"));
		commodity.setmSize(map.get("size"));
		commodity.setmInPrice(Double.parseDouble(map.get("inprice")));
		commodity.setmOutPrice(Double.parseDouble(map.get("outprice")));	
		
    	return commodityService.updateCommodity(commodity);
    }
    
    @RequestMapping(value="/commoditylist.do",method = RequestMethod.POST)
    @ResponseBody		
    public List<String> commodityList(@RequestBody HashMap<String,String> map){
    	return commodityService.commdotiyList();
    }
    
    @RequestMapping(value="/detelecommodity.do",method = RequestMethod.POST)
    @ResponseBody		
    public int deleteCommodity(@RequestBody HashMap<String,String> map){
    	String id = map.get("id");
    	return commodityService.deteleCommodity(id);
    }
}
