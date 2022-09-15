package com.pina.jisutay.comments.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pina.jisutay.comments.dao.CommentsDao;
import com.pina.jisutay.comments.dto.CommentsDto;

@Service
public class CommentsServiceImpl implements CommentsService {
	@Autowired
	private CommentsDao dao;
}
