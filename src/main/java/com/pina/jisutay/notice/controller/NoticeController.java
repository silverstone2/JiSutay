package com.pina.jisutay.notice.controller;


import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.pina.jisutay.notice.dto.NoticeDto;
import com.pina.jisutay.notice.service.NoticeService;

@Controller
public class NoticeController {

	@Autowired
	private NoticeService service;
	//공지사항 목록
	@RequestMapping("notice/list")
	public String getList(HttpServletRequest req) {
		
		service.getList(req);
		return "notice/list";
	}
	//공지사항 세부내용
	@RequestMapping("notice/detail")
	public ModelAndView detail(ModelAndView mav, int num) {
		
		service.detail(mav, num);
		mav.setViewName("notice/detail");
		return mav;
	}
	// 새글
	@RequestMapping("notice/insert")
	public String insert(NoticeDto ndto, HttpServletRequest req) {
		System.out.println(ndto.getContent());
		service.insert(ndto, req);
		return "redirect:/notice/list.do";
	}
	//새글 폼
	@RequestMapping("notice/insertForm")
	public ModelAndView insertForm(ModelAndView mav) {
		
		mav.setViewName("notice/insertForm");
		return mav;
	}
	// 공지 수정
	@RequestMapping(value="notice/update", method=RequestMethod.POST)
	public String update(NoticeDto ndto, HttpServletRequest req) {
		
		service.update(ndto, req);
		return "redirect:/notice/list.do";
	}
	// 공지 수정폼
	@RequestMapping("notice/updateForm")
	public ModelAndView updateForm(HttpServletRequest req) {
		service.getData(req);
		return new ModelAndView("notice/updateForm");
	}
	// 공지 삭제
	@RequestMapping("notice/delete") 
	public ModelAndView delete(@RequestParam int num, HttpServletRequest request) {
		
		service.delete(num, request);
		return new ModelAndView("redirect:/notice/list.do");
	}
}
