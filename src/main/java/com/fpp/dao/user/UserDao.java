package com.fpp.dao.user;

import com.fpp.dto.user.UserDto;

public interface UserDao {

	// 회원가입
	public int insertUser(UserDto userDto);

	// 로그인
	public UserDto selectUserById(UserDto userDto);

	// 회원정보 수정
	public int updateUserInfo(UserDto userDto);

	// 회원정보 수정시 비밀번호 확인
	public UserDto selectUserByPw(UserDto userDto);

	// 회원탈퇴
	public int deleteUserInfo(UserDto userDto);
}
