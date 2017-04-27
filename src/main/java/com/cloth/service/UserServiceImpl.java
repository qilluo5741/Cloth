package com.cloth.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cloth.dao.IUserDao;
import com.cloth.entity.MenuType;
import com.cloth.entity.UserInfo;

@Service
public class UserServiceImpl implements IUserService {

	@Autowired
	private IUserDao dao;
	
	/**
	 * 查询单个用户
	 */
	public UserInfo selectOneByUserId(String userId) {
		return dao.selectOneByUserId(userId);
	}
	/**
	 * 登陆
	 */
	public UserInfo login(UserInfo user) {
		return dao.login(user);
	}
	/**
	 * 查询菜单
	 */
	public List<MenuType> getMenu(String roleId) {
		return dao.getMenu(roleId);
	}
	
}
