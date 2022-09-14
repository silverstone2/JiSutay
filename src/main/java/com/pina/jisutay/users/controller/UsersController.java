package com.pina.jisutay.users.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.pina.jisutay.users.dto.UsersDto;
import com.pina.jisutay.users.service.UsersService;

@Controller
public class UsersController {
	@Autowired
	private UsersService service;
	
	// 회원 가입 기능
	@RequestMapping("/users/signupform.do")
	public String signupform() {
		return "users/signupform";
	}
	
	@RequestMapping("/users/private/checkId.do")
	@ResponseBody
	public Map<String, Boolean> checkId(@RequestParam String id) {
		return service.checkId(id);
	}
	
	@RequestMapping("/users/signup.do")
	public String signup(UsersDto dto) {
		service.addUser(dto);
		return "users/signup";
	}
	
	
	// 로그인 기능
	@RequestMapping("/users/loginform.do")
	public String loginform() {
		return "users/loginform";
	}
	
	@RequestMapping("/users/login.do")
	public ModelAndView login(UsersDto dto, ModelAndView mav, HttpServletRequest req) {
		service.checkUser(dto, mav, req);
		return mav;
	}
	
	
	// 로그아웃 기능
	@RequestMapping("/users/logout.do")
	public String logout(HttpServletRequest req) {
		service.logout(req);
		return "redirect:/home.do";
	}
}
