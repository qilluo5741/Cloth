package com.cloth.controller;
 
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
 
import com.cloth.entity.TestInfo;
import com.cloth.service.ITestService;
@Controller
@RequestMapping("add")
public class TestController  {
	@Autowired
	private ITestService service;
	@RequestMapping("test")
	public String login(ModelMap mp){
		TestInfo test=new TestInfo("","zhngsan");
		service.addTest(test);
		return "index";
	}

}
