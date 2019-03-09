package com.sunday.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.sunday.model.User;
import com.sunday.service.UserService;
import com.sunday.utils.EncryptionUtils;

@Controller
public class LoginAndLogoutController{
	
	@Autowired
    private UserService userService;
	
	@RequestMapping(value="/login.do",method = RequestMethod.POST)
    @ResponseBody	
	public int login(@RequestBody HashMap<String,String> map,HttpServletRequest request) throws Exception {
		HttpSession session = request.getSession();
		String uAccount = map.get("account");
		String uPassword =  map.get("password");
		if(null == uAccount || uAccount.equals("") || null == uPassword || uPassword.equals("")) {
			uAccount = (String) session.getAttribute("account");
			uPassword = (String) session.getAttribute("password");
		}
		User user = userService.getUser(uAccount);
		
		if (user != null && user.getuPassword().equalsIgnoreCase(EncryptionUtils.EncryptionMD5(uPassword))) {
			session.setAttribute("account", user.getuAccount());
			session.setAttribute("typeName", user.getuType()+" "+user.getuName());
			session.setAttribute("type", user.getuType());
			return 1;
		}
		else {
			return 0;
		}
	}
	
	@RequestMapping(value="/logout.do",method = RequestMethod.POST)
    @ResponseBody	
	public int logout(HttpServletRequest request) throws Exception {
		HttpSession session = request.getSession();
		session.removeAttribute("account");
		session.removeAttribute("typeName");
		session.removeAttribute("type");
		return 1;
	}
	
	@RequestMapping(value="/session.do",method = RequestMethod.POST)
    @ResponseBody	
	public Map<String,String> session(HttpServletRequest request) throws Exception {
		Map<String,String> map = new HashMap<String,String>();
		HttpSession session = request.getSession();
		map.put("type", (String)session.getAttribute("type"));
		map.put("account", (String)session.getAttribute("account"));
		return map;
	}
}
