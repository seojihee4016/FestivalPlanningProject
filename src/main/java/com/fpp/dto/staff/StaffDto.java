package com.fpp.dto.staff;

import lombok.AllArgsConstructor;
import lombok.Data;

@AllArgsConstructor

@Data
public class StaffDto {
	String SRNO;					//스탭 모집 공고 고유 번호
	String recruitmentTO;			//모집인원
	String recruitmentField;		//모집분야
	String preferentialTreatment;	//우대사항
	String applicationPeriod;		//접수기간
}
