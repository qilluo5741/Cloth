package com.cloth.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import com.cloth.entity.SupplierInfo;
import com.cloth.service.ISupplierInfoService;
import com.cloth.util.Pager;

@Controller
@RequestMapping("supplier")
public class SupplierController {

	@Autowired
	private ISupplierInfoService supplierService;
	/**
	 * 分页
	 * @param pager
	 * @param map
	 * @return
	 */
	@RequestMapping("querySelectAll")
	public String querySelectAll(Pager<SupplierInfo> pager,ModelMap map){
		pager.setPageIndex(pager.getPageIndex());
		pager.setPageSize(5);
		pager = supplierService.querySelectAll(pager.getPageIndex(), pager.getPageSize());
		map.addAttribute("supplierPager", pager);
		return "supplier/supplierManger";
	}
	
	/**
	 * 添加
	 * @param supplier
	 * @return
	 */
	@RequestMapping("insert")
	public String insert(SupplierInfo supplier){
		if(supplierService.insert(supplier)){
			return "supplier/supplierManger";
		}
		return "error";
	}
	
	/**
	 * 查询单个
	 */
	@RequestMapping("selectOne")
	public @ResponseBody String selectOne(String supplierName, String supplierPeople, String supplierAddress){
		if(supplierService.selectOne(supplierName, supplierPeople, supplierAddress)){
			return "true";
		}
		return "false";
	}
}
