<%@page import="com.pina.jisutay.reservation.dto.ReservationDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
    
<!DOCTYPE html>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
<meta charset="UTF-8">
<title>/views/reservation/list.jsp</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/css/common.css">
<link rel="shorcut icon" href="${pageContext.request.contextPath }/Jisutayimage/Logo_Icon/favicon.ico">
<script type="text/javascript" async="" src="https://www.google-analytics.com/analytics.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.1/jquery.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/common.js" defer=""></script>
<style>
	.reservationForm{
		background-color : #FAF9F9;
		display : none;
	}
	.col{
		float:left;
	}
	.card-body{
		background-color : #FAF9F9;
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
	.form{
		margin-top: 100px;
		margin-left : 130px;
		width: 1000px;
		height:600px;
		border-top:1px solid #323332
	}
	.dateform{
		margin-top : 10px;
		margin-bottom : 20px;
		margin-left : 370px;
	}
	.info{
		display:flex;
		justify-content:center;
		align-items:center;
	}
	.info2{
		margin-left : 240px;
	}
	.detail{
		margin:10px;
		display:flex;
		justify-content:center;
		align-items:center;		
		font-size:0.8em;
	}
	
</style>
</head>
<body>
   <!-- 상단 배너  -->
   <div class="banner">
		<img src="${pageContext.request.contextPath}/resources/Jisutayimage/travel/banner.jpg" style="height: 775px; width: 100%">
	</div>
<div class="container">
   <jsp:include page="/resources/include/navbar.jsp"></jsp:include>
  <div class="form">
  	<div class="dateform">
  	<br>
  	<p style="word-spacing: 110px; margin-bottom:5px; font-size:0.5em; color:#A9A2A7;">체크인 체크아웃</p>
	<form id="checkDateForm" action="ajaxCheckDate.do" method="post">
		<input type="date" id="check_in" name="check_in" oninput="checkDate();" placeholder= "체크인" />
		<input type="date" id="check_out" name="check_out" oninput="checkDate();" placeholder= "체크아웃"/>
		<button id="checkDateBtn" class="visually-hidden" type="submit"></button>
	</form>
	<br><br><br>
	</div>
	
	<div class="row">
		<c:forEach var="tmp" items="${requestScope.list }" varStatus="status">
			<div class="col-3">
				<div id="card${tmp.num }" class="card" style="position: relative; overflow: auto;">
					<img class="card-img-top" src="${pageContext.request.contextPath }/resources/Jisutayimage/main/room${status.index }.jpg"  />
					<div class="card-body">
						<h4 class="card-title" style="font-size:1em;" >${tmp.room_name }</h4>
						<p class="card-text" style="font-size:0.7em;  color:#8E8D8D;">
						 	기준:2인 ~ 최대:${tmp.room_people }
						</p>
						 <div><br></div>
						 <button id="cardBtn${tmp.num }" onclick="javascript:reserve(${status.index }, ${tmp.room_price }, ${tmp.num });" class="reserveDetail" type="button" style="border: none; width:200px; font-size:0.9em; padding: 10px 30px; color:#515051;">객실선택</button>
					</div>
					<div id="smoke${tmp.num }" class="smoke visually-hidden">SOLD OUT</div>
				</div>
			</div>
				<div id="reservationForm${status.index }" class="reservationForm">
				  <div class="info">
				  	<div class="detail">
					<img src="${pageContext.request.contextPath }${tmp.img_path }" width="300px" height="180px" style="margin-top:50px; margin-left:20px;"/>
					</div>
					<div class="detail">
					<table>
						<th><h3>${tmp.room_name}</h3></th>
						<tr>
							<th>객실구조 :</th>
							<td>${tmp.room_structure }</td>
						</tr>
						<tr>
							<th>객실평수 :</th>
							<td>${tmp.room_size }평</td>
						</tr>
						<tr>
							<th>숙박인원 :</th>
							<td>최대${tmp.room_people }</td>
						</tr>
						<tr>
							<th>비품 :</th>
							<td>${tmp.room_items }</td>
						</tr>
						<tr>
							<th>침실타입 :</th>
							<td>${tmp.bedroom_type }</td>
						</tr>
						<tr>
							<th>소개 :</th>
							<td>${tmp.room_introduce }</td>
						</tr>						
					</table>
					</div>
				 </div>
				 <div class="info2">
					<p><strong>숙박기간 : </strong><span class="date"></span>박 </p> 
					<p style="margin-bottom:7px;"><strong>이용인원</strong></p>
						<button onclick="javascript:minusNum(${status.index });" class="btn btn-outline-dark" >-</button>
						<input id="inputPeople${status.index }" type="text" value="2" style="width:150px; text-align:center;" disabled />
						<button onclick="javascript:plusNum(${status.index}, '${tmp.room_people }');" class="btn btn-outline-dark">+</button>
						<p>-성인 추가금 2만원입니다</p>
					
					<table>
						<tr>
							<th>객실요금 : </th>
							<td id="roomPricePrint${status.index }">${tmp.room_price }</td>
						</tr>
						<tr>
							<th>인원추가 요금 : </th>
							<td id="addCharge${status.index }">0</td>
						</tr>
						<tr>
							<th>총요금 : </th>
							<td id="totalPrice${status.index }">0</td>
						</tr>			
					</table>
					<button data-value="${status.index }" id="testCancel${status.index }" class="testCancel" style="border:none;">선택취소</button>
					<button data-value="${status.index }" id="testSubmit${status.index }" class="testSubmit" style="background-color:#C6DFF8; border:none;">선택완료</button>
					
				</div>
			 </div>
		</c:forEach>
		<form id="submitForm" action="reservationform.do", method="post">
			<input id="num" type="hidden" name="num"/>
			<input id="inputIn" type="hidden" name="check_in" />
			<input id="inputOut" type="hidden" name="check_out"/>
			<input id="peopleNum" type="hidden" name="peopleNum"/>
		</form>
	</div>
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
      $(".col-3").hide(50);
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

   $(".testCancel").on('click', function() {
	      $(".col-3").show();
	      $(".reservationForm").hide();
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
<div><br><br><br><br><br><br><br><br><br><br><br><br></div>	 
<jsp:include page="/resources/include/footer.jsp"></jsp:include>
</body>
</html>