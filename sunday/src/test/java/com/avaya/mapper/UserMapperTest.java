package com.avaya.mapper;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.sunday.inter.UserMapper;
import com.sunday.model.User;

/**
 * 配置spring和junit整合，junit启动时加载springIOC容器 spring-test,junit
 */
@RunWith(SpringJUnit4ClassRunner.class)
// 告诉junit spring配置文件
@ContextConfiguration({"classpath:config/applicationContext.xml" })
public class UserMapperTest {
	
	@Autowired
	private UserMapper  userMapper ; 
	
	@Test
	public void test1(){
		List<User> list= userMapper.selectUsers("", "", 0);
		System.out.println(list.get(0).getuAccount());
	}
	@Test
	public void test2(){
		String page= userMapper.totalPage("", "");
		System.out.println(page);
	}
	

}