package com.pina.jisutay.users.service;

import java.security.NoSuchAlgorithmException;
import java.util.Map;

import javax.crypto.NoSuchPaddingException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;

import com.pina.jisutay.users.dto.UsersDto;

public interface UsersService {
	// 회원가입 기능 서비스
	public Map<String, Boolean> checkId(String id);
	public void addUser(UsersDto dto);
	
	// 로그인 기능 서비스
	public void checkUser(UsersDto dto, ModelAndView mav, HttpServletRequest req, HttpServletResponse res);
	
	// 로그아웃 기능 서비스
	public void logout(HttpServletRequest req, HttpServletResponse res);
	
	// sessionId와 DB sessionId 검증 후, 자동 로그인 처리
	public void authSessionId(HttpServletRequest req) throws NoSuchAlgorithmException, NoSuchPaddingException;
	
	public void autoLoginFlag(HttpServletRequest req);
}
