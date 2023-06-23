package com.fpp.dao.festivalDataDao.impl;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.fpp.dao.festivalDataDao.FestivalDataDao;
import com.fpp.dto.festivalData.FestivalDataDto;

@Repository
public class FestivalDataDaoImpl implements FestivalDataDao{
	
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	
	@Override
	public int festivalDataApiSave(FestivalDataDto item) {
		
		int i = sqlSessionTemplate.insert("festivalData_mapper.merge_festivalDataUpdate", item);
		
		
		return i;
	}

	
	
	
}
