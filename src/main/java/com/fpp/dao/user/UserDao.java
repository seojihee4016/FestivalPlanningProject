package com.fpp.dao.user;

import com.fpp.dto.user.UserDto;

public interface UserDao {

	// 회원가입
	public int insertUser(UserDto userDto);

	public UserDto selectUserById(UserDto userDto);
	
	public int updateUserInfo(UserDto userDto);

	public UserDto selectUserByPw(UserDto userDto);
}
