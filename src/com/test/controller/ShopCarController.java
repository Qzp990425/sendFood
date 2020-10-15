package com.test.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.test.entity.Address;
import com.test.entity.ShopCar;
import com.test.entity.User;
import com.test.serviceImpl.AddressServiceImpl;
import com.test.serviceImpl.ShopCarServiceImpl;



@Controller
@RequestMapping("/shopCar")
@SessionAttributes("user")
public class ShopCarController {
	
	@Autowired
	ShopCarServiceImpl shopCarService;
	@Autowired
	AddressServiceImpl addressService;
	
	
	@RequestMapping("/addFoodIndex")
	public String addFoodIndex(ModelMap model,ShopCar shopCar) {
		User user = (User)model.get("user");
		boolean flag = shopCarService.addFood(shopCar,user);
		if(flag) {
			model.addAttribute("msg","添加成功");
		} else {
			model.addAttribute("msg","购物车中已经存在");
		}
		return "forward:/food/getFoodOnSale";
	}		
	
	@RequestMapping("/getShopCar")
	public String getShopCar(ModelMap model){
		User user = (User)model.get("user");
		List<ShopCar> shopCars = shopCarService.getShopCar(user);
		List<Address> addresses = addressService.getAllAddress(user.getUid());
		model.addAttribute("shopCars", shopCars);
		model.addAttribute("addresses", addresses);
		return "/user/shopCar";
	}
	
	@RequestMapping("/updateNum")
	public String updateNum(ShopCar shopCar) {
		shopCarService.updateNum(shopCar);
		return null;
	}
	
	@RequestMapping("/deleteById")
	public String deleteById(Integer sid,Model model) {
		boolean flag = shopCarService.deleteShopCarBySid(sid);
		if(flag) {
			model.addAttribute("msg", "删除成功");
		} else {
			model.addAttribute("msg", "删除失败");
		}
		return "forward:/shopCar/getShopCar";
	}
}
