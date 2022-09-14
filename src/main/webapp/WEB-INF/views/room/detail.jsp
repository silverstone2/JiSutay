<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>views/room/detail.jsp</title>
</head>
<body>
	<div class="container">
		<table>
			<tr>
				<th>방 이름</th>
				<td>${dto.room_name }</td>
			</tr>
			<tr>
				<th>방 가격</th>
				<td>${dto.room_price }</td>
			</tr>
			<tr>
				<th>방 구조</th>
				<td>${dto.room_structure }</td>
			</tr>
			<tr>
				<th>방 크기</th>
				<td>${dto.room_size }</td>
			</tr>
			<tr>
				<th>인원수</th>
				<td>${dto.people }</td>
			</tr>
			<tr>
				<th>비품</th>
				<td>${dto.items }</td>
			</tr>
			<tr>
				<th>베드타입</th>
				<td>${dto.bedroom_type }</td>
			</tr>
			<tr>
				<th>소개</th>
				<td>${dto.room_introduce }</td>
			</tr>		
		</table>
	</div>
</body>
</html>