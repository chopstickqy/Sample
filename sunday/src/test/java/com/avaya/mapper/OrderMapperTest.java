package com.avaya.mapper;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.sunday.inter.OrderMapper;
import com.sunday.model.Stock;
import com.sunday.utils.GenerationUtils;

/**
 * 配置spring和junit整合，junit启动时加载springIOC容器 spring-test,junit
 */
@RunWith(SpringJUnit4ClassRunner.class)
// 告诉junit spring配置文件
@ContextConfiguration({"classpath:config/applicationContext.xml" })
public class OrderMapperTest {
	
	@Autowired
	private OrderMapper  orderMapper ; 
	
	@Test
	public void test1(){
		List<String> page= orderMapper.selectEachBuyer();


		String[] strings = new String[page.size()];

		page.toArray(strings);
		System.out.println(page);
		System.out.println(strings);
	}
	@Test
	public void test2(){
		List<String> page= orderMapper.selectEachMonth();
		System.out.println(page);
	}
	@Test
	public void test3(){
		String page= orderMapper.monthSale("2017-11", "ML_002");
		System.out.println(page==null);
	}
	
	

}