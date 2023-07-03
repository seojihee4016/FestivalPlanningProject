package com.fpp.dao.commonCode;

import java.util.List;

import com.fpp.dto.commonCode.CommonCodeDto;

public interface CommonCodeDao {
	//CommonCode List 조회
	public List<CommonCodeDto> selectCommonCodeList();
}
