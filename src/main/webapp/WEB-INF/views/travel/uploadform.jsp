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
	   	<h1>주변 여행지 올리기</h1>
	   	<form action="${pageContext.request.contextPath}/travel/upload.do" method="post" enctype="multipart/form-data">
	      	<div>
	         	<label for="title">관광지명</label>
	         	<input type="text" name="title" id="title" value="${dto.title }"/>
	      	</div>
	      	<div>
	         	<label for="distance">거리</label>
	         	<input type="text" name="distance" id="distance" value="${dto.distance }"/>
	      	</div>
	      	<div>
	         	<label for="caption">설명</label>
	         	<textarea name="caption" id="catpion" value="${dto.caption }"></textarea>
	      	</div>
	      	<div>
	         	<label for="image">이미지</label>
	         	<input type="file" name="image" id="image" accept=".jpg, .jpeg, .png, .JPG, .JPEG"/>
	      	</div>
	      	<button type="submit">확인</button>
	   	</form>
	</div>
</body>
</html>