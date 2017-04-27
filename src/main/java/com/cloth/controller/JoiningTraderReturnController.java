package com.cloth.controller;

import java.util.Date;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import com.cloth.entity.EmpInfo;
import com.cloth.entity.GoodsInventoryInfo;
import com.cloth.entity.InboundInfo;
import com.cloth.entity.JoiningTraderReturnInfo;
import com.cloth.entity.UserInfo;
import com.cloth.entity.WarehouseInfo;
import com.cloth.service.IEmpInfoService;
import com.cloth.service.IGoodsInventoryService;
import com.cloth.service.IInboundInfoService;
import com.cloth.service.IJoiningTraderReturnInfoService;
import com.cloth.service.IWarehouseInfoService;
import com.cloth.util.Pager;

@Controller
@RequestMapping("joiningTraderReturn")
public class JoiningTraderReturnController {
	
	@Autowired
	private IJoiningTraderReturnInfoService jtriService;
	@Autowired
	private IGoodsInventoryService giService;
	@Autowired
	private IInboundInfoService ibService;
	@Autowired
	private IWarehouseInfoService iwiService;
	@Autowired
	private IEmpInfoService empService;
	@Autowired
	private HttpSession session;
	
	/**
	 * 查询单个
	 * */
	@RequestMapping("selectOne")//  http://localhost:8080/Cloth/joiningTraderReturn/selectOne.action?joiningTraderReturnId=24333928814870563
	public String selectOne(ModelMap model,String joiningTraderReturnId) {
		model.addAttribute("joiningTraderReturn", jtriService.selectOne(joiningTraderReturnId));
		return "join/joiningTraderReturnIndex";
	}
	
	/**
	 * 查询所有
	 * */
	@RequestMapping("selectAllByPager")//  http://localhost:8080/Cloth/joiningTraderReturn/selectAllByPager.action
	public String selectAllByPager(ModelMap model,Pager<JoiningTraderReturnInfo> pager) {
		pager.setPageSize(5);
		pager.setPageIndex(pager.getPageIndex());
		pager = jtriService.selectAllPager(pager.getPageIndex(), pager.getPageSize());
		model.addAttribute("pager", pager);
		return "join/joiningTraderReturnIndex";
	}
	
	/**
	 * 通过审核（修改状态  添加入库  修改库存）
	 * */
	@RequestMapping("updateOneByStatus")
	public String updateOneByStatus(ModelMap model,JoiningTraderReturnInfo join) {
		//获得当前登录用户及其对应的员工
		UserInfo user = (UserInfo) session.getAttribute("user");
		EmpInfo emp = empService.selectOneByUser(user);
		//设置退货的质检仓库
		WarehouseInfo warehouse = iwiService.selectOneById("24333928814870687");
		
		System.out.println(warehouse.getWarehouseId());
		
		//创建入库表对象
		InboundInfo inbound = new InboundInfo(null, new Date(), emp, join.getGoodsName(), null, warehouse, join.getReturnRemark());
		//创建商品库存对象
		GoodsInventoryInfo goodsInventory = new GoodsInventoryInfo(null, join.getGoodsName(), join.getColorName(), join.getSizeName(), join.getGoodsNum(), warehouse);
		//判断该商品是否存在   若存在  则修改   不存在  则添加
		goodsInventory = giService.selectOneBy(join.getGoodsName(), join.getColorName(), join.getSizeName());
		if(goodsInventory != null)
		{
			if(jtriService.updateOneByStatus(join.getJoiningTraderReturnId()) && ibService.insert(inbound) && giService.updateOneAdd(goodsInventory.getGoodsInventoryId(), join.getGoodsNum())) {
				return "redirect:selectAllByPager.action";
			} else {
				return "error";
			}
		} else {
			goodsInventory = new GoodsInventoryInfo(null, join.getGoodsName(), join.getColorName(), join.getSizeName(), join.getGoodsNum(), warehouse);
			if(jtriService.updateOneByStatus(join.getJoiningTraderReturnId()) && ibService.insert(inbound) && giService.insertOne(goodsInventory)) {
				return "redirect:selectAllByPager.action";
			} else {
				return "error";
			}
		}
	}
}
