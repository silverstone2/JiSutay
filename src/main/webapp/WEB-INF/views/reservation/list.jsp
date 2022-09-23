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
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/common.css">
<link rel="shorcut icon" href="${pageContext.request.contextPath }/Jisutayimage/Logo_Icon/favicon.ico">
<script type="text/javascript" async="" src="https://www.google-analytics.com/analytics.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.1/jquery.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/modify.js" ></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/common.js" ></script>
<script src="https://player.vimeo.com/api/player.js"></script>
<style>
	.reservationForm{
		border : 1px solid red;
		display : none;
	}
	
	.col{
		float:left;
		
	}
	
	.smoke {
		display: flex;
		position: absolute;
		background-color: #ffffff;
        background-color: rgba( 255, 255, 255, 0.9 );
		color: red;
		width: 100%;
		height: 100%;
		font-size: 1.4rem;
		align-items: center;
		justify-content: center;
	}
</style>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/bootstrap.css" />
</head>
<body>
<div class="container">
   <jsp:include page="/resources/include/navbar.jsp"></jsp:include>
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
	<br>
	<br>
	
	<form id="checkDateForm" action="ajaxCheckDate.do" method="post">
		<input type="date" id="check_in" name="check_in" oninput="checkDate();"/>
		<input type="date" id="check_out" name="check_out" oninput="checkDate();"/>
		<button id="checkDateBtn" class="visually-hidden" type="submit"></button>
	</form>

	
	<div class="row">
	<h1>방 목록</h1>
		<c:forEach var="tmp" items="${requestScope.list }" varStatus="status">
		<div class="col-3">
			<div id="card${tmp.num }" class="card" style="position: relative; overflow: auto;">
				<img class="card-img-top" src="${pageContext.request.contextPath }/resources/images/${status.count }.png" />
				<div class="card-body">
					<h4 class="card-title">${tmp.room_name }</h4>
					<p class="card-text">
					 	기준:2인 ~ 최대:${tmp.room_people }
					</p>
					 <button id="cardBtn${tmp.num }" onclick="javascript:reserve(${status.index }, ${tmp.room_price }, ${tmp.num });" class="reserveDetail" type="button">예약</button>
				</div>	 
				
				<div id="smoke${tmp.num }" class="smoke visually-hidden">SOLD OUT</div>
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
				<button data-value="${status.index }" id="testSubmit${status.index }" class="testSubmit">선택완료</button>
				<button data-value="${status.index }" id="testCancle${status.index }">선택취소</button>
			</div>
		</c:forEach>
		
		<form id="submitForm" action="reservationform.do", method="post">
			<input id="num" type="hidden" name="num"/>
			<input id="inputIn" type="hidden" name="check_in"/>
			<input id="inputOut" type="hidden" name="check_out"/>
			<input id="peopleNum" type="hidden" name="peopleNum"/>
		</form>
	</div>

</div>

<script src="${pageContext.request.contextPath }/resources/js/jquery-3.4.1.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/gura_util.js"></script>
<script>
   
   function reserve(index, room_price, num) {
      // input에서 체크인, 체크아웃 가져오기
      var check_in = new Date($("#check_in").val());
      var check_out = new Date($("#check_out").val());
      
      // 체크인, 체크아웃 form value로 보내기
      $('#num').val(num);
      $('#inputIn').val($("#check_in").val());
      $('#inputOut').val($("#check_out").val());
      
      // 몇 박 계산
      var dateDiff = Math.ceil((check_out.getTime()-check_in.getTime())/(1000*3600*24));
      if(dateDiff > 0 ){
      $(".col").hide(50);
      $("#reservationForm"+index).show(500);
      }else if(dateDiff==0){
         alert("1박 이상만 가능합니다")
      }else if(dateDiff<0){
         alert("체크아웃 일자가 체크인 일자를 앞설수 없습니다.")
      }else{
         alert("날짜를 기입하세요")
      }   
      $(".date").text(dateDiff);
      $("#roomPricePrint"+index).text(dateDiff*room_price);
      $("#totalPrice"+index).text(dateDiff*room_price);
      $("#peopleNum").val(parseInt($("#inputPeople"+index).val()));
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
         $("#peopleNum").val(inputNum.val());
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
         $("#peopleNum").val(inputNum.val());
      }
   }
   
   
   $(".testSubmit").on('click', function() {
      $("#submitForm").submit();
   });
   
/* ---------------- 날짜 선택 시, DB와 검증 후 Ajax 통신 처리 ---------------- */
	function checkDate() {
		let check_in = $("#check_in").val();
		let check_out = $("#check_out").val();
		
		if(check_in!="" && check_out!="") {
			$(".reserveDetail").removeClass("visually-hidden");
			$('.smoke').removeClass("visually-hidden");
			$('.smoke').addClass("visually-hidden");
			document.querySelector("#checkDateBtn").click();
		}
	}
	
	document.querySelector("#checkDateForm").addEventListener('submit', function(e) {
		const form = this;
		e.preventDefault();
		
		ajaxFormPromise(form)
		.then(function(res) {
			return res.json();
		})
		.then(function(data) {
			data.forEach((map) => {
				if(map.isNull) {
					return;
				}
				let room_num = map.room_num;
				$('#cardBtn'+room_num).addClass("visually-hidden");
				$('#smoke'+room_num).removeClass("visually-hidden");
			});
		});
	});
</script>
</body>
</html>