<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/views/notice/detail.jsp</title>
</head>
<body>
	<h1>공지사항</h1>
	<p>공지사항과 다양한 소식을 확인해보세요.</p>
	<table>
		<tr>
			<th>${dto.title } 작성자${dto.writer } ${dto.regdate } ${dto.views }</th>
			<td>${dto.content }</td>
		</tr>
	
	</table>
</body>
</html>