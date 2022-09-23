package com.pina.jisutay;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.pina.jisutay.comments.service.CommentsService;
import com.pina.jisutay.room.service.RoomService;


@Controller
public class HomeController {
	@Autowired
	private RoomService roomService;
	@Autowired
	private CommentsService commService;
	
	@RequestMapping("/home.do")
	public String home(HttpServletRequest request) {
		roomService.getList(request);
		return "home";
	}

	@RequestMapping("/detail")
	public String detail(HttpServletRequest request) {
		roomService.getDetail(request);
		commService.getList(request);
		return "room/detail";
	}
}
