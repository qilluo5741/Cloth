package com.cloth.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import com.cloth.entity.SalesRecordInfo;
import com.cloth.service.ISalesRecordService;
import com.cloth.util.Pager;

@Controller
@RequestMapping("salesRecord")
public class SalesRecordController {
	
	@Autowired
	private ISalesRecordService srService;
	
	/**
	 * 分页查询
	 * */
	@RequestMapping("selectAllByPager")
	public String selectAllByPager(ModelMap model,Pager<SalesRecordInfo> pager) {
		pager.setPageIndex(pager.getPageIndex());
		pager.setPageSize(5);
		pager = srService.selectAllByPager(pager.getPageIndex(), pager.getPageSize());
		model.addAttribute("pager", pager);
		return "goods/salesRecordIndex";
	}
	
	/**
	 * 添加单个
	 * */
	@RequestMapping("insertOne")
	public String insertOne(SalesRecordInfo salesRecord) {
		if(srService.insertOne(salesRecord)) {
			return "redirect:selectAllByPager.action";
		} else {
			return "error";
		}
	}
}
