package com.test.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;

import com.github.pagehelper.PageInfo;
import com.test.entity.Address;
import com.test.entity.Food;
import com.test.entity.ShopCar;
import com.test.entity.User;
import com.test.serviceImpl.AddressServiceImpl;
import com.test.serviceImpl.FoodServiceImpl;
import com.test.utils.FileNameUtil;

@Controller
@RequestMapping("/food")
@SessionAttributes(value={"user"})
public class FoodController {
	
	@Autowired
	FoodServiceImpl foodService;
	@Autowired
	AddressServiceImpl addressService;
	
	@RequestMapping("/getFoodOnSale")
	public String getFoodOnSale(Model model,@RequestParam(defaultValue="1")Integer pageNum) {
		PageInfo<Food> pageInfo = foodService.getFoodOnSale(pageNum);
		model.addAttribute("pageInfo",pageInfo);
		return "/user/hall";
	}
	
	@RequestMapping("/getFoodOnSaleByType")
	public String getFoodOnSale(Model model,@RequestParam(defaultValue="1")Integer pageNum,Integer type) {
		PageInfo<Food> pageInfo = foodService.getFoodOnSaleByType(type, pageNum);
		model.addAttribute("type", type);
		model.addAttribute("pageInfo",pageInfo);
		return "/user/hall";
	}
	
	@RequestMapping("/getFoodByBId")
	public String getFoodByPId(Model model,Integer fid) {
		Food Food = foodService.getFoodByfid(fid);
		model.addAttribute("Food",Food);
		return "/user/detail";
	}
	
	@RequestMapping("/getAllFood")
	public String getAllFood(Model model,@RequestParam(defaultValue="1")Integer pageNum) {
		PageInfo<Food> pageInfo = foodService.getAllFood(pageNum);
		model.addAttribute("pageInfo",pageInfo);
		return "/admin/food";
	}
	
	@RequestMapping("/getAllFoodByType")
	public String getAllFoodByType(Model model,@RequestParam(defaultValue="1")Integer pageNum,Integer type) {
		PageInfo<Food> pageInfo = foodService.getAllFoodByType(type, pageNum);
		model.addAttribute("type",type);
		model.addAttribute("pageInfo",pageInfo);
		return "/admin/food";
	}
	
	@RequestMapping("/putFood")
	public String putFood(Model model,Integer fid){
		boolean flag = foodService.putFood(fid);
		if(flag) {
			model.addAttribute("msg", "下架成功");
		} else {
			model.addAttribute("msg", "下架失败");
		}
		return "forward:/food/getAllFood";
	}
	
	@RequestMapping("/pushFood")
	public String pushFood(Model model,Integer fid){
		boolean flag = foodService.pushFood(fid);
		if(flag) {
			model.addAttribute("msg", "上架成功");
		} else {
			model.addAttribute("msg", "上架失败");
		}
		return "forward:/food/getAllFood";
	}
	
	@RequestMapping("/addFood")
	public String addFood(@RequestParam MultipartFile foodImg,HttpServletRequest request,Model model,Food food) {
		//创建存储的文件名
		String uuid = FileNameUtil.getUUIDFileName();
        String saveFileName = uuid + FileNameUtil.getFileType(foodImg.getOriginalFilename());        
        //找到存储的路径
        String path  = request.getServletContext().getRealPath("/foodImg");
        System.out.println(path+saveFileName);
        //转存
        try {
        	foodImg.transferTo(new File(path+saveFileName));
        } catch (IOException e) {
            e.printStackTrace();
        }
        food.setUuid(uuid);
        food.setStatus(0);
        boolean flag = foodService.addFood(food);
        if(flag) {
        	model.addAttribute("msg","添加成功");
        } else {
        	model.addAttribute("msg","添加失败");
        }
        return "/sold/addFood";
	}
	
	@RequestMapping("/getFoodByName")
	public String getFoodByName(Model model,String name,@RequestParam(defaultValue="1")Integer pageNum) {
		PageInfo<Food> pageInfo = foodService.getFoodByName(pageNum, name);
		model.addAttribute("name", name);
		model.addAttribute("pageInfo",pageInfo);
		return "/user/hall";
	}
	
	@RequestMapping("/readyBuy")
	public String readyBuy(ModelMap model,Integer fid) {
		Food Food = foodService.getFoodByfid(fid);
		ShopCar shopCar = new ShopCar();
		shopCar.setFood(Food);
		List<ShopCar> shopCars = new ArrayList<ShopCar>();
		shopCars.add(shopCar);
		User user = (User) model.get("user");
		List<Address> addresses = addressService.getAllAddress(user.getUid());
		model.addAttribute("shopCars",shopCars);
		model.addAttribute("addresses",addresses);
		return "/user/payment";
	}
	
	@RequestMapping("getFood")
	public String getFood(Model model,Integer fid) {
		Food food = foodService.getFoodByfid(fid);
		model.addAttribute("food", food);
		return "/admin/foodupdate";
	}
	
	@RequestMapping("updateFood")
	public String updateFood(Model model,Food food) {
        boolean flag = foodService.updateFood(food);
        if(flag) {
        	model.addAttribute("msg","修改成功");
        } else {
        	model.addAttribute("msg","修改失败");
        }
		model.addAttribute("food", food);
		return "/admin/foodupdate";
	}
}
