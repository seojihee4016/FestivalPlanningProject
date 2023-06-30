package com.fpp.service.bulletinBoard.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fpp.dao.bulletinBoard.CommentsDao;
import com.fpp.dto.bulletinBoard.CommentsDto;
import com.fpp.service.bulletinBoard.CommentsService;

@Service
public class CommentsServiceImpl implements CommentsService{

	@Autowired
	private CommentsDao commentsDao;
	
	//댓글 목록 조회 
	@Override
	public List<CommentsDto> readCommentsList(int bno) throws Exception {
		// TODO Auto-generated method stub
		return commentsDao.readCommentsList(bno);
	}

	//댓글 작성
	@Override
	public void writeReply(CommentsDto commentsDto) throws Exception {
		// TODO Auto-generated method stub
		commentsDao.writeReply(commentsDto);
	}

}
