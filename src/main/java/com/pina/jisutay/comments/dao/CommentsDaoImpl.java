package com.pina.jisutay.comments.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.pina.jisutay.comments.dto.CommentsDto;

@Repository
public class CommentsDaoImpl implements CommentsDao {
	@Autowired
	private SqlSession session;
	
}
