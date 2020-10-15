package com.test.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.test.dao.FoodMapper;
import com.test.dao.TypeMapper;
import com.test.dao.UserMapper;
import com.test.entity.Food;
import com.test.service.FoodService;

@Service
public class FoodServiceImpl implements FoodService{
	
	@Autowired
	FoodMapper foodMapper;
	@Autowired
	UserMapper userMapper;
	@Autowired
	TypeMapper typeMapper;
	
	
	@Override
	public PageInfo<Food> getAllFood(Integer pageNum) {
		PageHelper.startPage(pageNum, 4);
		List<Food> foods = foodMapper.getAllFood();
		for(int i = 0 ; i < foods.size() ; i ++) {
			Food food = foods.get(i);
			food.setSoldUser(userMapper.getUserByUid(food.getUid()));
			foods.remove(i);
			foods.add(i, food);
		}
		return new PageInfo<>(foods);
	}

	@Override
	public PageInfo<Food> getAllFoodByType(Integer type, Integer pageNum) {
		PageHelper.startPage(pageNum, 4);
		List<Food> foods = foodMapper.getFoodByType(type);
		for(int i = 0 ; i < foods.size() ; i ++) {
			Food food = foods.get(i);
			food.setSoldUser(userMapper.getUserByUid(food.getUid()));
			foods.remove(i);
			foods.add(i,food);
		}
		return new PageInfo<>(foods);
	}

	@Override
	public PageInfo<Food> getFoodOnSale(Integer pageNum) {
		PageHelper.startPage(pageNum, 8);
		List<Food> foods = foodMapper.getFoodOnSale();
		for(int i = 0 ; i < foods.size() ; i ++) {
			Food food = foods.get(i);
			food.setSoldUser(userMapper.getUserByUid(food.getUid()));
			foods.remove(i);
			foods.add(i, food);
		}
		return new PageInfo<>(foods);
	}

	@Override
	public PageInfo<Food> getFoodOnSaleByType(Integer type, Integer pageNum) {
		PageHelper.startPage(pageNum, 8);
		List<Food> foods = foodMapper.getFoodOnSaleByType(type);
		for(int i = 0 ; i < foods.size() ; i ++) {
			Food food = foods.get(i);
			food.setSoldUser(userMapper.getUserByUid(food.getUid()));
			foods.remove(i);
			foods.add(i, food);
		}
		return new PageInfo<>(foods);
	}

	@Override
	public Food getFoodByfid(Integer fid) {
		Food food = foodMapper.getFoodByFid(fid);
		food.setSoldUser(userMapper.getUserByUid(food.getUid()));
		food.setFoodType(typeMapper.getTypeByTid(food.getType()));
		return food;
	}

	@Override
	public boolean putFood(Integer fid) {
		Integer result = foodMapper.putFood(fid);
		if(result == 1) {
			return true;
		} else {
			return false;
		}
	}

	@Override
	public boolean pushFood(Integer fid) {
		Integer result = foodMapper.pushFood(fid);
		if(result == 1) {
			return true;
		} else {
			return false;
		}
	}

	@Override
	public boolean addFood(Food food) {
		// TODO Auto-generated method stub
		Integer result = foodMapper.insertFood(food);
		if(result == 1) {
			return true;
		} else {
			return false;
		}
	}

	@Override
	public PageInfo<Food> getFoodByName(Integer pageNum, String name) {
		PageHelper.startPage(pageNum, 4);
		List<Food> foods = foodMapper.getFoodByName(name);
		for(int i = 0 ; i < foods.size() ; i ++) {
			Food food = foods.get(i);
			food.setSoldUser(userMapper.getUserByUid(food.getUid()));
			foods.remove(i);
			foods.add(i, food);
		}
		return new PageInfo<>(foods);
	}

	@Override
	public void updateNum(Integer[] fid, Integer[] num) {
		// TODO Auto-generated method stub
		for(int i = 0 ; i < fid.length ; i++) {
			Food Food = foodMapper.getFoodByFid(fid[i]);
			Food.setNumber(Food.getNumber()-num[i]);
			foodMapper.updateNum(Food);
		}
	}
	
	@Override
	public void updateNum(Integer fid, Integer num) {
		// TODO Auto-generated method stub
		Food food = foodMapper.getFoodByFid(fid);
		food.setNumber(food.getNumber()-num);
		foodMapper.updateNum(food);
	}

	@Override
	public PageInfo<Food> getAllFoodOfMe(Integer pageNum,Integer uid) {
		PageHelper.startPage(pageNum, 4);
		List<Food> foods = foodMapper.getAllFoodOfMe(uid);
		return new PageInfo<>(foods);
	}

	@Override
	public PageInfo<Food> getAllFoodByTypeOfMe(Integer type, Integer pageNum,Integer uid) {
		PageHelper.startPage(pageNum, 4);
		List<Food> foods = foodMapper.getFoodByTypeOfMe(type,uid);
		return new PageInfo<>(foods);
	}
	
	@Override
	public boolean updateFood(Food food) {
		Integer result = foodMapper.updateFood(food);
		if(result == 1) {
			return true;
		} else {
			return false;
		}
	}
}
