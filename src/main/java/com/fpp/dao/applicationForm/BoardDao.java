package com.fpp.dao.applicationForm;

import java.util.List;

import com.fpp.dto.board.FormDto;

public interface BoardDao {
	// 신청 양식 작성
	public void write(FormDto formDto) throws Exception;
	
	// 신청 양식 리스트 조회
	public List<FormDto> list() throws Exception;
	
	// 신청 양식 번호로 확인하기
	public FormDto read(int fno) throws Exception;
	
	// 신청 양식 수정
	public void update(FormDto formDto) throws Exception;

	// 신청 양식 삭제
	public void delete(int fno) throws Exception;
}