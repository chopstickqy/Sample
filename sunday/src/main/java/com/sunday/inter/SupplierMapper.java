package com.sunday.inter;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.sunday.model.Supplier;


public interface SupplierMapper {
    Supplier selectByPrimaryKey(String uId);
	List<Supplier> selectSuppliers(@Param("name")String name, @Param("page") int page);
	List<Supplier> selectAllSuppliers();
	String totalPage(@Param("name")String name);
	int insertSupplier(Supplier supplier);
	int updateSupplier(Supplier supplier);
	int deleteSupplier(String id);
	
}
