package com.cloth.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import com.cloth.entity.WarehousLogInfo;
import com.cloth.service.IWarehousLogInfoService;
import com.cloth.util.Pager;

@Controller
@RequestMapping("WarehousLog")
public class WarehousLogInfoController {
	@Autowired
	private IWarehousLogInfoService iwlogService;
	@RequestMapping("selectAll")
	public String queryqueryProcurement(Pager<WarehousLogInfo> pager,ModelMap model){
		//������ʾ������
		pager.setPageSize(5);
		pager.setPageIndex(pager.getPageIndex());
		//ȡ������
		pager=iwlogService.selectAll(pager.getPageIndex(), pager.getPageSize());
		model.addAttribute("iwlogList", pager);
		//ȡ�ü���
		return "WarehousLog/WarehousLogManger";
	}
}
