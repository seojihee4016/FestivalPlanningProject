package com.fpp.validator.user;

import org.springframework.validation.Errors;

import org.springframework.validation.Validator;

import com.fpp.dto.user.UserDto;

public class UserValidator implements Validator {

	@Override
	public boolean supports(Class<?> clazz) {

		return UserDto.class.isAssignableFrom(clazz);
	}

	@Override
	public void validate(Object target, Errors errors) {

		UserDto userDto = (UserDto) target;
		// 아이디비교 
		// 아이디가 6자리보다 작거나 12자리보다 클때 
		if ((userDto.getLogin_Id().length() < 6 && userDto.getLogin_Id().length() > 12)) {
			errors.rejectValue("login_Id", "login_Id.sizeError", "아이디 길이를 확인하세요");
		}
		
	}

}
