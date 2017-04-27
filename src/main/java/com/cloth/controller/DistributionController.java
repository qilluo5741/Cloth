package com.cloth.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cloth.entity.DistributionInfo;
import com.cloth.service.IDistributionInfoService;
import com.cloth.util.Pager;

@Controller
@RequestMapping("distribution")
public class DistributionController {
	@Autowired
	private IDistributionInfoService distributionService;
	
	/**
	 * 分页
	 * @return
	 */
	@RequestMapping("querySelectAll")
	public String querySelectAll(Pager<DistributionInfo> pager, ModelMap map){
		pager.setPageSize(5);
		pager.setPageIndex(pager.getPageIndex());
		pager = distributionService.querySelectAll(pager.getPageIndex(), pager.getPageSize());
		map.addAttribute("distributionPager", pager);
		return "distribution/distributionManger";
	}
	
	/**
	 * 添加
	 * @param distribution
	 * @return
	 */
	@RequestMapping("insert")
	public String insert(DistributionInfo distribution){
		if(distributionService.insert(distribution)){
			return "distribution/distributionManger";
		}
		return "error";
	}
	
	/**
	 * 添加Ajax
	 * @param distribution
	 * @return
	 */
	@RequestMapping("insertAjax")
	public @ResponseBody String insertAjax(DistributionInfo distribution){
		if(distributionService.insert(distribution)){
			return "ture";
		}
		return "false";
	}
	
	/**
	 * 查询单个
	 * @param distributionId
	 * @param map
	 * @return
	 */
	public String selectOne(String distributionId,ModelMap map){
		DistributionInfo distribution = distributionService.selectOne(distributionId);
		map.addAttribute("distr", distribution);
		return "distribution/distributionUpdate";
	}
	
	/**
	 * 验收
	 * @return
	 */
	@RequestMapping("updateIsAcceptance")
	public @ResponseBody String updateIsAcceptance(String distributionId, int isAcceptance){
		if(distributionService.updateIsAcceptance(distributionId,isAcceptance)){
			return "true";
		}
		return "false";
	}
}
