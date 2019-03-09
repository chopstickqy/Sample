package com.sunday.controller;

import java.text.ParseException;
import java.util.Date;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sunday.model.Sales;
import com.sunday.service.SalesService;

@Controller
public class SalesController{
	@Autowired
    private SalesService salesService;
	  
	@RequestMapping(value="/querysales.do",method = RequestMethod.POST)
    @ResponseBody	
	public HashMap<String,Object> querySales(@RequestBody HashMap<String,String> map){
		String commodity = map.get("commodity");
		String customer = map.get("customer");
		String state = map.get("state");
		String id = map.get("id");
		String minTime = map.get("minTime");
		String maxTime = map.get("maxTime");
		int page = Integer.parseInt(map.get("page"));
		return salesService.getSales(commodity, customer, state, id, minTime, maxTime, page);
	}
	
	@RequestMapping(value="/insertsales.do",method = RequestMethod.POST)
    @ResponseBody	
	public int insertSales(@RequestBody HashMap<String,String> map,HttpServletRequest request){
		HttpSession session = request.getSession();
		Sales sales = new Sales();
		sales.seteCommodity(map.get("commodity"));
		sales.seteCommodityid(map.get("commodityid"));
		sales.seteCustomer(map.get("customer"));
		sales.seteNumber(Integer.parseInt(map.get("number")));
		sales.setePrice(Double.parseDouble(map.get("price")));
		sales.seteUser((String)session.getAttribute("account"));
		
		return salesService.insertSales(sales);
	}
	
    @RequestMapping(value="/updatesales.do",method = RequestMethod.POST)
    @ResponseBody		
    public int updateCommodity(@RequestBody HashMap<String,String> map) throws ParseException{
    	Sales sales = new Sales();
		sales.seteCommodity(map.get("commodity"));
    	sales.seteCommodityid(map.get("commodityId"));
		sales.seteCustomer(map.get("customer"));
    	sales.seteId(map.get("id"));
    	sales.seteNumber(Integer.parseInt(map.get("number")));
		sales.setePrice(Double.parseDouble(map.get("price")));
    	sales.seteState(map.get("state"));
    	sales.seteTime(new Date());
		sales.seteUser(map.get("user"));
		
		return salesService.updateSales(sales);
    }
    
    @RequestMapping(value="/salestatistics.do",method = RequestMethod.POST)
    @ResponseBody		
    public HashMap<String, Object> saleStatistics(@RequestBody HashMap<String,String> map){
		
		return salesService.salesStatistics();
    }
    
    @RequestMapping(value="/updatesalestate.do",method = RequestMethod.POST)
    @ResponseBody		
    public int updateSalesState(@RequestBody HashMap<String,String> map){
		String id = map.get("id");
		String state = map.get("state");
		return salesService.updateSalesState(id, state);
    }
    
    @RequestMapping(value="/updatesaleorderstate.do",method = RequestMethod.POST)
    @ResponseBody		
    public int updateSaleOrderState(@RequestBody HashMap<String,String> map){
		String id = map.get("id");
		String state = map.get("state");
		return salesService.updateSalesOrderState(id, state);
    }
    
    @RequestMapping(value="/typesales.do",method = RequestMethod.POST)
    @ResponseBody		
    public HashMap<String, Object> typeSales(@RequestBody HashMap<String,String> map){
    	String type = map.get("type");
		String dateFormate = map.get("dateFormate");
		return salesService.typeSales(type, dateFormate);
    }
}
