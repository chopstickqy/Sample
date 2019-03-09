package com.sunday.service.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.sunday.inter.CustomerMapper;
import com.sunday.model.Customer;
import com.sunday.service.CustomerService;
import com.sunday.utils.GenerationUtils;

@Service
@Transactional
public class CustomerServiceImpl implements CustomerService{
	
    @Resource
    public CustomerMapper customerMapper;
    
	@Override
	public Customer getCustomer(String id) {
		Customer customer = null;
		customer = customerMapper.selectByPrimaryKey(id);
		return customer;
	}

	@Override
	public HashMap<String,Object> getCustomers(String name, int page) {
		HashMap<String,Object> map = new HashMap<String, Object>();
		map.put("customerList", customerMapper.selectCustomers(name, page));
		List<Number> pageList = new ArrayList<>();
		int length = Integer.parseInt(customerMapper.totalPage(name));
		for(int i = 0; i<length ;i++){
			pageList.add(i+1);
		}
		map.put("pageList", pageList);
		return map;
	}

	@Override
	public int insertCustomer(Customer customer) {
		customer.setcId(GenerationUtils.customerGeneration());
		while(null != customerMapper.selectByPrimaryKey(customer.getcId())){
			customer.setcId(GenerationUtils.customerGeneration());
		
		}
		customer.setcTime(new Date());
		return customerMapper.insertCustomer(customer);
	}

	@Override
	public int updateCustomer(Customer customer) {
		customer.setcTime(new Date());
		return customerMapper.updateCustomer(customer);
	}

	@Override
	public int deleteCustomer(String id) {
		return customerMapper.deleteCustomer(id);
	}

	@Override
	public HashMap<String, Object> getAllCustomers() {
		HashMap<String,Object> map = new HashMap<String, Object>();
		map.put("customerList", customerMapper.selectAllCustomers());
		return map;
	}
	

}
