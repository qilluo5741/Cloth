package com.cloth.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import com.cloth.entity.MenuInfo;
import com.cloth.service.IMenuInfoService;
import com.cloth.util.Pager;

@Controller
@RequestMapping("Menu")
public class MenuInfoController {
	private static final String Error = null;
	@Autowired
	private IMenuInfoService IMenuService;
	/*查询全部*/
	@RequestMapping("selectAll")
	public String queryMenuInfo(Pager<MenuInfo> pager,ModelMap model){
		//设置显示的条数
		pager.setPageSize(4);
		pager.setPageIndex(pager.getPageIndex());
		//取得总数
		pager=IMenuService.selectAll(pager.getPageIndex(), pager.getPageSize());
		model.addAttribute("IMenuList", pager);
		//取得集合
		return "Jurisdiction/MenuInfoManger";
	}
	/*查询单个*/
	@RequestMapping("selectOneMenuInfo")
	public String selectOneMenuInfo(ModelMap model, String menuId){
		model.addAttribute("m", IMenuService.selectOneMenuInfo(menuId));
		if(this.IMenuService!=null){
			return "Jurisdiction/updateMenuInfo";
		}else{
			return Error;
		}
		
	}
	/*修改*/
	@RequestMapping("updateMenuInfo")
	public String updateMenuInfo(MenuInfo Menu) {
		if(IMenuService.updateMenuInfoBy(Menu)) {
			return "redirect:selectAll.action";
		} else {
			return Error;
		}
	}
}
