package com.fpp.dao.festivalDataDao;

import java.util.List;

import com.fpp.dto.festivalData.FestivalDataDto;

public interface FestivalDataDao {
	public void festivalDataApiSave(List<FestivalDataDto> requestInfo);
}
