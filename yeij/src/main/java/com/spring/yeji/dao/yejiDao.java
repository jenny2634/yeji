package com.spring.yeji.dao;

import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository	
public class yejiDao {
	@Autowired
	SqlSessionTemplate ss;
	
	public int insert(Map<String,Object> map) {
		return ss.insert("member_yeji.insertMember",map);
	}
	
	public Map<String, Object> login(Map<String, Object> map) {
		return ss.selectOne("member_yeji.login",map);
	}

}
