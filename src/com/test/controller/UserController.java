package com.test.controller;

import java.awt.image.BufferedImage;
import java.io.IOException;
import java.io.OutputStream;
import java.util.List;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.github.pagehelper.PageInfo;
import com.test.entity.Type;
import com.test.entity.User;
import com.test.serviceImpl.TypeServiceImpl;
import com.test.serviceImpl.UserServiceImpl;
import com.test.utils.VerifyCode;


@Controller
@RequestMapping("/user")
@SessionAttributes(value={"user","types"})
public class UserController {
	
	@Autowired
	UserServiceImpl userService;
	@Autowired
	TypeServiceImpl typeService;
	
	
	@RequestMapping("/")
	public String ready(Model model) {
		System.out.println("come");
		List<Type> types = typeService.getTypeList();
		model.addAttribute("types", types);
		return "forward:/food/getFoodOnSale";
	}
	
	@RequestMapping("/login")
	public String login(Model model,User user,HttpSession session,String captcha) {
		String verifyCode = (String) session.getAttribute("verifyCode");
		if(verifyCode.equals(captcha)) {
			boolean flag = userService.login(user);
			if(flag) {
				user = userService.getUserBySno(user);				
				model.addAttribute("user",user);
				return "forward:/food/getFoodOnSale";
			} else {
				model.addAttribute("msg","账号或者密码错误");
				return "/user/login";
			}
		} else {
			model.addAttribute("msg","验证码输入错误");
			return "/user/login";
		}
	}
	
	@RequestMapping("/register")
	public String register(Model model,User user,String captcha,HttpSession session) {
		String verifyCode = (String) session.getAttribute("verifyCode");
		System.out.println(verifyCode);
		if(verifyCode.equals(captcha)) {
			boolean flag = userService.register(user);
			if(flag) {
				model.addAttribute("msg","注册成功");
			} else {
				model.addAttribute("msg","学号已存在");
			}
		} else {
			model.addAttribute("msg","验证码输入错误");
		}
		return "/user/register";
	}
	
	@RequestMapping("/forget")
	public String forget(Model model,User user) {
		boolean flag = userService.forget(user);
		if(flag) {
			model.addAttribute("msg", "找回成功");
		} else {
			model.addAttribute("msg", "您输入的信息有误");
		}
		return "/user/forget";
	}
	
	@RequestMapping("/update")
	public String update(Model model,User user) {
		boolean flag = userService.update(user);
		if(flag) {
			model.addAttribute("user", user);
			model.addAttribute("msg", "更新成功");
		} else {
			model.addAttribute("msg", "更新失败");
		}
		return "/user/myMsg";
	}
	
	@RequestMapping("/exit")
	public String exit(HttpSession session) {
		session.removeAttribute("user");
		return "/user/login";
	}
	
	@RequestMapping("/getAllUser")
	public String getAllUser(Model model,@RequestParam(defaultValue="1")Integer pageNum){
		PageInfo<User> pageInfo = userService.getAllUser(pageNum);
		model.addAttribute("pageInfo", pageInfo);
		return "/admin/user";
	}
	
	@RequestMapping("/getVerifyCode")	 
    public void getVerificationCode(HttpServletResponse response,HttpServletRequest request) {
      try {
           int width= 200;
           int height = 69;
        BufferedImage verifyImg=new BufferedImage(width,height,BufferedImage.TYPE_INT_RGB);
	    //生成对应宽高的初始图片
	    String randomText = VerifyCode.drawRandomText(width,height,verifyImg);
	    //单独的一个类方法，出于代码复用考虑，进行了封装。
	    //功能是生成验证码字符并加上噪点，干扰线，返回值为验证码字符                   
	    request.getSession().setAttribute("verifyCode", randomText);
	    response.setContentType("image/png");//必须设置响应内容类型为图片，否则前台不识别
	    OutputStream os = response.getOutputStream(); //获取文件输出流    
	    ImageIO.write(verifyImg,"png",os);//输出图片流
	    os.flush();
	    os.close();//关闭流
          } catch (IOException e) {
                   e.printStackTrace();
         }
	}
	
	@RequestMapping("/updatePwd")
	public String updatePwd(User user,Model model) {
		boolean flag = userService.update(user);
		if(flag) {
			model.addAttribute("msg", "更新成功");
		} else {
			model.addAttribute("msg", "更新失败");
		}
		return "/user/myMsg";
	}
	
	@RequestMapping("/addAccount")
	public String addAccount(User user,Model model) {
		boolean flag = userService.addAccount(user);
		
		if(flag) {
			User newUser = userService.getUserByUid(user);
			model.addAttribute("user", newUser);
			model.addAttribute("msg", "充值成功");
		} else {
			model.addAttribute("msg", "充值失败");
		}
		return "/user/myMoney";
	}
	
	@RequestMapping("/updateMsg")
	public String updateMsg(User user,Model model) {
		boolean flag = userService.update(user);
		if(flag) {
			model.addAttribute("msg", "更新成功");
		} else {
			model.addAttribute("msg", "更新失败");
		}
		return "/sold/soldMsg";
	}
	
	@RequestMapping("/reflush")
	public String reflush(Integer uid,Model model) {
		User user = new User();
		user.setUid(uid);
		User sold = userService.getUserByUid(user);
		model.addAttribute("sold", sold);
		return "/sold/soldMsg";
	}

}
