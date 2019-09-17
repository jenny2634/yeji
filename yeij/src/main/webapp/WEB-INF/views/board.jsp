<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

게시글 리스트
<ol type="A">

	<c:forEach items="${list}" var="item">
		<li>
		${item.ID} / ${item.TITLE} / ${item.CONTENT}/  ${item.HIT} / ${item.WRITER} / ${item.WRITE_DATE}
		</li>
	</c:forEach>
</ol>

<script src="http://code.jquery.com/jquery-3.1.1.min.js"> </script>
