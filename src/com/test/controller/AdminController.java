package com.test.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.github.pagehelper.PageInfo;
import com.test.entity.Admin;
import com.test.entity.Type;
import com.test.serviceImpl.AdminServiceImpl;
import com.test.serviceImpl.TypeServiceImpl;


@Controller
@RequestMapping("/admin")
@SessionAttributes(value={"admin","types"})
public class AdminController {
	
	@Autowired
	AdminServiceImpl adminService;
	@Autowired
	TypeServiceImpl typeService;
	
	
	
	@RequestMapping("/login")
	public String login(Model model,Admin admin) {
		boolean flag = adminService.login(admin);
		if(flag) {
			admin = adminService.getAdminByUsername(admin);
			model.addAttribute("admin",admin);
			List<Type> types = typeService.getTypeList();
			model.addAttribute("types", types);
			return "/admin/index";
		} else {
			model.addAttribute("msg","账号或者密码错误");
			return "/admin/login";
		}
	}
	
	
	@RequestMapping("/exit")
	public String exit(HttpSession session) {
		session.removeAttribute("admin");
		return "/admin/login";
	}
	
	@RequestMapping("getAdmin")
	public String getAdmin(Integer id,Model model) {
		Admin admin1 = adminService.getAdmin(id);
		model.addAttribute("admin1", admin1);
		return "/admin/adminupdate";
	}
	
	@RequestMapping("getAllAdmin")
	public String getAllAdmin(Model model,@RequestParam(defaultValue="1")Integer pageNum) {
		PageInfo<Admin> pageInfo = adminService.getAllAdmin(pageNum);
		model.addAttribute("pageInfo", pageInfo);
		return "/admin/admin";
	}
	
	@RequestMapping("deleteAdmin")
	public String deleteAdmin(Integer id,Model model) {
		boolean flag = adminService.deleteAdmin(id);
		if(flag) {
			model.addAttribute("msg", "删除成功");
		} else {
			model.addAttribute("msg", "删除失败");
		}
		return "forward:/admin/getAllAdmin";
	}
	
	@RequestMapping("updateAdmin")
	public String updateAdmin(Admin admin1,Model model) {
		boolean flag = adminService.updateAdmin(admin1);
		if(flag) {
			model.addAttribute("msg", "修改成功");
		} else {
			model.addAttribute("msg", "修改失败");
		}
		return "forward:/admin/getAllAdmin";
	}
	
	@RequestMapping("addAdmin")
	public String addAdmin(Admin admin,Model model) {
		boolean flag = adminService.addAdmin(admin);
		if(flag) {
			model.addAttribute("msg", "新增成功");
		} else {
			model.addAttribute("msg", "新增失败");
		}
		return "/admin/adminAdd";
	}
}
