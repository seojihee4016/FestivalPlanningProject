package com.fpp.dao.bulletinBoard;

import java.util.List;

import com.fpp.dto.board.FormDto;
import com.fpp.dto.bulletinBoard.BulletinBoardDto;
import com.fpp.dto.bulletinBoard.CommentsDto;
import com.fpp.dto.bulletinBoard.Criteria;
import com.fpp.dto.bulletinBoard.SearchCriteria;

public interface BulletinBoardDao {
	// 게시글 작성
	public void insertBulletinBoard(BulletinBoardDto bulletinBoardDto) throws Exception;

	// 게시물 목록 조회 - 페이지네이션 추가 후
	public List<BulletinBoardDto> selectBulletinBoardList(SearchCriteria scri) throws Exception;
	
	//게시글 페이지네이션 카운트 - 총 개수
	public int listCount(SearchCriteria scri) throws Exception;

	// 게시글 번호로 확인하기
	public BulletinBoardDto selectBulletinBoardListByBno(int bno) throws Exception;

	// 게시글 수정
	public void updateBulletinBoard(BulletinBoardDto bulletinBoardDto) throws Exception;

	// 게시글 삭제
	public void deleteBulletinBoardByBno(int bno) throws Exception;
	
}
