<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    
<c:if test="${result == true}">
	<h1>로그인</h1>
</c:if>
<c:if test="${result != true}">
	<h1>아이디와 비밀번호를 확인해주세요.</h1>
</c:if>