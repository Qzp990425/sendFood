package com.test.service;

import com.github.pagehelper.PageInfo;
import com.test.entity.OrderRecord;
import com.test.entity.User;

public interface OrderService {
	
	public void insertOrder(User user,Integer[] pid,Integer[] number,String name);
	
	public PageInfo<OrderRecord> getOrderByUid(User user,Integer pageNum);
	
	//发货
	public boolean sendOrder(Integer oid);
	
	//收货
	public boolean doneOrder(Integer oid);
	
	public PageInfo<OrderRecord> getAllOrder(Integer pageNum);
	
	public PageInfo<OrderRecord> getOrderByType(Integer pageNum,Integer type);

	void insertOrderOne(User user, Integer bid, Integer number,String name);
}
