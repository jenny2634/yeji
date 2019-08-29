package com.spring.yeji.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.yeji.dao.yejiDao;

@Service
public class yejiService {

	@Autowired
	yejiDao yejidao;
	
	public void insertMember(Map<String, Object> map) {
		yejidao.insert(map);
	}
	
	public Map<String, Object> login(Map<String, Object> map) {
		return yejidao.login(map);
	}
}
