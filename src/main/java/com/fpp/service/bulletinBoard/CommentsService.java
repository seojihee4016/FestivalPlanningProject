package com.fpp.service.bulletinBoard;

import java.util.List;

import com.fpp.dto.bulletinBoard.CommentsDto;

public interface CommentsService {

	//댓글 목록 조회 
	public List<CommentsDto> readCommentsList(int bno) throws Exception;
	
	//댓글 작성
	public void writeComments(CommentsDto commentsDto) throws Exception;
	
	//댓글 수정
	public void updateCommentsByCno(CommentsDto commentsDto) throws Exception;
	
	//댓글 삭제
	public void deleteReply(CommentsDto commentsDto) throws Exception;
	
	//선택된 댓글 조회
	public CommentsDto selectReply(int cno) throws Exception ;
}
