<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="container">
		<p>
			${id }님의 예약이 완료되었습니다.
			<a href="${pageContext.request.contextPath }/home.do">홈으로</a>
		</p>
	</div>
<script src="${pageContext.request.contextPath }/resources/js/jquery-3.4.1.js"></script>
<script>
$(function() {
	alert("예약이 완료되었습니다.");
});
</script>	
</body>
</html>