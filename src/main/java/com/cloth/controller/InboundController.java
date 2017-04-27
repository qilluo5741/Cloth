package com.cloth.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cloth.entity.InboundInfo;
import com.cloth.service.IInboundInfoService;
import com.cloth.util.Pager;

@Controller
@RequestMapping("inbound")
public class InboundController {

	@Autowired
	private IInboundInfoService inboundService;
	
	
	/**
	 * ∑÷“≥
	 * @param pager
	 * @param map
	 * @return
	 */
	@RequestMapping("querySelectAll")
	public String querySelectAll(Pager<InboundInfo> pager, ModelMap map){
		pager.setPageSize(5);
		pager.setPageIndex(pager.getPageIndex());
		pager = inboundService.querySelectAll(pager.getPageIndex(), pager.getPageSize());
		map.addAttribute("inboundPager", pager);
		return "inbound/inboundManger";
	}
	
	/**
	 * ÃÌº”
	 * @param inbound
	 * @return
	 */
	@RequestMapping("insert")
	public String insert(InboundInfo inbound){
		if(inboundService.insert(inbound)){
			return "inbound/inboundManger";
		}
		return "error";
	}
	/**
	 * ÃÌº”Ajax
	 * @param inbound
	 * @return
	 */
	@RequestMapping("insertAjax")
	public @ResponseBody String insertAjax(InboundInfo inbound){
		if(inboundService.insert(inbound)){
			return "true";
		}
		return "false";
	}
}
