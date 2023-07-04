package com.fpp.service.applicationForm;

import java.util.List;

import com.fpp.dto.board.FormDto;
import com.fpp.dto.bulletinBoard.SearchCriteria;

public interface BoardService {
	// 신청 양식 작성
	public void write(FormDto formDto) throws Exception;

	// 신청 양식 리스트 조회
	public List<FormDto> list(SearchCriteria scri) throws Exception;

	//페이지
	public int listCount(SearchCriteria scri) throws Exception ;

	// 신청 양식 번호로 조회
	public FormDto read(int fno) throws Exception;

	// 신청 양식 수정
	public void update(FormDto formDto) throws Exception;

	// 신청 양식 삭제
	public void delete(int fno) throws Exception;

}