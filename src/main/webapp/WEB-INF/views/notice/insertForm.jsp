<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/views/notice/insertForm.jsp</title>
</head>
<body>
<div class="container">
	<h1>새글 작성 폼</h1>
	<form action="insert.do" method="post" id="insertForm">
		<div>
			<label for="">제목</label>
			<input type="text" name="title" id="title" />
		</div>
		<div>
			<label for="">내용</label>
			<input type="text" name="content" id="content" />
		</div>
		<button type="button">저장</button>
	</form>
</div>
</body>
</html>