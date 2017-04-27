package com.cloth.controller;


import java.util.List;

import net.sf.json.JSONArray;
import net.sf.json.JsonConfig;
import net.sf.json.util.PropertyFilter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import com.cloth.entity.MenuInfo;
import com.cloth.entity.MenuRoleInfo;
import com.cloth.entity.MenuType;
import com.cloth.entity.RoleInfo;
import com.cloth.service.IJurisdictionService;
import com.cloth.util.Pager;

@Controller
@RequestMapping("jurisdiction")
public class JurisdictionController {
	@Autowired
	private IJurisdictionService service;
	
	//角色查询
	@RequestMapping("getReole")
	public String getReole(ModelMap model){
		model.addAttribute("role", service.getRole());
		return "Jurisdiction/roleInfo";
	}
	//修改角色
	@RequestMapping("updateReole")
	public @ResponseBody  String updateReole(ModelMap model,RoleInfo role){
		if(service.updateRole(role)){
			return "0";
		}
		return "1";
	}
	//删除角色
	@RequestMapping("deleteReole")
	public @ResponseBody String deleteRole(ModelMap model,RoleInfo role){
		try {
			if(service.deleteRole(role)){
				return "0";
			}
		} catch (Exception e) {
			return "1"; 
		}
		return "1";
	}
	//添加角色
	@RequestMapping("addReole")
	public @ResponseBody String addReole(ModelMap model,RoleInfo role){
		if(service.addReole(role)){
			return "0";
		}
	
		return "1";
	}
	//查询菜单类型
	@RequestMapping("getMenuType")
	public String getMenuType(ModelMap model,int pageIndex){
		Pager<MenuType> p=service.getMenuType(pageIndex, 5);
		if(p.getList().size()==0){
			 p=service.getMenuType(pageIndex-1, 5);
		}
		model.addAttribute("pager", p);
		return "Jurisdiction/menuType";
	}
	//修改菜单类型
	@RequestMapping("updateMenuType")
	public @ResponseBody String updateMenuTyep(ModelMap model,MenuType mt){
		if(service.updateMenuType(mt)){
			return "0";
		}
		return "1";
	}
	//添加菜单类型
	@RequestMapping("addMenuType")
	public @ResponseBody String addMenuTyep(ModelMap model,MenuType mt){
		if(service.addMenuType(mt)){
			return "0";
		}
		return "1";
	}
	//删除菜单类型
	@RequestMapping("deleteMenuType")
	public @ResponseBody String deleteMenuType(ModelMap model,MenuType mt)
	{
		try {
			if(service.deleteMenuType(mt)){
				return "0";
			}
		} catch (Exception e) {
			return "1";
		}
		return "1";
	}
	
	//查询角色下面所有的菜单
	@RequestMapping("getRoleMenu")
	public String getRoleMenu(ModelMap model,RoleInfo r){
		model.addAttribute("roleInfo",service.getReoleMenu(r));
		return "Jurisdiction/roleMenu";
	}
	//删除角色中的一个菜单
	@RequestMapping("deleteRoleMenu")
	public @ResponseBody String deleteRoleMenu(ModelMap model,RoleInfo r){
		if(service.deleteRoleMenu(r)){
			return "0";
		}
		return "1";
	}
	//根据角色Id查询为添加的菜单
	@RequestMapping("getMenuisNoadd")
	public @ResponseBody String getMenuisNoadd(ModelMap map,RoleInfo r){
		JsonConfig cfg = new JsonConfig();
	    cfg.setJsonPropertyFilter(new PropertyFilter()
	    {
	         public boolean apply(Object source, String name, Object value) {
	           if(name.equals("menuType")) {
	             return true;
	           } else {
	             return false;
	          }
	        }
	    });
		List<MenuInfo> list=service.getMenuisNoadd(r);
		System.out.println("*****"+list.size());
		JSONArray ja=JSONArray.fromObject(list,cfg);
		return ja.toString();
	}
	//角色添加菜单
	@RequestMapping("addMenuRole")
	public @ResponseBody String addMenuRole(MenuRoleInfo m){
		if(service.addMenuRole(m)){
			return "0";
		}
		return "1";
	}
}
