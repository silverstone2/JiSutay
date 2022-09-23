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
				<div class="btn">
					${dto.num }
					<a href="${pageContext.request.contextPath }/room_SH/updateform.do?num=${dto.num }">
						<svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="black" class="bi bi-pencil" viewBox="0 0 16 16">
	  					<path d="M12.146.146a.5.5 0 0 1 .708 0l3 3a.5.5 0 0 1 0 .708l-10 10a.5.5 0 0 1-.168.11l-5 2a.5.5 0 0 1-.65-.65l2-5a.5.5 0 0 1 .11-.168l10-10zM11.207 2.5 13.5 4.793 14.793 3.5 12.5 1.207 11.207 2.5zm1.586 3L10.5 3.207 4 9.707V10h.5a.5.5 0 0 1 .5.5v.5h.5a.5.5 0 0 1 .5.5v.5h.293l6.5-6.5zm-9.761 5.175-.106.106-1.528 3.821 3.821-1.528.106-.106A.5.5 0 0 1 5 12.5V12h-.5a.5.5 0 0 1-.5-.5V11h-.5a.5.5 0 0 1-.468-.325z"/>
						</svg>
					</a>
				</div>
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
			<c:forEach var="img_List" items="${imgList }">
				<img src="${pageContext.request.contextPath }${img_List}"/>
				<br>
			</c:forEach>
		</div>
	</div>
</body>
</html>