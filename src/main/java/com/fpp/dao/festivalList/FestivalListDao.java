package com.fpp.dao.festivalList;

import java.util.List;

import com.fpp.dto.festivalData.FestivalDataDto;


public interface FestivalListDao {
	public List<FestivalDataDto> selectFestivalList();
}
