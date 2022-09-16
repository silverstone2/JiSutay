package com.pina.jisutay.room.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.pina.jisutay.comments.service.CommentsService;
import com.pina.jisutay.room.service.RoomService;

@Controller
public class RoomController {
	@Autowired
	private RoomService roomService;
	
	@Autowired
	private CommentsService commService;
	
	
	@RequestMapping("/room/list.do")
	public String getList(HttpServletRequest request) {
		
		roomService.getList(request);
		
		return "room/list";
	}
	
	@RequestMapping("/room/detail")
	public String detail(HttpServletRequest request) {
		roomService.getDetail(request);
		
		commService.getList(request);
		return "room/detail";
	}
	
}
