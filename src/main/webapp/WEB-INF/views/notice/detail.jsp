<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/views/notice/detail.jsp</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
<style>
		.container{
		margin-left: 25%;
		margin-right: 25%;
	}
	.detailTable{
		width:900px;
		border-right:none;
		border-left:none;
		border-top:none;
		border-bottom:none;
		border: 1px;
	}

	/*
	.buttonEffect{
		text-align:center;
		vertical-align: center;
		width:575px;
		height: 45px;
		background-color:#E0E0E0;
		border-top: 10px;
		font-size: 15px;
	}
	*/
	.buttonEffect {
		margin-left: 25%;
		margin-right: 25%;
		width:250px;
		height: 50px;
		text-align:center;
		vertical-align: baseline;
		background-color:#E0E0E0;
		margin-top: 10px;
		padding: 10px 0 10px;
		font-size: 15px;
		border: none;
	}
	.buttonEffect > a{
		text-decoration: none;
		color: #E0E0E0;
	}
	h1{
		margin-top:3%;
	}
	p{
		margin-bottom:3%;
	}
	h1, p {
		width:900px;
		text-align:center;
	}
	.aaa{
		margin-bottom:5%;
	}
</style>
</head>
<body>
<div class="container">
	<h1>공지사항</h1>
	<p>공지사항과 다양한 소식을 확인해보세요.</p>
	
<%-- 	<c:if test="${dto.prevNum ne 0 }">
		<a href="detail.do?num=${dto.prevNum }&keyword=${encodedK }&condition=${condition }">이전글</a>
	</c:if>
	<c:if test="${dto.nextNum ne 0 }">
		<a href="detail.do?num=${dto.nextNum }&keyword=${encodedK }&condition=${condition }">다음글</a>
	</c:if>
	<c:if test="${ not empty keyword }"> <!-- 키워드에 검색내용을 입력했으면 아래 글이 나오고, 아니면 나오지 않는다. -->
		<p>	
			<strong>${condition }</strong> 조건, 
			<strong>${keyword }</strong> 검색어로 검색된 내용 자세히 보기 
		</p>
	</c:if>	 --%>
	
	<table class="detailTable">
		<tr style="font-size:45px;" class="aaa">
			<th colspan="3">${dto.title }  </th>
		</tr>
		
		<tr style="border:1px;" class="aaa">
			<%-- <td>번호 : ${dto.num } 번 입니다</td> --%>
			<td class="col-2"><span>작성자 : ${dto.writer }</span></td>
			<td class="col-3"><span>날짜 : ${dto.regdate }</span></td>
			<td class="col-7" style="text-align:right;"><span>조회수 : ${dto.views } 회</span></td>
		</tr>
		<tr class="aaa">
			<td colspan="3">${dto.content }</td>
		</tr>
	</table>
	
	<c:choose>
		<c:when test="${id eq 'admin'}">
			<div>
			<button class="buttonEffect" onclick="location.href='list.do'">목록</button>
			</div>
			<div>
			<button class="buttonEffect" onclick="location.href='updateForm.do?num=${param.num }'">수정</button>
			</div>
			<div>
			<button class="buttonEffect" onclick="location.href='delete.do?num=${param.num }'">삭제</button>
			</div>
			
		</c:when>
		<c:otherwise>
			<button class="buttonEffect" onclick="location.href='list.do'">목록</button>
		</c:otherwise>
	</c:choose>
</div>
</body>
</html>