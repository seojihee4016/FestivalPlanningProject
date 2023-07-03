package com.fpp.service.user;

import org.springframework.validation.BindingResult;

import com.fpp.dto.user.UserDto;

public interface UserService {

	// 회원가입
	public int saveUser(UserDto userDto, BindingResult bindingResult);

	// 아이디 중복체크
	public boolean idCheck(UserDto userDto, BindingResult bindingResult);

	// 로그인
	public boolean login(UserDto userDto);
	
	// 회원정보 수정
	public int editUserInfo(UserDto userDto, BindingResult bindingResult);
	
	// 회원정보 수정 시 비밀번호 확인
	public boolean pwCheck(UserDto userDto);
	
	// 회원탈퇴
	public int WithdrawalUserInfo(UserDto userDto);

}
