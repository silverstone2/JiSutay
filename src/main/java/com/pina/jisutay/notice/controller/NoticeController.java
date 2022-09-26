package com.pina.jisutay.notice.controller;


import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.pina.jisutay.exception.NoLoginException;
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
		// 로그인 예외 처리
		if(req.getSession().getAttribute("id") == null) {
			throw new NoLoginException("/notice/list.do");
		}
		
		System.out.println(ndto.getContent());
		service.insert(ndto, req);
		return "redirect:/notice/list.do";
	}
	//새글 폼
	@RequestMapping("notice/insertForm")
	public ModelAndView insertForm(ModelAndView mav, HttpServletRequest req) {
		// 로그인 예외 처리
		if(req.getSession().getAttribute("id") == null) {
			throw new NoLoginException("/notice/list.do");
		}
		
		mav.setViewName("notice/insertForm");
		return mav;
	}
	// 공지 수정
	@RequestMapping(value="notice/update", method=RequestMethod.POST)
	public String update(NoticeDto ndto, HttpServletRequest req) {
		// 로그인 예외 처리
		if(req.getSession().getAttribute("id") == null) {
			throw new NoLoginException("/notice/list.do");
		}
		
		service.update(ndto, req);
		return "redirect:/notice/list.do";
	}
	// 공지 수정폼
	@RequestMapping("notice/updateForm")
	public ModelAndView updateForm(HttpServletRequest req) {
		// 로그인 예외 처리
		if(req.getSession().getAttribute("id") == null) {
			throw new NoLoginException("/notice/list.do");
		}
		
		service.getData(req);
		return new ModelAndView("notice/updateForm");
	}
	// 공지 삭제
	@RequestMapping("notice/delete") 
	public ModelAndView delete(@RequestParam int num, HttpServletRequest req) {
		// 로그인 예외 처리
		if(req.getSession().getAttribute("id") == null) {
			throw new NoLoginException("/notice/list.do");
		}
		
		service.delete(num, req);
		return new ModelAndView("redirect:/notice/list.do");
	}
}
