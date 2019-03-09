package com.sunday.inter;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.sunday.model.Commodity;

public interface CommodityMapper {
	Commodity selectByPrimaryKey(String mId);
	List<Commodity> selectCommoditys(@Param("id")String id,@Param("name")String name,@Param("type")String type,@Param("color")String color,@Param("material")String material,@Param("size")String size,@Param("page") int page);
	List<Commodity> selectAllCommoditys();
	String totalPage(@Param("id")String id,@Param("name")String name,@Param("type")String type,@Param("color")String color,@Param("material")String material,@Param("size")String size);
	int insertCommodity(Commodity commodity);
	int updateCommodity(Commodity commodity);
	int deleteCommodity(String id);
	String selectSizeid(@Param("name")String name,@Param("size")String size);
	String commodityType(@Param("name")String name);
	List<String> commodityList();
}
