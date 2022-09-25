package com.pina.jisutay.notice.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.servlet.ModelAndView;

import com.pina.jisutay.notice.dto.NoticeDto;

public interface NoticeService {

	public void getList(HttpServletRequest req);

	public void detail(ModelAndView mav, int num);

	public void insert(NoticeDto ndto, HttpServletRequest req);
	
	public void update(NoticeDto ndto, HttpServletRequest req);

	public void getData(HttpServletRequest req);

	public void delete(int num, HttpServletRequest request);

}
