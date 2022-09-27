package com.pina.jisutay.exception;

import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.servlet.ModelAndView;

@ControllerAdvice
public class ExceptionController {
	@ExceptionHandler(NotAccessInsert.class)
	public ModelAndView noticeInsert(NotAccessInsert e) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("error", e.getMessage());
		mav.setViewName("error/info");
		return mav;
	}
	
	@ExceptionHandler(NoLoginException.class)
	public ModelAndView loginException(NoLoginException e) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("url", e.getMessage());
		mav.setViewName("error/info");
		return mav;
	}
}
