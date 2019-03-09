package com.sunday.inter;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.sunday.model.User;

public interface UserMapper {
    User selectByPrimaryKey(String account);
	List<User> selectUsers(@Param("name")String name,@Param("type")String type,@Param("page") int page);
	String totalPage(@Param("name")String name,@Param("type")String type);
	int insertUser(User user);
	int updateUser(User user);
	int updatePassword(@Param("account")String account,@Param("password")String password);
	int deleteUser(String account);
	
}
