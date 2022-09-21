<%@page import="com.pina.jisutay.reservation.dto.ReservationDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/views/reservation/list.jsp</title>
<style>
	.reservationForm{
		border : 1px solid red;
		display : none;
	}
	.col{
		width : 18.5%;
		float : left;
		margin-left : 5px;
	}
	.datepick{
		float : left;
		margin-left : 35%;
		margin-right : 10px;
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
				<a href="${pageContext.request.contextPath }/">홈</a>
			</p>
		</c:when>
		<c:otherwise>
			<p>
				<strong>${id }</strong> 님 로그인중...
			</p>
		</c:otherwise>
	</c:choose>

	<div class="datepick"><input type="date" id="check_in" name="check_in" /></div>
	<input type="date" id="check_out" name="check_out" />
	<br>
	<div class="row">
	<h1>방 목록</h1>
		<c:forEach var="tmp" items="${requestScope.list }" varStatus="status">
			<div class="col">
				<div class="card">
					<img class="card-img-top" src="${pageContext.request.contextPath }/resources/images/${status.count }.png" />
					<div class="card-body">
						<h4 class="card-title">${tmp.room_name }</h4>
						<p class="card-text">
							객실 최대인원 : <strong>${tmp.room_people }</strong>
						</p>
						<button onclick="javascript:reserve(${status.index }, ${tmp.room_price });" class="reserveDetail">예약</button>
					</div>	 
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
						<th>침실타입엥</th>
						<td>${tmp.bedroom_type }</td>
					</tr>
					<tr>
						<th>소개</th>
						<td>${tmp.room_introduce }</td>
					</tr>						
				</table>
				
				<p>숙박기간</p>
				<div class="date"></div>박
				<p>이용인원</p>
				<button onclick="javascript:minusNum(${status.index });">-</button>
				<input id="inputPeople${status.index }" type="text" value="2" disabled/>
				<button onclick="javascript:plusNum(${status.index}, '${tmp.room_people }');">+</button>
				<p>-성인 추가금 2만원입니다</p>
				<table>
					<tr>
						<th>객실요금</th>
						<td id="roomPricePrint${status.index }">${tmp.room_price }</td>
					</tr>
					<tr>
						<th>인원추가 요금</th>
						<td id="addCharge${status.index }">0</td>
					</tr>
					<tr>
						<th>총요금</th>
						<td id="totalPrice${status.index }">0</td>
					</tr>			
				</table>
				<form action="${pageContext.request.contextPath }/reservation/reservationform.do" method="post">
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
	
	function reserve(index, room_price) {
		$(".card").hide(50);
		$("#reservationForm"+index).show(500);
		
		var check_in = new Date($("#check_in").val());
		var check_out = new Date($("#check_out").val());
		var dateDiff = Math.ceil((check_out.getTime()-check_in.getTime())/(1000*3600*24));
		
		$(".date").text(dateDiff);
		$("#roomPricePrint"+index).text(dateDiff*room_price);
		$("#totalPrice"+index).text(dateDiff*room_price);
	}
	
	function reserve(index, room_price) {

		var check_in = new Date($("#check_in").val());
		var check_out = new Date($("#check_out").val());
		var dateDiff = Math.ceil((check_out.getTime()-check_in.getTime())/(1000*3600*24));
		if(dateDiff > 0 ){
			$(".card").hide(50);
			$("#reservationForm"+index).show(500);
		}else{
			alert("날짜를 기입해주세요")
		}	
		$(".date").text(dateDiff);
		$("#roomPricePrint"+index).text(dateDiff*room_price);
		$("#totalPrice"+index).text(dateDiff*room_price);
		}
	
	function minusNum(index) {
		let inputNum = $("#inputPeople"+index);
		let inputVal = parseInt(inputNum.val());
		let totalPrice = parseInt($("#totalPrice"+index).text());
		
		if(inputVal == 2) {
			alert("2인 이상 예약 가능합니다!");
		} else {
			inputNum.val(inputVal-1);
			
			if(inputNum.val() == 2) {
				$("#addCharge"+index).text(0);
				$("#totalPrice"+index).text(totalPrice-20000);
			} else {
				$("#addCharge"+index).text((inputVal-1-2)*20000);
			}
			$("#totalPrice"+index).text(totalPrice-20000);
		}
	}
	
	function plusNum(index, room_people) {
		let inputNum = $("#inputPeople"+index);
		let inputVal = parseInt(inputNum.val());
		let totalPrice = parseInt($("#totalPrice"+index).text());
		
		room_people = parseInt(room_people.replace("인", ""));
		console.log(room_people);
		console.log(inputVal);
		if(inputVal == room_people) {
			alert("최대 "+room_people+"인 예약 가능합니다!");
		} else {
			inputNum.val(inputVal+1);
			$("#addCharge"+index).text((inputVal+1-2)*20000);
			$("#totalPrice"+index).text(totalPrice+20000);
		}
	}
	
</script>
</body>
</html>