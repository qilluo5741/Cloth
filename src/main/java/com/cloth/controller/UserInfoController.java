package com.cloth.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import com.cloth.entity.UserInfo;
import com.cloth.service.IEmpInfoService;
import com.cloth.service.IJurisdictionService;
import com.cloth.service.IUserInfoService;
import com.cloth.util.Pager;

@Controller
@RequestMapping("User")
public class UserInfoController {
	private static final String Error = null;
	@Autowired
	private IUserInfoService IUserService;
	@Autowired
	private IJurisdictionService IJurisService;
	@Autowired
	private IEmpInfoService IempService;
	/*查询全部*/
	@RequestMapping("selectAll")
	public String queryMenuInfo(Pager<UserInfo> pager,ModelMap model){
		//设置显示的条数
		pager.setPageSize(4);
		pager.setPageIndex(pager.getPageIndex());
		//取得总数
		pager=IUserService.selectAll(pager.getPageIndex(), pager.getPageSize());
		model.addAttribute("IUserList", pager);
		//取得集合
		return "user/UserInfoManger";
	}
	/*查询单个*/
	@RequestMapping("selectOneUserInfo")
	public String selectOneMenuInfo(ModelMap model, String userId){
		model.addAttribute("user", IUserService.selectOneUserInfo(userId));
		model.addAttribute("Ijur", IJurisService.getRole());
		if(this.IUserService!=null && this.IJurisService!=null){
			return "user/updateUserInfo";
		}else{
			return Error;
		}
	}
	/*修改*/
	@RequestMapping("updateUserInfo")
	public String updateUserInfo(UserInfo user) {
		if(IUserService.updateUserInfoBy(user)) {
			return "redirect:selectAll.action";
		} else {
			return Error;
		}
	}
	@RequestMapping("selectUserAll")
	public String queryMenuInfoAll(ModelMap model,String userName){
		model.addAttribute("users",IempService.selectAll());
		if(this.IempService!=null){
			return "circles";
		}else{
			return Error;
		}
	}
}
