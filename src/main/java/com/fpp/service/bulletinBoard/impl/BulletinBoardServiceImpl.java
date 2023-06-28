package com.fpp.service.bulletinBoard.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fpp.dao.bulletinBoard.BulletinBoardDao;
import com.fpp.dto.bulletinBoard.BulletinBoardDto;
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
	@Override
	public List<BulletinBoardDto> selectBulletinBoardList() throws Exception {

		return bulletinBoardDao.selectBulletinBoardList();
	}
}
