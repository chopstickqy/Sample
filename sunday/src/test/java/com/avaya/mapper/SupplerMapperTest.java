package com.avaya.mapper;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.sunday.inter.SupplierMapper;
import com.sunday.model.Supplier;

/**
 * 配置spring和junit整合，junit启动时加载springIOC容器 spring-test,junit
 */
@RunWith(SpringJUnit4ClassRunner.class)
// 告诉junit spring配置文件
@ContextConfiguration({"classpath:config/applicationContext.xml" })
public class SupplerMapperTest {
	
	@Autowired
	private SupplierMapper  SupplierMapper ; 
	
	@Test
	public void test1(){
		List<Supplier> list= SupplierMapper.selectSuppliers(null, 0);
		System.out.println(list.get(0).getsName());
	}
//	@Test
//	public void test2(){
//		String page= userMapper.totalPage("", "");
//		System.out.println(page);
//	}
//	

}