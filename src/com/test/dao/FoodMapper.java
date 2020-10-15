package com.test.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.test.entity.Food;





@Repository
public interface FoodMapper {

	public List<Food> getAllFood();
	
	public List<Food> getFoodByType(Integer type);
	
	public List<Food> getFoodOnSale();

	public List<Food> getFoodOnSaleByType(Integer type);
	
	public Integer insertFood(Food Food);
	
	public Integer putFood(Integer id);
	
	public Integer pushFood(Integer id);
	
	public Food getFoodByFid(Integer id);
	
	public List<Food> getFoodByName(String name);
	
	public void updateNum(Food Food);
	
	public List<Food> getAllFoodOfMe(Integer uid);
	
	public List<Food> getFoodByTypeOfMe(@Param("type")Integer type,@Param("uid")Integer uid);
	
	public Integer updateFood(Food food);
}
