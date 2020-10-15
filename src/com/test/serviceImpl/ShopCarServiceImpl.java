package com.test.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.test.dao.FoodMapper;
import com.test.dao.ShopCarMapper;
import com.test.dao.UserMapper;
import com.test.entity.Food;
import com.test.entity.ShopCar;
import com.test.entity.User;
import com.test.service.ShopCarService;


@Service
public class ShopCarServiceImpl implements ShopCarService {
	
	@Autowired
	ShopCarMapper shopCarMapper;
	@Autowired
	FoodMapper foodMapper;
	@Autowired
	UserMapper userMapper;
	
	@Override
	public boolean addFood(ShopCar shopCar,User user) {
		List<ShopCar> shopCars = shopCarMapper.getShopCar(user);
		for(int i = 0 ; i < shopCars.size(); i++) {
			if(shopCars.get(i).getFid().equals(shopCar.getFid())) {
				return false;
			}			
		} 
		shopCar.setUid(user.getUid());
		shopCar.setNumber(1);
		Integer result = shopCarMapper.addFood(shopCar);	
		if(result == 1) {
			return true;
		} else {
			return false;
		}
	}


	@Override
	public List<ShopCar> getShopCar(User user) {
		List<ShopCar> shopCars = shopCarMapper.getShopCar(user);
		for(int i = 0 ; i < shopCars.size() ; i++) {
			ShopCar shopCar = shopCars.get(i);		
			Food Food = foodMapper.getFoodByFid(shopCar.getFid());
			Food.setSoldUser(userMapper.getUserByUid(Food.getUid()));
			shopCar.setFood(Food);
			shopCars.remove(i);
			shopCars.add(i, shopCar);
		}
		return shopCars;
	}


	@Override
	public boolean deleteShopCarBySid(Integer sid) {
		Integer result = shopCarMapper.deleteShopCarBySid(sid);
		if(result == 1) {
			return true;
		} else {
			return false;
		}		
	}


	@Override
	public void updateNum(ShopCar shopCar) {
		shopCarMapper.updateNum(shopCar);		
	}


	@Override
	public void deleteShopCar(Integer[] sid) {
		// TODO Auto-generated method stub
		shopCarMapper.deleteShopCar(sid);
	}

}
