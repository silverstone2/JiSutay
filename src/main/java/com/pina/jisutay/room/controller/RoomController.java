package com.pina.jisutay.room.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.pina.jisutay.comments.service.CommentsService;
import com.pina.jisutay.exception.NoLoginException;
import com.pina.jisutay.room.dto.RoomDto;
import com.pina.jisutay.room.service.RoomService;

@Controller
public class RoomController {
	@Autowired
	private RoomService roomService;
	
	@Autowired
	private CommentsService commService;
	
	@RequestMapping("/room/detail")
	public String detail(HttpServletRequest request) {
		roomService.getDetail(request);
		commService.getList(request);
		return "room/detail";
	}
	
	@RequestMapping("/room/updateform")
	public String updateform(HttpServletRequest req) {
		// 로그인 예외 처리
		if(req.getSession().getAttribute("id") == null) {
			throw new NoLoginException("/room/detail.do,"+req.getParameter("num")+",regdate");
		}
		
		roomService.getDetail(req);
		return "room/updateform";
	}
	
	@RequestMapping(value = "/room/update", method = RequestMethod.POST)
	public String update(RoomDto dto, MultipartHttpServletRequest mtfReq) {
		// 로그인 예외 처리
		if(mtfReq.getSession().getAttribute("id") == null) {
			throw new NoLoginException("/room/detail.do,"+mtfReq.getParameter("num")+",regdate");
		}
		
		roomService.update(dto, mtfReq);
		return "room/update";
	}
}
