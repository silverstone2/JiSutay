package com.pina.jisutay.comments.service;

import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

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
		final int  PAGE_DISPLAY_COUNT = 5;
		
		int pageNum=1;
		if(request.getParameter("pageNum") != null) {
			pageNum = Integer.parseInt(request.getParameter("pageNum"));
		}
		// 보여줄 페이지의 ROW 번호
		int startRowNum=1+(pageNum-1)*PAGE_ROW_COUNT;
		int endRowNum=pageNum*PAGE_ROW_COUNT;
		
		// 하단 페이지 번호
		int startPageNum = 1 + ((pageNum-1)/PAGE_DISPLAY_COUNT)*PAGE_DISPLAY_COUNT;
		int endPageNum=startPageNum+PAGE_DISPLAY_COUNT-1;
		
		CommentsDto commentsDto=new CommentsDto();
		
		int room_num = Integer.parseInt(request.getParameter("num"));
		String sort = request.getParameter("sort");
		commentsDto.setRoom_num(room_num); 
		commentsDto.setStartRowNum(startRowNum);
		commentsDto.setEndRowNum(endRowNum);
		commentsDto.setSort(sort);
		
		// 한 페이지에 해당하는 댓글 목록만 select 되도록 한다.
		List<CommentsDto> commentsList=dao.getList(commentsDto);
		
		//원글의 글번호를 이용해서 댓글 전체의 갯수를 얻어낸다.
		int totalRow=dao.getCount(room_num);
		//댓글 전체 페이지의 갯수
		int totalPageCount=(int)Math.ceil(totalRow/(double)PAGE_ROW_COUNT);
		
		if(endPageNum > totalPageCount){
			endPageNum = totalPageCount;
		}
		
		List<Integer> countList = dao.getCommCommCount(commentsDto);
		for(int i=0; i<countList.toArray().length; i++) {
			int count = countList.get(i);
			commentsList.get(i).setCommCount(count);
		}
		
		// 전체 후기 데이터의 score 가져오기
		Map<String, Object> map = dao.getAllScore(room_num);
		
		// 숫자에 콤마 붙이는 format
		DecimalFormat decFormat = new DecimalFormat("###,###");
		String allCount = decFormat.format(map.get("allCount"));

		request.setAttribute("commentsList", commentsList);
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("startPageNum", startPageNum);
		request.setAttribute("endPageNum", endPageNum);
		request.setAttribute("totalPageCount", totalPageCount);
		request.setAttribute("sumScore", map.get("sumScore"));
		request.setAttribute("allCount", allCount);
	}
	
	@Override
	public void getCommCommList(HttpServletRequest request) {
		int num = Integer.parseInt(request.getParameter("num"));
		int comment_num = Integer.parseInt(request.getParameter("comment_num"));
		
		CommentsDto commentsDto = new CommentsDto();
		commentsDto.setRoom_num(num);
		commentsDto.setComment_num(comment_num);
		
		List<CommentsDto> commentsList = dao.getCommCommList(commentsDto);
		request.setAttribute("commentsList", commentsList);
	}

	@Override
	public void saveComment(HttpServletRequest request) {
		int room_num=Integer.parseInt(request.getParameter("room_num"));	// 객실 번호
		String target_id=request.getParameter("target_id");	// 답글의 대상
		String content=request.getParameter("content");	// 후기 내용
		// comment_num 은 후기에서는 전송 X 답글에서만 전송 >> null 여부 조사
		String comment_num=request.getParameter("comment_num");	// 댓글 번호
		String writer=(String)request.getSession().getAttribute("id"); //후기 작성자 확인
		Double score = null;
		int seq=dao.getSequence();
		CommentsDto dto=new CommentsDto();
		dto.setNum(seq);
		dto.setWriter(writer);
		dto.setTarget_id(target_id);
		dto.setContent(content);
		dto.setRoom_num(room_num);
		if(request.getParameter("score") != null) {
			score = Double.parseDouble(request.getParameter("score"));
			dto.setScore(score);
		} // 별점
		
		if(comment_num==null) { // comment_num 은 후기(일반댓글)에서는 전송 X
			dto.setComment_num(seq);
		} else {
			dto.setComment_num(Integer.parseInt(comment_num));
		}
		dao.insert(dto);
	}
	
	@Override
	public void saveReComment(HttpServletRequest request) {
		int room_num=Integer.parseInt(request.getParameter("room_num"));	// 객실 번호
		String target_id=request.getParameter("target_id");	// 답글의 대상
		String content=request.getParameter("content");	// 후기 내용
		// comment_num 은 후기에서는 전송 X 답글에서만 전송 >> null 여부 조사
		String comment_num=request.getParameter("comment_num");	// 댓글 번호
		String writer=(String)request.getSession().getAttribute("id"); //후기 작성자 확인
		Double score = null;
		int seq=dao.getSequence();
		CommentsDto dto=new CommentsDto();
		dto.setNum(seq);
		dto.setWriter(writer);
		dto.setTarget_id(target_id);
		dto.setContent(content);
		dto.setRoom_num(room_num);
		if(request.getParameter("score") != null) {
			score = Double.parseDouble(request.getParameter("score"));
			dto.setScore(score);
		} // 별점
		
		if(comment_num==null) { // comment_num 은 후기(일반댓글)에서는 전송 X
			dto.setComment_num(seq);
		} else {
			dto.setComment_num(Integer.parseInt(comment_num));
		}
		dao.insert(dto);
		
		// ajax로 뿌려줄 DTO 하나만 들어있는 List
		List<CommentsDto> commentsList = new ArrayList<CommentsDto>();
		commentsList.add(dao.getData(dto));
		request.setAttribute("commentsList", commentsList);
	}

	@Override
	public void deleteComment(HttpServletRequest request) {
		int num=Integer.parseInt(request.getParameter("num"));
//		삭제할 댓글 정보를 읽어와서 글 작성자와 로그인된 아이디와 일치하지 않으면
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

