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
	<h1>주변여행지 수정폼 입니다.</h1>
	<a href="${pageContext.request.contextPath }/home.do">인덱스</a>
	<form action="${pageContext.request.contextPath }/travel/update.do" method="post" enctype="multipart/form-data">
		<input type="hidden" name="num" value="${dto.num }" />
		<div>
			<label for="title">제목</label>
			<input type="text" id="title" name="title" value="${dto.title }"/>
		</div>
		<div>
			<label for="distance">거리</label>
			<input type="text" name="distance" id="distance" value="${dto.distance }"/>
		</div>
		<div>
			<label for="caption">내용</label>
			<textarea name="caption" id="caption">${dto.caption }</textarea>
		</div>
		<div>
			<label for="image">사진</label>
			<input type="file" name="image" id="image" accept=".jpg, .jpeg, .png, .JPG, .JPEG"/>
		</div>
		<button type="submit" onclick="submitContents(this);">수정확인</button>
		<button type="reset">취소</button>
	</form>
</body>
</html>