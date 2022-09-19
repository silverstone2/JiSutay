<%@page import="com.pina.jisutay.reservation.dto.ReservationDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
    
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/bootstrap.css" />
<meta charset="UTF-8">
<title>/views/reservation/list.jsp</title>
<style>
	.reservationForm{
		border : 1px solid red;
		display : none;
	}
</style>
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
	
	

	
	<input type="date" id="check_in" name="check_in"  />

	<input type="date" id="check_out" name="check_out" />
	
	
	<div class="row">
	<h1>방 목록</h1>
		<c:forEach var="tmp" items="${requestScope.list }" varStatus="status">
			<div class="card">
				<img class="card-img-top" src="${pageContext.request.contextPath }/resources/images/${status.count }.png" />
				<div class="card-body">
					<h4 class="card-title">${tmp.room_name }</h4>
					<p class="card-text">
					 	객실 최대인원 : <strong>${tmp.room_people }</strong>
					</p>
					 <button type="button" class="reserveDetail">예약</button>
				</div>	 
			</div>
			<div id="reservationForm${status.index }" class="reservationForm">
				<img src="${pageContext.request.contextPath }/resources/images/${status.count}.png"/>
				<table>
					<tr>
						<th>객실구조</th>
						<td>${tmp.room_structure }</td>
					</tr>
					<tr>
						<th>객실평수</th>
						<td>${tmp.room_size }평</td>
					</tr>
					<tr>
						<th>숙박인원</th>
						<td>최대${tmp.room_people }</td>
					</tr>
					<tr>
						<th>비품</th>
						<td>${tmp.room_items }</td>
					</tr>
					<tr>
						<th>침실타입</th>
						<td>${tmp.bedroom_type }</td>
					</tr>
					<tr>
						<th>소개</th>
						<td>${tmp.room_introduce }</td>
					</tr>						
				</table>
				
				<p>숙박기간</p>
				<div class="date"></div>
				<p>이용인원</p>
				<div></div>
				<p>-성인 추가금 2만원입니다</p>
				<table>
					<tr>
						<th>객실요금</th>
						<td>${tmp.room_price }</td>
					</tr>
					<tr>
						<th>인원추가 요금</th>
						<td>?</td>
					</tr>
					<tr>
						<th>총요금</th>
						<td>?</td>
					</tr>			
				</table>
				<form action="">
					<button type="submit">선택완료</button>
				</form>	
				<form action="">
					<button type="submit">선택취소</button>
				</form>
			
			</div>						
		</c:forEach>
	</div>
</div>

<script src="${pageContext.request.contextPath }/resources/js/jquery-3.4.1.js"></script>
<script>
	
	const reserves = document.querySelectorAll(".reserveDetail");
	console.log(reserves);
	reserves.forEach((value, index) => {
		console.log(index);
		value.addEventListener("click", function() {
			$(".card").hide();
			$("#reservationForm"+index).show();
			
			var check_in = new Date($("#check_in").val());
			var check_out = new Date($("#check_out").val());
			var dateDiff = Math.ceil((check_out.getTime()-check_in.getTime())/(1000*3600*24));
			
			console.log(dateDiff);
			
			$(".date").text(dateDiff);
		});
	});
</script>
	
	



	



</body>
</html>