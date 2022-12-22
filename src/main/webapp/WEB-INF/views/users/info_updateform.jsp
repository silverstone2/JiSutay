<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<link rel="shortcut icon" href="${pageContext.request.contextPath }/Jisutayimage/Logo_Icon/favicon.ico">
<jsp:include page="/resources/include/style.jsp"></jsp:include>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/css/common.css">
<link rel="shorcut icon" href="${pageContext.request.contextPath }/resources/Jisutayimage/Logo_Icon/favicon.ico">
<script type="text/javascript" async="" src="https://www.google-analytics.com/analytics.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.1/jquery.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/common.js" defer=""></script>
<head>
<meta charset="UTF-8">
<title>users - pwd_updateform.jsp</title>
</head>
<body class="text-center">
	<div class="container-fluid mb-4">
		<div class="row justify-content-md-center">
			<!-- nav 바 -->
			<jsp:include page="/resources/include/navbar.jsp"></jsp:include>
			
			<div>
				<br>
				<br>
				<br>
			</div>
			
			<!-- 페이지 제목 -->
	      	<h2 class="mt-5">마이페이지</h2>
				
			<!-- form -->
			<div class="col-md-7 col-lg-4 mt-4">
				<form action="" method="post" id="formSubmit" class="validation" novalidate>
				<!-- input 요소 -->
					<!-- 이메일 -->
					<div class="input-group mt-3 mb-4">
						<label class="form-label" for="email">
							<span class="visually-hidden">이메일</span>
						</label>
						<span class="input-group-text">@</span>
						<input class="form-control" id="email" type="email" name="email" value="${dto.email}" required/>
						<!-- <div class="invalid-feedback" id="emailValid">이메일 형식에 맞게 입력하세요</div> -->
					</div>
					
					<!-- 아이디 -->
					<div class="input-group mb-4">
						<label class="form-label" for="id">
							<span class="visually-hidden">아이디</span>
						</label>
						<span class="input-group-text">
							<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-person" viewBox="0 0 16 16">
							  <path d="M8 8a3 3 0 1 0 0-6 3 3 0 0 0 0 6zm2-3a2 2 0 1 1-4 0 2 2 0 0 1 4 0zm4 8c0 1-1 1-1 1H3s-1 0-1-1 1-4 6-4 6 3 6 4zm-1-.004c-.001-.246-.154-.986-.832-1.664C11.516 10.68 10.289 10 8 10c-2.29 0-3.516.68-4.168 1.332-.678.678-.83 1.418-.832 1.664h10z"/>
							</svg>
						</span>
						<input class="form-control" id="id" type="text" name="id" value="${dto.id}" required disabled/>
						<!-- <small class="form-text text-muted w-100">영문자 소문자로 시작하고 5글자~10글자 이내로 입력하세요</small> -->
						<!-- <div class="invalid-feedback" id="idValid">사용할 수 없는 형식입니다</div> -->
					</div>
					
					<!-- 이름 -->
					<div class="input-group mb-5">
						<label class="form-label" for="name">
							<span class="visually-hidden">이름</span>
						</label>
						<span class="input-group-text" id="basic-addon1">
							<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-person-badge" viewBox="0 0 16 16">
							  <path d="M6.5 2a.5.5 0 0 0 0 1h3a.5.5 0 0 0 0-1h-3zM11 8a3 3 0 1 1-6 0 3 3 0 0 1 6 0z"/>
							  <path d="M4.5 0A2.5 2.5 0 0 0 2 2.5V14a2 2 0 0 0 2 2h8a2 2 0 0 0 2-2V2.5A2.5 2.5 0 0 0 11.5 0h-7zM3 2.5A1.5 1.5 0 0 1 4.5 1h7A1.5 1.5 0 0 1 13 2.5v10.795a4.2 4.2 0 0 0-.776-.492C11.392 12.387 10.063 12 8 12s-3.392.387-4.224.803a4.2 4.2 0 0 0-.776.492V2.5z"/>
							</svg>
						</span>
						<input class="form-control" id="name" type="text" name="name" value="${dto.name}" required/>
						<div class="invalid-feedback" id="nameValid"></div>
					</div>
					
				</form>
					<!-- button 요소 -->
					<button type="submit" class="w-100 btn btn-lg mb-4" style="height: 45px;background: #354A54;border-radius: 5px;border: 2.5px solid lightgrey;cursor: pointer;font-size:15px;color:#ffffff"><a href="${pageContext.request.contextPath}/users/update.do">개인정보 수정</a></button>
					<button type="submit" class="w-100 btn btn-lg mb-4" style="height: 45px;background: #354A54;border-radius: 5px;border: 2.5px solid lightgrey;cursor: pointer;font-size:15px;color:#ffffff"><a href="javascript:deleteConfirm()">탈퇴</a></button>
					
				<br>
			</div>
		</div>
	</div>

<script>
	function deleteConfirm(){
		const isDelete=confirm("${id} 님 탈퇴 하시겠습니까?");
		if(isDelete){
			location.href="${pageContext.request.contextPath}/users/delete.do";
		}
	}
</script>
	
	<!-- footer include -->
	<jsp:include page="/resources/include/navbar.jsp"></jsp:include>
</body>
</html>