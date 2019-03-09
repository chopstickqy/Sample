package com.sunday.service.impl;

import java.util.HashMap;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.sunday.inter.ConstantMapper;
import com.sunday.model.Constant;
import com.sunday.service.ConstantService;

@Service
@Transactional
public class ConstantServiceImpl implements ConstantService {
	
	@Resource
	public ConstantMapper constantMapper;
	
	@Override
	public HashMap<String, Object> getConstant() {
		HashMap<String,Object> map = new HashMap<String, Object>();
		map.put("typeList", constantMapper.selectConstant());
		return map;
	}

	@Override
	public int insertConstant(Constant constant) {
		return constantMapper.insertConstant(constant);
	}

	@Override
	public int deleteConstant(String typeName) {
		return constantMapper.deleteConstant(typeName);
	}

}
