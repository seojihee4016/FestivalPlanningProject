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
		return sqlSessionTemplate.selectList("comments_mapper.read_comments_List",bno);
	}

	//댓글 작성
	@Override
	public void writeComments(CommentsDto commentsDto) throws Exception {
		// TODO Auto-generated method stub
		sqlSessionTemplate.insert("comments_mapper.write_comments", commentsDto);
	}

	//댓글 수정
	@Override
	public void updateCommentsByCno(CommentsDto commentsDto) throws Exception {
		// TODO Auto-generated method stub

		sqlSessionTemplate.update("comments_mapper.update_comments_by_cno", commentsDto);
	}

	//댓글 삭제
	@Override
	public void deleteReply(CommentsDto commentsDto) throws Exception {
		// TODO Auto-generated method stub
		sqlSessionTemplate.delete("comments_mapper.deleteReply", commentsDto);
	}

	//선택된 댓글 조회
	@Override
	public CommentsDto selectReply(int cno) throws Exception {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectOne("comments_mapper.selectReply", cno);
	}

}
