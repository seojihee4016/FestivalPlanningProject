package com.fpp.dao.bulletinBoard.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.fpp.dao.bulletinBoard.CommentsDao;
import com.fpp.dto.bulletinBoard.CommentsDto;

@Repository
public class CommentsDaoImpl implements CommentsDao{

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	//댓글 조회
	@Override
	public List<CommentsDto> readCommentsList(int bno) throws Exception {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectList("comments_mapper.read_Comments_List",bno);
	}
	
	//댓글 작성
	@Override
	public void writeReply(CommentsDto commentsDto) throws Exception {
		// TODO Auto-generated method stub
		sqlSessionTemplate.insert("comments_mapper.writeReply", commentsDto);
	}

}
