package com.pina.jisutay.comments.dao;

import java.util.List;
import java.util.Map;

import com.pina.jisutay.comments.dto.CommentsDto;

public interface CommentsDao {
	public void insert(CommentsDto dto);
	public List<CommentsDto> getList(CommentsDto dto);
	public Map<String, Object> getAllScore(int room_num);
	public List<Integer> getCommCommCount(CommentsDto dto);
	public List<CommentsDto> getCommCommList(CommentsDto dto);
	public CommentsDto getData(CommentsDto dto);
	public int getSequence();
	public int getCount(int room_num);
	public void update(CommentsDto dto);
	public void delete(int num);
	// 마이페이지 내가 쓴 글 전체 출력
	public List<CommentsDto> getMyList(CommentsDto dto);
	// 마이페이지 내가 쓴 글 삭제
	public void commDelete(int num);
}
