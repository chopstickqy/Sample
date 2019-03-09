package com.sunday.inter;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.sunday.model.Stock;


public interface StockMapper {
	Stock selectByPrimaryKey(String uId);
	List<Stock> selectStocks(@Param("type")String type, @Param("name")String name, @Param("number")String number, @Param("supplier")String supplier, @Param("minQuantity")String minQuantity, @Param("maxQuantity")String maxQuantity, @Param("minTime")String minTime, @Param("maxTime")String maxTime,@Param("page") int page);
	List<Stock> selectAllStocks();
	String totalPage(@Param("type")String type, @Param("name")String name, @Param("number")String number, @Param("supplier")String supplier, @Param("minQuantity")String minQuantity, @Param("maxQuantity")String maxQuantity, @Param("minTime")String minTime, @Param("maxTime")String maxTime);
	int insertStock(Stock stock);
	int updateStock(Stock stock);
	
}
