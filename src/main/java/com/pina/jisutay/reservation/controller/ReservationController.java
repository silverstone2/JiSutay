package com.pina.jisutay.reservation.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.pina.jisutay.reservation.dto.ReservationDto;
import com.pina.jisutay.reservation.service.ReservationService;
import com.pina.jisutay.room.service.RoomService;

@Controller
public class ReservationController {
	@Autowired
	private RoomService service;
	
	@Autowired
	private ReservationService res_service;
	
	@RequestMapping("/reservation/list.do")
	public String getList(HttpServletRequest request, ReservationDto dto) {
		
		service.getList(request);
		return "reservation/list";
	}
		
	@RequestMapping("/reservation/list")
	public ModelAndView detail(HttpServletRequest request, ModelAndView mav, ReservationDto dto) {
		
		service.getDetail(request, mav);
		mav.setViewName("reservation/list");
		return mav;
	}
	
	@RequestMapping(value="/reservation/reservationform.do", method=RequestMethod.POST)
	public ModelAndView detail(ModelAndView mav, HttpServletRequest request) {
		
		service.getDetail(request, mav);
		mav.setViewName("reservation/reservationform");
		return mav;
	}
	
//	@RequestMapping("/reservation/reservation")
//	public String insert() {
//		return "reservation/reservation";
//	}
	
	@RequestMapping("/reservation/reservation")
	public ModelAndView insert(ReservationDto dto) {
		res_service.addReservation(dto);
		return new ModelAndView("reservation/reservation");
	}
	
	@RequestMapping("/reservation/clientlist")
	public ModelAndView list() {
		ModelAndView mView = new ModelAndView();
		res_service.getListReservation(mView);
		return mView;
	}


}
