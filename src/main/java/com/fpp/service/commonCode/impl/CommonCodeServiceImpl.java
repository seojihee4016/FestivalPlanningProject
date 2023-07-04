package com.fpp.service.commonCode.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fpp.dao.commonCode.CommonCodeDao;
import com.fpp.dto.commonCode.CommonCodeDto;
import com.fpp.service.commonCode.CommonCodeService;

@Service
public class CommonCodeServiceImpl implements CommonCodeService {

	@Autowired
	CommonCodeDao commonCodeDao;
	
	//CommonCode List 조회
	@Override
	public List<CommonCodeDto> getCommonCodeList() {
		// TODO Auto-generated method stub
		
		List<CommonCodeDto> list = commonCodeDao.selectCommonCodeList();
		
		return list;
	}

}
