package com.cloth.controller;

import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cloth.entity.LocalReturnInfo;
import com.cloth.entity.UserInfo;
import com.cloth.service.ILocalReturnService;
import com.cloth.util.Pager;

@Controller
@RequestMapping("localReturn")
public class LocalReturnController {
	
	@Autowired
	private ILocalReturnService returnService;
	@Autowired
	private HttpSession session;
	
	@RequestMapping("queryLocalReturn")
	public String queryLocalReturn(Pager<LocalReturnInfo> pager,ModelMap model){
		//设置显示的条数
		pager.setPageSize(9);
		pager.setPageIndex(pager.getPageIndex());
		//取得总数
		pager=returnService.queryLocalAll(pager.getPageIndex(), pager.getPageSize());
		model.addAttribute("pagerLocalReturn", pager);
		//取得集合
		return "local/localReturnIndex";
	}
	
	@RequestMapping("localReturnSure")
	public @ResponseBody String localReturnSure(String returnId){
		LocalReturnInfo local=returnService.selectOntByReturnId(returnId);
		String uid=UUID.randomUUID().toString();
		if(returnService.returnGoods(local,((UserInfo)session.getAttribute("user")).getUserId(),uid)){
			return "0";
		}else{
			return "1";
		}
	}
}
