package com.pina.jisutay.comments.service;

import javax.servlet.http.HttpServletRequest;

import com.pina.jisutay.comments.dto.CommentsDto;

public interface CommentsService {
	public void getList(HttpServletRequest request);
	public void getCommCommList(HttpServletRequest request);
	public void saveComment(HttpServletRequest request);
	public void saveReComment(HttpServletRequest request);
	public void updateComment(CommentsDto dto);
	public void deleteComment(HttpServletRequest request);
	// 마이페이지에서 내가 쓴 글 출력
	public void getMyCommList(HttpServletRequest request);
	//내가 쓴글 삭제
	public void delete(int num, HttpServletRequest request);
}
