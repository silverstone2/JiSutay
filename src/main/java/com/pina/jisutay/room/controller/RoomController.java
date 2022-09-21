package com.pina.jisutay.room.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.pina.jisutay.room.service.RoomService;

@Controller
public class RoomController {
	@Autowired
	private RoomService service;
	
	@RequestMapping("/room/list.do")
	public String getList(HttpServletRequest request) {
		
		service.getList(request);
		
		return "room/list";
	}
	
	@RequestMapping("/room/detail")
	public ModelAndView detail(HttpServletRequest request, ModelAndView mav) {
		service.getDetail(request, mav);
		mav.setViewName("room/detail");
		return mav;
	}
	
}
