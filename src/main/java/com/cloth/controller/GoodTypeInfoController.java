package com.cloth.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import com.cloth.util.Pager;
import com.cloth.entity.GoodTypeInfo;
import com.cloth.service.IGoodTypeInfoService;

@Controller
@RequestMapping("select")
public class GoodTypeInfoController {
	private static final String Error = null;
	@Autowired
	private IGoodTypeInfoService service;
	/*查询全部*/
	@RequestMapping("queryAllGoodTypeInfo")
	public String queryAllGoodTypeInfo(ModelMap model){
		List<GoodTypeInfo> list = this.service.queryAllGoodTypeInfo();
		model.addAttribute("goodt", list);
		return "GoodType/goodt";
	}
	/*添加*/
	@RequestMapping("addGoodTypeInfo")
	public String addGoodTypeInfo(ModelMap model,GoodTypeInfo goodt){
		this.service.addGoodTypeInfo(goodt);
		if(this.service!=null){
			return "redirect:selectAllByPager.action";
		}
		return Error;
	}
	/*删除*/
	@RequestMapping("deleteGoodTypeInfo")
	public String deleteGoodTypeInfo(String goodTypeId) {
		if(service.deleteGoodTypeInfo(goodTypeId)) {
			return "redirect:selectAllByPager.action";
		} else {
			return Error;
		}
	}
	/*查询单个*/
	@RequestMapping("selectOneGoodTypeInfo")
	public String selectOneGoodTypeInfo(ModelMap model, String goodTypeId){
		model.addAttribute("goodt", service.selectOneGoodTypeInfo(goodTypeId));
		if(this.service!=null){
			return "GoodType/updateGoodTypeInfo";
		}else{
			return Error;
		}
		
	}
	/*修改*/
	@RequestMapping("updateGoodTypeInfo")
	public String updateGoodTypeInfo(GoodTypeInfo goodt) {
		if(service.updateGoodTypeInfo(goodt)) {
			return "redirect:selectAllByPager.action";
		} else {
			return Error;
		}
	}
	
	/**
	 * 查询所有返回ajax
	 * @return
	 */
	@RequestMapping("queryAllGoodTypeInfoToAjax")
	public @ResponseBody List<GoodTypeInfo> queryAllGoodTypeInfoToAjax(){
		List<GoodTypeInfo> list = this.service.queryAllGoodTypeInfo();
		return list;
	}
	/**
	 * 分页查询所有
	 * */
	@RequestMapping("selectAllByPager")
	public String selectAllByPager(Pager<GoodTypeInfo> pager,ModelMap model){
		//设置显示的条数
		pager.setPageSize(5);
		pager.setPageIndex(pager.getPageIndex());
		//取得总数
		pager=service.selectAllByPager(pager.getPageIndex(), pager.getPageSize());
		model.addAttribute("pagerList", pager);
		//取得集合
		return "GoodType/goodt";
	}
}
