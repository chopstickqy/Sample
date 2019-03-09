package com.sunday.service.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.sunday.inter.StockMapper;
import com.sunday.model.Stock;
import com.sunday.service.StockService;

@Service
@Transactional
public class StockServiceImpl implements StockService{
	
	@Resource
    public StockMapper stockMapper;
	
	@Override
	public Stock getStock(String id) {
		Stock stock = null;
		stock = stockMapper.selectByPrimaryKey(id);
		return stock;
	}

	@Override
	public HashMap<String,Object> getStocks(String type, String name, String number, String supplier, String minQuantity, String maxQuantity, String minTime, String maxTime, int page) {
		HashMap<String,Object> map = new HashMap<String, Object>();
		if(minQuantity == null || minQuantity.equals(""))
			minQuantity = "0";
		if(minTime == null || minTime.equals(""))
			minTime = "0";
		map.put("stockList", stockMapper.selectStocks(type, name, number, supplier, minQuantity, maxQuantity, minTime, maxTime, page));
		List<Number> pageList = new ArrayList<>();
		int length = Integer.parseInt(stockMapper.totalPage(type, name, number, supplier, minQuantity, maxQuantity, minTime, maxTime));
		for(int i = 0; i<length ;i++){
			pageList.add(i+1);
		}
		map.put("pageList", pageList);
		return map;
	}

	@Override
	public int insertStock(Stock stock) {
		if(null == stockMapper.selectByPrimaryKey(stock.gettId())){
			stock.settTime(new Date());
			return stockMapper.insertStock(stock);
		}
		else
			return -1;
	}

	@Override
	public int updateStock(Stock stock) {
		return 0;
	}
	
	@Override
	public int updateStockState(String id,String state) {
		Stock stock = stockMapper.selectByPrimaryKey(id);
		stock.settState(state);
		return stockMapper.updateStock(stock);
	}

	@Override
	public HashMap<String, Object> getAllStocks() {
		HashMap<String,Object> map = new HashMap<String, Object>();
		map.put("stockList", stockMapper.selectAllStocks());
		return map;
	}

}
