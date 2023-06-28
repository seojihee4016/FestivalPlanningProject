package com.fpp.service.bulletinBoard.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fpp.dao.bulletinBoard.BulletinBoardDao;
import com.fpp.dto.board.FormDto;
import com.fpp.dto.bulletinBoard.BulletinBoardDto;
import com.fpp.dto.bulletinBoard.Criteria;
import com.fpp.dto.staff.StaffDto;
import com.fpp.service.bulletinBoard.BulletinBoardService;

@Service
public class BulletinBoardServiceImpl implements BulletinBoardService{

	@Autowired
	BulletinBoardDao bulletinBoardDao;

	//게시글 작성
	@Override
	public void insertBulletinBoard(BulletinBoardDto bulletinBoardDto) throws Exception {
		// TODO Auto-generated method stub
		bulletinBoardDao.insertBulletinBoard(bulletinBoardDto);
	}

	// 게시물 목록 조회
//	@Override
//	public List<BulletinBoardDto> selectBulletinBoardList() throws Exception {
//
//		return bulletinBoardDao.selectBulletinBoardList();
//	}
	
	@Override
	public List<BulletinBoardDto> selectBulletinBoardList(Criteria cri) throws Exception {

		return bulletinBoardDao.selectBulletinBoardList(cri);
	}
	
	//페이징
	@Override
	public int listCount() throws Exception {
		// TODO Auto-generated method stub
		return bulletinBoardDao.listCount();
	}

	
	
	//게시글 고유 번호로 조회
	@Override
	public BulletinBoardDto selectBulletinBoardListByBno(int bno) throws Exception {
		// TODO Auto-generated method stub
		return bulletinBoardDao.selectBulletinBoardListByBno(bno);
	}

	//게시글 수정
	@Override
	public void updateBulletinBoard(BulletinBoardDto bulletinBoardDto) throws Exception {
		// TODO Auto-generated method stub
		bulletinBoardDao.updateBulletinBoard(bulletinBoardDto);
	}
	
	//게시글 삭제
	@Override
	public void deleteBulletinBoardByBno(int bno) throws Exception {
		// TODO Auto-generated method stub
		bulletinBoardDao.deleteBulletinBoardByBno(bno);
	}

}
