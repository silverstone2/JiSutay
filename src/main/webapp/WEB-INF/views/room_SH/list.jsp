<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<div class="container">
		<div class="banner">
			<img src="${pageContext.request.contextPath }/Jisutayimage/room/oreum/1.jpg" style="height: 90vh; width: 100%;"/>
		</div>
		<div class="uploadLink"> 
			<a href="${pageContext.request.contextPath }/room_SH/uploadform">객실 업로드하기</a>
		</div>
		<div class="roomInfo">
			
		</div>
		<div class="roomImg">
		</div>
	</div>
</body>
</html>