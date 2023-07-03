package com.fpp.dto.bulletinBoard;

import java.util.Date;

import lombok.Data;

@Data
public class BulletinBoardDto {
	private int bno;
	private String typeOfInquiry;
	private String title;
	private String content;
	private String writer;
	private Date regdate;
}
