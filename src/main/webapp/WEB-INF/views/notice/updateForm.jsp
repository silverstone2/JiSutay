<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/views/notice/updateForm.jsp</title>
</head>
<body>
<div class="container">
	<h1>수정 폼</h1>
	<form action="update.do" method="post" id="updateForm">
	<input type="hidden" name="num" value="${dto.num }" />
		<div>
			<label for="num">번호</label>
			<input type="text" id="num" value="${dto.num }" disabled/>
		</div>
		<div>
			<label for="writer">작성자</label>
			<input type="text" id="writer" value="${dto.writer }" disabled/>
		</div>
		<div>
			<label for="">제목</label>
			<input type="text" name="title" id="title" value="${dto.title }"/>
		</div>
		<div>
			<label for="">내용</label>
			<input type="text" name="content" id="content" value="${dto.content }"/>
		</div>
		<button type="submit">수정</button>
		<button type="reset">취소</button>
	</form>
</div>
</body>
</html>