package com.sunday.inter;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.sunday.model.Customer;


public interface CustomerMapper {
	Customer selectByPrimaryKey(String uId);
	List<Customer> selectCustomers(@Param("name")String name, @Param("page") int page);
	List<Customer> selectAllCustomers();
	String totalPage(@Param("name")String name);
	int insertCustomer(Customer customer);
	int updateCustomer(Customer customer);
	int deleteCustomer(String id);
}
