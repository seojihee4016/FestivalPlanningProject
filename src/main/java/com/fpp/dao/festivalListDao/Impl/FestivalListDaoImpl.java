package com.fpp.dao.festivalListDao.Impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.fpp.dao.festivalListDao.FestivalListDao;
import com.fpp.dto.festivalList.FestivalListDto;

@Repository
public class FestivalListDaoImpl implements FestivalListDao {
	
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	
	@Override
	public List<FestivalListDto> selectFestivalList() {
		
		List<FestivalListDto> List = sqlSessionTemplate.selectList("festivalData_mapper.select_festivalList");
		
		return List;
	}

}
