package com.pina.jisutay.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.pina.jisutay.users.service.UsersService;

public class LoginInterceptor extends HandlerInterceptorAdapter {
	@Autowired
	private UsersService service;
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		service.authSessionId(request);
		
		return true;
	}
}
