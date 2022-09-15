package com.pina.jisutay.reservation.controller;

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
	
	@Autowired
	private ReservationService service1;
	
	@RequestMapping("/reservation/list")
	public ModelAndView list(ModelAndView mView) {
		service.getListMember(mView);
		mView.setViewName("reservation/list");
		return mView;
	}

}
