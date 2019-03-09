package com.sunday.controller;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sunday.model.Supplier;
import com.sunday.service.SupplierService;

@Controller
public class SupplierController{
	@Autowired
    private SupplierService supplierService;
	  
	@RequestMapping(value="/querysuppliers.do",method = RequestMethod.POST)
    @ResponseBody	
	public HashMap<String,Object> querySuppliers(@RequestBody HashMap<String,String> map){
		String name = map.get("name");
		int page = Integer.parseInt(map.get("page"));;
		return supplierService.getSuppliers(name, page);	
	}
	
	@RequestMapping(value="/queryallsuppliers.do",method = RequestMethod.POST)
    @ResponseBody	
	public HashMap<String,Object> queryAllSuppliers(@RequestBody HashMap<String,String> map){
		return supplierService.getAllSuppliers();
	}
	
	@RequestMapping(value="/insertsupplier.do",method = RequestMethod.POST)
    @ResponseBody	
	public int insertSupplier(@RequestBody HashMap<String,String> map){
		Supplier supplier = new Supplier();
		supplier.setsName(map.get("name"));
		supplier.setsContact(map.get("contact"));
		supplier.setsPhone(map.get("phone"));
		supplier.setsAddress(map.get("address"));
		supplier.setsDescription(map.get("description"));
		return supplierService.insertSupplier(supplier);
	}
	
    @RequestMapping(value="/updatesupplier.do",method = RequestMethod.POST)
    @ResponseBody		
    public int updateSupplier(@RequestBody HashMap<String,String> map){
    	Supplier supplier = new Supplier();
		supplier.setsId(map.get("id"));
		supplier.setsName(map.get("name"));
		supplier.setsContact(map.get("contact"));
		supplier.setsPhone(map.get("phone"));
		supplier.setsAddress(map.get("address"));
		supplier.setsDescription(map.get("description"));
    	return supplierService.updateSupplier(supplier);
    }

    @RequestMapping(value="/deletesupplier.do",method = RequestMethod.POST)
    @ResponseBody		
    public int deleteSupplier(@RequestBody HashMap<String,String> map){
    	String id = map.get("id");
    	return supplierService.deleteSupplier(id);
    }
}
