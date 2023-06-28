package com.fpp.dto.staff;

import lombok.AllArgsConstructor;
import lombok.Data;

@AllArgsConstructor

@Data
public class StaffApplyDto {
	String SRNO;			//스탭 모집 공고 고유 번호
	String SRANO;			//스탭 신청 양식 고유 번호
	String supportPeriodStart; 
	String supportPeriodEnd;
	String recruitmentField;		//모집분야
	String id;
}