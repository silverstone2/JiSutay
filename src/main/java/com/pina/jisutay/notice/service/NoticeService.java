package com.pina.jisutay.notice.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.servlet.ModelAndView;

import com.pina.jisutay.notice.dto.NoticeDto;

public interface NoticeService {

	public void getList(ModelAndView mav);

	public void detail(ModelAndView mav, int num);
}
