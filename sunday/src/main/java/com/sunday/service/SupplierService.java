package com.sunday.service;

import java.util.HashMap;

import com.sunday.model.Supplier;

public interface SupplierService {
	public Supplier getSupplier (String id);
	public HashMap<String,Object> getSuppliers(String name,int page); 
	public HashMap<String,Object> getAllSuppliers(); 
	public int insertSupplier(Supplier supplier);
	public int updateSupplier(Supplier  supplier);
	public int deleteSupplier(String id);
}
