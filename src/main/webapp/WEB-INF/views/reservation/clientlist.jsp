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
		<table>
		<thead>
			<tr>
				<th>고객 아이디</th>
				<th>체크인</th>
				<th>체크아웃</th>
				<th>예약인원</th>
				<th>방번호</th>
				<th>예약신청한 날짜</th>
			</tr>
		</thead>
		<tbody>
		<c:forEach var="tmp" items="${requestScope.list }">
			<tr>
				<td>${tmp.res_id }</td>
				<td>${tmp.check_in}</td>
				<td>${tmp.check_out }</td>
				<td>${tmp.res_people }</td>
				<td>${tmp.room_num }</td>
				<td>${tmp.regdate }</td>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	</div>

</body>
</html>