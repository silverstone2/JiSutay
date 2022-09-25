package com.pina.jisutay.notice.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.web.servlet.ModelAndView;

import com.pina.jisutay.notice.dto.NoticeDto;

@Repository
public class NoticeDaoImpl implements NoticeDao{

	@Autowired
	private SqlSession session;
	
	@Override
	public List<NoticeDto> getList(NoticeDto ndto) {
		
		return session.selectList("notice.getList", ndto);
	}
	//전체 글의 갯수
	@Override
	public int getCount(NoticeDto ndto) {
		
		return session.selectOne("notice.getCount", ndto);
	}
	
	// 새글
	@Override
	public void insert(NoticeDto ndto) {
		
		session.insert("notice.insert", ndto);
	}
	//수정
	@Override
	public void update(NoticeDto ndto) {
		
		session.update("notice.update", ndto);
	}
	//검색 키워드 x
	@Override
	public NoticeDto getData(int num) {
		
		return session.selectOne("notice.getData", num);
	}
	//검색 키워드 O
	@Override
	public NoticeDto getData(NoticeDto ndto) {
		
		return session.selectOne("notice.getData2", ndto);
	}
	//삭제
	@Override
	public void delete(int num) {
		
		session.selectOne("notice.delete", num);
	}
	// 조회수 카운트
	@Override
	public void addViewCount(int num) {

		session.selectOne("notice.views", num);
	}

	
	

}













