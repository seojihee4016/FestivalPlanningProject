package com.fpp.dao.festivalDataDao.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.fpp.dao.festivalDataDao.FestivalDataDao;
import com.fpp.dto.festivalData.FestivalDataDto;

public class FestivalDataDaoImpl implements FestivalDataDao{
	
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	
	@Override
	public void festivalDataApiSave(List<FestivalDataDto> requestInfo) {
		
		sqlSessionTemplate.update("festivalData_mapper.updat_festivalDataUpdate", requestInfo);
	}

	
	
	
}
