package com.fpp.dao.staff;

import java.util.List;

import com.fpp.dto.staff.StaffApplyDto;
import com.fpp.dto.staff.StaffFormDto;
import com.fpp.dto.staff.StaffDto;

public interface StaffDao {
	//스탭 모집 공고 추가
	public int insertStaff(StaffDto staffDto);
	
	//스탭 모집 공고 리스트 조회
	public List<StaffDto> selectStaffRecruitmentList();
	
	//스탭 신청
	public void insertStaffApply(StaffApplyDto staffApplyDto);
	
	//스탭 모집 공고 + 신청 양식 테이블 조회
	public List<StaffFormDto> selectStaffRecruitmentAndFormList();
	
	//스탭 모집 공고 + 신청 양식 테이블 조회 by fno
	public StaffFormDto selectStaffRecruitmentFormListByFno(int fno);
}
