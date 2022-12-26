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
<title>reservation - resList.jsp</title>
<style>
@import url(https://fonts.googleapis.com/css?family=Josefin+Slab:100,300,400,600,700);
	/* 제목a 부분  */
	tr td a{
		color: black;
		text-decoration: none;
	}
	tr td a:hover {
		font-weight: bold;
		text-decoration: underline;
	}
	tr td a:active {
		font-weight: bold;
		text-decoration: underline;
	}
	/* 제목a 부분  끝*/
	tr th {
		background-color : #E0E0E0;
		text-align: center;
		border-collapse : collapse;
		border : 0px solid #E0E0E0;
		height: 35px;
	}
	
	tr td {
		text-align: center;
		height: 35px;
	}
	.listTable{
		width: 100%;
		border-right:none;
		border-left:none;
		border-top:none;
		border-bottom:none;
	}
	
	.container {
	  padding-top: 1em;
	  margin-top: 1em;
	}
	
	table {
	    border-top: 1px solid #C6C6C6;
	    border-collapse: collapse;
	 }
	th, td {
	    border-bottom: 1px solid #C6C6C6;
	 }
	h1, p {
		width:fit-content;
        margin:auto;
	}
</style>
</head>

<body>
<jsp:include page="/resources/include/navbar.jsp"></jsp:include>
	<div class="container"><br><br>
		<h1 class="mt-5">결제 내역</h1><br><br>
		<table class="listTable table-primary mt-2">
			<thead>
				<tr>					
					<th>예약번호</th>
					<th>예약자</th>
					<th>체크인</th>
					<th>체크아웃</th>
					<th>예약날짜</th>
					<th>예약취소</th>				
				</tr>
			</thead>
			<tbody>
				<c:forEach var="tmp" items="${list}">
					<c:if test="${tmp.res_id eq sessionScope.id}"><!-- ${sessionScope.id} - 내가 접속한 아이디 표시가능  -->
						<tr>
							<td style="width: 50px;">${tmp.num}</td>
							<td style="width: 100px;">${tmp.res_id}</td>
							<td style="width: 150px;">${tmp.check_in }</td>
							<td style="width: 150px;">${tmp.check_out }</td>
							<td style="width: 150px;">${tmp.regdate }</td>
							<td style="width: 100px;">
								<a href="javascript:deleteRes()" href="javascript:goto()">
									<button class="btn btn-secondary">
										취소
									</button>
								</a>
								<%-- <button class="btn btn-secondary" onclick="location.href='resDelete.do?num=${tmp.num }' ">
									취소
								</button> --%>
							</td>
						</tr>
						<script>
							function deleteRes() {
							    if (confirm("예약을 취소하시겠습니까?")) {
							    	location.href = "resDelete.do?num=${tmp.num }";
							    };
							};
						</script>
					</c:if>
				</c:forEach>
			</tbody>
		</table>
	</div>
<br>

<!-- footer include -->
<jsp:include page="/resources/include/navbar.jsp"></jsp:include>
</body>
</html>