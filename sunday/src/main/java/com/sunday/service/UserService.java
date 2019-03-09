package com.sunday.service;

import java.util.HashMap;

import com.sunday.model.User;

public interface UserService {
	public User getUser(String account);
	public HashMap<String,Object> getUsers(String name, String type ,int page); 
	public int insertUser(User user);
	public int updateUser(User user);
	public int updatePassword(String account,String password);
	public int deleteUser(String account);
}
