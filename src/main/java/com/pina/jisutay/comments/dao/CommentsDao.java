package com.pina.jisutay.comments.dao;

import java.util.List;

import com.pina.jisutay.comments.dto.CommentsDto;

public interface CommentsDao {
	
	public void insert(CommentsDto dto);
	public List<CommentsDto> getList(CommentsDto dto);
	public CommentsDto getData(int num);
	public int getSequence();
	public int getCount(int room_num);
	public void update(CommentsDto dto);
	public void delete(int num);
}
