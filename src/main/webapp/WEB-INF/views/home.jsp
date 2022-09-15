<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/views/home.jsp</title>
</head>
<body>
	<h1>인덱스 페이지 테스트중</h1>
	<p>develop 브랜치 생성</p>
	<h1>테스트</h1>
	<c:choose>
		<c:when test="${empty id }">
			<a href="users/signupform.do">회원가입</a>
			<a href="users/loginform.do">로그인</a>
		</c:when>
		<c:otherwise>
			<a href="users/logout.do">로그아웃</a>
		</c:otherwise>
	</c:choose>
	
	<a href="${pageContext.request.contextPath}/room/list.do">Go to list</a>
	<a href="users/signupform.do">회원가입</a>

</body>
</html>