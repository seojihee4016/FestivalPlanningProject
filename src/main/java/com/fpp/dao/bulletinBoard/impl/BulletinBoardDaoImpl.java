package com.fpp.dao.bulletinBoard.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.fpp.dao.bulletinBoard.BulletinBoardDao;
import com.fpp.dto.bulletinBoard.BulletinBoardDto;
import com.fpp.dto.staff.StaffDto;

@Repository
public class BulletinBoardDaoImpl implements BulletinBoardDao{

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	@Override
	public void insertBulletinBoard(BulletinBoardDto bulletinBoardDto) throws Exception {
		// TODO Auto-generated method stub
		sqlSessionTemplate.insert("bulletinBoard_mapper.insertBulletinBoard",bulletinBoardDto);
	}

	// 게시물 목록 조회
	@Override
	public List<BulletinBoardDto> selectBulletinBoardList() throws Exception {
		return sqlSessionTemplate.selectList("bulletinBoard_mapper.select_BulletinBoard_List");
	}
	
}
