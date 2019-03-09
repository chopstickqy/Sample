package com.sunday.service;

import java.util.HashMap;

import com.sunday.model.Constant;

public interface ConstantService {
	public HashMap<String,Object> getConstant(); 
	public int insertConstant(Constant constant);
	public int deleteConstant(String typeName);
}
