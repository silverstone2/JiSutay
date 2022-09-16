<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	*{
		margin: 0px;
		padding: 0px;
		box-sizing: border-box;
	}
	.frame{
		width: 100%;
		height: 100%;
	}
	ul{
		text-align: center;
		list-style:none;
	}
	.grid{
		margin-top: 100px;
		display: grid;
		grid-template-columns: 1fr 1fr;
		justify-items: start;
		grid-gap: 5px;
	}
	li:nth-child(odd){
		justify-self:end;
	}
	strong {
	font-size: 2em;
	}
	a {
	text-decoration-line: none;
	}
</style>
</head>
<body>
<div class="container">
	<div class="banner">
		<img src="${pageContext.request.contextPath}/Jisutayimage/travel/banner.jpg"/ style="height: 775px; width: 100%">
	</div>
	<div class="section contents">
		<ul>
			<div class="grid">
				<c:forEach var="tmp" items="${list }" >
					<li>
						<div class="img">
							<img src="${pageContext.request.contextPath }${tmp.imgPath}" height="auto" alt="">
						</div>
						<div class="txt">
							<h4>
								<strong>${tmp.title }</strong>
								<span>&nbsp;|&nbsp; 펜션에서 약 ${tmp.distance }분 소요</span>
							</h4>
							<span>${tmp.caption }</span>
						</div>
						<!-- id==master 계정일때만 보이는 ul로 수정예정 -->
						<div class="btn">
							<a href="${pageContext.request.contextPath }/travel/updateform.do?num=${tmp.num }">
								<svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="black" class="bi bi-pencil" viewBox="0 0 16 16">
  									<path d="M12.146.146a.5.5 0 0 1 .708 0l3 3a.5.5 0 0 1 0 .708l-10 10a.5.5 0 0 1-.168.11l-5 2a.5.5 0 0 1-.65-.65l2-5a.5.5 0 0 1 .11-.168l10-10zM11.207 2.5 13.5 4.793 14.793 3.5 12.5 1.207 11.207 2.5zm1.586 3L10.5 3.207 4 9.707V10h.5a.5.5 0 0 1 .5.5v.5h.5a.5.5 0 0 1 .5.5v.5h.293l6.5-6.5zm-9.761 5.175-.106.106-1.528 3.821 3.821-1.528.106-.106A.5.5 0 0 1 5 12.5V12h-.5a.5.5 0 0 1-.5-.5V11h-.5a.5.5 0 0 1-.468-.325z"/>
								</svg>
							</a>
							<a href="${pageContext.request.contextPath }/travel/delete.do">
								<svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="black" class="bi bi-trash" viewBox="0 0 16 16">
  									<path d="M5.5 5.5A.5.5 0 0 1 6 6v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm2.5 0a.5.5 0 0 1 .5.5v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm3 .5a.5.5 0 0 0-1 0v6a.5.5 0 0 0 1 0V6z"/>
  									<path fill-rule="evenodd" d="M14.5 3a1 1 0 0 1-1 1H13v9a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2V4h-.5a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1H6a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1h3.5a1 1 0 0 1 1 1v1zM4.118 4 4 4.059V13a1 1 0 0 0 1 1h6a1 1 0 0 0 1-1V4.059L11.882 4H4.118zM2.5 3V2h11v1h-11z"/>
								</svg>
							</a>
						</div>
					</li>
				</c:forEach>
			</div>
		</ul>
		<!-- 아이디==master 계정일때 만 보이는 ui로 수정예정 -->
	<div>
		<a href="${pageContext.request.contextPath }/travel/uploadform.do">업로드하로가기</a>
	</div>
	</div>
</div>
</body>
</html>