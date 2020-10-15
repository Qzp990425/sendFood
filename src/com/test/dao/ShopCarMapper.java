package com.test.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.test.entity.ShopCar;
import com.test.entity.User;

@Repository
public interface ShopCarMapper {
	
	public Integer addFood(ShopCar shopCar);
	
	public List<ShopCar> getShopCar(User user);
	
	public Integer deleteShopCarBySid(Integer sid);	
	
	public void updateNum(ShopCar shopCar);
	
	public void deleteShopCar(Integer[] sid);
}
