package com.test.service;

import com.github.pagehelper.PageInfo;
import com.test.entity.User;

public interface UesrService {
	
	public boolean login(User user);
	
	public boolean register(User user);
	
	public User getUserByUid(User user);
	
	public boolean update(User user);
	
	public PageInfo<User> getAllUser(Integer pageNum);
	
	public User getUserBySno(User user);
	
	public boolean forget(User user);
	
	public boolean addAccount(User user);
	
	public boolean updateAccount(User user);
	
	public PageInfo<User> getAllUserByStatus(Integer pageNum,Integer status);
/*	
	public boolean updateAccount(Integer price,Integer uid);*/
}
