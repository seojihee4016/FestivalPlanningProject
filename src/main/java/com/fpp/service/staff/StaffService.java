package com.fpp.service.staff;

import java.util.List;

import com.fpp.dto.staff.StaffApplyDto;
import com.fpp.dto.staff.StaffFormDto;
import com.fpp.dto.staff.StaffDto;

public interface StaffService {
	//스탭 모집 공고 추가
	public int recruitmentStaff(StaffDto staffDto);
	
	//스탭 모집 공고 리스트 조회
	public List<StaffDto> getStaffRecruitmentList();
	
	//스탭 신청
	public void staffRecruitmentApply(StaffApplyDto staffApplyDto);
	
	//스탭 모집 공고 + 신청 양식 테이블 조회
	public List<StaffFormDto> getStaffRecruitmentAndFormList();
	
	//스탭 모집 공고 + 신청 양식 테이블 조회 by fno
	public StaffFormDto getStaffRecruitmentFormListByFno(int fno);
}
