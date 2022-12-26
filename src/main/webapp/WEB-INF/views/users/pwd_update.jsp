<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
			<!-- nav 바 -->
			<jsp:include page="/resources/include/navbar.jsp"></jsp:include>
			
				<div class="w-50 alert alert-success alert-dismissible fade show text-center mt-3" role="alert" style="text-align:center;">
					<strong>
						🎉🎉
						비밀번호 변경 성공~~!
						🎉🎉
					</strong>
				</div>
			<!-- 페이지 내용 -->
	<c:choose>
		<c:when test="${isSuccess }">
			<h1 class="text-center mt-5 mb-5">JiSutay</h1>
			<h2 class="text-center mt-5 mb-5"><strong>성공!</strong></h2>
			<div class="text-center mt-5"><strong>${param.name}</strong> 님 비밀번호를 수정하고 로그아웃 되었습니다.</div>
			<div><br><br></div>
			<a class="col-3 btn btn-info btn-lg mb-4 center" href="${pageContext.request.contextPath}/home.do">다시 로그인 하러 가기</a>
		</c:when>
		<c:otherwise>
			<h1 class="text-center mt-5 mb-5">JiSutay</h1>
			<h2 class="text-center mt-5 mb-5"><strong>실패!</strong></h2>
			<div class="text-center mt-5">이전 비밀번호가 일치하지 않습니다.</div>
			<a class="col-3 btn btn-danger btn-lg mb-4 center" href="${pageContext.request.contextPath}/users/pwd_updateform.do">다시시도</a>
		</c:otherwise>
	</c:choose>
		</div>
	</div>
	</section>
</body>
</html>