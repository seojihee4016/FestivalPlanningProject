package com.fpp.service.user.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.validation.BindingResult;

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

		if (bindingResult.hasErrors()) {
			return 0;
		}

		int result = userDao.insertUser(userDto);

		return result;
	}

	@Override
	public boolean idCheck(UserDto userDto, BindingResult bindingResult) {

		UserValidator.idValidate(userDto, bindingResult);

		if (!(bindingResult.hasErrors())) {

			UserDto user = userDao.selectUserById(userDto);

			// 중복아이디 없으면 true
			if (user == null) {
				return true;
			}
		}

		return false;
	}

	@Override
	public boolean login(UserDto userDto) {

		UserDto userInfo = userDao.selectUserById(userDto);

		if (userInfo != null) {
			if (userInfo.getLoginPw().equals(userDto.getLoginPw())) {
				return true;
			}
		}

		return false;
	}

	@Override
	public boolean pwCheck(UserDto userDto) {
		UserDto userPw = userDao.selectUserByPw(userDto);

		if (userPw != null) {
			if (userPw.getLoginPw().equals(userDto.getLoginPw())) {
				return true;
			}
		}
		return false;
	}

	@Override
	public int editUserInfo(UserDto userDto, BindingResult bindingResult) {
		UserValidator.updateValidate(userDto, bindingResult);

		if (bindingResult.hasErrors()) {
			return 0;
		}

		int result = userDao.updateUserInfo(userDto);

		return result;
	}

	@Override
	public int WithdrawalUserInfo(UserDto userDto) {

		int result = userDao.deleteUserInfo(userDto);

		return result;
	}

}
