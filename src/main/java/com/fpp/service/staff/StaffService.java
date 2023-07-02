package com.fpp.service.staff;

import java.util.List;

import com.fpp.dto.staff.StaffApplyDto;
import com.fpp.dto.staff.StaffDto;

public interface StaffService {
	
	public int recruitmentStaff(StaffDto staffDto);
	
	public List<StaffDto> getStaffRecruitmentList();
	
	public List<StaffDto> getStaffRecruitmentListByFestivalName(String festivalName);
	
	public int staffRecruitmentApply(StaffApplyDto staffApplyDto);
	
}
