<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<link rel="stylesheet" href="navbar.css" />
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa" crossorigin="anonymous"></script> 
<script src="http://code.jquery.com/jquery-latest.js"></script> 
 
<body class="pt-5">
	<header>	
 
		<nav class="navbar navbar-expand-sm bg-light fixed-top" style="height: 79px; width:auto;">
		<div class="container-fluid" style="height: 79px; border: 1px solid #DCDCDC; font-size: 15px;">
    	<a class="navbar-brand" href="${pageContext.request.contextPath }/">
			<img src="${pageContext.request.contextPath }/Jisutayimage/Logo.png" width="160" height="70">
		</a>
		<p class="navbar-text" style="padding: 25px 0px; height: 79px; width : 120px; margin: 0px 30px; text-align: center;">
			<span> 제주도 힐링 감성
				<br><strong>"지수테이"</strong>
			</span>
    	</p>
    	<div class="collapse navbar-collapse justify-content-between" id="navbarSupportedContent">
      		<ul class="navbar-nav" style="border: 1px solid #DCDCDC; height: 79px;">
        		<li class="nav-item dropdown"  style="border-left: 1px solid #DCDCDC;">
        			<a class="nav-link dropdown-toggle" style="padding: 32px 0px; border-left: 0px solid #DCDCDC; height: 79px; width: 70px; margin: 0px 30px" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false" onMouseOver="this.innerHTML='<strong>지수테이</strong>'" onMouseOut="this.innerHTML='<strong>ABOUT</strong>'">
        				<strong>ABOUT</strong>
        			</a>
        			<ul class="dropdown-menu">
						<li><a class="dropdown-item" href="${pageContext.request.contextPath }/about.do">인사말</a></li>
			            <li><a class="dropdown-item" href="${pageContext.request.contextPath }/">외부전경</a></li>
			            <li><a class="dropdown-item" href="${pageContext.request.contextPath }/">오시는길</a></li>
					</ul>
        
        		<li class="nav-item dropdown" style="border-left: 1px solid #DCDCDC;">
		        	<a class="nav-link dropdown-toggle" style=" padding: 32px 0px; width: 80px;
		           	 	height: 79px;
		           	 	margin: 0px 30px"	 
		        	 href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false"
		        	onMouseOver="this.innerHTML='<strong>풀빌라</strong>'" onMouseOut="this.innerHTML='<strong>POOLVILA</strong>'">
		        	<strong>POOLVILLA</strong>
		        	</a>
        <ul class="dropdown-menu">
			<li><a class="dropdown-item" href="${pageContext.request.contextPath }/room/room1.do">오름</a></li>
            <li><a class="dropdown-item" href="${pageContext.request.contextPath }/room/room2.do">자미</a></li>
            <li><a class="dropdown-item" href="${pageContext.request.contextPath }/room/room3.do">밤별</a></li>
            <li><a class="dropdown-item" href="${pageContext.request.contextPath }/room/room4.do">달빛</a></li>
		</ul>
        
        <li class="nav-item"  style="border-left: 1px solid #DCDCDC;">
          <a class="nav-link" style=
          	"padding: 32px 0px;
           	 width: 80px;
           	 height: 79px;
           	 margin: 0px 30px"
           	 href="${pageContext.request.contextPath }/" onMouseOver="this.innerHTML='<strong>주변 여행지</strong>'" onMouseOut="this.innerHTML='<strong>TRAVEL</strong>'" ><strong>TRAVEL</strong></a>
        </li>
        
              
        <li class="nav-item"  style="border-left: 1px solid #DCDCDC;">
          <a class="nav-link" style=
          	"padding: 32px 0px;
           	 width: 120px;
           	 height: 79px;
           	 margin: 0px 30px"
           href="${pageContext.request.contextPath }/reservation/list.do" onMouseOver="this.innerHTML='<strong>실시간예약</strong>'" onMouseOut="this.innerHTML='<strong>RESERVATION</strong>'"><strong>RESERVATION</strong></a>
        </li>
        
        
        
 		 <li class="nav-item"  style="border-left: 1px solid #DCDCDC;">
          <a class="nav-link" style=
          	"padding: 32px 0px;
           	 border-left: 0px solid #DCDCDC;
           	 width: 100px;
           	 height: 79px;
           	 margin: 0px 30px;"
           href="${pageContext.request.contextPath }/notice/list.do" onMouseOver="this.innerHTML='<strong>커뮤니티</strong>'" onMouseOut="this.innerHTML='<strong>COMMUNITY</strong>'"><strong>COMMUNITY</strong></a>
        </li>
          	
        
 
       </ul> 
                 
		<ul class="navbar-nav">				
			<c:choose>
				<c:when test="${empty sessionScope.id }">									
					<li class="nav-item dropdown">
	         			 <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
	            			<strong>Log-in</strong>
	          			</a>
	       				 <ul class="dropdown-menu">
							<li><a class="dropdown-item" href="${pageContext.request.contextPath }/users/signupform.do">회원가입</a></li>
	           				<li><a class="dropdown-item" href="${pageContext.request.contextPath }/users/loginform.do">로그인</a></li>
						</ul>				
				</c:when>
			<c:otherwise>					
				<nav class="navbar bg-light">
		  			<div class="container-fluid">
						<a class="nav-bar-brand" href="${pageContext.request.contextPath }/"><strong>${id }</strong></a> 님 로그인중...
						<a class="nav-bar-brand" href="${pageContext.request.contextPath }/users/logout.do">로그아웃</a>		       
		 			</div>
		 		</nav>
			</c:otherwise>
		</c:choose>
	</ul>
	</div>							       
</div>
</nav>
</header>
</body>