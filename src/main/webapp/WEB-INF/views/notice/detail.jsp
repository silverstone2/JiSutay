<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/views/notice/detail.jsp</title>
<link rel="shortcut icon" href="${pageContext.request.contextPath }/resources/Jisutayimage/Logo_Icon/favicon.ico">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
<style>
	.detailTable{
		width:80%;
		border-right:none;
		border-left:none;
		border-top:none;
		border-bottom:none;
		border: 1px;
	}
	table{
		margin-left:auto;
		margin-right:auto;
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
		width:25%;
		height: 50px;
		text-align:center;
		display: inline-block;
		vertical-align: baseline;
		background-color:#354A54;
		color: #ffffff;
		margin-top: 10px;
		padding: 10px 0 10px;
		font-size: 15px;
		border-radius: 4px;
		margin-left:37%;
	}
	
	
	.buttonEffect > a{
		text-decoration: none;
		color: #E0E0E0;
	}
	.h1p {
		width:fit-content;
        margin:auto;
	}
	th > p, td{
		/* margin-bottom:5%; */
		float:left;
	}
	.prevNextTitle{
		text-decoration: none;
		color: black;
		font-weight: bold;
		font-size: 18px;
	}
	/* 공지사항 이미지 쪽 */
	.lb-wrap {
		width: 100%;
		margin: 10px auto;
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
	video {
		max-width: 100%; display: block; margin: 0px auto;
	}
/* 	.lb-text3 {
		transform: translate(-90%, -90%);
		position: absolute;
		top: 10%;
		left: 90%;
		font-size: 10px;
		color:#FBFCFC;
	} */
</style>
</head>
<body>
<!-- 동영상 -->
<div class="lb-wrap">
	<div class="lb-text">
		<p>NOTICE</p><br/>
	</div>
	<div class="lb-text2">
		<br>
		<br>
		<p>공지사항</p>
	</div>
	<div class="lb-image">
		<video muted autoplay loop>
      		<source src="${pageContext.request.contextPath}/resources/video/notice.mp4" type="video/mp4">
    	</video>
	</div>
</div>
<div class="m-5">
	<div class="container" id="post">
		<h1 class="h1p">공지사항</h1>
		<p class="h1p" style="margin-top:10px;">공지사항과 다양한 소식을 확인해보세요.</p>
		
		<table class="detailTable" style="border-top:2px solid gray; margin-top:2%;">
			<tr style="font-size:45px;" class="aaa">
				<th colspan="3"><p class="dTable">${dto.title }</p></th>
			</tr>
			 <!-- style="border:1px solid black;" -->
			<tr class="aaa">
				<%-- <td>번호 : ${dto.num } 번 입니다</td> --%>
				<td class="col-2"><span class="dTable" style="font-weight:bold; font-size:24px;">${dto.writer }</span></td>
				<td class="col-10" style="text-align:right; rowspan="2">
					<a href="list.do">
						<img src="${pageContext.request.contextPath}/resources/Jisutayimage/notice/list5.png">
					</a>
				</td>
			</tr>
			<tr class="aaa" style="margin-bottom:5%;">
				<td class=""><span class="dTable"><img src="${pageContext.request.contextPath}/resources/Jisutayimage/notice/clock.png" style="margin-bottom:2px;">&nbsp;${dto.regdate}&nbsp;&nbsp;</span></td>
				<td class="dTable"><span><img src="${pageContext.request.contextPath }/resources/Jisutayimage/notice/eye1.png" style="margin-bottom:5px;">&nbsp;${dto.views } 회</span></td>
								<!--  style="text-align:right; -->
			</tr>
			<tr class="aaa" >
				<td colspan="3" style="margin-top:5%; margin-bottom:5%;">
					<pre>${dto.content }</pre>
				</td>
			</tr>
			<!-- 다음글, 이전글 버튼 -->
			<tr style="border-top:1px solid #DAD8D7">
				<c:if test="${dto.prevNum ne 0 }">
					<td class="col-2"><img src="${pageContext.request.contextPath}/resources/Jisutayimage/notice/arrowUp.png" style="margin-bottom:4px;">&nbsp;이전 글</td>
					<td class="col-7"><a href="detail.do?num=${dto.prevNum }#post" class="prevNextTitle">${dto.prevTitle}</a></td>
					<td class="col-3" style="text-align:right;">${dto.prevDate}</td>
				</c:if>
			</tr>
			<tr style="border-top:1px solid #DAD8D7; border-bottom:1px solid #DAD8D7;">
				<c:if test="${dto.nextNum ne 0 }">
					<td class="col-2"><img src="${pageContext.request.contextPath}/resources/Jisutayimage/notice/arrowDown.png">&nbsp;다음 글</td>
					<td class="col-7" ><a href="detail.do?num=${dto.nextNum }#post" class="prevNextTitle" >${dto.nextTitle}</a></td>
					<td class="col-3" style="text-align:right;">${dto.nextDate}</td>
				</c:if>
			</tr>
		</table>
		
		<c:choose>
			<c:when test="${id eq 'admin'}">
				<!-- <div>
				<button class="buttonEffect" onclick="location.href='list.do'">목록</button>
				</div> -->
				<div>
				<button class="buttonEffect" onclick="location.href='updateForm.do?num=${param.num }'">수정</button>
				</div>
				<div>
				<button class="buttonEffect" onclick="location.href='delete.do?num=${param.num }'">삭제</button>
				</div>	
			</c:when>
			<%-- <c:otherwise>
				<button class="buttonEffect" onclick="location.href='list.do'">목록</button>
			</c:otherwise> --%>
		</c:choose>
	</div>
</div>
</body>
</html>