package com.fpp.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fpp.dao.BoardDao;
import com.fpp.dto.board.BoardDto;
import com.fpp.dto.board.FormDto;
import com.fpp.service.BoardService;

@Service
public class BoardServiceImpl implements BoardService {

	@Autowired
	private BoardDao boardDao;

	// 게시글 작성
	@Override
	public void write(FormDto formDto) throws Exception {
		boardDao.write(formDto);
	}

	//게시글 리스트 조회
	@Override
	public List<FormDto> list() throws Exception {
		// TODO Auto-generated method stub
		return boardDao.list();
	}


	// 게시글 번호로 조회
	@Override
	public FormDto read(int fno) throws Exception {

		return boardDao.read(fno);
	}

	//게시글 수정
	@Override
	public void update(FormDto formDto) throws Exception {

		boardDao.update(formDto);
	}
//
//	//게시글 삭제
//	@Override
//	public void delete(int bno) throws Exception {
//
//		boardDao.delete(bno);
//	}
}