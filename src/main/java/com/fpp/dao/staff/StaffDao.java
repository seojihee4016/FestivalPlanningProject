package com.fpp.dao.staff;

import java.util.List;

import com.fpp.dto.staff.StaffApplyDto;
import com.fpp.dto.staff.StaffDto;

public interface StaffDao {
	public int insertStaff(StaffDto staffDto);
	
	public List<StaffDto> selectStaffRecruitmentList();
	
	public List<StaffDto> selectStaffRecruitmentListByFestivalName(String festivalName);
	
	public int insertStaffApply(StaffApplyDto staffApplyDto);
	
}
