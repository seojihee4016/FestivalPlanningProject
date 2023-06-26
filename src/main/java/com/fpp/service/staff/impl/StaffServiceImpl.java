package com.fpp.service.staff.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fpp.dao.staff.StaffDao;
import com.fpp.dto.staff.StaffApplyDto;
import com.fpp.dto.staff.StaffDto;
import com.fpp.service.staff.StaffService;

@Service
public class StaffServiceImpl implements StaffService {

	@Autowired
	StaffDao staffDao;
	
	@Override
	public int recruitmentStaff(StaffDto staffDto) {
		// TODO Auto-generated method stub
		
		int result = staffDao.insertStaff(staffDto);
		
		return result;
	}

	@Override
	public List<StaffDto> getStaffRecruitmentList() {
		// TODO Auto-generated method stub
		
		List<StaffDto> list = staffDao.selectStaffRecruitmentList();
		
		return list;
	}

	@Override
	public List<StaffDto> getStaffRecruitmentListByFestivalName(String festivalName) {
		// TODO Auto-generated method stub
		
		List<StaffDto> list =
				staffDao.selectStaffRecruitmentListByFestivalName(festivalName);
		
		return list;
	}

	@Override
	public int staffRecruitmentApply(StaffApplyDto staffApplyDto) {
		// TODO Auto-generated method stub
		
		int result = staffDao.insertStaffApply(staffApplyDto);
		
		return result;
	}



}
