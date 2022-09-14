package com.pina.jisutay.users.service;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.servlet.ModelAndView;

import com.pina.jisutay.users.dto.UsersDto;

public interface UsersService {
	// 회원가입 기능 서비스
	public Map<String, Boolean> checkId(String id);
	public void addUser(UsersDto dto);
	
	// 로그인 기능 서비스
	public void checkUser(UsersDto dto, ModelAndView mav, HttpServletRequest req);
	
	// 로그아웃 기능 서비스
	public void logout(HttpServletRequest req);
}
