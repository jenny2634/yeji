<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<ol type="A">

	<c:forEach items="${list}" var="item">
		<li>
		${item.UNAME} / ${item.PSW}
		</li>
	</c:forEach>
</ol>