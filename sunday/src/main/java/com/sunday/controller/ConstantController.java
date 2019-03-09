package com.sunday.controller;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sunday.model.Constant;
import com.sunday.service.ConstantService;


@Controller
public class ConstantController{
	@Autowired
    private ConstantService constantService;
	  
	@RequestMapping(value="/typeList.do",method = RequestMethod.POST)
    @ResponseBody	
	public HashMap<String,Object> queryUsers(@RequestBody HashMap<String,String> map){
		return constantService.getConstant();	
	}
	
	@RequestMapping(value="/insertType.do",method = RequestMethod.POST)
    @ResponseBody	
	public int insertUser(@RequestBody HashMap<String,String> map){
		Constant constant = new Constant();
		constant.setCommodityType(map.get("type"));
		return constantService.insertConstant(constant);
	}
	
    @RequestMapping(value="/deleteType.do",method = RequestMethod.POST)
    @ResponseBody		
    public int deleteUser(@RequestBody HashMap<String,String> map){
    	String typeName = map.get("type");
    	return constantService.deleteConstant(typeName);
    }
    
}
