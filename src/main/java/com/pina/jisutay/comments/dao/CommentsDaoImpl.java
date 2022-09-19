package com.pina.jisutay.comments.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.pina.jisutay.comments.dto.CommentsDto;

@Repository
public class CommentsDaoImpl implements CommentsDao {
	@Autowired
	private SqlSession session;

	
	@Override
	public void insert(CommentsDto dto) {
		session.insert("comments.insert", dto);
	}

	@Override
	public List<CommentsDto> getList(CommentsDto dto) {
		return session.selectList("comments.getList", dto);
	}

	@Override
	public List<Integer> getCommCommCount(CommentsDto dto) {
		return session.selectList("comments.getCommCommCount", dto);
	}
	
	@Override
	public List<CommentsDto> getCommCommList(CommentsDto dto) {
		return session.selectList("comments.getCommCommList", dto);
	}

	@Override
	public int getSequence() {
		return session.selectOne("comments.getSequence");
	}

	@Override
	public int getCount(int room_num) {
		return session.selectOne("comments.getCount", room_num);
	}

	@Override
	public void update(CommentsDto dto) {
		session.update("comments.update", dto);
	}

	@Override
	public void delete(int num) {
		session.update("comments.delete", num);
	}

	@Override
	public CommentsDto getData(int num) {
		return session.selectOne("comments.getData",num);
	}
}
