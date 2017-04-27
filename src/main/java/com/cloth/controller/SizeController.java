package com.cloth.controller;

import java.io.UnsupportedEncodingException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cloth.entity.SizeInfo;
import com.cloth.service.ISizeService;
import com.cloth.util.Pager;

@Controller
@RequestMapping("size")
public class SizeController {
	
	@Autowired
	private ISizeService sizeService;

	/**
	 * 分页查询所有
	 * @param pager
	 * @param map
	 * @return
	 */
	@RequestMapping("queryAllSize")
	public String queryAllSize(Pager<SizeInfo> pager,ModelMap map){
		//设置显示的条数
		pager.setPageSize(9);
		pager.setPageIndex(pager.getPageIndex());
		//取得总数
		pager=sizeService.queryAllSize(pager.getPageIndex(), pager.getPageSize());
		map.addAttribute("pagersize", pager);
		//取得集合
		return "size/sizeIndex";
	}
	
	/**
	 * 新增尺寸
	 * @param sizes
	 * @return
	 */
	@RequestMapping("insertSize")
	public String insertSize(SizeInfo sizes){
		if(sizeService.insertSize(sizes)){
			return "redirect:queryAllSize.action";
		}else{
			return "error";
		}
	}
	
	@RequestMapping("selectAllToAjax")
	public @ResponseBody List<SizeInfo> selectAllToAjax(){
		List<SizeInfo> list=sizeService.selectAllToList();
		return list;
	}
	
	/**
	 * 查询是否存在该尺寸
	 * @param sizeName
	 * @return
	 * @throws UnsupportedEncodingException 
	 */
	@RequestMapping("selectIsExistsSize")
	public @ResponseBody boolean selectIsExistsSize(String sizeName,String goodsTypeName) throws UnsupportedEncodingException{
		goodsTypeName= new String(goodsTypeName.getBytes("ISO-8859-1"),"UTF-8");
		return sizeService.selectIsExistsSize(sizeName,goodsTypeName);
	}
}
