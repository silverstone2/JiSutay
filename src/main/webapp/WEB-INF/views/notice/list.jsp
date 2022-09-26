<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/views/notice/list.jsp</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">

<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/css/common.css">
<link rel="shorcut icon" href="${pageContext.request.contextPath }/Jisutayimage/Logo_Icon/favicon.ico">
<script type="text/javascript" async="" src="https://www.google-analytics.com/analytics.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.1/jquery.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/common.js" defer=""></script>

<script src="https://player.vimeo.com/api/player.js"></script>

<style>
	/*@@@@@@@@@새글 작성 시작@@@@@@@@@@*/
	@import url(https://fonts.googleapis.com/css?family=Josefin+Slab:100,300,400,600,700);
	
	button {
	  margin-bottom: 0.5em;
	}
	
	a,
	a:visited {
	  text-decoration: none;
	  color: #00AE68;
	}
	
	.clear {
	  clear: both;
	}

	.pageTitle {
	  font-size: 2em;
	  font-weight: 700;
	  text-transform: uppercase;
	  line-height: 1em;
	  color: #00AE68;
	}
	
	.pageSubTitle {
	  margin-bottom: 0.5em;
	  font-size: 1.3em;
	  font-weight: 700;
	  line-height: 1em;
	  color: #222;
	}
	
	.articleTitle {
	  font-size: 1.15em;
	  font-weight: 700;
	  line-height: 1em;
	  color: #222;
	}
	
	.wrapper {
	  width: 600px;
	  margin: 20px auto;
	}
	
	.container {
	  padding-top: 1em;
	  margin-top: 1em;
	  
	}
	
	a.button {
	  display: block;
	  position: relative;
	  float: left;
	  width: 80px;
	  padding: 0;
	  margin: 10px 20px 10px 0;
	  font-weight: 600;
	  text-align: center;
	  line-height: 40px;
	  color: #FFF;
	  border-radius: 5px;
	  transition: all 0.2s ;
	}
	
	.btnLightBlue {
	  background: #CCCCFF;
	}
	
	.btnLightBlue.btnPush {
	  box-shadow: 0px 5px 0px 0px #6666FF;
	}
	
	.btnPush:hover {
	  margin-top: 15px;
	  margin-bottom: 5px;
	}
	
	.btnLightBlue.btnPush:hover {
	  box-shadow: 0px 0px 0px 0px #1E8185;
	}
	/*@@@@@@@@@@새글작성 끝@@@@@@@@@@*/
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
	
	/* 페이징 css */ 
	.page-ui a{
		color: black;
		text-decoration: none;
	}
	
	.page-ui {
		font-size: 24px;
	}
	.page-ui a:hover{
		text-decoration: none;
	}
	
	.page-ui a.active{
		color: sky;
		font-weight: bold;
		text-decoration: none;
	}
	.page-ui ul{
		list-style-type: none;
		padding: 0;
		display: inline-block; 
	}
	
	.page-ui ul > li{
		float: left;
		padding: 5px;
	}
	/* 페이징 css 끝 */
	.clearfix {
		width: 100%;
		border-right:none;
		border-left:none;
		border-top:none;
		border-bottom:none;
		border-width: 2px;
		margin-bottom: 0px;
		padding-bottom: 0px;
		text-align: center;
		margin-top: 20px;
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
	select{
		width: 100px;
		height: 30px;
	}
	div .aa{
		float:right;	
	}
/* 공지사항 이미지 쪽 */
	.lb-wrap {
		width: 100%;
		margin: 10px auto;
		border: 1px solid #000000;
		position: relative;
	}
	.lb-wrap img {
		width: 100%;
		vertical-align: middle;
	}
	.lb-text {
		padding: 10px 20px;
		background-color: #FFEEBC;
		text-align: center;
		position: absolute;
		top: 50%;
		left: 50%;
		transform: translate(-50%, -50%);	
		font-size:80px;
		color:#FBFCFC;
		background-color:transparent;
	}
	.lb-text2 {
		padding: 10px 20px;
		background-color: #FFEEBC;
		text-align: center;
		position: absolute;
		top: 50%;
		left: 50%;
		transform: translate(-50%, -50%);
		font-size:30px;
		color:#FBFCFC;
		margin-bottom:7%;
		background-color:transparent;
	}
</style>
</head>
<div class="lb-wrap">
	<div class="lb-text">
		<p>NOTICE</p><br/>
	</div>
	<div class="lb-text2">
		<p>공지사항</p>
	</div>
	<div class="lb-image">
		<img src="${pageContext.request.contextPath}/Jisutayimage/notice/fullstay3.png" alt="noticeImage">
	</div>
</div>
<body>
<div class="container">
	<h1>공지사항</h1>
  
	<p>공지사항과 다양한 소식을 확인해보세요.</p>
	<br />
		<!-- 새글 작성 -->
	<c:choose>
		<c:when test="${id eq 'admin'}">
			<div class="aa">
				<a href="insertForm.do" title="Button push lightblue" class="button btnPush btnLightBlue">새글작성</a>		
			</div>
		</c:when>
	</c:choose>
	<!-- 새글 작성 끝 -->
	<table class="listTable table-primary mt-5">
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
				<td style="width: 150px;">${tmp.writer }</td>
				<td style="width: 200px;">${tmp.regdate }</td>
				<%-- <td>${tmp.content }</td> --%>
				<td style="width: 50px;">${tmp.views }</td>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<!-- 페이지 부분 -->
	<div class="page-ui clearfix aa" style="float:right;">
		<ul>
			<c:if test="${startPageNum ne 1 }">
				<li>
					<a class="text-decoration-none" href="list.do?pageNum=${startPageNum-1 }&condition=${condition }&keyword=${encodedK }">Prev</a>
				</li>
			</c:if>
			<c:forEach var="i" begin="${startPageNum }" end="${endPageNum }">
				<li>
					<c:choose>
						<c:when test="${pageNum eq i }">
							<a  class="active text-decoration-none" href="list.do?pageNum=${i }&condition=${condition }&keyword=${encodedK }" >${i }</a>
						</c:when>
						<c:otherwise>
							<a class="text-decoration-none" href="list.do?pageNum=${i }&condition=${condition }&keyword=${encodedK }" >${i }</a>
						</c:otherwise>
					</c:choose>
				</li>
			</c:forEach>
			<c:if test="${endPageNum lt totalPageCount }">
				<li>
					<a class="text-decoration-none" href="list.do?pageNum=${endPageNum+1 }&condition=${condition }&keyword=${encodedK }">Next</a>
				</li>
			</c:if>
		</ul>
	</div>
	<!-- 페이지 부분 끝 -->

	<div style="clear:both;"></div>

	
	<!-- 검색 부분 -->
	<div style="text-align:center; width:100%;">
		<form action="list.do" method="get"> 
			<label for="condition"><strong>검색</strong></label>
			<select name="condition" id="condition">
				<option value="title_content" ${condition eq 'title_content' ? 'selected' : '' }>제목+내용</option>
				<option value="title" ${condition eq 'title' ? 'selected' : '' }>제목</option>
				<option value="writer" ${condition eq 'writer' ? 'selected' : '' }>작성자</option>
			</select>
			<input type="text" id="keyword" name="keyword" placeholder="검색어..." value="${keyword }"/>
			<button class="btn btn-primary btn-sm" type="submit" >찾기</button>
		</form>	
		<c:if test="${ not empty condition }">
			<p>
				<strong>${totalRow }</strong> 개의 글이 검색 되었습니다.
			</p>
		</c:if>
	</div>
	<!-- 검색 부분 끝 -->
</div>
</body>
</html>