package com.fpp.dto.staff;

import lombok.AllArgsConstructor;
import lombok.Data;

@AllArgsConstructor

@Data
public class StaffDto {
	String festivalName;
	String supportPeriod;
	String recruitmentTO;
	String recruitmentField;
	String preferentialTreatment;
	String applicationPeriod;
}
