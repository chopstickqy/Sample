package com.sunday.service.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.sunday.inter.SupplierMapper;
import com.sunday.model.Supplier;
import com.sunday.service.SupplierService;
import com.sunday.utils.GenerationUtils;



@Service
@Transactional
public class SupplierServiceImpl implements SupplierService{
	
    @Resource
    public SupplierMapper supplierMapper;
    
	@Override
	public Supplier getSupplier(String id) {
		Supplier supplier = null;
		supplier = supplierMapper.selectByPrimaryKey(id);
		return supplier;
	}

	@Override
	public HashMap<String,Object> getSuppliers(String name, int page) {
		HashMap<String,Object> map = new HashMap<String, Object>();
		map.put("supplierList", supplierMapper.selectSuppliers(name, page));
		List<Number> pageList = new ArrayList<>();
		int length = Integer.parseInt(supplierMapper.totalPage(name));
		for(int i = 0; i<length ;i++){
			pageList.add(i+1);
		}
		map.put("pageList", pageList);
		return map;
	}

	@Override
	public int insertSupplier(Supplier supplier) {
		supplier.setsId(GenerationUtils.supplierGeneration());
		while(null != supplierMapper.selectByPrimaryKey(supplier.getsId())){
			supplier.setsId(GenerationUtils.supplierGeneration());
		}
		supplier.setsTime(new Date());
		return supplierMapper.insertSupplier(supplier);
	}

	@Override
	public int updateSupplier(Supplier supplier) {
		supplier.setsTime(new Date());
		return supplierMapper.updateSupplier(supplier);
	}

	@Override
	public int deleteSupplier(String id) {
		return supplierMapper.deleteSupplier(id);
	}

	@Override
	public HashMap<String, Object> getAllSuppliers() {
		HashMap<String,Object> map = new HashMap<String, Object>();
		map.put("supplierList",supplierMapper.selectAllSuppliers());
		return map;
	}
	

}
