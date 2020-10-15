package com.test.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.github.pagehelper.PageInfo;
import com.test.entity.Type;
import com.test.serviceImpl.TypeServiceImpl;

@Controller
@RequestMapping("/type")
@SessionAttributes("type")
public class TypeController {
	
	@Autowired 
	TypeServiceImpl typeSerivce;
	
	
	@RequestMapping("/getAllType")
	public String getAllType(@RequestParam(defaultValue="1")Integer pageNum,Model model) {
		PageInfo<Type> pageInfo = typeSerivce.getAllType(pageNum);
		model.addAttribute("pageInfo", pageInfo);
		return "/admin/type";
	}
	
	@RequestMapping("/deleteType")
	public String deleteType(Integer tid,Model model) {
		boolean flag = typeSerivce.deleteType(tid);
		if(flag) {
			List<Type> types = typeSerivce.getTypeList();
			model.addAttribute("types", types);
			model.addAttribute("msg", "删除成功");
		} else {
			model.addAttribute("msg", "删除失败");
		}		
		return "forward:/type/getAllType";
	}
	
	@RequestMapping("/addType")
	public String addType(String tname,Model model) {
		boolean flag = typeSerivce.insertType(tname);
		if(flag) {
			List<Type> types = typeSerivce.getTypeList();
			model.addAttribute("types", types);
			model.addAttribute("msg", "添加成功");
		} else {
			model.addAttribute("msg", "添加失败");
		}		
		return "forward:/type/getAllType";
	}
	
	@RequestMapping("/updateType")
	public String updateType(Type type,Model model) {
		boolean flag = typeSerivce.updateType(type);
		if(flag) {
			List<Type> types = typeSerivce.getTypeList();
			model.addAttribute("types", types);
			model.addAttribute("msg", "更改成功");
		} else {
			model.addAttribute("msg", "更改失败");
		}		
		return "forward:/type/getType?tid="+type.getTid();
	}
	
	@RequestMapping("/getType")
	public String getType(Integer tid,Model model) {
		Type type = typeSerivce.getTypeByTid(tid);
		model.addAttribute("type", type);
		return "/admin/typeUpdate";
	}
}
