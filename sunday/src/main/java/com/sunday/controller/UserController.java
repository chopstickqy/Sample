package com.sunday.controller;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sunday.model.User;
import com.sunday.service.UserService;
import com.sunday.utils.EncryptionUtils;

@Controller
public class UserController{
	@Autowired
    private UserService userService;
	  
	@RequestMapping(value="/queryusers.do",method = RequestMethod.POST)
    @ResponseBody	
	public HashMap<String,Object> queryUsers(@RequestBody HashMap<String,String> map){
		String uName = map.get("name");
		String uType = map.get("type");
		int page = Integer.parseInt(map.get("page"));;
		return userService.getUsers(uName, uType, page);	
	}
	
	@RequestMapping(value="/insertuser.do",method = RequestMethod.POST)
    @ResponseBody	
	public int insertUser(@RequestBody HashMap<String,String> map){
		User user = new User();
		user.setuAccount(map.get("account"));
		user.setuName(map.get("name"));
		user.setuSex(map.get("sex"));
		user.setuPhone(map.get("phone"));
		user.setuType(map.get("type"));
		user.setuPassword("123456");
		return userService.insertUser(user);
	}
	
    @RequestMapping(value="/updateuser.do",method = RequestMethod.POST)
    @ResponseBody		
    public int updateUser(@RequestBody HashMap<String,String> map){
    	User user = new User();
		user.setuAccount(map.get("account"));
		user.setuName(map.get("name"));
		user.setuSex(map.get("sex"));
		user.setuPhone(map.get("phone"));
		user.setuType(map.get("type"));
    	return userService.updateUser(user);
    }
    
    @RequestMapping(value="/deleteuser.do",method = RequestMethod.POST)
    @ResponseBody		
    public int deleteUser(@RequestBody HashMap<String,String> map){
    	String account = map.get("account");
    	return userService.deleteUser(account);
    }
    
    @RequestMapping(value="/updatepassword.do",method = RequestMethod.POST)
    @ResponseBody		
    public int updatePassword(@RequestBody HashMap<String,String> map){
    	String account = map.get("account");
    	String oldPassword = map.get("oldPassword");
    	String newPassword = map.get("newPassword");
    	User user = userService.getUser(account);
    	if(user == null)
    		return -1;
    	if(!user.getuPassword().equals(EncryptionUtils.EncryptionMD5(oldPassword)))
    		return -2;
    	return userService.updatePassword(account, EncryptionUtils.EncryptionMD5(newPassword));
    }
}
