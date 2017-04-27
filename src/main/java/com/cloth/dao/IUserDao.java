package com.cloth.dao;

import java.util.List;

import com.cloth.entity.MenuType;
import com.cloth.entity.UserInfo;

public interface IUserDao {
	public UserInfo selectOneByUserId(String userId);
	//µÇÂ½
	public UserInfo login(UserInfo user);
	//²éÑ¯²Ëµ¥
	public List<MenuType> getMenu(String roleId);
}
