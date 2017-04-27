package com.cloth.service;

import java.util.List;

import com.cloth.entity.MenuInfo;
import com.cloth.entity.MenuRoleInfo;
import com.cloth.entity.MenuType;
import com.cloth.entity.RoleInfo;
import com.cloth.util.Pager;

public interface IJurisdictionService {
	public List<RoleInfo> getRole();
	//修改角色名称
	public boolean updateRole(RoleInfo role);
	//删除角色
	public boolean deleteRole(RoleInfo role);
	//添加角色
	public boolean addReole(RoleInfo role);
	//分页查询菜单分类
	public Pager<MenuType> getMenuType(int pageIndex,int pageSize);
	//修改菜单信息
	public boolean updateMenuType(MenuType mt);
	//添加菜单类型
	public boolean addMenuType(MenuType mt);
	//删除菜单类型
	public boolean deleteMenuType(MenuType mt);
	//查询角色下面对应的菜单
	public RoleInfo getReoleMenu(RoleInfo role);
	//删除关系表菜单管理
	public boolean deleteRoleMenu(RoleInfo r);
	//根据一个用户 查询用户没有分配的菜单
	public List<MenuInfo> getMenuisNoadd(RoleInfo r);
	// 添加角色菜单
	public  boolean addMenuRole(MenuRoleInfo mr);
}
