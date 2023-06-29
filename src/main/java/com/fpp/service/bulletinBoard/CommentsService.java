package com.fpp.service.bulletinBoard;

import java.util.List;

import com.fpp.dto.bulletinBoard.CommentsDto;

public interface CommentsService {

	//댓글 목록 조회 
	public List<CommentsDto> readCommentsList(int bno) throws Exception;
	
	//댓글 작성
	public void writeReply(CommentsDto commentsDto) throws Exception;
	
}
