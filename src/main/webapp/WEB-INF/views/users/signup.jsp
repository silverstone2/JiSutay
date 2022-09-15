<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>signup</title>
<jsp:include page="/include/style.jsp"></jsp:include>
</head>
<body>
	<div class="container-fluid mb-4">
		<div class="row justify-content-md-center">
			<!-- nav 바 -->
			
			
				<div class="w-50 alert alert-success alert-dismissible fade show text-center mt-3" role="alert" style="text-align:center;">
					<strong>
						🎉🎉
						회원 가입을 성공했습니다~!
						🎉🎉
					</strong>
				</div>
			<!-- 페이지 내용 -->
			<h1 class="text-center mt-5 mb-5">JiSutay</h1>
			<h2 class="text-center mt-5 mb-5"><strong>환영합니다!</strong></h2>
			<div class="text-center mt-5"><strong>${param.name}</strong> 님 회원가입을 축하드립니다.</div>
			<div class="text-center mb-5">Acorn-On의 새로운 아이디는 <strong>${param.id}</strong> 입니다.</div>
			<a class="col-3 btn btn-success btn-lg mb-4 center" href="loginform.do">시작하기</a>
		</div>
	</div>
</body>
</html>