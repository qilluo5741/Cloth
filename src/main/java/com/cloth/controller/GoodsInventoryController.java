package com.cloth.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cloth.entity.GoodsInfo;
import com.cloth.entity.GoodsInventoryInfo;
import com.cloth.service.IColorInfoService;
import com.cloth.service.IGoodsInfoService;
import com.cloth.service.IGoodsInventoryService;
import com.cloth.service.ISizeService;
import com.cloth.service.IWarehouseInfoService;
import com.cloth.util.Pager;

@Controller
@RequestMapping("goodsInventory")
public class GoodsInventoryController {
	
	@Autowired
	private IGoodsInventoryService giService;
	@Autowired
	private IWarehouseInfoService whService;
	@Autowired
	private IColorInfoService colorService;
	@Autowired
	private ISizeService sizeService;
	@Autowired
	private IGoodsInfoService goodsService;
	
	/**
	 * 分页查询所有
	 * */
	@RequestMapping("selectAllByPager")
	public String selectAllByPager(ModelMap model,Pager<GoodsInventoryInfo> pager) {
		pager.setPageSize(5);
		pager.setPageIndex(pager.getPageIndex());
		pager = giService.selectAllByPager(pager.getPageIndex(), pager.getPageSize());
		model.addAttribute("pager", pager);
		return "goods/goodsInventoryIndex";
	}
	
	/**
	 * 查询单个
	 * */
	@RequestMapping("selectOne")
	public String selectOne(ModelMap model,String goodsInventoryId,String a) {
		model.addAttribute("gi", giService.selectOne(goodsInventoryId));
		if(a.equals("1")) {
			return "goods/goodsInventoryAdd";
		} else if(a.equals("2")) {
			return "goods/goodsInventoryReMove";
		} else {
			model.addAttribute("whList",whService.selectAllList());
			return "goods/goodsInventoryMove";
		}
	}

	/**
	 * 修改单个（添加单个）
	 * */
	@RequestMapping("updateOneAdd")
	public String updateOneAdd(ModelMap model,String goodsInventoryId,int num) {
		if(giService.updateOneAdd(goodsInventoryId, num)) {
			return "redirect:selectAllByPager.action";
		} else {
			return "error";
		}
	}
	
	/**
	 * 修改单个（减少单个）
	 * */
	@RequestMapping("updateOneReMove")
	public String updateOneReMove(ModelMap model,String goodsInventoryId,int num) {
		if(giService.updateOneReMove(goodsInventoryId, num)) {
			return "redirect:selectAllByPager.action";
		} else {
			return "error";
		}
	}
	
	/**
	 * 修改单个（转移仓库）
	 * */
	@RequestMapping("updateOneMove")
	public String updateOneMove(ModelMap model,String goodsInventoryId,String warehouseId) {
		if(giService.updateOneMove(goodsInventoryId, warehouseId)) {
			return "redirect:selectAllByPager.action";
		} else {
			return "error";
		}
	}
	
	/**
	 * 添加单个前的查询
	 * */
	@RequestMapping("insertOneBefore")
	public String insertOneBefore(ModelMap model) {
		model.addAttribute("goodsList", goodsService.selectAllToList());
		model.addAttribute("whList",whService.selectAllList());
		model.addAttribute("colorList",colorService.selectAll());
		model.addAttribute("sizeList",sizeService.selectAllToList());
		return "goods/goodsInventoryAddNew";
	}
	
	/**
	 * 添加单个
	 * */
	@RequestMapping("insertOne")
	public String insertOne(GoodsInventoryInfo goodsInventory) {
		if(giService.insertOne(goodsInventory)) {
			return "redirect:selectAllByPager.action";
		} else {
			return "error";
		}
	}
	
	@RequestMapping("selectGoodsNum")
	public @ResponseBody String selectGoodsNum(String goodsName,String colorName,String sizeName){
		GoodsInventoryInfo gii=giService.selectOneBy(goodsName,colorName,sizeName);
		GoodsInfo goods=goodsService.selectOnebySize(goodsName, sizeName, colorName);
		if(gii==null){
			return "售完,"+goods.getGoodsImg();
		}else{
			return ""+gii.getGoodsNum()+","+goods.getGoodsImg();
		}
	}
}
