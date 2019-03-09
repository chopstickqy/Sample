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

import com.sunday.model.Order;
import com.sunday.service.OrderService;

@Controller
public class OrderController{
	@Autowired
    private OrderService orderService;
	  
	@RequestMapping(value="/queryorders.do",method = RequestMethod.POST)
    @ResponseBody	
	public HashMap<String,Object> queryOrders(@RequestBody HashMap<String,String> map){
		String commodity = map.get("commodity");
		String supplier = map.get("supplier");
		String state = map.get("state");
		String id = map.get("id");
		String minTime = map.get("minTime");
		String maxTime = map.get("maxTime");
		int page = Integer.parseInt(map.get("page"));
		return orderService.getOrders(commodity, supplier, state, id, minTime, maxTime, page);
	}
	
	@RequestMapping(value="/insertorder.do",method = RequestMethod.POST)
    @ResponseBody	
	public int insertSales(@RequestBody HashMap<String,String> map,HttpServletRequest request){
		HttpSession session = request.getSession();
		Order order = new Order();
		order.setoCommodity(map.get("commodity"));
		order.setoCommodityid(map.get("commodityid"));
		order.setoSupplier(map.get("supplier"));
		order.setoNumber(Integer.parseInt(map.get("number")));
		order.setoPrice(Double.parseDouble(map.get("price")));
		order.setoUser((String)session.getAttribute("account"));
		
		return orderService.insertOrder(order);
	}
	
    @RequestMapping(value="/updateorder.do",method = RequestMethod.POST)
    @ResponseBody		
    public int updateSales(@RequestBody HashMap<String,String> map, HttpServletRequest request) throws ParseException{
    	HttpSession session = request.getSession();
    	Order order = new Order();
    	order.setoId(map.get("id"));
		order.setoCommodity(map.get("commodity"));
		order.setoSupplier(map.get("supplier"));
		order.setoNumber(Integer.parseInt(map.get("number")));
		order.setoPrice(Double.parseDouble(map.get("price")));
		order.setoTime(new Date());
		order.setoUser((String)session.getAttribute("account"));
		order.setoState("待确认");
		order.setoCommodityid(map.get("commodityid"));
		
		return orderService.updateOrder(order);
    }
    
    @RequestMapping(value="/salesstatistics.do",method = RequestMethod.POST)
    @ResponseBody		
    public HashMap<String, Object> saleSstatistics(@RequestBody HashMap<String,String> map){
		
		return orderService.salesStatistics();
    }
    
    @RequestMapping(value="/updateorderstate.do",method = RequestMethod.POST)
    @ResponseBody		
    public int updateOrderState(@RequestBody HashMap<String,String> map){
		String id = map.get("id");
		String state = map.get("state");
		return orderService.updateOrderState(id, state);
    }
    
    @RequestMapping(value="/updatepurchasestate.do",method = RequestMethod.POST)
    @ResponseBody		
    public int updatePurchaseState(@RequestBody HashMap<String,String> map){
		String id = map.get("id");
		String state = map.get("state");
		return orderService.updatePurchaseState(id, state);
    }
}
