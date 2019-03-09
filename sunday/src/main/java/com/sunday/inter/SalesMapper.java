package com.sunday.inter;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.sunday.model.Sales;

public interface SalesMapper {
	Sales selectByPrimaryKey(String mId);
	List<Sales> selectSales(@Param("commodity")String commodity,@Param("customer")String customer,@Param("state")String state,@Param("id")String id,@Param("minTime")String minTime,@Param("maxTime")String maxTime, @Param("page") int page);
	String totalPage(@Param("commodity")String commodity,@Param("customer")String customer,@Param("state")String state,@Param("id")String id,@Param("minTime")String minTime,@Param("maxTime")String maxTime);
	int insertSales(Sales sales);
	int updateSales(Sales sales);
	int deleteSales(String account);
	
	List<String> selectEachBuyer();
	List<String> selectEachYear();
	List<String> selectEachMonth();
	List<String> selectEachDay();
	String monthSale(@Param("month")String month,@Param("id")String id);
	String monthTotalSales(@Param("month")String month);
	String sizeSale(@Param("commodityid")String commodityid);
	String typeSale(@Param("type")String type, @Param("format")String format, @Param("date")String date);
}
