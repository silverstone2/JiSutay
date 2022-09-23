package com.pina.jisutay.users.service;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCrypt;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.pina.jisutay.users.dao.UsersDao;
import com.pina.jisutay.users.dto.UsersDto;

@Service
public class UsersServiceImpl implements UsersService {
	@Autowired
	private UsersDao dao;
	
	// 회원가입 기능 서비스
	@Override
	public void addUser(UsersDto dto) {
		String password = dto.getPassword();
		
		BCryptPasswordEncoder encoder=new BCryptPasswordEncoder();
		String encodedPwd=encoder.encode(password);
		
		dto.setPassword(encodedPwd);
		dao.insert(dto);
	}

	@Override
	public Map<String, Boolean> checkId(String id) {
		UsersDto dto = dao.checkId(id);
		Map<String, Boolean> result = new HashMap<String, Boolean>();
		
		if(dto == null) {
			result.put("isExist", false);
		} else {
			result.put("isExist", true);
		}
		
		return result;
	}

	
	// 로그인 기능 서비스
	@Override
	public void checkUser(UsersDto dto, ModelAndView mav, HttpServletRequest req) {
		String id = dto.getId();
		String password = dto.getPassword();
		Boolean isValid = false;
		
		UsersDto savedDto = dao.checkId(id);
		HttpSession session = req.getSession();
		System.out.println(password);
		if(savedDto != null && password != "") {
			String encodedPwd = savedDto.getPassword();
			
			isValid=BCrypt.checkpw(password, encodedPwd);
		} else {
			session.setAttribute("isFail", true);
			mav.setViewName("redirect:/users/loginform.do");
			return;
		}
		
		if(isValid) {
			session.removeAttribute("isFail");
			session.setAttribute("id", id);
			mav.setViewName("redirect:/home.do");
		} else {
			session.setAttribute("isFail", true);
			mav.setViewName("redirect:/users/loginform.do");
		}
	}

	// 로그아웃 기능 서비스
	@Override
	public void logout(HttpServletRequest req) {
		HttpSession session = req.getSession();
		session.removeAttribute("id");
	}

}
