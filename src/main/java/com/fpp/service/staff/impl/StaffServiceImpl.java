package com.fpp.service.staff.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fpp.dao.staff.StaffDao;
import com.fpp.dto.staff.StaffApplyDto;
import com.fpp.dto.staff.StaffBySrnoDto;
import com.fpp.dto.staff.StaffDto;
import com.fpp.service.staff.StaffService;

@Service
public class StaffServiceImpl implements StaffService {

	@Autowired
	StaffDao staffDao;
	
	//스탭 모집 공고 추가
	@Override
	public int recruitmentStaff(StaffDto staffDto) {
		// TODO Auto-generated method stub
		
		int result = staffDao.insertStaff(staffDto);
		
		return result;
	}

	//스탭 모집 공고 리스트 조회
	@Override
	public List<StaffDto> getStaffRecruitmentList() {
		// TODO Auto-generated method stub
		
		List<StaffDto> list = staffDao.selectStaffRecruitmentList();
		
		return list;
	}
	
	/*
	@Override
	public List<StaffDto> getStaffRecruitmentListByFestivalName(String festivalName) {
		// TODO Auto-generated method stub
		
		List<StaffDto> list =
				staffDao.selectStaffRecruitmentListByFestivalName(festivalName);
		
		return list;
	}
	*/

	//스탭 신청 추가
	@Override
	public void staffRecruitmentApply(StaffApplyDto staffApplyDto) {
		// TODO Auto-generated method stub
		
		staffDao.insertStaffApply(staffApplyDto);
		
	}

	//스탭 모집 공고 조회
	@Override
	public StaffDto getStaffRecruitment(int fno) {
		// TODO Auto-generated method stub
		
		StaffDto staffDto = staffDao.selectStaffRecruitment(fno);
		
		return staffDto;
	}

	//스탭 모집 공고 + 신청 양식 테이블 조회
	@Override
	public List<StaffBySrnoDto> getStaffRecruitmentAndFormList() {
		// TODO Auto-generated method stub
		
		List<StaffBySrnoDto> list = staffDao.selectStaffRecruitmentAndFormList();
		
		return list;
	}



}
