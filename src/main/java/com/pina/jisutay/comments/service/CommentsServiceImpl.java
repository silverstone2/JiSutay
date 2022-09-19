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
		commentsDto.setRoom_num(num); 
		commentsDto.setStartRowNum(startRowNum);
		commentsDto.setEndRowNum(endRowNum);
		//1페이지에 해당하는 댓글 목록만 select 되도록 한다. 
		List<CommentsDto> commentsList=dao.getList(commentsDto);
		
//		System.out.println("댓글 번호 : "+commentsList.get(0).getNum());
//		System.out.println("작성자 : "+commentsList.get(0).getWriter());
//		System.out.println("작성일 : "+commentsList.get(0).getRegdate());
//		System.out.println("참조 댓글 번호 : "+commentsList.get(0).getComment_num());
		
		//원글의 글번호를 이용해서 댓글 전체의 갯수를 얻어낸다.
		int totalRow=dao.getCount(num);
		//댓글 전체 페이지의 갯수
		int totalPageCount=(int)Math.ceil(totalRow/(double)PAGE_ROW_COUNT);
		

		request.setAttribute("commentsList", commentsList);
		request.setAttribute("totalRow", totalRow);
		request.setAttribute("totalPageCount", totalPageCount);
	}

	@Override
	public void saveComment(HttpServletRequest request) {
		int room_num=Integer.parseInt(request.getParameter("room_num"));
		String target_id=request.getParameter("target_id");
		String content=request.getParameter("content");
		// comment_num 은 후기에서는 전송 X 답글에서만 전송 >> null 여부 조사
		String comment_num=request.getParameter("comment_num");
		String writer=(String)request.getSession().getAttribute("id"); //후기 작성자 확인
		int seq=dao.getSequence();
		CommentsDto dto=new CommentsDto();
		dto.setNum(seq);
		dto.setWriter(writer);
		dto.setContent(content);
		dto.setRoom_num(room_num);
		dto.setScore(5); //임시
		
		if(comment_num==null) { // comment_num 은 후기(일반댓글)에서는 전송 X
			dto.setComment_num(seq);
		} else {
			dto.setComment_num(Integer.parseInt(comment_num));
		}
		dao.insert(dto);
	}

	@Override
	public void deleteComment(HttpServletRequest request) {
		int num=Integer.parseInt(request.getParameter("num"));
		// 여기까진 num 들어옴.
		//삭제할 댓글 정보를 읽어와서 
		//글 작성자와 로그인된 아이디와 일치하지 않으면
//		CommentsDto dto=dao.getData(num);
//		String id=(String)request.getSession().getAttribute("id");
//		if(!dto.getWriter().equals(id)) {
//			throw new NotDeleteException("남의 댓글 지우면 혼난당!");
//		}
		// 예외처리 나중에
		
		dao.delete(num);
		
	}

	@Override
	public void updateComment(CommentsDto dto) {
		dao.update(dto);
	}	
	
	
}

