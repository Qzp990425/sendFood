package com.test.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.test.entity.User;



@Repository
public interface UserMapper {
	
	public User getUserByTel(User user);
	
	public Integer insertUser(User user);
	
	public Integer updateUserByUid(User user);
	
	public List<User> getAllUser();
	
	public List<User> getAllUserByStatus(Integer status);
	
	public User getUserByUid(Integer id);
	
	public User getUserBySno(User user);
	
	
	public Integer updateUserByTelandSno(User user);
	
	public Integer addAccount(User user);
	
	public Integer addAccountOne(@Param("price")Integer price,@Param("uid")Integer uid);
	
}
