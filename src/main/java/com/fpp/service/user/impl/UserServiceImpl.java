package com.fpp.service.user.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;

import com.fpp.dao.user.UserDao;
import com.fpp.dto.user.UserDto;
import com.fpp.service.user.UserService;
import com.fpp.validator.user.UserValidator;

@Service
public class UserServiceImpl implements UserService {

	@Autowired
	UserDao userDao;

	@Override
	public int saveUser(UserDto userDto, BindingResult bindingResult) {
		
		UserValidator.validate(userDto, bindingResult);
		
		
		if(bindingResult.hasErrors()) {
			return 0;
		}
		
		int result = userDao.insertUser(userDto);

		return result;
	}

	@Override
	public List<UserDto> getUserList() {
		// TODO Auto-generated method stub
		List<UserDto> userList = userDao.selectUserList();

		return userList;
	}

	@Override
	public List<UserDto> getUserList2(UserDto userDto) {
		// TODO Auto-generated method stub

		List<UserDto> userList = userDao.selectUserList2(userDto);

		return userList;
	}

}
