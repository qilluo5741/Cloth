package com.cloth.dao;

import java.util.List;

import com.cloth.entity.MenuInfo;
import com.cloth.util.Pager;
public interface IMenuInfoDao {
	public MenuInfo selectOneMenuInfo(String menuId);
	public boolean updateMenuInfoBy(MenuInfo Menu);
	public List<MenuInfo> selectAllList();
	public Pager<MenuInfo> selectAll(int pageIndex, int pageSize);
}
