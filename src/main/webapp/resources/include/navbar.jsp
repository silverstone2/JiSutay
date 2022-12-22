<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<header>
	<hgroup>
		<h1><a href="${pageContext.request.contextPath }/"><img src="${pageContext.request.contextPath }/resources/Jisutayimage/Logo_Icon/Logo_Image.png" width="220px" height="80px" ></a></h1>
		<div><p>제주도 힐링 감성을 가득 담은 <span style="font-size:18px;">JiSutay</span></p></div>
	</hgroup>
	<nav>
		<ul>
			<li class="gb"><a href="${pageContext.request.contextPath }/about.do"><span class="en">ABOUT</span><span class="ko">지수테이</span></a>
				<ul class="sub">
					<li><a href="${pageContext.request.contextPath }/about.do#title">인사말</a></li>
					<li><a href="${pageContext.request.contextPath }/about.do#exterior">외부전경</a></li>
					<li><a href="${pageContext.request.contextPath }/about.do#location">오시는길</a></li>
				</ul>
			</li>
			<li class="gb"><a href="${pageContext.request.contextPath }/home.do#poolvila"><span class="en">POOLVILLA</span><span class="ko">풀빌라</span></a>
				<ul class="sub">
					<li><a href="${pageContext.request.contextPath }/room/detail.do?num=5&sort=regdate">다     랑</a></li>
					<li><a href="${pageContext.request.contextPath }/room/detail.do?num=1&sort=regdate">새     별</a></li>
					<li><a href="${pageContext.request.contextPath }/room/detail.do?num=2&sort=regdate">사 려 니</a></li>
					<li><a href="${pageContext.request.contextPath }/room/detail.do?num=3&sort=regdate">백 약 이</a></li>
					<li><a href="${pageContext.request.contextPath }/room/detail.do?num=4&sort=regdate">가     메</a></li>
				</ul>
			<li class="gb"><a href="${pageContext.request.contextPath }/travel/list.do"><span class="en">TRAVEL</span><span class="ko">주변여행지</span></a></li>
			<li class="gb">
				<a href="${pageContext.request.contextPath }/reservation/list.do#focus">
					<span class="en">RESERVATION</span>
					<span class="ko">실시간예약</span>
				</a>
			</li>
			<li class="gb">
				<a href="${pageContext.request.contextPath }/notice/list.do">
					<span class="en">NOTICE</span>
					<span class="ko">공지 사항</span>
				</a>
			</li>
							
			<c:choose>
				<c:when test="${empty sessionScope.id }">						
					<li class="gb">
          				<a href="#">
		  					<span class="en">Log-in</span>
		  					<span class="ko">로그인</span>
          				</a>
        				<ul class="sub">
							<li><a href="${pageContext.request.contextPath }/users/signupform.do">회원가입</a></li>
            				<li><a href="${pageContext.request.contextPath }/users/loginform.do">로그인</a></li>
						</ul>
					</li>			
				</c:when>
				
				<c:otherwise>
					<li class="gb">
						<a href="${pageContext.request.contextPath }/" style="color:#4A817A;font-size:17px;">${id }</a>	  					
						<ul class="sub">
							<li><a href="${pageContext.request.contextPath }/reservation/reservationform.do">예약확인</a></li>     
							<li><a href="${pageContext.request.contextPath }/users/info.do">마이페이지</a></li>     
							<li><a href="${pageContext.request.contextPath }/users/logout.do">로그아웃</a></li>     
 						</ul>
 					<li>
				</c:otherwise>
			</c:choose>
		</ul>
	</nav>
	<!-- progress bar -->
	<div class = "progress-container">
		<div class = "progress-bar" id = "indicator"></div>
	</div>
</header>

<!-- 프로그래스바 스크립트 START -->
<script>
// 인터넷 스크롤 이동 시 이벤트
window.onscroll = function() {createPrograssBar()}; 

function createPrograssBar() {
  let winScroll = document.body.scrollTop || document.documentElement.scrollTop;
  let height = document.documentElement.scrollHeight - document.documentElement.clientHeight;
  let scrolled = (winScroll / height) * 100;
  document.getElementById("indicator").style.width = scrolled + "%";
}

function setBarColor() {
	const randNum = parseInt(Math.random() * 7 + 0);
	const colorArr = ['#FC9EBD', '#FFADC5', '#FFA9B0', '#FFCCCC', '#CCD1FF', '#A8C8F9', '#FFDDA6', '#B8F3B8'];
	
	document.getElementById("indicator").style.backgroundColor = colorArr[randNum];
}


setInterval(setBarColor, 500);
</script>

