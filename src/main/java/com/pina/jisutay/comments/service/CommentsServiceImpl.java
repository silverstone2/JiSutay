package com.pina.jisutay.comments.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pina.jisutay.comments.dao.CommentsDao;
import com.pina.jisutay.comments.dto.CommentsDto;

@Service
public class CommentsServiceImpl implements CommentsService {
	@Autowired
	private CommentsDao dao;

	@Override
	public void getList(HttpServletRequest request) {
		
		final int PAGE_ROW_COUNT=10;
		int pageNum=1;
		int startRowNum=1+(pageNum-1)*PAGE_ROW_COUNT;
		int endRowNum=pageNum*PAGE_ROW_COUNT;
		
		CommentsDto commentsDto=new CommentsDto();
		commentsDto.setRoom_num(1); //일단 임시로 1 넣어둠
		commentsDto.setStartRowNum(startRowNum);
		commentsDto.setEndRowNum(endRowNum);
		//1페이지에 해당하는 댓글 목록만 select 되도록 한다. 
		List<CommentsDto> commentList=dao.getList(commentsDto);
		//원글의 글번호를 이용해서 댓글 전체의 갯수를 얻어낸다.
		int totalRow=dao.getCount(1); //임시로 1 넣어둠
		//댓글 전체 페이지의 갯수
		int totalPageCount=(int)Math.ceil(totalRow/(double)PAGE_ROW_COUNT);
		
		request.setAttribute("commentsList", commentList);
		request.setAttribute("totalRow", totalRow);
		request.setAttribute("totalPageCount", totalPageCount);
		
	}
}
