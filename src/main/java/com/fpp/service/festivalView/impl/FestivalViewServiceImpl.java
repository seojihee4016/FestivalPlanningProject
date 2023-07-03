package com.fpp.service.festivalView.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fpp.dao.festivalView.FestivalViewDao;
import com.fpp.dto.festivalData.FestivalDataDto;
import com.fpp.service.festivalView.FestivalViewService;

@Service
public class FestivalViewServiceImpl implements FestivalViewService{
	
	@Autowired
	FestivalViewDao festivalViewDao;
	
	@Override
	public FestivalDataDto loadDetailInfo(String code) {
		
		FestivalDataDto detailInfo = festivalViewDao.selectFestivalDetailInfo(code);
		
		return detailInfo;
	}

}
