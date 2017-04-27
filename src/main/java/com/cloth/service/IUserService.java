package com.cloth.service;

import java.util.List;

import com.cloth.entity.MenuType;
import com.cloth.entity.UserInfo;

public interface IUserService {
	//查询一个用户
	public UserInfo selectOneByUserId(String userId);
	//登陆
	public UserInfo login(UserInfo user);
	//查询菜单
	public List<MenuType> getMenu(String roleId);
}
