package com.fpp.service.applicationForm.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fpp.dao.applicationForm.BoardDao;
import com.fpp.dto.board.FormDto;
import com.fpp.dto.bulletinBoard.SearchCriteria;
import com.fpp.service.applicationForm.BoardService;

@Service
public class BoardServiceImpl implements BoardService {

	@Autowired
	private BoardDao boardDao;

	// 신청 양식 작성
	@Override
	public void write(FormDto formDto) throws Exception {
		boardDao.write(formDto);
	}

	//신청 양식 리스트 조회
	@Override
	public List<FormDto> list(SearchCriteria scri) throws Exception {
		// TODO Auto-generated method stub
		return boardDao.list(scri);
	}

	//페이지네이션 게시물 총 개수
	@Override
	public int listCount(SearchCriteria scri) throws Exception {
		// TODO Auto-generated method stub
		return boardDao.listCount(scri);
	}

	// 신청 양식 번호로 조회
	@Override
	public FormDto read(int fno) throws Exception {

		return boardDao.read(fno);
	}

	//신청 양식 수정
	@Override
	public void update(FormDto formDto) throws Exception {

		boardDao.update(formDto);
	}

	//신청 양식 삭제
	@Override
	public void delete(int fno) throws Exception {

		boardDao.delete(fno);
	}
}