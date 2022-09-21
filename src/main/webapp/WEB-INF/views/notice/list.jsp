<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/views/notice/list.jsp</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
<style>
	.container{
		margin-left: 25%;
		margin-right: 25%;
	}
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
		background-color : #d9efed;
		text-align: center;
		border-collapse : collapse;
		border : 0px solid #d9efed;
	}
	
	tr td {
		text-align: center;
	}
	.listTable{
		width: 850px;
		border-right:none;
		border-left:none;
		border-top:none;
		border-bottom:none;
	}
	
	<!--페이징 css -->
	.page-ui a{
		color: black;
		text-decoration: none;
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
	}
	
	.page-ui ul > li{
		float: left;
		padding: 5px;
	}
	.clearfix {
		width: 850px;
		border-right:none;
		border-left:none;
		border-top:none;
		border-bottom:none;
		
		margin-left: 30%;
		margin-right: 30%;
		border-width: 2px;
	}
	.buttonEffect{
   		/* border-width: 1px 1px 1px 1px; */
		border-style: thin;
		border-color: pink; 
	}
</style>
</head>
<body>
<div class="container">
	<h1>공지사항 페이지</h1>
	<p>공지사항과 다양한 소식을 확인해보세요.</p>
	<c:choose>
		<c:when test="${id eq 'admin'}">
			<!-- <a href="insertForm.do">새 공지 작성 </a> -->
			<button type="button" class="buttonEffect" onclick="location.href='insertForm.do'">새 글 작성</button>		
		</c:when>
	</c:choose>
	<br />
	<table class="listTable table-primary">
		<thead>
			<tr>
				<th>번호</th>
				<th>제목</th>
				<th>글쓴이</th>
				<th>날짜</th>
				<!-- <th>내용</th> -->
				<th>조회</th>
			</tr>
		</thead>
		
		<tbody>
		<c:forEach var="tmp" items="${list }">
			<tr>
				<td style="width: 50px;">${tmp.num}</td>
				<td style="width: 400px;">
					<a href="detail.do?num=${tmp.num }">${tmp.title }</a>
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
	<div class="page-ui clearfix">
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
	<div style="text-align:center; width:850px;">
		<form action="list.do" method="get"> 
			<label for="condition">검색조건</label>
			<select name="condition" id="condition">
				<option value="title_content" ${condition eq 'title_content' ? 'selected' : '' }>제목+내용</option>
				<option value="title" ${condition eq 'title' ? 'selected' : '' }>제목</option>
				<option value="writer" ${condition eq 'writer' ? 'selected' : '' }>작성자</option>
			</select>
			<input type="text" id="keyword" name="keyword" placeholder="검색어..." value="${keyword }"/>
			<button type="submit" class="buttonEffect">검색</button>
		</form>	
		<c:if test="${ not empty condition }">
			<p>
				<strong>${totalRow }</strong> 개의 글이 검색 되었습니다.
			</p>
		</c:if>
	</div>
	<!-- 검색 부분 끝 -->
	<!-- 처음으로 -->
	<button type="button" class="buttonEffect" onclick="location.href='${pageContext.request.contextPath}/home.do' ">첫 화면</button>
	<!-- 처음으로 끝 -->
		
</div>
</body>
</html>