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

import com.cloth.entity.OrderInfo;
import com.cloth.service.IOrderInfoService;
import com.cloth.util.Pager;

@Controller
@RequestMapping("Order")
public class OrderInfoController {
	@Autowired
	private IOrderInfoService OrderService;
	/**
	 * 分页
	 * @param pager
	 * @param model
	 * @return
	 */
	@RequestMapping("queryAllByPager")
	public String queryAllOrder(Pager<OrderInfo> pager,ModelMap model){
		//设置显示的条数
		pager.setPageSize(5);
		pager.setPageIndex(pager.getPageIndex());
		//取得总数
		pager=OrderService.selectAll(pager.getPageIndex(), pager.getPageSize());
		model.addAttribute("OrderList",pager);
		//取得集合
		return "Order/OrderManger";
	}
	
	/**
	 * 查询未处理的订单
	 * @return
	 */
	@RequestMapping("selectIsDo")
	public String selectIsDo(ModelMap map){
		List<OrderInfo> list = OrderService.selectIsDo();
		map.addAttribute("isDoList", list);
		return "distribution/distributionInsert";
	}
	
	/**
	 * 查询数量是否足
	 * @return
	 */
	@RequestMapping("selectOrderById")
	public @ResponseBody String selectOrderById(String orderId ){
		if(OrderService.selectOrderById(orderId)){
			return "true";
		}
		return "false";
	}
	
	/**
	 * 查询单个
	 * @param orderId
	 * @return
	 */
	@RequestMapping("selectOneById")
	public @ResponseBody String selectOneById(String orderId){
		JsonConfig cfg = new JsonConfig();
		cfg.setJsonPropertyFilter(new PropertyFilter() {
			public boolean apply(Object source, String name, Object value) {
				
				if(name.equals("joiningTrader")){
					return true;
				}else {
					return false;
				}
			}
		});
		OrderInfo order = OrderService.selectOneById(orderId);
		JSONArray jo = JSONArray.fromObject(order,cfg);
		System.out.println(jo.toString());
		return jo.toString();
	}
	/*
	 * 审核通过
	 */
	@RequestMapping("passVerify")
	public @ResponseBody String passVerify(String orderId){
		if(OrderService.passVerify(orderId)){
			return "redirect:queryAllByPager.action";
		} else {
			return "error";
		}
	}
	/*
	 * 审核失败
	 */
	@RequestMapping("noPassVerify")
	public @ResponseBody String noPassVerify(String orderId){
		if(OrderService.noPassVerify(orderId)){
			return "redirect:queryAllByPager.action";
		} else {
			return "error";
		}
	}
}


