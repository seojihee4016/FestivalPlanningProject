package com.fpp.dao.user.impl;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.fpp.dao.user.UserDao;
import com.fpp.dto.user.UserDto;

@Repository
public class UserDaoImpl implements UserDao {

	@Autowired
	SqlSessionTemplate sqlSessionTemplate;

	@Override
	public int insertUser(UserDto userDto) {

		int result = 0;

		try {
			result = sqlSessionTemplate.insert("user_mapper.insert_user", userDto);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return result;
	}

	@Override
	public UserDto selectUserById(UserDto userDto) {
		UserDto findUser = sqlSessionTemplate.selectOne("user_mapper.select_user_by_id", userDto);
		return findUser;
	}

	@Override
	public UserDto selectUserByPw(UserDto userDto) {
		UserDto findUserPw = sqlSessionTemplate.selectOne("user_mapper.select_user_by_pw", userDto);
		return findUserPw;
	}

	@Override
	public int updateUserInfo(UserDto userDto) {
		int result2 = 0;

		try {
			result2 = sqlSessionTemplate.update("user_mapper.update_user_info", userDto);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return result2;
	}
}
