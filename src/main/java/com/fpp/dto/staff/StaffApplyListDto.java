package com.fpp.dto.staff;

import lombok.AllArgsConstructor;
import lombok.Data;

@AllArgsConstructor

@Data
public class StaffApplyListDto {
	String festivalName;
	String addressEvent;
	String place;
	String id;
	String supportPeriodStart;
	String supportPeriodEnd;
	String codeName;
}
