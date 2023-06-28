package com.fpp.dao.bulletinBoard;

import java.util.List;

import com.fpp.dto.bulletinBoard.BulletinBoardDto;

public interface BulletinBoardDao {
	// 게시글 작성
	public void insertBulletinBoard(BulletinBoardDto bulletinBoardDto) throws Exception;
	
	// 게시물 목록 조회
	public List<BulletinBoardDto> selectBulletinBoardList() throws Exception;
}
