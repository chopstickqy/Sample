package com.sunday.service;

import java.util.HashMap;

import com.sunday.model.Customer;

public interface CustomerService {
	public Customer getCustomer (String id);
	public HashMap<String,Object> getCustomers(String name,int page); 
	public HashMap<String,Object> getAllCustomers(); 
	public int insertCustomer(Customer customer);
	public int updateCustomer(Customer customer);
	public int deleteCustomer(String id);
}
