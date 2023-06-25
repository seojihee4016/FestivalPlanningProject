package com.fpp.dto.staff;

import lombok.AllArgsConstructor;
import lombok.Data;

@AllArgsConstructor

@Data
public class StaffDto {
	String festivalName;			//축제 이름
	String commissioningAgency;		//운영 기관(주최)
	String addressEvent;			//축제 주소
	String place;					//장소 구분(실내/실외/실내외)
	String startDate;				//시작 일자
	String endDate;					//종료 일자
	String recruitmentTO;			//모집인원
	String recruitmentField;		//모집분야
	String preferentialTreatment;	//우대사항
	String applicationPeriod;		//접수기간
}
