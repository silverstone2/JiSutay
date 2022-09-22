<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>views/room/list.jsp</title>
</head>
<body>
	<div class="container">
		<table>
		<thead>
			<tr>
				<th>방 이름</th>
				<th>방 가격</th>
				<th>방 구조</th>
				<th>방 크기</th>
				<th>인원수</th>
				<th>비품</th>
				<th>베드타입</th>
				<th>소개</th>
				<th> </th>
			</tr>
		</thead>
		<tbody>
		<c:forEach var="tmp" items="${requestScope.list }">
			<tr>
				<td>${tmp.room_name }</td>
				<td>${tmp.room_price}</td>
				<td>${tmp.room_structure }</td>
				<td>${tmp.room_size }</td>
				<td>${tmp.room_people }</td>
				<td>${tmp.room_items }</td>
				<td>${tmp.room_people }</td>
				<td>${tmp.bedroom_type }</td>
				<td>${tmp.room_introduce }</td>
				<td><a href="detail.do?num=${tmp.num }&sort=regdate">바로가기</a></td>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	</div>
</body>
</html>