package com.fpp.service.user;

import java.util.List;

import com.fpp.dto.user.UserDto;

public interface UserService {

	public int saveUser(UserDto userDto);

	public List<UserDto> getUserList();
	
	public List<UserDto> getUserList2(UserDto userDto);
}
