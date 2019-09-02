package com.spring.yeji.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

@Repository	
public class yejiDao {
	
	@Autowired
	JdbcTemplate jt;
	
	@Autowired
	SqlSessionTemplate ss;
	
	public int insert(Map<String,Object> map) {
		return ss.insert("member_yeji.insertMember",map);
	}
	
	public Map<String, Object> login(Map<String, Object> map) {
		return ss.selectOne("member_yeji.login",map);
	}

	public List<Map<String, Object>> select(){
		return ss.selectList("member_yeji.select");
	}
	
	public List<Map<String, Object>> selectFile(){
		return ss.selectList("member_yeji.selectFile");
	}
	
	public void save(Map<String, String> map) {
		StringBuffer sql = new StringBuffer();
		sql.append("INSERT INTO file_yeji (UNAME ,TITLE,FILE)");
		sql.append("	VALUES (?,?,?)");
		
		jt.update(sql.toString(), map.get("uname"), map.get("title"), map.get("file1"));
	}
}
