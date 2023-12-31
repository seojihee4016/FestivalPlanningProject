package com.fpp.dao.bulletinBoard.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.fpp.dao.bulletinBoard.BulletinBoardDao;
import com.fpp.dto.board.FormDto;
import com.fpp.dto.bulletinBoard.BulletinBoardDto;
import com.fpp.dto.bulletinBoard.Criteria;
import com.fpp.dto.bulletinBoard.SearchCriteria;


@Repository
public class BulletinBoardDaoImpl implements BulletinBoardDao{

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	@Override
	public void insertBulletinBoard(BulletinBoardDto bulletinBoardDto) throws Exception {
		// TODO Auto-generated method stub
		sqlSessionTemplate.insert("bulletinBoard_mapper.insertBulletinBoard",bulletinBoardDto);
	}

	// 게시물 목록 조회 - 페이지네이션 포함	
	@Override
	public List<BulletinBoardDto> selectBulletinBoardList(SearchCriteria scri) throws Exception {
		return sqlSessionTemplate.selectList("bulletinBoard_mapper.listPage" ,scri);
	}
	
	//페이징 - 개시물 총 개수
	@Override
	public int listCount(SearchCriteria scri) throws Exception {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectOne("bulletinBoard_mapper.listCount" , scri);
	}


	// 게시글 번호로 조회
	@Override
	public BulletinBoardDto selectBulletinBoardListByBno(int bno) throws Exception {

		return sqlSessionTemplate.selectOne("bulletinBoard_mapper.select_BulletinBoard_List_By_Bno", bno);
	}

	//게시글 수정
	@Override
	public void updateBulletinBoard(BulletinBoardDto bulletinBoardDto) throws Exception {
		// TODO Auto-generated method stub
		int a = sqlSessionTemplate.update("bulletinBoard_mapper.update_BulletinBoard", bulletinBoardDto);
	}

	@Override
	public void deleteBulletinBoardByBno(int bno) throws Exception {
		// TODO Auto-generated method stub

		sqlSessionTemplate.delete("bulletinBoard_mapper.delete_BulletinBoard_By_Bno", bno);
	}


	

}
