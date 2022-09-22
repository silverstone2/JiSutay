package com.pina.jisutay.notice.dao;

import java.util.List;

import com.pina.jisutay.notice.dto.NoticeDto;

public interface NoticeDao {
	
	public List<NoticeDto> getList();// 글 목록

	public NoticeDto getData(int num);
	
}
