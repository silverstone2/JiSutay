package com.pina.jisutay.notice.dao;

import java.util.List;

import org.springframework.web.servlet.ModelAndView;

import com.pina.jisutay.notice.dto.NoticeDto;

public interface NoticeDao {
	// 글 정보 얻어오기
	public NoticeDto getData(int num);
	// 글 목록
	public List<NoticeDto> getList(NoticeDto ndto);
	// 조회수 증가 시키기
	public void addViewCount(int num);
	// 새글 작성
	public void insert(NoticeDto ndto);
	// 글 수정
	public void update(NoticeDto ndto);
	// 글 삭제
	public void delete(int num);
	//글의 갯수
	public int getCount(NoticeDto ndto);
	
	


	
}
