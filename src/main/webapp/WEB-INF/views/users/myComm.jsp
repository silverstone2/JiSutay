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
<title>users - myComm.jsp</title>
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

}
</style>
</head>

<body>
<jsp:include page="/resources/include/navbar.jsp"></jsp:include>
	<div class="container"><br><br>	
		<h1 class="mt-5">${sessionScope.id} 님의 글 목록</h1>	
		<table class="listTable table-primary mt-5">
			<thead>
				<tr>					
					<th></th>
					<th>방이름</th>
					<th>리뷰내용</th>
					<th>리뷰날짜</th>
					<th></th>
					<th>삭제</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="tmp" items="${commentsList}">
					<c:if test="${tmp.writer eq sessionScope.id}">
						<tr>
							<td style="width: 50px;">${tmp.num}</td>
<%-- 							<td style="width: 50px;"><a href="${pageContext.request.contextPath }/room/detail.do?target_id=${tmp.target_id}">${tmp.target_id}</a></td> --%>
							<td style="width: 50px;"><a href="${pageContext.request.contextPath }/room/detail.do?num=${tmp.room_num}&sort=regdate">${tmp.target_id}</a></td>
							<td style="width: 250px;" class="word"><a href="${pageContext.request.contextPath }/room/detail.do?num=${tmp.room_num}&sort=regdate#review">${tmp.content}</a></td>
							<td style="width: 100px;">${tmp.regdate}</td>
							<td style="width: 50px;"></td>
							<td style="width: 50px;">
								<a href="javascript:deleteComm()">
									<button class="btn btn-secondary">삭제</button>
								</a>
							</td>
						</tr>
						<script>
						function deleteComm() {
						    if (confirm("댓글을 삭제하시겠습니까?")) {
						        /* location.href = "commDelete.do?num=${tmp.num }"; */
						        location.href = "commDelete.do?num=${tmp.num }";
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