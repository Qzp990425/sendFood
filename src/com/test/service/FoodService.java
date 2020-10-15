package com.test.service;

import com.github.pagehelper.PageInfo;
import com.test.entity.Food;

public interface FoodService {
	public PageInfo<Food> getAllFood(Integer pageNum);
	
	public PageInfo<Food> getAllFoodByType(Integer type,Integer pageNum);
	
	public PageInfo<Food> getFoodOnSale(Integer pageNum);
	
	public PageInfo<Food> getFoodOnSaleByType(Integer type,Integer pageNum);
	
	public Food getFoodByfid(Integer fid);
	
	public boolean putFood(Integer fid);
	
	public boolean pushFood(Integer fid);
	
	public boolean addFood(Food Food);
	
	public PageInfo<Food> getFoodByName(Integer pageNum,String name);
	
	public void updateNum(Integer[] fid,Integer[] num);
	
	public void updateNum(Integer fid,Integer num);
	
	public PageInfo<Food> getAllFoodOfMe(Integer pageNum,Integer uid);
	
	public PageInfo<Food> getAllFoodByTypeOfMe(Integer type,Integer pageNum,Integer uid);
	
	public boolean updateFood(Food food);
}
