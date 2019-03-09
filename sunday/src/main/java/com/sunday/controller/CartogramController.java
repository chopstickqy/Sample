package com.sunday.controller;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sunday.service.CartogramService;

@Controller
public class CartogramController{
	@Autowired
    private CartogramService cartogramService;
	  
	
    @RequestMapping(value="/profitstatistics.do",method = RequestMethod.POST)
    @ResponseBody		
    public HashMap<String, Object> profitStatistics(@RequestBody HashMap<String,String> map){
		
		return cartogramService.profitStatistics();
    }
    
    @RequestMapping(value="/sizestatistics.do",method = RequestMethod.POST)
    @ResponseBody		
    public HashMap<String, Object> sizeStatistics(@RequestBody HashMap<String,String> map){
		String name = map.get("name");
		return cartogramService.sizeStatistics(name);
    }
}
