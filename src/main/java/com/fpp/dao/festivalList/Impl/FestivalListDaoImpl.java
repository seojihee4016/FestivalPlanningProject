package com.fpp.dao.festivalList.Impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.fpp.dao.festivalList.FestivalListDao;
import com.fpp.dto.festivalData.FestivalDataDto;

@Repository
public class FestivalListDaoImpl implements FestivalListDao {
	
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	
	@Override
	public List<FestivalDataDto> selectFestivalList() {
		
		List<FestivalDataDto> List = sqlSessionTemplate.selectList("festivalData_mapper.select_festivalList");
		
		return List;
	}

}
