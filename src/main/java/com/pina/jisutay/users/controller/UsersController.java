package com.pina.jisutay.users.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.pina.jisutay.exception.NoLoginException;
import com.pina.jisutay.reservation.service.ReservationService;
import com.pina.jisutay.users.dto.UsersDto;
import com.pina.jisutay.users.service.UsersService;

@Controller
public class UsersController {
	@Autowired
	private UsersService service;
	
	@Autowired
	private ReservationService res_service;
	
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
	public String loginform(HttpServletRequest req) {
		service.autoLoginFlag(req);
		return "users/loginform";
	}
	
	@RequestMapping("/users/login.do")
	public ModelAndView login(UsersDto dto, ModelAndView mav, HttpServletRequest req, HttpServletResponse res) {
		service.checkUser(dto, mav, req, res);
		return mav;
	}
	
	// 로그아웃 기능
	@RequestMapping("/users/logout.do")
	public String logout(HttpServletRequest req, HttpServletResponse res) {
		service.logout(req, res);
		return "redirect:/home.do";
	}
	//-------------------------------------------------------
	// 마이페이지 패스워드 변경
	@RequestMapping("/users/pwd_update")
	public ModelAndView authPwdUpdate(UsersDto dto, 
			ModelAndView mView, HttpSession session, HttpServletRequest request) {
		//서비스에 필요한 객체의 참조값을 전달해서 비밀번호 수정 로직을 처리한다.
		service.updateUserPwd(session, dto, mView, request);
		//view page 로 forward 이동해서 작업 결과를 응답한다.
		mView.setViewName("users/pwd_update");
		return mView;
	}
	
	@RequestMapping("/users/pwd_updateform")
	public ModelAndView authPwdUpdateForm(ModelAndView mView, HttpServletRequest request) {
		mView.setViewName("users/pwd_updateform");
		return mView;
	}
	// ---------------------------
	// 마이페이지 값 가져오기
	@RequestMapping("/users/info")
	public ModelAndView authInfo(HttpSession session, ModelAndView mView, 
			HttpServletRequest request) {
		
		service.getInfo(session, mView);
		
		mView.setViewName("users/info");
		return mView;
	}
	
	//개인정보 수정 반영 요청 처리
	@RequestMapping(value = "/users/info_update", method=RequestMethod.POST)
	@RequestMapping(value = "/users/update", method=RequestMethod.POST)
	public ModelAndView authUpdate(UsersDto dto, HttpSession session, ModelAndView mView,
			 HttpServletRequest request) {
		//서비스를 이용해서 개인정보를 수정하고 
		service.updateUser(dto, session);
		mView.setViewName("/users/info_update");
		//개인정보 보기로 리다일렉트 이동 시킨다
		return mView;
	}
		mView.setViewName("redirect:/users/info.do");
		//개인정보 보기로 리다일렉트 이동 시틴다
		return mView;
	}

	//회원정보 수정폼 요청처리
	@RequestMapping("/users/info_updateform")
	public ModelAndView authUpdateForm(ModelAndView mView, HttpSession session,
			HttpServletRequest request) {
		service.getInfo(session, mView);
		mView.setViewName("users/info_updateform");
		return mView;
	}

	//회원 탈퇴 요청 처리
	@RequestMapping("/users/delete")
	public ModelAndView authDelete(HttpSession session, ModelAndView mView,
		HttpServletRequest request) {
		
		service.deleteUser(session, mView);
		
		mView.setViewName("users/delete");
		return mView;
	}
}



