package com.sunday.service.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.sunday.inter.UserMapper;
import com.sunday.model.User;
import com.sunday.service.UserService;
import com.sunday.utils.EncryptionUtils;

@Service
@Transactional
public class UserServiceImpl implements UserService{
	
    @Resource
    public UserMapper userMapper;
    
	@Override
	public User getUser(String account) {
		User user = null;
		user = userMapper.selectByPrimaryKey(account);
		return user;
	}

	@Override
	public HashMap<String,Object> getUsers(String name, String type, int page) {
		HashMap<String,Object> map = new HashMap<String, Object>();
		map.put("userList", userMapper.selectUsers(name, type, page));
		List<Number> pageList = new ArrayList<>();
		int length = Integer.parseInt(userMapper.totalPage(name, type));
		for(int i = 0; i<length ;i++){
			pageList.add(i+1);
		}
		map.put("pageList", pageList);
		return map;
	}

	@Override
	public int insertUser(User user) {
		if(null == userMapper.selectByPrimaryKey(user.getuAccount())){
			user.setuPassword(EncryptionUtils.EncryptionMD5(user.getuPassword()));
			user.setuTime(new Date());
			return userMapper.insertUser(user);
		}
		else
			return -1;
	}

	@Override
	public int updateUser(User user) {
			user.setuTime(new Date());
			return userMapper.updateUser(user);
	}

	@Override
	public int deleteUser(String account) {
		return userMapper.deleteUser(account);
	}

	@Override
	public int updatePassword(String account, String password) {
		return userMapper.updatePassword(account, password);
	}
	

}
