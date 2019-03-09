package com.sunday.inter;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.sunday.model.Order;

public interface OrderMapper {
	Order selectByPrimaryKey(String mId);
	List<Order> selectOrders(@Param("commodity")String commodity,@Param("supplier")String supplier,@Param("state")String state,@Param("id")String id,@Param("minTime")String minTime,@Param("maxTime")String maxTime, @Param("page") int page);
	String totalPage(@Param("commodity")String commodity,@Param("supplier")String supplier,@Param("state")String state,@Param("id")String id,@Param("minTime")String minTime,@Param("maxTime")String maxTime);
	int insertOrder(Order order);
	int updateOrder(Order order);
	int deleteOrder(String account);
	
	List<String> selectEachBuyer();
	List<String> selectEachMonth();
	String monthSale(@Param("month")String month,@Param("id")String id);
	String monthTotalSales(@Param("month")String month);
	
}
