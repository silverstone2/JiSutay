package com.pina.jisutay.reservation.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.pina.jisutay.exception.NoLoginException;
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

		service.getList(request);
		mav.setViewName("reservation/list");
		return mav;
	}

	@RequestMapping(value = "/reservation/reservationform.do", method = RequestMethod.POST)
	public ModelAndView detail(ModelAndView mav, HttpServletRequest request) {
		// 로그인 예외 처리
		if (request.getSession().getAttribute("id") == null) {
			throw new NoLoginException("/reservation/list.do#contents");
		}

		service.getDetail(request);
		mav.setViewName("reservation/reservationform");
		return mav;
	}

	@RequestMapping("/reservation/reservation")
	public String insert(ReservationDto dto, HttpServletRequest request) {
		// 로그인 예외 처리
		if (request.getSession().getAttribute("id") == null) {
			throw new NoLoginException("/reservation/list.do#contents");
		}

		res_service.addReservation(dto);
		return "redirect:/reservation/list.do";
	}

	@RequestMapping("/reservation/clientlist")
	public ModelAndView list() {
		ModelAndView mView = new ModelAndView();
		res_service.getListReservation(mView);
		return mView;
	}

	@RequestMapping("/reservation/ajaxCheckDate.do")
	@ResponseBody
	public List<Map<String, Object>> checkDate(HttpServletRequest req) {
		List<Map<String, Object>> list = res_service.getCheckDate(req);
		return list;
	}

	// 예약 내역 확인
	@RequestMapping("users/reslist")
	public String getResList(HttpServletRequest req) {

		res_service.getResList(req);
		return "users/reslist";
	}
	// 예약 내역 취소
	 @RequestMapping("/users/resDelete") 
	 public ModelAndView authDelete(@RequestParam int num, HttpServletRequest request) { // 로그인 예외 처리
	 if(request.getSession().getAttribute("id") == null) { 
		 throw new NoLoginException("/home.do"); 
		 }
	  
	 res_service.delete(num, request); 
	 return new ModelAndView("/home");
	 }

}
