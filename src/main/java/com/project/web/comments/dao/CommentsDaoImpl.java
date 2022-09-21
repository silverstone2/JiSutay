package com.project.web.comments.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.web.comments.dto.CommentsDto;

@Repository
public class CommentsDaoImpl implements CommentsDao {
	@Autowired
	private SqlSession session;
	
}
