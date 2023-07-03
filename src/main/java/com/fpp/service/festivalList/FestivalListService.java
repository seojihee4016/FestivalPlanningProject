package com.fpp.service.festivalList;

import java.util.List;

import com.fpp.dto.festivalData.FestivalDataDto;

public interface FestivalListService {
	public List<FestivalDataDto> loadList();
}
