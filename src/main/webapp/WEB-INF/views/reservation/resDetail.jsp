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
<title>reservation - resInfo.jsp</title>
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
	      	<h2 class="mt-5">예약 상세 내역</h2>	
			<!-- form -->
<%-- 			<table class="listTable table-primary mt-5">
		<thead>
			<tr>
				<th>번호</th>
				<th>제목</th>
				<th>글쓴이</th>
				<th>날짜</th>
				<th>조회</th>
			</tr>
		</thead>
		
		<tbody>
		<c:forEach var="tmp" items="${list }">
			<tr>
				<td style="width: 50px;">${tmp.num}</td>
				<td style="width: 400px;">
					<a href="detail.do?num=${tmp.num }#post">${tmp.title }</a>
				</td>
				<td style="width: 150px;">${tmp.check_in }</td>
				<td style="width: 200px;">${tmp.regdate }</td>
				<td>${tmp.content }</td>
				<td style="width: 50px;">${tmp.views }</td>
			</tr>
		</c:forEach>
		</tbody>
	</table>	 --%>
			
 				<div class="col-md-7 col-lg-4 mt-4">
					<div>
						<input type="hidden" value="${dto.res_id  }" readonly="readonly">
					</div>
					<!-- 예약자 -->
					<div class="input-group mt-3 mb-4">
						<label class="form-label" for="email">
							<span class="visually-hidden">예약자</span>
						</label>
						<span class="input-group-text">예약자</span>
						<input class="form-control" id="email" type="text" name="email" value="${dto.res_id}" required disabled/>
					</div>
					<!-- 방이름 -->
					<div class="input-group mb-4">
						<label class="form-label" for="id">
							<span class="visually-hidden">방이름</span>
						</label>
						<span class="input-group-text">방이름</span>
						<input class="form-control" id="id" type="text" name="id" value="${dto.room_num}" required disabled/>
					</div>
					<!-- 체크인 -->
					<div class="input-group mb-4">
						<label class="form-label" for="id">
							<span class="visually-hidden">체크인</span>
						</label>
						<span class="input-group-text">체크인</span>
						<input class="form-control" id="id" type="text" name="id" value="${dto.check_in}" required disabled/>
					</div>
					<!-- 체크아웃 -->
					<div class="input-group mb-4">
						<label class="form-label" for="id">
							<span class="visually-hidden">체크아웃</span>
						</label>
						<span class="input-group-text">체크아웃</span>
						<input class="form-control" id="id" type="text" name="id" value="${dto.check_out}" required disabled/>
					</div>

					<!-- 예약날짜 -->
					<div class="input-group mb-4">
						<label class="form-label" for="id">
							<span class="visually-hidden">예약날짜</span>
						</label>
						<span class="input-group-text">예약날짜</span> <!-- span글자 부분에 flaticon으로 채워주기 -->
						<input class="form-control" id="id" type="text" name="id" value="${dto.regdate}" required disabled/>
					</div> 
					
					
					
					<!-- button 요소 -->
					<%-- <button type="submit" class="w-100 btn btn-lg mb-4" style="height: 45px;background: #354A54;border-radius: 5px;border: 2.5px solid lightgrey;cursor: pointer;font-size:15px;color:#ffffff"><a href="${pageContext.request.contextPath}/users/info_updateform.do">개인정보 수정</a></button> --%>
					<button type="submit" class="w-100 btn btn-lg mb-4" style="height: 45px;background: #354A54;border-radius: 5px;border: 2.5px solid lightgrey;cursor: pointer;font-size:15px;color:#ffffff"><a href="${pageContext.request.contextPath}/home.do">홈으로</a></button>
					<!-- <button type="submit" class="w-100 btn btn-lg mb-4" style="height: 45px;background: #354A54;border-radius: 5px;border: 2.5px solid lightgrey;cursor: pointer;font-size:15px;color:#ffffff"><a href="javascript:deleteConfirm()">탈퇴</a></button> -->
					
				<!-- </form> -->
				<br>
			</div>
		</div>
	</div>

<script>
/* 	function deleteConfirm(){
		const isDelete=confirm("${id} 님 탈퇴 하시겠습니까?");
		if(isDelete){
			location.href="${pageContext.request.contextPath}/users/delete.do";
		}
	} */
</script>
	
	<!-- footer include -->
	<jsp:include page="/resources/include/navbar.jsp"></jsp:include>
</body>
</html>