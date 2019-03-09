package com.avaya.mapper;


import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.sunday.utils.EncryptionUtils;

/**
 * 配置spring和junit整合，junit启动时加载springIOC容器 spring-test,junit
 */
@RunWith(SpringJUnit4ClassRunner.class)
// 告诉junit spring配置文件
@ContextConfiguration({"classpath:config/applicationContext.xml" })
public class EncryptionUtilsTest {
	
	
	@Test
	public void test1(){
		String pwd = EncryptionUtils.EncryptionMD5("admin");
		System.out.println(pwd);
	}

	

}