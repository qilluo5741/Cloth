package com.cloth.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

public class UserLoginInterceptor implements HandlerInterceptor{
	public void afterCompletion(HttpServletRequest arg0,
			HttpServletResponse arg1, Object arg2, Exception arg3)
			throws Exception {
	}
	public void postHandle(HttpServletRequest request, HttpServletResponse response,
			Object obj, ModelAndView model) throws Exception {
	}
	//验证是否登录
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response,
			Object obj) throws Exception {
		String url = request.getRequestURI();
		HttpSession session = request.getSession();
		if(url.contains("user/login.action")){
			return true;
		}
		//已经登录
		if(session.getAttribute("user") != null){
			return true;
		}
		//request.getRequestDispatcher("/login.jsp").forward(request, response);
		//return false;
		return true;
	}
}
