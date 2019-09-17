<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>



<button onclick="location.href='board'">게시글쓰기</button>
<br>
<button onclick="location.href='write'">파일올리기</button>
<br>

<hr />
게시글 리스트

<table>
		<thead>
			<tr>
				<th>글번호</th>
				<th>글제목</th>
				<th>조회수</th>
				<th>작성자</th>
				<th>날짜</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${list}" var="item">
			<li>
			${item.ID} / ${item.TITLE} /  ${item.HIT} / ${item.WRITER} / ${item.WRITE_DATE}
			</li>
			</c:forEach>
		<tbody>
</table>
