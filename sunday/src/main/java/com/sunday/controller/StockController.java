package com.sunday.controller;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sunday.model.Stock;
import com.sunday.service.StockService;

@Controller
public class StockController{
	@Autowired
    private StockService stockService;
	private String stockType;
	  
	@RequestMapping(value="/querystocks.do",method = RequestMethod.POST)
    @ResponseBody	
	public HashMap<String,Object> queryStocks(@RequestBody HashMap<String,String> map){
		String name = map.get("name");
		String number = map.get("number");
		String supplier = map.get("supplier");
		String minQuantity = map.get("minQuantity");
		String maxQuantity = map.get("maxQuantity");
		String minTime = map.get("minTime");
		String maxTime = map.get("maxTime");
		int page = Integer.parseInt(map.get("page"));
		return stockService.getStocks(stockType,name, number, supplier, minQuantity, maxQuantity, minTime, maxTime, page);
	}
	
	@RequestMapping(value="/queryallstocks.do",method = RequestMethod.POST)
    @ResponseBody	
	public HashMap<String,Object> queryAllStocks(@RequestBody HashMap<String,String> map){
		return stockService.getAllStocks();
	}
	
	@RequestMapping(value="/insertstock.do",method = RequestMethod.POST)
    @ResponseBody	
	public int insertStock(@RequestBody HashMap<String,String> map){
		Stock stock = new Stock();
		stock.settName(map.get("name"));
		stock.settNumber(map.get("number"));
		stock.settQuantity(Integer.parseInt(map.get("quantity")));
		stock.settInQuantity(Integer.parseInt(map.get("quantity")));
		stock.settState(map.get("state"));
		stock.settSupplier(map.get("supplier"));
		stock.settType(map.get("type"));
		return stockService.insertStock(stock);
	}
	
    @RequestMapping(value="/updatestock.do",method = RequestMethod.POST)
    @ResponseBody		
    public int updateCommodity(@RequestBody HashMap<String,String> map){
    	Stock stock = new Stock();
		stock.settName(map.get("name"));
		stock.settNumber(map.get("number"));
		stock.settInQuantity(Integer.parseInt(map.get("inQuantity")));
		stock.settState(map.get("state"));
		stock.settSupplier(map.get("supplier"));
		stock.settType(stockType);
		return stockService.updateStock(stock);
    }
    
    @RequestMapping(value="/updatestockstate.do",method = RequestMethod.POST)
    @ResponseBody		
    public int updateStockState(@RequestBody HashMap<String,String> map){
		String id = map.get("id");
		String state = map.get("state");
		return stockService.updateStockState(id, state);
    }
    
    @RequestMapping(value="/stockType.do",method = RequestMethod.POST)
    @ResponseBody		
	public int stockType(@RequestBody HashMap<String,String> map) throws Exception {
		stockType = map.get("type");
		return 1;
	}
}
