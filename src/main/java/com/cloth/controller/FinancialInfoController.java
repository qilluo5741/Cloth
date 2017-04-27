package com.cloth.controller;

import java.util.Date;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import com.cloth.entity.FinancialInfo;
import com.cloth.service.IFinancialInfoService;
import com.cloth.service.IProcurementInfoService;
import com.cloth.service.ISalesRecordService;
import com.cloth.util.Pager;

@Controller
@RequestMapping("select")
public class FinancialInfoController {
	private static final String Error = null;
	@Autowired
	private IFinancialInfoService service;
	@Autowired
	private IProcurementInfoService proservice;
	@Autowired
	private ISalesRecordService salservice;
	/**
	 * 分页查询所有
	 * */
	@RequestMapping("selectbyAll")
	public String selectbyAll(Pager<FinancialInfo> pager,ModelMap model){
		//设置显示的条数
		pager.setPageSize(5);
		pager.setPageIndex(pager.getPageIndex());
		//取得总数
		pager=service.selectbyAll(pager.getPageIndex(), pager.getPageSize());
		model.addAttribute("pagerList", pager);
		//取得集合
		return "Financial/fina";
	}
	/**
	 * 添加前的查询
	 * */
	@RequestMapping("insert")
	public String insert(ModelMap model) {
		model.addAttribute("prolist", proservice.selectAllList());
		model.addAttribute("sallist", salservice.queryAllSalesRecordInfo());
		return "Financial/addFinancialInfo";
	}
	/**
	 * 添加单个
	 * */
	@RequestMapping("insertOneFinancialInfo")
	public String insertOneFinancialInfo(ModelMap model,FinancialInfo fina){
		fina.setFinancialTime(new Date());
		if(this.service.insertOneFinancialInfo(fina)){
			return "redirect:selectbyAll.action";
		}
		return Error;
	}
	/**
	 * 查询单个
	 * @param fina
	 * @return
	 */
	@RequestMapping("selectFinancialInfo")
	public String selectFinancialInfo(ModelMap model, String financialId){
		model.addAttribute("prolist", proservice.selectAllList());
		model.addAttribute("sallist", salservice.queryAllSalesRecordInfo());
		model.addAttribute("fina", service.selectFinancialInfo(financialId));
			if(this.service!=null){
				return "Financial/updateFinancialInfo";
			}else{
				return Error;
			}
	}
	/*修改*/
	@RequestMapping("updateFinancialInfo")
	public String updateFinancialInfo(FinancialInfo fina) {
		if(service.updateFinancialInfo(fina)) {
			return "redirect:selectbyAll.action";
		} else {
			return Error;
		}
	}
	/*删除*/
	@RequestMapping("deleteFinancialInfo")
	public String deleteFinancialInfo(String financialId) {
		if(service.deleteFinancialInfo(financialId)) {
			return "redirect:selectbyAll.action";
		} else {
			return Error;
		}
	}
}