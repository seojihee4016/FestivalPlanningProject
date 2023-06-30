package com.fpp.service.staff;

import java.util.List;

import com.fpp.dto.staff.StaffApplyDto;
import com.fpp.dto.staff.StaffBySrnoDto;
import com.fpp.dto.staff.StaffDto;

public interface StaffService {
	//스탭 모집 공고 추가
	public int recruitmentStaff(StaffDto staffDto);
	
	//스탭 모집 공고 리스트 조회
	public List<StaffDto> getStaffRecruitmentList();
	
	/* public List<StaffDto> getStaffRecruitmentListByFestivalName(String festivalName); */
	
	//스탭 신청 추가
	public void staffRecruitmentApply(StaffApplyDto staffApplyDto);
	
	//스탭 모집 공고 조회
	public StaffDto getStaffRecruitment(int fno);
	
	//스탭 모집 공고 + 신청 양식 테이블 조회
	public List<StaffBySrnoDto> getStaffRecruitmentAndFormList();
}
