package com.pina.jisutay.notice.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.pina.jisutay.notice.service.NoticeService;

@Controller
public class NoticeController {

	@Autowired
	private NoticeService service;
	
	@RequestMapping("notice/list")
	public ModelAndView getList(ModelAndView mav) {
		
		service.getList(mav);
		mav.setViewName("notice/list");
		return mav;
	}
	
	@RequestMapping("notice/detail")
	public ModelAndView detail(ModelAndView mav, int num) {
		
		service.detail(mav, num);
		mav.setViewName("notice/detail");
		return mav;
	}
}
