package com.fpp.dao;

import java.util.List;

import com.fpp.dto.board.BoardDto;

public interface BoardDao {
	// 게시글 작성
	public void write(BoardDto boardDto) throws Exception;

	// 게시글 리스트 조회
	public List<BoardDto> list() throws Exception;
	
	// 게시글 번호로 확인하기
	public BoardDto read(int bno) throws Exception;
	
	// 게시글 수정
	public void update(BoardDto boardDto) throws Exception;
	
	// 게시글 삭제
	public void delete(int bno) throws Exception;
}