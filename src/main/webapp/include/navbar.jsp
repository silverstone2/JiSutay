<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
  
 
<nav class="navbar navbar-expand-lg bg-light">
	
	<div class="container-fluid">
    	<a class="navbar-brand" href="${pageContext.request.contextPath }/">지수테이</a>
    	<button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      	<span class="navbar-toggler-icon"></span>
    	</button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav">
        <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="${pageContext.request.contextPath }/">Home</a>
        </li>
        
        	<li class="nav-item dropdown">
        	<a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
        	ABOUT
        	</a>
        <ul class="dropdown-menu">
			<li><a class="dropdown-item" href="${pageContext.request.contextPath }/">인사말</a></li>
            <li><a class="dropdown-item" href="${pageContext.request.contextPath }/">외부전경</a></li>
            <li><a class="dropdown-item" href="${pageContext.request.contextPath }/">오시는길</a></li>
		</ul>
        
        
        <li class="nav-item dropdown">
        	<a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
        	POOLVILLA
        	</a>
        <ul class="dropdown-menu">
			<li><a class="dropdown-item" href="${pageContext.request.contextPath }/">2~3인실 객실 A</a></li>
            <li><a class="dropdown-item" href="${pageContext.request.contextPath }/">2~3인실 객실 B</a></li>
            <li><a class="dropdown-item" href="${pageContext.request.contextPath }/">4~5인실 객실 A</a></li>
            <li><a class="dropdown-item" href="${pageContext.request.contextPath }/">4~5인실 객실 B</a></li>
            <li><a class="dropdown-item" href="${pageContext.request.contextPath }/">다인용 객실</a></li>
		</ul>
        
        <li class="nav-item">
          <a class="nav-link" href="${pageContext.request.contextPath }/">TRAVEL</a>
        </li>      
        <li class="nav-item">
          <a class="nav-link" href="${pageContext.request.contextPath }/">RESERVATION</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="${pageContext.request.contextPath }/">COMMUNITY</a>
        </li>             
								

		</ul>
		
			<c:choose>
		<c:when test="${empty sessionScope.id }">
									
		<li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
            로그인
          </a>
        <ul class="dropdown-menu">
			<li><a class="dropdown-item" href="${pageContext.request.contextPath }/users/signup_form.jsp">회원가입</a></li>
            <li><a class="dropdown-item" href="${pageContext.request.contextPath }/users/loginform.jsp">로그인</a></li>
		</ul>
							
		</c:when>
		
		<c:otherwise>
			
		<nav class="navbar bg-light">
  			<div class="container-fluid">
				<a class="nav-bar-brand" href="${pageContext.request.contextPath }/users/private/info.jsp">${id }</a> 님 로그인중...
				<a class="nav-bar-brand" href="${pageContext.request.contextPath }/users/logout.jsp">로그아웃</a>		       
 			</div>
 		</nav>
		
		</c:otherwise>
	</c:choose>
	
	
	 </div>							       
 	</div>
</nav>
