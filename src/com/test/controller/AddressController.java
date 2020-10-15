package com.test.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.test.entity.Address;
import com.test.entity.User;
import com.test.serviceImpl.AddressServiceImpl;

@Controller
@RequestMapping("/address")
@SessionAttributes("user")
public class AddressController {
	
	@Autowired
	AddressServiceImpl addressService;
	
	@RequestMapping("/addAddress")
	public String addAddress(Address address,ModelMap model) {
		User user = (User) model.get("user");
		address.setUid(user.getUid());
		boolean flag = addressService.insertAddress(address);
		if(flag) {
			model.addAttribute("msg", "添加成功");
		} else {
			model.addAttribute("msg", "添加失败");
		}
		return "forward:/address/getAddress";
	}
	
	@RequestMapping("/deleteAddress")
	public String deleteAddress(Integer aid,Model model) {
		boolean flag = addressService.deleteAddress(aid);
		if(flag) {
			model.addAttribute("msg", "删除成功");
		} else {
			model.addAttribute("msg", "删除失败");
		}
		return "forward:/address/getAddress";
	}
	
	@RequestMapping("/updateAddress")
	public String updateAddress(Address address,Model model) {
		boolean flag = addressService.updateAddress(address);
		if(flag) {
			model.addAttribute("msg", "更新成功");
		} else {
			model.addAttribute("msg", "更新失败");
		}
		return "forward:/address/getAddress";
	}
	
	@RequestMapping("/getAddress")
	public String getAddress(ModelMap model) {
		User user = (User) model.get("user");
		List<Address> addresses = addressService.getAllAddress(user.getUid());
		model.addAttribute("addresses", addresses);
		return "/user/myAddress";
	}
	
	@RequestMapping("/getAddressById")
	public String getAddressById(Integer aid,Model model) {
		Address address = addressService.getAddressById(aid);
		model.addAttribute("address", address);
		return "/user/updateAddress";
	}
}
