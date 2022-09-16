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
		
		System.out.println("num : "+request.getParameter("num"));
		
		final int PAGE_ROW_COUNT=10;
		int pageNum=1;
		if(request.getParameter("pageNum") != null) {
			pageNum = Integer.parseInt(request.getParameter("pageNum"));
		}
		int startRowNum=1+(pageNum-1)*PAGE_ROW_COUNT;
		int endRowNum=pageNum*PAGE_ROW_COUNT;
		
		CommentsDto commentsDto=new CommentsDto();
		
		int num = Integer.parseInt(request.getParameter("num"));
		commentsDto.setRoom_num(num); //일단 임시로 1 넣어둠
		commentsDto.setStartRowNum(startRowNum);
		commentsDto.setEndRowNum(endRowNum);
		//1페이지에 해당하는 댓글 목록만 select 되도록 한다. 
		List<CommentsDto> commentsList=dao.getList(commentsDto);
		
		System.out.println("댓글 번호 : "+commentsList.get(0).getNum());
		System.out.println("작성자 : "+commentsList.get(0).getWriter());
		System.out.println("작성일 : "+commentsList.get(0).getRegdate());
		System.out.println("참조 댓글 번호 : "+commentsList.get(0).getComment_num());
		
		//원글의 글번호를 이용해서 댓글 전체의 갯수를 얻어낸다SELE.
		int totalRow=dao.getCount(num); //임시로 1 넣어둠
		//댓글 전체 페이지의 갯수
		int totalPageCount=(int)Math.ceil(totalRow/(double)PAGE_ROW_COUNT);
		
		request.setAttribute("commentsList", commentsList);
		request.setAttribute("totalRow", totalRow);
		request.setAttribute("totalPageCount", totalPageCount);
	}
}
