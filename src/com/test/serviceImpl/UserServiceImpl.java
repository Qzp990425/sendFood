package com.test.serviceImpl;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.test.dao.UserMapper;
import com.test.entity.User;
import com.test.service.UesrService;
import com.test.utils.Util;

@Service
public class UserServiceImpl implements UesrService{
	
	@Autowired
	UserMapper userMapper;
	
	
	public boolean login(User user) {
		User checkUser = userMapper.getUserBySno(user);
		if(checkUser == null) {
			return false;
		} else {
			if(checkUser.getPassword().equals(user.getPassword())) {
				return true;
			} else {
				return false;
			}
		}
	}
	
	public boolean register(User user) {
		User checkUser = userMapper.getUserBySno(user);
		if(checkUser == null) {
			user.setCreateTime(Util.formatDate(new Date()));
			userMapper.insertUser(user);
			return true;
		} else {
			return false;
		}
	}

	@Override
	public User getUserByUid(User user) {
		User checkUser = userMapper.getUserByUid(user.getUid());
		return checkUser;
	}

	@Override
	public User getUserBySno(User user) {
		User checkUser = userMapper.getUserBySno(user);
		return checkUser;
	}
	
	@Override
	public boolean update(User user) {
		// TODO Auto-generated method stub
		Integer result = userMapper.updateUserByUid(user);
		if(result == 1) {
			return true;
		} else {
			return false;
		}
	}

	@Override
	public PageInfo<User> getAllUser(Integer pageNum) {
		PageHelper.startPage(pageNum, 5);
		List<User> users = userMapper.getAllUser();
		return new PageInfo<>(users);
	}
	
	@Override
	public boolean forget(User user) {
		// TODO Auto-generated method stub
		Integer result = userMapper.updateUserByTelandSno(user);
		if(result == 1) {
			return true;
		} else {
			return false;
		}
	}

	@Override
	public boolean addAccount(User user) {
		User allUser = userMapper.getUserByUid(user.getUid());
		user.setAccount(user.getAccount()+allUser.getAccount());
		if(userMapper.addAccount(user) == 1) {
			return true;
		} else {
			return false;
		}
	}
	
	@Override
	public boolean updateAccount(User user) {
		if(userMapper.addAccount(user) == 1) {
			return true;
		} else {
			return false;
		}
	}

	@Override
	public PageInfo<User> getAllUserByStatus(Integer pageNum,Integer status) {
		PageHelper.startPage(pageNum, 5);
		List<User> users = userMapper.getAllUserByStatus(status);
		return new PageInfo<>(users);
	}
	
/*	@Override
	public boolean updateAccount(Integer price,Integer uid) {
		User user = userMapper.getUserByUid(uid);
		price = user.getAccount()+ price;
		if(userMapper.addAccountOne(price,uid) == 1) {
			return true;
		} else {
			return false;
		}
	}*/
}
