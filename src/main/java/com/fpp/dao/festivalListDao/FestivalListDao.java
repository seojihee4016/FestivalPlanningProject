package com.fpp.dao.festivalListDao;

import java.util.List;

import com.fpp.dto.festivalList.FestivalListDto;

public interface FestivalListDao {
	public List<FestivalListDto> selectFestivalList();
}
