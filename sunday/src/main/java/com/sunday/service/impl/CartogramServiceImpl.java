package com.sunday.service.impl;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.sunday.inter.CommodityMapper;
import com.sunday.inter.OrderMapper;
import com.sunday.inter.SalesMapper;
import com.sunday.service.CartogramService;


@Service
@Transactional
public class CartogramServiceImpl implements CartogramService{
	
    @Resource
    public OrderMapper orderMapper;
    @Resource
    public SalesMapper  salesMapper;
    @Resource
    public CommodityMapper commodityMapper;
    
	@Override
	public HashMap<String, Object> profitStatistics() {
		HashMap<String,Object> map = new HashMap<String, Object>();
		List<String> ordermonthList = orderMapper.selectEachMonth();
		List<String> salsermonthList = salesMapper.selectEachMonth();
		List<String> monthList  = salsermonthList;
		if(ordermonthList.size()>salsermonthList.size()){
			monthList = ordermonthList;
		}
		map.put("monthList", monthList);
		Double[] totalSales = new Double[monthList.size()];
		for(int i = 0;i < monthList.size();i++){
			String totalOrder = orderMapper.monthTotalSales(monthList.get(i));
			String totalSale = salesMapper.monthTotalSales(monthList.get(i));
			if(totalSale == null)
				totalSale = "0";
			if(totalOrder == null)
				totalOrder = "0";
			totalSales[i] = Double.parseDouble(totalSale) - Double.parseDouble(totalOrder);
		}
		map.put("profitList", totalSales);
		return map;
	}

	@Override
	public HashMap<String, Object> sizeStatistics(String name) {
		HashMap<String,Object> map = new HashMap<String, Object>();
		String type = commodityMapper.commodityType(name);
		String[] sizes = new String[6];
		String[] totals = new String[6];
		if(type == "鞋子"){
			sizes[0]="36";
			sizes[1]="37";
			sizes[2]="38";
			sizes[3]="39";
			sizes[4]="40";
			sizes[5]="41";
		} else {
			sizes[0]="XS";
			sizes[1]="S";
			sizes[2]="M";
			sizes[3]="L";
			sizes[4]="XL";
			sizes[5]="XXL";
		}
		for(int i=0;i<sizes.length;i++){
			String commodityid = commodityMapper.selectSizeid(name, sizes[i]);
			String total = salesMapper.sizeSale(commodityid);
			if(total==null)
				total = "0";
			totals[i]= total;
				
		}
		map.put("totalList", totals);
		map.put("sizeList", sizes);
		return map;
	}
	

}
