<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
<style>
  table {
    width: 100%;
    border: 1px solid #444444;
    border-collapse: collapse;
  }
  th, td {
    border: 1px solid #444444;
  }
  
</style>
</style>
</head>
<body>
	<table class="reservationtable">
		<colgroup>
			<col style="width:287px">
			<col style="width:126px">
			<col style="width:99px">
			<col style="width:288px">
		</colgroup>
		<thead>
			<tr>
				<th colspan="3" class="total">예약정보 확인 및 결제금액</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td>객실명</td>
				<td>숙박기간</td>
				<td>인원선택</td>
			</tr>
			<tr>
				<td rowspan="2">
					<div class="thumb"><img src="${pageContext.request.contextPath }/resources/images/${dto.num}.png" /></div>
					<div><p>${dto.room_name }</p></div>
				</td>
				<td>${check_in }~${check_out }</td>
				<td>${peopleNum }</td>
			</tr>
			<tr>
				<td>
					<span>₩</span>
					<span id="room_price"></span>
				</td>
				<td>₩ ${20000*(peopleNum -2)}</td>
			</tr>
			<tr>
				<td colspan="3">
					"총 결제액"
					<span>₩</span>
					<span id="total_price"></span>
					<span >(VAT 포함)</span>
				</td>
			</tr>
		</tbody>
	</table>
	
	<table class="notice">
		<colgroup>
			<col style="width:100%">
		</colgroup>
		<thead>
			<tr>
				<th>환불규정 확인</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td>
					<p style="color:#ff3535;">아래 환불규정은 고객님과 저희 제주 풀스테이의 계약이므로 동의하신다면 예약을 진행하시기 바랍니다.</p>
					<p>천재지변으로 결항되어 예약을 취소하실 경우, 증빙서류를 제출하시면 100% 환불이 가능합니다.</p>
					<p>온수수영장 사용은 무료이기때문에 수영장 사용에 대한 클레임은 받아들여지지 않습니다. 양해해주시기 바랍니다.</p>
					<p>당일 예약 당일 취소하셨을 경우 송금수수료 1,000원 제외후 환불됩니다..</p>
					<p>단, 당일 예약 당일 취소하시는 경우라도 예약 신청일이 예약일 기준으로 10일 이내라면 아래 환불 규정이 적용됩니다.</p>
					<p>예약을 신청하신 당일 24시까지는 1일 전이며, 그 이후부터 24시간 경과 시 1일씩 경과하는 것으로 계산합니다.</p>
					<p>이용일까지 30일 이상 남았더라도 취소 시 취소 위약금 5%가 적용됩니다. 신중한 예약 부탁드립니다.</p>
					<p>예약 날짜변경은 예약일 기준 일주일전까지 1회에 한하여 가능하시며, 예약일을 변경한 후 취소하셨을 경우 환불금은 전액 환불불가입니다.</p>
					<p>고객님의 사정에 의해 예약을 취소하실 경우, 아래와 같이 위약금이 적용되므로 신중히 고려하여 예약하시기 바랍니다.</p>
				</td>
			</tr>
			<tr>
				<td>
					<p>이용약관 및 환불규정에 동의합니다. <input type="checkbox" id="agree" /></p>
				</td>
			</tr>
		</tbody>
	</table>
	
	<a href="reservation/reservation">객실예약</a>
	
	
	<script src="${pageContext.request.contextPath }/resources/js/jquery-3.4.1.js"></script>
	<script>
	var check_in = new Date("${check_in}");
	var check_out = new Date("${check_out}");
	var dateDiff = Math.ceil((check_out.getTime()-check_in.getTime())/(1000*3600*24));
	var room_price = dateDiff * ${dto.room_price};
	
	$(function() {
		$("#room_price").text(room_price.toLocaleString());
		$("#total_price").text((room_price + ${20000*(peopleNum -2)}).toLocaleString());
	});
	</script>
	
</body>
</html>