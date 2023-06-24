package com.fpp.dto.user;

import lombok.Data;
import lombok.ToString;

@Data
@ToString
public class UserDto {

	String loginId;
	String loginPw;
	String name;
	String email;
	String telNumber;
	String birth;
}
