package com.fpp.dao.applicationForm.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.fpp.dao.applicationForm.BoardDao;
import com.fpp.dto.board.FormDto;
import com.fpp.dto.bulletinBoard.SearchCriteria;

@Repository
public class BoardDaoImpl implements BoardDao{
	@Autowired
	private SqlSession sqlSession;
	SqlSessionTemplate sessionTemplate;

	// 신청 양식 작성
	@Override
	public void write(FormDto formDto) throws Exception {
		sqlSession.insert("board_mapper.insert", formDto);
	}

	// 신청 양식 리스트 조회
	@Override
	public List<FormDto> list(SearchCriteria scri) throws Exception {
		// TODO Auto-generated method stub

		return sqlSession.selectList("board_mapper.listPage" ,scri);
	}

	//페이징 - 개시물 총 개수
	@Override
	public int listCount(SearchCriteria scri) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("board_mapper.listCount" , scri);
	}

	// 신청 양식 번호로 조회
	@Override
	public FormDto read(int fno) throws Exception {

		return sqlSession.selectOne("board_mapper.read", fno);
	}

	// 신청 양식 수정
	@Override
	public void update(FormDto formDto) throws Exception {

		int a = sqlSession.update("board_mapper.update", formDto);
		System.out.println(a);
	}

	// 신청 양식 삭제
	@Override
	public void delete(int fno) throws Exception {

		sqlSession.delete("board_mapper.delete", fno);
	}

	@Override
	public List<FormDto> list2() throws Exception {
		List<FormDto> list2 = sqlSession.selectList("board_mapper.list");
		return list2;
	}

}