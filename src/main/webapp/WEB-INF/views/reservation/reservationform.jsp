<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JISUTAY - Reservation</title>
<link rel="shortcut icon" href="${pageContext.request.contextPath }/Jisutayimage/Logo_Icon/favicon.ico">
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
  
  .container{
      display: flex;
      flex-wrap: wrap;
      flex-direction: column; /*수직 정렬*/
      align-items: center;
      justify-content: center;
  }
  /* 상단 동영상 CSS 설정 */
	.lb-wrap {
		width: 100%;
		margin: 10px auto;
		position: relative;
	}
	.lb-wrap img {
		width: 100%;
		vertical-align: middle;
	}
	.lb-text {
		padding: 10px 20px;
		background-color: #FFEEBC;
		text-align: center;
		position: absolute;
		top: 50%;
		left: 50%;
		transform: translate(-50%, -50%);	
		font-size:80px;
		color:#FBFCFC;
		background-color:transparent;
	}
	.lb-text2 {
		padding: 10px 20px;
		background-color: #FFEEBC;
		text-align: center;
		position: absolute;
		top: 50%;
		left: 50%;
		transform: translate(-50%, -50%);
		font-size:30px;
		color:#FBFCFC;
		margin-bottom:7%;
		background-color:transparent;
	}
	video {
		max-width: 100%; display: block; margin: 0px auto;
	}
</style>
</head>
<body>
   <div class="lb-wrap">
	<div class="lb-text">
		<p style="font-family: 'Zilla Slab', serif;">RESERVATION</p><br/>
	</div>
	<div class="lb-text2">
		<br>
		<br>
		<p style="font-family: 'Gowun Dodum', sans-serif;">예약 진행</p>
	</div>
	<div class="lb-image">
		<video muted autoplay loop>
      		<source src="${pageContext.request.contextPath}/resources/video/reservation.mp4" type="video/mp4">
    	</video>
	</div>
</div>
   <div class="container">
   	  <div class="item" style="margin-top:30px; margin-bottom:20px;">	
		<table class="reservationtable" style="text-align:center; width:797px;">
			<colgroup>
				<col style="width:300px">
				<col style="width:200px">
				<col style="width:99px">
			</colgroup>
			<thead>
				<tr>
					<th colspan="3" class="total" style="background-color:#F2F1F1; font-size:0.9em;">예약정보 확인 및 결제금액</th>
				</tr>
			</thead>
			<tbody style="font-size:0.9em;">
				<tr>
					<td><strong>객실명</strong></td>
					<td><strong>숙박기간</strong></td>
					<td><strong>인원선택</strong></td>
				</tr>
				<tr>
					<td rowspan="2">
						<div>
							<img src="${pageContext.request.contextPath }/resources/Jisutayimage/main/room${dto.num }.jpg" width="300px" height="180px" />
						</div>
						<div><h3>${dto.room_name }</h3></div>
					</td>
					<td style="height:55px;">
						<span style="font-size: 20px;">${param.check_in }</span>
						<br />
						<span style="font-size: 20px;">~</span>
						<br />
						<span style="font-size: 20px;">${param.check_out }</span>
					</td>
					<td><span style="font-size: 20px;">${param.peopleNum }인</span></td>
				</tr>
				<tr>
					<td style="height:55px;">
						<span>₩</span>
						<span id="room_price" style="font-size: 20px;"></span>
					</td>
					<td>
						<span>₩</span>
						<span id="people_price" style="font-size: 20px;"></span>
					</td>
				</tr>
				<tr>
					<td colspan="3">
						총 결제액
						<span style="font-size:1.5em";>₩</span>
						<span id="total_price" style="font-size:1.5em";></span>
						<span >(VAT 포함)</span>
					</td>
				</tr>
			</tbody>
		</table>
	 </div>	
	 	
 <div class="item">
	<table class="notice">
		<colgroup>
			<col style="width:100%">
		</colgroup>
		<thead>
			<tr>
				<th style="background-color:#F2F1F1; font-size:0.9em;">환불규정 확인</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td style="font-size:0.8em;">
					<p style="color:#ff3535;">아래 환불규정은 고객님과 저희 제주 풀스테이의 계약이므로 동의하신다면 예약을 진행하시기 바랍니다.</p>
					<p>천재지변으로 결항되어 예약을 취소하실 경우, 증빙서류를 제출하시면 100% 환불이 가능합니다.</p>
					<p style="color:#ff3535;">온수수영장 사용은 무료이기때문에 수영장 사용에 대한 클레임은 받아들여지지 않습니다. 양해해주시기 바랍니다.</p>
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
					<p style="font-size:0.7em;">이용약관 및 환불규정에 동의합니다.<input type="checkbox" id="agree" />
							<form action="reservation.do", method="post">
								<input id="res_id" type="hidden" name="res_id"/>
								<input id="check_in" type="hidden" name="check_in"/>
								<input id="check_out" type="hidden" name="check_out"/>
								<input id="res_people" type="hidden" name="res_people"/>
								<input id="room_num" type="hidden" name="room_num"/>
								<button id="reservationBtn" type="submit" disabled style="margin-left:700px";>객실예약</button>
							</form>
					</p>
				</td>
			</tr>
		</tbody>
	</table>
   </div>	
  </div>
	
	<script src="${pageContext.request.contextPath }/resources/js/jquery-3.4.1.js"></script>
	<script>
	var check_in = new Date("${param.check_in}");
	var check_out = new Date("${param.check_out}");
	var dateDiff = Math.ceil((check_out.getTime()-check_in.getTime())/(1000*3600*24));
	var room_price = dateDiff * ${dto.room_price};
	
	$(function() {
		//페이지 로딩시점에 방가격 , 인원추가가격 위에 표에 담기.
		$("#room_price").text(room_price.toLocaleString());
		$("#total_price").text((room_price + ${20000*(param.peopleNum -2)}).toLocaleString());
		$("#people_price").text((${20000*(param.peopleNum -2)}).toLocaleString());
		
		//페이지 로딩시점에 resevation.jsp로 보내는 form에 담기
		$("#res_id").val("${id}");
		$("#check_in").val("${param.check_in}");
		$("#check_out").val("${param.check_out}");
		$("#res_people").val(${param.peopleNum});
		$("#room_num").val(${dto.num});
	});
	
	//약관동의
	$(function(){
		$('#agree').click(function(){
			if($('#agree:checked').length>0){
				$('#reservationBtn').removeAttr('disabled');
			}else{
				$('#reservationBtn').attr('disabled','disabled');
			}
		});
	});
	
	//객실예약 누르면 알림뜨며 예약되고 list로 redirect
	$("#reservationBtn").on('click', function() {
		 alert("예약이 완료되었습니다.")
	});
	
	//페이지 로딩시 화면 포커스
	$(function(){
		$(".container").get(0).scrollIntoView(true);
	})
	
	
	</script>
</body>
</html>