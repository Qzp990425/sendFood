package com.test.serviceImpl;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.test.dao.FoodMapper;
import com.test.dao.OrderMapper;
import com.test.dao.UserMapper;
import com.test.entity.OrderRecord;
import com.test.entity.User;
import com.test.service.OrderService;
import com.test.utils.Util;

@Service
public class OrderServiceImpl implements OrderService{
	
	@Autowired
	OrderMapper orderMapper;
	@Autowired
	FoodMapper FoodMapper;
	@Autowired
	UserMapper userMapper;
	
	@Override
	public void insertOrder(User user, Integer[] Fid, Integer[] number,String name) {
		List<OrderRecord> orderRecords = new ArrayList<OrderRecord>();
		for(int i = 0; i < Fid.length ; i ++) {
			OrderRecord orderRecord = new OrderRecord();
			orderRecord.setBuyId(user.getUid());
			orderRecord.setFid(Fid[i]);
			orderRecord.setNumber(number[i]);
			orderRecord.setCreateTime(Util.formatDate(new Date()));
			orderRecord.setStatus(0);
			orderRecord.setUuid(Util.getRandomUUID());
			orderRecord.setName(name);
			orderRecords.add(orderRecord);
		}
		orderMapper.insertOrder(orderRecords);
	}

	@Override
	public void insertOrderOne(User user, Integer Fid, Integer number,String name) {
		OrderRecord orderRecord = new OrderRecord();
		orderRecord.setBuyId(user.getUid());
		orderRecord.setFid(Fid);
		orderRecord.setNumber(number);
		orderRecord.setCreateTime(Util.formatDate(new Date()));
		orderRecord.setStatus(0);
		orderRecord.setUuid(Util.getRandomUUID());
		orderRecord.setName(name);
		orderMapper.insertOrderOne(orderRecord);
	}
	
	@Override
	public PageInfo<OrderRecord> getOrderByUid(User user,Integer pageNum) {
		// TODO Auto-generated method stub
		PageHelper.startPage(pageNum, 5);
		List<OrderRecord> orderRecords = orderMapper.getOrderByUid(user);
		for(int i = 0 ; i < orderRecords.size(); i ++) {
			OrderRecord orderRecord = orderRecords.get(i);
			orderRecord.setFood(FoodMapper.getFoodByFid(orderRecord.getFid()));
			orderRecords.remove(i);
			orderRecords.add(i, orderRecord);
		}
		return new PageInfo<>(orderRecords);
	}

	@Override
	public boolean sendOrder(Integer oid) {
		OrderRecord orderRecord = new OrderRecord();
		orderRecord.setOid(oid);
		orderRecord.setSendTime(Util.formatDate(new Date()));
		Integer result = orderMapper.updateOrderStatusToOne(orderRecord);
		if(result == 1) {
			return true;
		} else {
			return false;
		}
	}

	@Override
	public boolean doneOrder(Integer oid) {
		OrderRecord orderRecord = new OrderRecord();
		orderRecord.setOid(oid);
		orderRecord.setDoneTime(Util.formatDate(new Date()));
		Integer result = orderMapper.updateOrderStatusToTwo(orderRecord);
		if(result == 1) {
			return true;
		} else {
			return false;
		}
	}

	@Override
	public PageInfo<OrderRecord> getAllOrder(Integer pageNum) {
		PageHelper.startPage(pageNum, 4);
		List<OrderRecord> orderRecords = orderMapper.getAllOrder();
		for(int i = 0 ; i < orderRecords.size(); i ++) {
			OrderRecord orderRecord = orderRecords.get(i);
			orderRecord.setFood(FoodMapper.getFoodByFid(orderRecord.getFid()));
			orderRecords.remove(i);
			orderRecords.add(i, orderRecord);
		}
		return new PageInfo<>(orderRecords);
	}

	@Override
	public PageInfo<OrderRecord> getOrderByType(Integer pageNum, Integer type) {
		PageHelper.startPage(pageNum, 3);
		List<OrderRecord> orderRecords = orderMapper.getOrderByType(type);
		for(int i = 0 ; i < orderRecords.size(); i ++) {
			OrderRecord orderRecord = orderRecords.get(i);
			orderRecord.setFood(FoodMapper.getFoodByFid(orderRecord.getFid()));
			orderRecords.remove(i);
			orderRecords.add(i, orderRecord);
		}
		return new PageInfo<>(orderRecords);
	}
	
}
