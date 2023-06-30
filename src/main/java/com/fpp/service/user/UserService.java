package com.fpp.service.user;

import org.springframework.validation.BindingResult;

import com.fpp.dto.user.UserDto;

public interface UserService {

	public int saveUser(UserDto userDto, BindingResult bindingResult);

	public boolean idCheck(UserDto userDto, BindingResult bindingResult);

	public boolean login(UserDto userDto);
	
	public int editUserInfo(UserDto userDto, BindingResult bindingResult);

}
