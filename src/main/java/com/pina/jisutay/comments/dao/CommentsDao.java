package com.pina.jisutay.comments.dao;

import java.util.List;

import com.pina.jisutay.comments.dto.CommentsDto;

public interface CommentsDao {
	
	public void insert(CommentsDto dto);
	
	public List<CommentsDto> getList(CommentsDto dto);
	public int getSequence();
	public int getCount(int ref_group);
	
	public void update(CommentsDto dto);
	
	public void delete(int num);
}
