package com.sunday.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.sunday.inter.CommodityMapper;
import com.sunday.model.Commodity;
import com.sunday.service.CommodityService;


@Service
@Transactional
public class CommodityServiceImpl implements CommodityService{
	
    @Resource
    public CommodityMapper commodityMapper;
    
	@Override
	public Commodity getCommodity(String id) {
		Commodity commodity = null;
		commodity = commodityMapper.selectByPrimaryKey(id);
		return commodity;
	}

	@Override
	public HashMap<String,Object> getCommoditys(String id, String name, String type, String color, String material, String size, int page) {
		HashMap<String,Object> map = new HashMap<String, Object>();
		map.put("commodityList", commodityMapper.selectCommoditys(id, name, type, color, material, size, page));
		List<Number> pageList = new ArrayList<>();
		int length = Integer.parseInt(commodityMapper.totalPage(id, name, type, color, material, size));
		for(int i = 0; i<length ;i++){
			pageList.add(i+1);
		}
		map.put("pageList", pageList);
		return map;
	}

	@Override
	public int insertCommodity(Commodity commodity) {
		if(null == commodityMapper.selectByPrimaryKey(commodity.getmId()))
			return commodityMapper.insertCommodity(commodity);
		else
			return -1;
	}

	@Override
	public int updateCommodity(Commodity commodity) {
		return commodityMapper.updateCommodity(commodity);
	}

	@Override
	public List<String> commdotiyList() {
		return commodityMapper.commodityList();
	}

	@Override
	public int deteleCommodity(String id) {
		return  commodityMapper.deleteCommodity(id);
	}

	@Override
	public HashMap<String, Object> getAllCommoditys() {
		HashMap<String,Object> map = new HashMap<String, Object>();
		map.put("commodityList",commodityMapper.selectAllCommoditys());
		return map;
	}
	

}
