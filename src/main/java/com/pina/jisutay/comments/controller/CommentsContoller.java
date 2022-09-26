package com.pina.jisutay.comments.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.pina.jisutay.comments.dto.CommentsDto;
import com.pina.jisutay.comments.service.CommentsService;
import com.pina.jisutay.exception.NoLoginException;

@Controller
public class CommentsContoller {
	@Autowired
	private CommentsService service;
	
	@RequestMapping(value="/room/comment_insert", method=RequestMethod.POST)
	public ModelAndView commentInsert(HttpServletRequest request, 
			@RequestParam int room_num) {
		service.saveComment(request);
		return new ModelAndView("redirect:/room/detail.do?num="+room_num+"&sort=regdate#review");
	}
	
	@RequestMapping("/room/re_comment_insert")
	public String ajaxReCommentInsert(HttpServletRequest request) {
		service.saveReComment(request);
		return "room/ajax_commComment_list";
	}

	@RequestMapping("/room/comment_delete")
	@ResponseBody
	public Map<String, Object> authCommentDelete(HttpServletRequest request) {
		// 로그인 예외 처리
		if(request.getSession().getAttribute("id") == null) {
			throw new NoLoginException("/room/detail.do,"+request.getParameter("room_num")+",regdate");
		}
		
		service.deleteComment(request);
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("isSuccess", true);
		return map;
	}
	
	@RequestMapping("/room/ajax_comments.do")
	public String ajaxCommentsList(HttpServletRequest request) {
		service.getList(request);
		return "room/ajax_comment_list";
	}
	
	@RequestMapping("/room/ajax_commComments.do")
	public String ajaxCommCommList(HttpServletRequest request) {
		service.getCommCommList(request);
		return "room/ajax_commComment_list";
	}
	
	@RequestMapping("/room/comment_update")
	@ResponseBody
	public Map<String, Object> authCommentUpdate(CommentsDto dto, HttpServletRequest request){
		service.updateComment(dto);
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("isSuccess", true);
		System.out.println("업데이트 수행");
		return map;
	}
}
