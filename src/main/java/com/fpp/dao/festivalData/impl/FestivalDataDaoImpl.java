package com.fpp.dao.festivalData.impl;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.fpp.dao.festivalData.FestivalDataDao;
import com.fpp.dto.festivalData.FestivalDataDto;

@Repository
public class FestivalDataDaoImpl implements FestivalDataDao{
	
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	
	@Override
	public int festivalDataApiSave(FestivalDataDto festivalDataDto) {
		
		System.out.println(festivalDataDto);
		sqlSessionTemplate.insert("festivalData_mapper.merge_festivalDataUpdate", festivalDataDto);
		
		
		return 1;
	}

	
	
	
}
