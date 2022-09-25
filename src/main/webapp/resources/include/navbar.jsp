<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<header>
	<hgroup>
		<h1><a href="${pageContext.request.contextPath }/"><img src="${pageContext.request.contextPath }/Jisutayimage/Logo.png" width="190" height="80"></a></h1>
		<div><p>제주도 힐링 감성을 가득 담은 <span>"지수테이"</span></p></div>
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
					<li><a href="${pageContext.request.contextPath }/room/detail.do?num=5&sort=regdate">단체실</a></li>
					<li><a href="${pageContext.request.contextPath }/room/detail.do?num=1&sort=regdate">일반실</a></li>
					<li><a href="${pageContext.request.contextPath }/room/detail.do?num=2&sort=regdate">자미</a></li>
					<li><a href="${pageContext.request.contextPath }/room/detail.do?num=3&sort=regdate">밤별</a></li>
					<li><a href="${pageContext.request.contextPath }/room/detail.do?num=4&sort=regdate">달빛</a></li>
				</ul>
			<li class="gb"><a href="${pageContext.request.contextPath }/travel/list.do"><span class="en">TRAVEL</span><span class="ko">주변여행지</span></a></li>
			<li class="gb">
				<a href="${pageContext.request.contextPath }/reservation/list.do">
					<span class="en">RESERVATION</span>
					<span class="ko">실시간예약</span>
				</a>
			</li>
			<li class="gb">
				<a href="${pageContext.request.contextPath }/notice/list.do">
					<span class="en">COMMUNITY</span>
					<span class="ko">커뮤니티</span>
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
					<div class="container-fluid">
							<a class="nav-bar-brand" href="${pageContext.request.contextPath }/">${id }</a> 님 로그인중...
							<a class="nav-bar-brand" href="${pageContext.request.contextPath }/users/logout.do">로그아웃</a>	       
 					</div>
				</c:otherwise>
			</c:choose>
		</ul>
	</nav>
</header>

