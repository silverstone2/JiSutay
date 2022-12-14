<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>pwd_update</title>
<jsp:include page="/resources/include/style.jsp"></jsp:include>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/css/common.css">
<link rel="shorcut icon" href="${pageContext.request.contextPath }/resources/Jisutayimage/Logo_Icon/favicon.ico">
<script type="text/javascript" async="" src="https://www.google-analytics.com/analytics.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.1/jquery.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/modify.js" defer=""></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/common.js" defer=""></script>
<script src="https://player.vimeo.com/api/player.js"></script>
</head>
<body>
	<section>
	<div class="container-fluid mb-4">
		<div class="row justify-content-md-center">
			<!-- nav λ° -->
			<jsp:include page="/resources/include/navbar.jsp"></jsp:include>
			
				<div class="w-50 alert alert-success alert-dismissible fade show text-center mt-3" role="alert" style="text-align:center;">
					<strong>
						ππ
						λΉλ°λ²νΈ λ³κ²½ μ±κ³΅~~!
						ππ
					</strong>
				</div>
			<!-- νμ΄μ§ λ΄μ© -->
	<c:choose>
		<c:when test="${isSuccess }">
			<h1 class="text-center mt-5 mb-5">JiSutay</h1>
			<h2 class="text-center mt-5 mb-5"><strong>μ±κ³΅!</strong></h2>
			<div class="text-center mt-5"><strong>${param.name}</strong> λ λΉλ°λ²νΈλ₯Ό μμ νκ³  λ‘κ·Έμμ λμμ΅λλ€.</div>
			<div><br><br></div>
			<a class="col-3 btn btn-info btn-lg mb-4 center" href="${pageContext.request.contextPath}/home.do">λ€μ λ‘κ·ΈμΈ νλ¬ κ°κΈ°</a>
		</c:when>
		<c:otherwise>
			<h1 class="text-center mt-5 mb-5">JiSutay</h1>
			<h2 class="text-center mt-5 mb-5"><strong>μ€ν¨!</strong></h2>
			<div class="text-center mt-5">μ΄μ  λΉλ°λ²νΈκ° μΌμΉνμ§ μμ΅λλ€.</div>
			<a class="col-3 btn btn-danger btn-lg mb-4 center" href="${pageContext.request.contextPath}/users/pwd_updateform.do">λ€μμλ</a>
		</c:otherwise>
	</c:choose>
		</div>
	</div>
	</section>
<title>/views/users/pwd_update.jsp</title>
</head>
<body>
<div class="container">
	<c:choose>
		<c:when test="${isSuccess }">
			<p>
				<strong>${id }</strong> λ λΉλ°λ²νΈλ₯Ό μμ νκ³  λ‘κ·Έ μμλμμ΅λλ€
				<a href="${pageContext.request.contextPath}/home.do">λ€μ λ‘κ·ΈμΈ νλ¬ κ°κΈ°</a>
			</p>
		</c:when>
		<c:otherwise>
			<p>
				μ΄μ  λΉλ°λ²νΈκ° μΌμΉνμ§ μμ΅λλ€.
				<a href="${pageContext.request.contextPath}/users/pwd_updateform.do">λ€μ μλ</a>
			</p>
		</c:otherwise>
	</c:choose>
</div>
</body>
</html>