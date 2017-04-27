package com.cloth.controller;
 
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cloth.entity.UserInfo;
import com.cloth.service.IUserService;
@Controller
@RequestMapping("user")
public class UserController  {
	@Autowired
	private IUserService service;
	@Autowired
	private HttpSession session;
	@RequestMapping("login")
	public @ResponseBody String login(ModelMap model,UserInfo user){
		//登陆
		UserInfo userinfo=service.login(user);
		if(userinfo!=null){
			//登陆成功！
			session.setAttribute("user",userinfo);
			return "0";
		}
		return "1";
	}
	//查询该用户的权限
	@RequestMapping("index")
	public String index(ModelMap model){
		UserInfo userInfo=(UserInfo) session.getAttribute("user");
		if(userInfo==null){
			return "login";
		}
		session.setAttribute("menutype",service.getMenu(userInfo.getRole().getRoleId()));
		return "main";
	}

}
