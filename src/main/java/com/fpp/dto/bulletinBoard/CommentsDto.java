package com.fpp.dto.bulletinBoard;

import java.util.Date;

import lombok.Data;
import lombok.ToString;

@Data
@ToString
public class CommentsDto {
	private int bno;
	private int cno;
	private String content;
	private String writer;
	private Date regdate;
}
