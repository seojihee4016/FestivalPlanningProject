package com.fpp.dto.staff;

import lombok.AllArgsConstructor;
import lombok.Data;

@AllArgsConstructor

@Data
public class StaffApplyDto {
	Integer SRNO;					//스탭 모집 공고 고유 번호
	Integer SRANO;					//스탭 신청 양식 고유 번호
	String supportPeriodStart;		//지원기간 시작일
	String supportPeriodEnd;		//지원기간 종료일
	String recruitmentField;		//모집분야
	String id;
}