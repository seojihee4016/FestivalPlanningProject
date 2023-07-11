package com.fpp.dto.board;

import java.util.Date;

import lombok.Data;

@Data
public class FormDto {
	private int fno;
	private String writer;
	private String festivalName;
	private String place;
	private String addressEvent;
	private String carryingDifficulty;
	private String numberOfPeople;
	private String startDate;
	private String endDate;
	private String budgetRange;
	private String commissioningAgency;
	private String name;
	private String secret; // 공개 / 비공개 여부
}

