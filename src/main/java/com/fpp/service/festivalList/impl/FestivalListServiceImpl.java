package com.fpp.service.festivalList.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fpp.dao.festivalList.FestivalListDao;
import com.fpp.dto.festivalData.FestivalDataDto;
import com.fpp.service.festivalList.FestivalListService;

@Service
public class FestivalListServiceImpl implements FestivalListService{

	@Autowired
	FestivalListDao festivalListDao;
	
	@Override
	public List<FestivalDataDto> loadList() {
		
		List<FestivalDataDto> List = festivalListDao.selectFestivalList();
		
		return List;
	}

	
}