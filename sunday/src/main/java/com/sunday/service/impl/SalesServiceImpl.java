package com.sunday.service.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.sunday.inter.CommodityMapper;
import com.sunday.inter.OrderMapper;
import com.sunday.inter.SalesMapper;
import com.sunday.inter.StockMapper;
import com.sunday.model.Commodity;
import com.sunday.model.Sales;
import com.sunday.model.Stock;
import com.sunday.service.SalesService;
import com.sunday.utils.GenerationUtils;


@Service
@Transactional
public class SalesServiceImpl implements SalesService{
	
    @Resource
    public SalesMapper salesMapper;
    @Resource
    public StockMapper stockMapper;
    @Resource
    public OrderMapper orderMapper;
    @Resource
    public CommodityMapper commodityMapper;
    
	@Override
	public Sales getSale(String id) {
		Sales sales = null;
		sales = salesMapper.selectByPrimaryKey(id);
		return sales;
	}

	@Override
	public HashMap<String,Object> getSales(String commodity, String customer, String state, String id, String minTime, String maxTime, int page) {
		if(minTime == null || minTime.equals(""))
			minTime = "0";
		HashMap<String,Object> map = new HashMap<String, Object>();
		map.put("salesList", salesMapper.selectSales(commodity, customer, state, id, minTime, maxTime, page));
		List<Number> pageList = new ArrayList<>();
		int length = Integer.parseInt(salesMapper.totalPage(commodity, customer, state, id, minTime, maxTime));
		for(int i = 0; i<length ;i++){
			pageList.add(i+1);
		}
		map.put("pageList", pageList);
		return map;
	}

	@Override
	public int insertSales(Sales sales) {
		sales.seteId(GenerationUtils.salesGeneration());
		sales.seteTime(new Date());
		sales.seteState("待确认");
		
		Commodity commodity = commodityMapper.selectByPrimaryKey(sales.geteCommodityid());
		double profit = (commodity.getmOutPrice() - commodity.getmInPrice())*sales.geteNumber();
		sales.seteProfit(profit);
		
		while(null != salesMapper.selectByPrimaryKey(sales.geteId())){
			sales.seteId(GenerationUtils.salesGeneration());
		}
		return salesMapper.insertSales(sales);
	}

	@Override
	public int updateSales(Sales sales) {
		Commodity commodity = commodityMapper.selectByPrimaryKey(sales.geteCommodityid());
		double profit = (commodity.getmOutPrice() - commodity.getmInPrice())*sales.geteNumber();
		sales.seteProfit(profit);
		return salesMapper.updateSales(sales);
	}
	
	@Override
	public HashMap<String, Object> salesStatistics() {
		HashMap<String,Object> map = new HashMap<String, Object>();
		List<String> buyerList = salesMapper.selectEachBuyer();
		List<String> monthList = salesMapper.selectEachMonth();
		HashMap<String,String[]> saleMap = new HashMap<String,String[]>();
		map.put("buyerList", buyerList);
		map.put("monthList", monthList);
		for(int i = 0;i < buyerList.size();i++){
			String[] sales = new String[monthList.size()];
			for(int j = 0;j < monthList.size();j++){
				String sale = salesMapper.monthSale(monthList.get(j), buyerList.get(i));
				if(sale == null)
					sale = "0";
				sales[j]=sale;
			}
			saleMap.put(buyerList.get(i), sales);
		}
		map.put("saleMap", saleMap);
		return map;
	}

	@Override
	public int updateSalesState(String id, String state) {
		Sales sales = salesMapper.selectByPrimaryKey(id);
		Stock stock = stockMapper.selectByPrimaryKey(sales.geteCommodityid());
		int stockResult;
		if(stock == null || stock.gettQuantity() < sales.geteNumber()){
			return -1;
		} else {
			stock.settQuantity(stock.gettQuantity() - sales.geteNumber());
			stockResult = stockMapper.updateStock(stock);
		}
		if(stockResult != 1){
			return 0;
		} else {
			sales.seteState(state);
			return salesMapper.updateSales(sales);
		}
	}

	@Override
	public int updateSalesOrderState(String id, String state) {
		Sales sales = salesMapper.selectByPrimaryKey(id);
		sales.seteState(state);
		return  salesMapper.updateSales(sales);
	}
	
	@Override
	public HashMap<String, Object> typeSales(String type, String dateformat) {
		HashMap<String,Object> map = new HashMap<String, Object>();
		String format = ""; 
		List<String> dateList = new ArrayList<>();
		if(dateformat.equals("日")){
			dateList = salesMapper.selectEachDay();
			format = "%Y-%m-%d";
		}
		else if(dateformat.equals("月")){
			dateList = salesMapper.selectEachMonth();
			format = "%Y-%m";
		}
		else if(dateformat.equals("年")){
			dateList = salesMapper.selectEachYear();
			format = "%Y";
		}
		List<String> profitList = new ArrayList<>();
		map.put("dateList", dateList);
		for(int i = 0;i < dateList.size();i++){
			String sale = salesMapper.typeSale(type, format, dateList.get(i));
			if(sale == null)
				sale = "0";
			profitList.add(sale);
		}
		map.put("profitList", profitList);
		return map;
	}
}
