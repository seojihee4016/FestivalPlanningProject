package com.fpp.service.festivalList.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fpp.dao.festivalListDao.FestivalListDao;
import com.fpp.dto.FestivalList.FestivalListDto;
import com.fpp.service.festivalList.FestivalListService;

@Service
public class FestivalListServiceImpl implements FestivalListService{

	@Autowired
	FestivalListDao festivalListDao;
	
	@Override
	public List<FestivalListDto> lodeList() {
		
		List<FestivalListDto> List = festivalListDao.selectFestivalList();
		
		return List;
	}

	
}