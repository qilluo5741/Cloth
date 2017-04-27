package com.cloth.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.cloth.entity.EmpInfo;
import com.cloth.entity.PositionInfo;
import com.cloth.service.IEmpInfoService;
import com.cloth.service.IPositionInfoService;
import com.cloth.util.Pager;

@Controller
@RequestMapping("emp")
public class EmpController {
	
	@Autowired
	private IEmpInfoService empService;
	@Autowired
	private IPositionInfoService posService;

	/**
	 * 查询单个
	 * */
	@RequestMapping("selectOne")
	public String selectOne(ModelMap model, String empId, String a) {
		model.addAttribute("emp", empService.selectOne(empId));
		if(a.equals("1")) {
			return "emp/empUpdateLow";
		} else {
			model.addAttribute("posList", posService.queryAllPositionInfo());
			return "emp/empUpdateHigh";
		}
	}
	
	/**
	 * 查询所有
	 * */
	@RequestMapping("selectAll")
	public String selectAll(ModelMap model) {
		model.addAttribute("empList", empService.selectAll());
		return "emp/empIndex";
	}
	
	/**
	 * 分页查询所有
	 * */
	@RequestMapping("selectAllByPager")
	public String selectAllByPager(ModelMap model,Pager<EmpInfo> pager) {
		pager.setPageSize(5);
		pager.setPageIndex(pager.getPageIndex());
		pager = empService.selectAllByPager(pager.getPageIndex(), pager.getPageSize());
		model.addAttribute("pager", pager);
		return "emp/empIndex";
	}
	
	/**
	 * 添加单个
	 * */
	@SuppressWarnings("deprecation")
	@RequestMapping(value="insertOne", method = RequestMethod.POST) 
	public String insertOne(EmpInfo emp,@RequestParam(value = "imgEmp", required = false)MultipartFile imgEmp,HttpServletRequest request) throws IllegalStateException, IOException {
		//在将photoFile文件写入到服务器的文件目录
		if(imgEmp != null){
			//得到需要上传的文件名
			String fileName = imgEmp.getOriginalFilename();
			//写入到指定的目录（E:\images\Desert.jpg）
			String newFileName = request.getRealPath("/")+"/images/"+fileName.substring(fileName.lastIndexOf("."));
			//创建图片上传到服务器上之后的文件
			File file = new File(newFileName);
			//将photoFile写入到file
			imgEmp.transferTo(file);
			emp.setEmpPhoto(file.getName());
		}
		if(empService.insertOne(emp)) {
			return "redirect:selectAllByPager.action";
		} else {
			return "error";
		}
	}
	
	/**
	 * 添加前的查询
	 * */
	@RequestMapping("insertOneBefore")
	public String insertOneBefore(ModelMap model) {
		model.addAttribute("posList", posService.queryAllPositionInfo());
		return "emp/empAdd";
	}
	
	/**
	 * 查询所有职位  返回Ajax
	 * */
	@RequestMapping("selectPostionAjax")
	public @ResponseBody List<PositionInfo> selectPostionAjax() {
		List<PositionInfo> list = posService.queryAllPositionInfo();
		return list;
	}
	/**
	 * 修改单个（基本资料）
	 * */
	@SuppressWarnings("deprecation")
	@RequestMapping(value="updateOneLow", method = RequestMethod.POST)
	public String updateOneLow(EmpInfo emp,@RequestParam(value = "imgEmp", required = false)MultipartFile imgEmp,HttpServletRequest request) throws IllegalStateException, IOException  {
		//在将photoFile文件写入到服务器的文件目录
		if(imgEmp != null){
			//得到需要上传的文件名
			String fileName = imgEmp.getOriginalFilename();
			//写入到指定的目录（E:\images\Desert.jpg）
			String newFileName = request.getRealPath("/")+"/images/"+fileName.substring(fileName.lastIndexOf("."));
			//创建图片上传到服务器上之后的文件
			File file = new File(newFileName);
			//将photoFile写入到file
			imgEmp.transferTo(file);
			emp.setEmpPhoto(file.getName());
		}
		if(empService.updateOneLow(emp)) {
			return "redirect:selectAllByPager.action";
		} else {
			return "error";
		}
	}
	
	/**
	 * 修改单个（高级资料）
	 * */
	@RequestMapping("updateOneHigh")
	public String updateOneHigh(EmpInfo emp) {
		if(empService.updateOneHigh(emp)) {
			return "redirect:selectAllByPager.action";
		} else {
			return "error";
		}
	}
	
	/**
	 * 修改单个（修改就职状态）
	 * */
	@RequestMapping("updateOneByStatus")
	public String updateOneByStatus(String empId,int isServing) {
		
		System.out.println("sdfsdfsdf:"+empId);
		if(empService.updateOneByStatus(empId, isServing)) {
			return "redirect:selectAllByPager.action";
		} else {
			return "error";
		}
	}
}
