package com.pina.jisutay.users.service;

import java.security.NoSuchAlgorithmException;
import java.util.Map;

import javax.crypto.NoSuchPaddingException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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
	// --------------------------------------------
	// 마이페이지 정보 가져오기
	public void getInfo(HttpSession session, ModelAndView mView);
	// 패스워드 변경 서비스
	public void updateUserPwd(HttpSession session, UsersDto dto, ModelAndView mView, HttpServletRequest request);
	// 개인정보 삭제
	public void deleteUser(HttpSession session, ModelAndView mView);
	// 개인정보 수정
	public void updateUser(UsersDto dto, HttpSession session);	
}
