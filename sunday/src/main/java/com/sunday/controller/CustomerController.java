package com.sunday.controller;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sunday.model.Customer;
import com.sunday.service.CustomerService;

@Controller
public class CustomerController{
	@Autowired
    private CustomerService customerService;
	  
	@RequestMapping(value="/querycustomers.do",method = RequestMethod.POST)
    @ResponseBody	
	public HashMap<String,Object> queryCustomers(@RequestBody HashMap<String,String> map){
		String name = map.get("name");
		int page = Integer.parseInt(map.get("page"));;
		return customerService.getCustomers(name, page);	
	}
	
	@RequestMapping(value="/queryallcustomers.do",method = RequestMethod.POST)
    @ResponseBody	
	public HashMap<String,Object> queryAllCustomers(@RequestBody HashMap<String,String> map){
		return customerService.getAllCustomers();
	}
	
	@RequestMapping(value="/insertcustomer.do",method = RequestMethod.POST)
    @ResponseBody	
	public int insertSupplier(@RequestBody HashMap<String,String> map){
		Customer customer = new Customer();
		customer.setcName(map.get("name"));
		customer.setcContact(map.get("contact"));
		customer.setcPhone(map.get("phone"));
		customer.setcAddress(map.get("address"));
		customer.setcDescription(map.get("description"));
		return customerService.insertCustomer(customer);
	}
	
    @RequestMapping(value="/updatecustomer.do",method = RequestMethod.POST)
    @ResponseBody		
    public int updateCustomer(@RequestBody HashMap<String,String> map){
    	Customer customer = new Customer();
		customer.setcId(map.get("id"));
		customer.setcName(map.get("name"));
		customer.setcContact(map.get("contact"));
		customer.setcPhone(map.get("phone"));
		customer.setcAddress(map.get("address"));
		customer.setcDescription(map.get("description"));
    	return customerService.updateCustomer(customer);
    }
    
    @RequestMapping(value="/deletecustomer.do",method = RequestMethod.POST)
    @ResponseBody		
    public int deleteSupplier(@RequestBody HashMap<String,String> map){
    	String id = map.get("id");
    	return customerService.deleteCustomer(id);
    }
}
