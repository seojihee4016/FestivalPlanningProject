package com.fpp.dao.staff.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.fpp.dao.staff.StaffDao;
import com.fpp.dto.staff.StaffApplyDto;
import com.fpp.dto.staff.StaffBySrnoDto;
import com.fpp.dto.staff.StaffDto;

@Repository
public class StaffDaoImpl implements StaffDao {

	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	
	//스탭 모집 공고 추가
	@Override
	public int insertStaff(StaffDto staffDto) {
		// TODO Auto-generated method stub
		
		int result = sqlSessionTemplate.insert("staff_mapper.insert_staff", staffDto);
		
		return result;
	}

	//스탭 모집 공고 리스트 조회
	@Override
	public List<StaffDto> selectStaffRecruitmentList() {
		// TODO Auto-generated method stub
		
		List<StaffDto> list =
				sqlSessionTemplate.selectList("staff_mapper.select_staff_recruitment_list");
		
		return list;
	}
	
	/*
	@Override
	public List<StaffDto> selectStaffRecruitmentListByFestivalName(String festivalName) {
		// TODO Auto-generated method stub
		List<StaffDto> list =
				sqlSessionTemplate.selectList("staff_mapper.select_staff_recruitment_list_by_festivalName", festivalName);
		
		return list;
	}
	*/

	//스탭 신청
	@Override
	public void insertStaffApply(StaffApplyDto staffApplyDto) {
		// TODO Auto-generated method stub
		
		sqlSessionTemplate.insert("staff_mapper.insert_staff_apply", staffApplyDto);
	}

	//스탭 모집 공고 조회
	@Override
	public StaffDto selectStaffRecruitment(int fno) {
		// TODO Auto-generated method stub
		
		StaffDto staffDto = 
				sqlSessionTemplate.selectOne("staff_mapper.select_staff_recruitment_by_fno", fno);
		
		return staffDto;
	}

	//스탭 모집 공고 + 신청 양식 테이블 조회
	@Override
	public List<StaffBySrnoDto> selectStaffRecruitmentAndFormList() {
		// TODO Auto-generated method stub
		
		List<StaffBySrnoDto> list =
				sqlSessionTemplate.selectList("staff_mapper.select_staff_recruitment_and_form_list");
		
		return list;
	}

}
