package com.pina.jisutay.travel.dao;

import java.util.List;

import com.pina.jisutay.travel.dto.TravelDto;

public interface TravelDao {
	
	public List<TravelDto> getList();
	public void insert(TravelDto dto);
	public TravelDto getData(int num);
	public void update(TravelDto dto);
	
}
