package com.project.web.comments.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.project.web.comments.dto.CommentsDto;
import com.project.web.comments.service.CommentsService;

@Controller
public class CommentsContoller {
	@Autowired
	private CommentsService service;
}
