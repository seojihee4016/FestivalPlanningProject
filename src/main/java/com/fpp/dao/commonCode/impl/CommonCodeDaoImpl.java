package com.fpp.dao.commonCode.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.fpp.dao.commonCode.CommonCodeDao;
import com.fpp.dto.commonCode.CommonCodeDto;

@Repository
public class CommonCodeDaoImpl implements CommonCodeDao {

	@Autowired
	SqlSessionTemplate sqlSessionTemplate;

	//CommonCode List 조회
	@Override
	public List<CommonCodeDto> selectCommonCodeList() {
		// TODO Auto-generated method stub
		
		List<CommonCodeDto> list = 
				sqlSessionTemplate.selectList("common_code_mapper.select_common_code_list");
		
		return list;
	}
	
}
