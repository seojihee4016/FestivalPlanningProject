package com.fpp.dao;

import java.util.List;

import com.fpp.dto.board.BoardDto;
import com.fpp.dto.board.FormDto;

public interface BoardDao {
	// 게시글 작성
	public void write(FormDto formDto) throws Exception;
	
	// 게시글 리스트 조회
	public List<FormDto> list() throws Exception;
	
	// 게시글 번호로 확인하기
	public FormDto read(int fno) throws Exception;
	
	// 게시글 수정
	public void update(FormDto formDto) throws Exception;

//	// 게시글 삭제
//	public void delete(int fno) throws Exception;
}