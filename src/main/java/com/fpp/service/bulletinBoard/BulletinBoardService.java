package com.fpp.service.bulletinBoard;

import java.util.List;

import com.fpp.dto.board.FormDto;
import com.fpp.dto.bulletinBoard.BulletinBoardDto;
import com.fpp.dto.bulletinBoard.Criteria;
import com.fpp.dto.bulletinBoard.SearchCriteria;

public interface BulletinBoardService {
	// 게시글 작성
	public void insertBulletinBoard(BulletinBoardDto  bulletinBoardDto) throws Exception;

	// 게시물 목록 조회
	public List<BulletinBoardDto> selectBulletinBoardList(SearchCriteria scri) throws Exception;
	
	//페이지
	public int listCount(SearchCriteria scri) throws Exception ;

	// 게시글 번호로 조회
	public BulletinBoardDto selectBulletinBoardListByBno(int bno) throws Exception;

	// 게시글 수정
	public void updateBulletinBoard(BulletinBoardDto  bulletinBoardDto) throws Exception;
	
	// 게시글 삭제
	public void deleteBulletinBoardByBno(int bno) throws Exception;
}
