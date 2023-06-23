package com.fpp.service.user;

import java.util.List;

import org.springframework.validation.BindingResult;

import com.fpp.dto.user.UserDto;

public interface UserService {

	public int saveUser(UserDto userDto, BindingResult bindingResult);

	public List<UserDto> getUserList();
	
	public List<UserDto> getUserList2(UserDto userDto);
}
