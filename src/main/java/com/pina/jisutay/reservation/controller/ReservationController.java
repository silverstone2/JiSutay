package com.pina.jisutay.reservation.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.pina.jisutay.reservation.service.ReservationService;
import com.pina.jisutay.room.service.RoomService;

@Controller
public class ReservationController {
	@Autowired
	private RoomService service;
	
	@RequestMapping("/reservation/list.do")
	public String getList(HttpServletRequest request) {
		
		service.getList(request);
		
		return "reservation/list";
	}
	


}
