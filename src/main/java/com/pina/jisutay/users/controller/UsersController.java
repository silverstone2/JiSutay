package com.pina.jisutay.users.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class UsersController {
	@RequestMapping("/users/signupform.do")
	public String signupform() {
		return "users/signupform";
	}
}
