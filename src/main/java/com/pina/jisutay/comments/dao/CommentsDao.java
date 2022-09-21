package com.pina.jisutay.comments.dao;

import java.util.List;

import com.pina.jisutay.comments.dto.CommentsDto;

public interface CommentsDao {
	public void insert(CommentsDto dto);
	public List<CommentsDto> getList(CommentsDto dto);
	public List<Integer> getCommCommCount(CommentsDto dto);
	public List<CommentsDto> getCommCommList(CommentsDto dto);
	public CommentsDto getData(CommentsDto dto);
	public int getSequence();
	public int getCount(int room_num);
	public void update(CommentsDto dto);
	public void delete(int num);
}
