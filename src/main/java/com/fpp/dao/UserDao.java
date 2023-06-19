package com.fpp.dao;

import java.util.List;

import com.fpp.dto.user.UserDto;

public interface UserDao {

	// 회원가입
	public int insertUser(UserDto userDto);
	
	public List<UserDto> selectUserList();

	public List<UserDto> selectUserList2(UserDto userDto);

}
