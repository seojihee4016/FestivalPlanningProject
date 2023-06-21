package com.fpp.dto.user;

import org.springframework.stereotype.Component;

import lombok.Data;

@Data
@Component
public class UserDto {

	String login_Id;
	String login_Pw;
	String name;
	String email;
	String phone_Number;
	
	
}
