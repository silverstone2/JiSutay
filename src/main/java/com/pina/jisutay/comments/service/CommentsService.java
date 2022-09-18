package com.pina.jisutay.comments.service;

import javax.servlet.http.HttpServletRequest;

public interface CommentsService {
	public void getList(HttpServletRequest request);
	public void getCommCommList(HttpServletRequest request);
	public void saveComment(HttpServletRequest request);
	public void deleteComment(HttpServletRequest request);
}
