package com.pina.jisutay.comments.service;

import javax.servlet.http.HttpServletRequest;

import com.pina.jisutay.comments.dto.CommentsDto;

public interface CommentsService {
	public void getList(HttpServletRequest request);
	public void getCommCommList(HttpServletRequest request);
	public void saveComment(HttpServletRequest request);
	public void updateComment(CommentsDto dto);
	public void deleteComment(HttpServletRequest request);
}
