package com.pina.jisutay.comments.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
		List<CommentsDto> list = new ArrayList<CommentsDto>();
		
		if(dto.getSort().equals("regdate")) {
			list = session.selectList("comments.getListRegdate", dto);
		} else if(dto.getSort().equals("highScore")) {
			list = session.selectList("comments.getListHighScore", dto);
		} else if(dto.getSort().equals("lowScore")) {
			list = session.selectList("comments.getListLowScore", dto);
		}
		return list;
	}
	
	@Override
	public Map<String, Object> getAllScore(int room_num) {
		Map<String, Object> map = new HashMap<String, Object>();
		
		double sumScore = session.selectOne("comments.getScoreSum", room_num);
		int allCount = session.selectOne("comments.getAllCount", room_num);
		
		map.put("sumScore", sumScore);
		map.put("allCount", allCount);
		return map;
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
	public CommentsDto getData(CommentsDto dto) {
		return session.selectOne("comments.getData", dto);
	}
}
