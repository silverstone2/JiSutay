package com.pina.jisutay.comments.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.pina.jisutay.comments.dto.CommentsDto;
import com.pina.jisutay.comments.service.CommentsService;

@Controller
public class CommentsContoller {
	@Autowired
	private CommentsService service;
	
	@RequestMapping("/room/comment_insert")
	public ModelAndView authCommentInsert(HttpServletRequest request, 
			@RequestParam int room_num) {
		service.saveComment(request);
		
		return new ModelAndView("redirect:/room/detail.do?num="+room_num);
	}

	@RequestMapping("/room/comment_update")
	@ResponseBody
	public Map<String, Object> authCommentUpdate(CommentsDto dto, HttpServletRequest request){
		service.updateComment(dto);
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("isSuccess", true);
		return map;
	}
	
	@RequestMapping("/room/comment_delete")
	@ResponseBody
	public Map<String, Object> authCommentDelete(HttpServletRequest request) {
		service.deleteComment(request);
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("isSuccess", true);
		return map;
	}
}
