package com.spring.yeji.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.yeji.dao.yejiDao;

@Service
public class yejiService {

	@Autowired
	yejiDao yejidao;
	
	public int insertMember(Map<String, Object> map) {
		return yejidao.insert(map);
	}
	
	public Map<String, Object> login(Map<String, Object> map) {
		return yejidao.login(map);
	}
	
	public List<Map<String, Object>> select(){
		return yejidao.select();
	}
}
