<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>signup</title>
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
						νμ κ°μμ μ±κ³΅νμ΅λλ€~!
						ππ
					</strong>
				</div>
			<!-- νμ΄μ§ λ΄μ© -->
			<h1 class="text-center mt-5 mb-5">JiSutay</h1>
			<h2 class="text-center mt-5 mb-5"><strong>νμν©λλ€!</strong></h2>
			<div class="text-center mt-5"><strong>${param.name}</strong> λ νμκ°μμ μΆνλλ¦½λλ€.</div>
			<div class="text-center mb-5">Acorn-Onμ μλ‘μ΄ μμ΄λλ <strong>${param.id}</strong> μλλ€.</div>
			<a class="col-3 btn btn-success btn-lg mb-4 center" href="loginform.do">μμνκΈ°</a>
		</div>
	</div>
	</section>
</body>
</html>