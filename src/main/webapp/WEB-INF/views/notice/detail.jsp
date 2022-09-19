<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/views/notice/detail.jsp</title>
</head>
<body>
	<h1>공지사항</h1>
	<p>공지사항과 다양한 소식을 확인해보세요.</p>
	<c:if test="${dto.prevNum ne 0 }">
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
	</c:if>	
	
	<%-- <button type="button" onclick="location.href='${pageContext.request.contextPath}/home.do' ">이전 글</button>
	<button type="button" onclick="location.href='${pageContext.request.contextPath}/home.do' ">다음 글</button>--%>
	<table>
		<tr>
			<th>${dto.title }  </th>
		</tr>
		<tr>
			<td>작성자</td>
			<td>번호 : ${dto.num } 번 입니다</td>
			<td>작성자 : ${dto.writer }</td><br><br>
			<td>날짜 : ${dto.regdate }</td><br><br>
			<td>조회수 : ${dto.views } 회</td><br><br>
		</tr>
		<tr>
			<td>${dto.content }</td>
		</tr>
	</table>
	<button type="button" onclick="location.href='list.do'">목록</button>
	<c:choose>
		<c:when test="${id eq 'admin'}">
			<button type="button" onclick="location.href='updateForm.do?num=${param.num }'">수정</button>
			<button type="button" onclick="location.href='delete.do?num=${param.num }'">삭제</button>
		</c:when>
	</c:choose>

</body>
</html>