package com.fpp.dto.user;

import lombok.Data;

@Data
public class UserDto {

	String login_Id;
	String login_Pw;
	String name;
	String email;
	String tel_Number;
	String birth;
}
