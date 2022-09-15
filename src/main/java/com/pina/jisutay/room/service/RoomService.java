package com.pina.jisutay.room.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.servlet.ModelAndView;

public interface RoomService {
	public void getList(HttpServletRequest request);
	public void getDetail(int num, ModelAndView mav);
}
