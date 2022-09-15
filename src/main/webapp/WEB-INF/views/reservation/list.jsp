<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
    
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/bootstrap.css" />
<meta charset="UTF-8">
<title>/views/reservation/list.jsp</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/bootstrap.css" />
</head>
<body>
<div class="container">
	<c:choose>
		<c:when test="${empty id }">
			<p>
				<a href="${pageContext.request.contextPath }/users/loginform.do">로그인</a>
				<a href="${pageContext.request.contextPath }/users/signupform.do">회원가입</a>
			</p>
		</c:when>
		<c:otherwise>
			<p>
				<strong>${id }</strong> 님 로그인중...
			</p>
		</c:otherwise>
	</c:choose>

	<h1>방 목록</h1>
	<div class="row">
		<c:forEach var="tmp" items="${requestScope.list }">
			<div class="card">
				<img class="card-img-top" src="${pageContext.request.contextPath }/resources/images/0.png" />
				<div class="card-body">
					<h4 class="card-title">${tmp.room_name }</h4>
					<p class="card-text">
					 	객실 최대인원 : <strong>${tmp.room_people }</strong>
					</p>
					
					
				</div>
			</div>
		</c:forEach>
	</div>
</div>


</body>
</html>