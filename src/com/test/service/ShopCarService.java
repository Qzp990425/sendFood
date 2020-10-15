package com.test.service;

import java.util.List;

import com.test.entity.ShopCar;
import com.test.entity.User;


public interface ShopCarService {
	
	public boolean addFood(ShopCar shopCar,User user);
	
	public List<ShopCar> getShopCar(User user);
	
	public boolean deleteShopCarBySid(Integer sid);
	
	public void updateNum(ShopCar shopCar);
	
	public void deleteShopCar(Integer[] sid);
}
