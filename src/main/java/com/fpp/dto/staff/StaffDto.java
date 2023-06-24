package com.fpp.dto.staff;

import lombok.AllArgsConstructor;
import lombok.Data;

@AllArgsConstructor

@Data
public class StaffDto {
	String festivalName;			//축제명
	String commissioningAgency;		//의뢰 기관(주최)
	String addressEvent;			//행사 주소
	String place;					//장소 구분 (실내/실외/실내외)
	String startDate;				//행사 시작일
	String endDate;					//행사 종료일
	String recruitmentTO;			//모집인원
	String recruitmentField;		//모집분야
	String preferentialTreatment;	//우대사항
	String applicationPeriod;		//접수기간
	//String supportPeriod;			//지원기간
}
