package com.fpp.dao.festivalListDao;

import java.util.List;

import com.fpp.dto.FestivalList.FestivalListDto;

public interface FestivalListDao {
	public List<FestivalListDto> selectFestivalList();
}
