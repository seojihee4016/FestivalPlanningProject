package com.fpp.dao.festivalView;

import com.fpp.dto.festivalData.FestivalDataDto;

public interface FestivalViewDao {
	public FestivalDataDto selectFestivalDetailInfo(String code);
}
