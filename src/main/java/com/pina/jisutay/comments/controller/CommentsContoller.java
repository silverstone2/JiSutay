package com.pina.jisutay.comments.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.pina.jisutay.comments.dto.CommentsDto;
import com.pina.jisutay.comments.service.CommentsService;

@Controller
public class CommentsContoller {
	@Autowired
	private CommentsService service;
}
