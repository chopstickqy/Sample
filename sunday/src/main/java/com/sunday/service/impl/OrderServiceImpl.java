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
import com.sunday.inter.StockMapper;
import com.sunday.model.Order;
import com.sunday.model.Stock;
import com.sunday.service.OrderService;
import com.sunday.utils.GenerationUtils;


@Service
@Transactional
public class OrderServiceImpl implements OrderService{
	
    @Resource
    public OrderMapper orderMapper;
    @Resource 
    public StockMapper stockMapper;
    @Resource 
    public CommodityMapper commodityMapper;
    
	@Override
	public Order getOrder(String id) {
		Order order = null;
		order = orderMapper.selectByPrimaryKey(id);
		return order;
	}

	@Override
	public HashMap<String,Object> getOrders(String commodity, String supplier, String state, String id, String minTime, String maxTime, int page) {
		if(minTime == null || minTime.equals(""))
			minTime = "0";
		HashMap<String,Object> map = new HashMap<String, Object>();
		map.put("orderList", orderMapper.selectOrders(commodity, supplier, state, id, minTime, maxTime, page));
		List<Number> pageList = new ArrayList<>();
		int length = Integer.parseInt(orderMapper.totalPage(commodity, supplier, state, id, minTime, maxTime));
		for(int i = 0; i<length ;i++){
			pageList.add(i+1);
		}
		map.put("pageList", pageList);
		return map;
	}

	@Override
	public int insertOrder(Order order) {
		order.setoId(GenerationUtils.orderGeneration());
		order.setoTime(new Date());
		order.setoState("待确认");
		while(null != orderMapper.selectByPrimaryKey(order.getoId())){
			order.setoId(GenerationUtils.orderGeneration());
		}
		return orderMapper.insertOrder(order);
	}

	@Override
	public int updateOrder(Order order) {
		return orderMapper.updateOrder(order);
	}

	@Override
	public HashMap<String, Object> salesStatistics() {
		HashMap<String,Object> map = new HashMap<String, Object>();
		List<String> buyerList = orderMapper.selectEachBuyer();
		List<String> monthList = orderMapper.selectEachMonth();
		HashMap<String,String[]> saleMap = new HashMap<String,String[]>();
		map.put("buyerList", buyerList);
		map.put("monthList", monthList);
		for(int i = 0;i < buyerList.size();i++){
			String[] sales = new String[monthList.size()];
			for(int j = 0;j < monthList.size();j++){
				String sale = orderMapper.monthSale(monthList.get(j), buyerList.get(i));
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
	public int updateOrderState(String id, String state) {
		Order order = orderMapper.selectByPrimaryKey(id);
		Stock stock = stockMapper.selectByPrimaryKey(order.getoCommodityid());
		String type = commodityMapper.selectByPrimaryKey(order.getoCommodityid()).getmType();
		int stockResult;
		if(stock == null){
			stock = new Stock();
			stock.settId(order.getoCommodityid());
			stock.settName(order.getoCommodity());
			stock.settNumber(order.getoCommodityid());
			stock.settQuantity(order.getoNumber());
			stock.settTime(new Date());
			stock.settInQuantity(order.getoNumber());
			stock.settState("正常");
			stock.settSupplier(order.getoSupplier());
			stock.settType(type);
			stockResult = stockMapper.insertStock(stock);
		} else {
			stock.settQuantity(stock.gettQuantity()+order.getoNumber());
			if(stock.gettQuantity() > 50){
				stock.settState("正常");
			}
			stock.settInQuantity(order.getoNumber());
			stock.settTime(new Date());
			stockResult = stockMapper.updateStock(stock);
		}
		if(stockResult != 1){
			return 0;
		} else {
			order.setoState(state);
			return orderMapper.updateOrder(order);
		}
	}

	@Override
	public int updatePurchaseState(String id, String state) {
		Order order = orderMapper.selectByPrimaryKey(id);
		order.setoState(state);
		return orderMapper.updateOrder(order);
	}
}
