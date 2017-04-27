package com.cloth.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import com.cloth.entity.WarehouseInfo;
import com.cloth.service.IWarehouseInfoService;
import com.cloth.util.Pager;
@Controller
@RequestMapping("Warehouse")
public class WarehouseInfoContrller {
	@Autowired
	private IWarehouseInfoService IwService;
	@RequestMapping("selectAll")
	public String queryWarehouse(Pager<WarehouseInfo> pager,ModelMap model){
		//������ʾ������
		pager.setPageSize(5);
		pager.setPageIndex(pager.getPageIndex());
		//ȡ������
		pager=IwService.selectAll(pager.getPageIndex(), pager.getPageSize());
		model.addAttribute("IwList", pager);
		//ȡ�ü���
		return "warehouse/WarehouseManger";
	}
}
