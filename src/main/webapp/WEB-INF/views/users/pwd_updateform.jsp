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
<body>
<div class="text-center">
	<div class="container-fluid mb-4">
		<div class="row justify-content-md-center">
			<jsp:include page="/resources/include/navbar.jsp"></jsp:include>
			<div>
				<br><br><br>
			</div>
	<!-- 페이지 제목 -->
	<h2 class="mt-5">비밀 번호 수정</h2>
	<!-- form -->
			<div class="col-md-7 col-lg-4 mt-4">
				<form action="${pageContext.request.contextPath}/users/pwd_update.do" method="post" id="myForm" class="validation" novalidate>
					<div class="input-group mt-3 mb-4">
						<!-- <label for="pwd">기존 비밀 번호</label> -->
						<label class="form-label" for="password">
							<span class="visually-hidden">기존 비밀번호</span>
						</label>
						<span class="input-group-text" id="basic-addon1">
							<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-lock" viewBox="0 0 16 16">
						  		<path d="M8 1a2 2 0 0 1 2 2v4H6V3a2 2 0 0 1 2-2zm3 6V3a3 3 0 0 0-6 0v4a2 2 0 0 0-2 2v5a2 2 0 0 0 2 2h6a2 2 0 0 0 2-2V9a2 2 0 0 0-2-2zM5 8h6a1 1 0 0 1 1 1v5a1 1 0 0 1-1 1H5a1 1 0 0 1-1-1V9a1 1 0 0 1 1-1z"/>
							</svg>
						</span>
						<input class="form-control" type="password" name="password" id="password" placeholder="기존 비밀번호"/>
					</div>
					<div class="input-group mb-4">
						<!-- <label for="newPwd">새 비밀번호</label> -->
						<label class="form-label" for="password">
							<span class="visually-hidden">새 비밀번호</span>
						</label>
						<span class="input-group-text" id="basic-addon1">
							<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-lock" viewBox="0 0 16 16">
						  		<path d="M8 1a2 2 0 0 1 2 2v4H6V3a2 2 0 0 1 2-2zm3 6V3a3 3 0 0 0-6 0v4a2 2 0 0 0-2 2v5a2 2 0 0 0 2 2h6a2 2 0 0 0 2-2V9a2 2 0 0 0-2-2zM5 8h6a1 1 0 0 1 1 1v5a1 1 0 0 1-1 1H5a1 1 0 0 1-1-1V9a1 1 0 0 1 1-1z"/>
							</svg>
						</span>
						<input class="form-control" type="password" name="newpassword" id="newpassword" placeholder="새 비밀번호"/>
					</div>
					<div class="input-group mb-5">
						<!-- <label for="newPwd2">새 비밀번호 확인</label> -->
						<label class="form-label" for="password">
							<span class="visually-hidden">새 비밀번호 확인</span>
						</label>
						<span class="input-group-text" id="basic-addon1">
							<svg xmlns="http://www.w3.org/2000/svg" height="16px" viewBox="0 0 24 24" width="16px" fill="#000000"><path d="M0 0h24v24H0z" fill="none"/><path d="M9 16.2L4.8 12l-1.4 1.4L9 19 21 7l-1.4-1.4L9 16.2z"/>
								<path xmlns="http://www.w3.org/2000/svg" d="M0 0h24v24H0z" fill="none"/>
								<path xmlns="http://www.w3.org/2000/svg" d="M9 16.2L4.8 12l-1.4 1.4L9 19 21 7l-1.4-1.4L9 16.2z"/>
							</svg>
						</span>
						<input class="form-control" type="password" id="newpassword2" placeholder="새 비밀번호 확인"/>
					</div>
					<button type="submit" class="w-100 btn btn-lg mb-4" style="height: 45px;background: #354A54;border-radius: 5px;border: 2.5px solid lightgrey;cursor: pointer;font-size:15px;color:#ffffff">수정하기</button>
					<button type="reset" class="w-100 btn btn-lg mb-4" style="height: 45px;background: #354A54;border-radius: 5px;border: 2.5px solid lightgrey;cursor: pointer;font-size:15px;color:#ffffff">리셋</button>
				</form>
				<a href="javascript:history.back();"><button type="submit" class="w-100 btn btn-lg mb-4" style="height: 45px;background: #354A54;border-radius: 5px;border: 2.5px solid lightgrey;cursor: pointer;font-size:15px;color:#ffffff">취소</button></a>
			</div>
		</div>
	</div>
</div>
<script>
	//폼에 submit 이벤트가 일어났을때 실행할 함수를 등록하고 
	document.querySelector("#myForm").addEventListener("submit", function(e){
		let pwd1=document.querySelector("#newpassword").value;
		let pwd2=document.querySelector("#newpassword2").value;
		//새 비밀번호와 비밀번호 확인이 일치하지 않으면 폼 전송을 막는다.
		if(pwd1 != pwd2){
			alert("비밀번호를 확인 하세요!");
			e.preventDefault();//폼 전송 막기 
		}
	});
</script>
	<jsp:include page="/resources/include/navbar.jsp"></jsp:include>
</body>
</html>


