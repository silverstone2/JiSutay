<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	<a href="users/signupform.do">회원가입</a>
	<a href="${pageContext.request.contextPath }/travel/list.do">주변여행지</a>
	<a href="${pageContext.request.contextPath }/room_SH/list.do?num=1">객실</a>

</body>
</html>