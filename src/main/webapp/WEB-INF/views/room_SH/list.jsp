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
		<div class="infoBox">
			<div class="roomInfo">
				<h4>객실정보</h4>
				<ul>
					<li>
						<strong>객실구조</strong>
						<span>${dto.room_structure }평형</span>
					</li>
					<li>
						<strong>객실크기</strong>
						<span>${dto.room_size }평형</span>
					</li>
					<li>
						<strong>입실인원</strong>
						<span>${dto.room_people }</span>
					</li>
					<li>
						<strong>객실비품</strong>
						<span>${dto.room_items }</span>
					</li>
				</ul>
			</div>
			<div class="roomIntroduce">
			<h4>객실소개</h4>
			<span>${dto.room_introduce }</span>
			</div>
		</div>
		<div class="roomImg">
			<c:forEach var="img_path" items="${imgList }">
				<img src="${pageContext.request.contextPath }${img_path}"/>
				<br>
			</c:forEach>
		</div>
		<div class="uploadLink"> 
			<a href="${pageContext.request.contextPath }/room_SH/uploadform.do">객실 업로드하기</a>
		</div>
	</div>
</body>
</html>