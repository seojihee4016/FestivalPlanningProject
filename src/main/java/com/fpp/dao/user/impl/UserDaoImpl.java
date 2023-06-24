package com.fpp.dao.user.impl;

import java.util.List;

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
		// TODO Auto-generated method stub

		int result = 0;
		try {
			result = sqlSessionTemplate.insert("user_mapper.insert_user", userDto);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return result;
	}

	@Override
	public List<UserDto> selectUserList() {
		// TODO Auto-generated method stub
		List<UserDto> list = sqlSessionTemplate.selectList("user_mapper.select_user");

		return list;
	}

	@Override
	public List<UserDto> selectUserList2(UserDto userDto) {
		// TODO Auto-generated method stub
		List<UserDto> list = sqlSessionTemplate.selectList("user_mapper.select_user2", userDto);

		return list;
	}

	@Override
	public UserDto selectUserById(UserDto userDto) {
		UserDto findUser = sqlSessionTemplate.selectOne("user_mapper.select_user_by_id", userDto);
		return findUser;
	}

}
