package com.fpp.dto.staff;

import lombok.AllArgsConstructor;
import lombok.Data;

@AllArgsConstructor

@Data
public class StaffApplyDto {
	String festivalName;			//축제 이름
//	String supportPeriod;			//지원기간
	String supportPeriodStart; 
	String supportPeriodEnd;
	String recruitmentField;		//모집분야
//	String id;
}