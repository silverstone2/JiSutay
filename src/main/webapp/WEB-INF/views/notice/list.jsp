<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/views/notice/list.jsp</title>
</head>
<body>
	<jsp:include page="/resources/include/navbar.jsp"></jsp:include>
	<h1>공지사항 페이지</h1>
	<p>공지사항과 다양한 소식을 확인해보세요.</p>
	지수테이 - 공지사항
	<a href="notice/insert.do"></a>
	
	<table>
		<thead>
			<tr>
				<th>번호</th>
				<th>제목</th>
				<th>글쓴이</th>
				<th>날짜</th>
				<th>조회</th>
				<th>내용</th>
			</tr>
		</thead>
		
		<tbody>
		<c:forEach var="tmp" items="${list }">
			<tr>
				<td>${tmp.num}</td>
				<td><a href="detail.do?num=${tmp.num }">${tmp.title }</a></td>
				<td>${tmp.writer }</td>
				<td>${tmp.regdate }</td>
				<td>${tmp.views }</td>
				<td>${tmp.content }</td>
			</tr>
		</c:forEach>
		</tbody>
	</table>
</body>
</html>