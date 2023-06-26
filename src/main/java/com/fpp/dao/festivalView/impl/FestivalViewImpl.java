package com.fpp.dao.festivalView.impl;


import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.fpp.dao.festivalView.FestivalViewDao;
import com.fpp.dto.festivalData.FestivalDataDto;

@Repository
public class FestivalViewImpl implements FestivalViewDao{

	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	
	@Override
	public FestivalDataDto selectFestivalDetailInfo(String code) {
		
		
		FestivalDataDto detailData = sqlSessionTemplate.selectOne("festivalData_mapper.select_festivalDetailInfo",code);
		
		return detailData;
	}

}
