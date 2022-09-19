<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/views/cafe/detail.jsp</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css"/>
<style>
	.content{
		border: 1px dotted gray;
	}
		.profile-image{
		width: 50px;
		height: 50px;
		border: 1px solid #cecece;
		border-radius: 50%;
	}
	/* ul 요소의 기본 스타일 제거 */
	.comments ul{
		padding: 0;
		margin: 0;
		list-style-type: none;
	}
	.comments dt{
		margin-top: 5px;
	}
	.comments dd{
		margin-left: 50px;
	}
	.comment-form textarea, .comment-form button{
		float: left;
	}
	.comments li{
		clear: left;
	}
	.comments ul li{
		border-top: 1px solid #888;
	}
	.comment-form textarea{
		width: 84%;
		height: 100px;
	}
	.comment-form button{
		width: 14%;
		height: 100px;
	}
	/* 댓글에 댓글을 다는 폼과 수정폼은 일단 숨긴다. */
	.comments .comment-form{
		display: none;
	}
	/* .reply_icon 을 li 요소를 기준으로 배치 하기 */
	.comments li{
		position: relative;
	}
	.comments .reply-icon{
		position: absolute;
		top: 1em;
		left: 1em;
		color: red;
	}
	pre {
	  display: block;
	  padding: 9.5px;
	  margin: 0 0 10px;
	  font-size: 13px;
	  line-height: 1.42857143;
	  color: #333333;
	  word-break: break-all;
	  word-wrap: break-word;
	  background-color: #f5f5f5;
	  border: 1px solid #ccc;
	  border-radius: 4px;
	}	
</style>
</head>
<body>
<div class="container">
	<table>
		<tr>
			<th>방 이름</th>
			<td>${dto.room_name }</td>
		</tr>
		<tr>
			<th>방 가격</th>
			<td>${dto.room_price }</td>
		</tr>
		<tr>
			<th>방 구조</th>
			<td>${dto.room_structure }</td>
		</tr>
		<tr>
			<th>방 크기</th>
			<td>${dto.room_size }</td>
		</tr>
		<tr>
			<th>인원수</th>
			<td>${dto.room_people }</td>
		</tr>
		<tr>
			<th>비품</th>
			<td>${dto.room_items }</td>
		</tr>
		<tr>
			<th>베드타입</th>
			<td>${dto.bedroom_type }</td>
		</tr>
		<tr>
			<th>소개</th>
			<td>${dto.room_introduce }</td>
		</tr>		
	</table>
	<!-- 댓글 목록 -->
	<div class="comments">
		<ul>
			<c:forEach var="tmp" items="${commentsList }">
				<c:choose>
					<c:when test="${tmp.deleted eq 'yes' }">
						<%--일반 후기 --%>
						<c:if test="${tmp.num eq tmp.comment_num }">
							<li>삭제된 후기입니다.</li>
						</c:if>
						<%--관리자 답글(대댓글) --%>
						<c:if test="${tmp.num ne tmp.comment_num }">
							<li id="reli${tmp.num }" style="padding-left:50px;">삭제된 답글입니다.</li>
						</c:if>					
					</c:when>
					<c:otherwise>
						<%--일반 후기 --%>
						<c:if test="${tmp.num eq tmp.comment_num }">
							<li id="reli${tmp.num }">
						</c:if>
						<%--관리자 답글(대댓글) --%>
						<c:if test="${tmp.num ne tmp.comment_num }">
							<%-- 왼쪽 padding 50px로 들여쓰기 효과 + 화살표 아이콘 추가 --%>
							<li id="reli${tmp.num }" style="padding-left:50px;">
								<svg class="reply-icon" xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-arrow-return-right" viewBox="0 0 16 16">
		  							<path fill-rule="evenodd" d="M1.5 1.5A.5.5 0 0 0 1 2v4.8a2.5 2.5 0 0 0 2.5 2.5h9.793l-3.347 3.346a.5.5 0 0 0 .708.708l4.2-4.2a.5.5 0 0 0 0-.708l-4-4a.5.5 0 0 0-.708.708L13.293 8.3H3.5A1.5 1.5 0 0 1 2 6.8V2a.5.5 0 0 0-.5-.5z"/>
								</svg>
						</c:if>
								<dl>
									<dt>
										<c:if test="${ empty tmp.profile }">
											<svg class="profile-image" xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-person-circle" viewBox="0 0 16 16">
											  <path d="M11 6a3 3 0 1 1-6 0 3 3 0 0 1 6 0z"/>
											  <path fill-rule="evenodd" d="M0 8a8 8 0 1 1 16 0A8 8 0 0 1 0 8zm8-7a7 7 0 0 0-5.468 11.37C3.242 11.226 4.805 10 8 10s4.757 1.225 5.468 2.37A7 7 0 0 0 8 1z"/>
											</svg>
										</c:if>
										<c:if test="${not empty tmp.profile }">
											<img class="profile-image" src="${pageContext.request.contextPath}${tmp.profile }"/>
										</c:if>
										<%-- 만일 글번호가 댓글의 그룹번호와 다르다면(대댓글이라면) 누구를 향한 댓글인지 옆에 @~ 텍스트 출력 --%>
										<span>${tmp.writer }</span>
										<c:if test="${tmp.num ne tmp.comment_num }">
											@<i>${tmp.target_id }</i>
										</c:if>
										<span>${tmp.regdate }</span>
										<%-- 답글 링크를 눌렀을 때 해당 댓글의 글번호 얻어오기 위해 data-num 속성에 댓글의 번호 넣어두기 --%>
										<a data-num="${tmp.num }" href="javascript:" class="reply-link">답글</a>
										<%-- 댓글 작성자와 로그인한 사용자가 같다면 수정/삭제 버튼 활성화 --%>
										<c:if test="${ tmp.writer eq sessionScope.id }">
											<a data-num="${tmp.num }" class="update-link" href="javascript:">수정</a>
											<a data-num="${tmp.num }" class="delete-link" href="javascript:">삭제</a>
										</c:if>
									</dt>
									<dd>
										<pre id="pre${tmp.num }">${tmp.content }</pre>						
									</dd>
								</dl>
								<%--
									대댓글 폼은 미리 만들어서 hidden 상태로 두었다가 답글 링크를 누르면 보이도록 한다 
									JAVASCRIPT 에서 폼을 바로 선택할 수 있도록 댓글 번호를 조합해 아이디를 부여해 놓았다.
									대댓글은 고유한 댓글 그룹번호(tmp.comment_num)가 있으므로, form 전송될 대 같이 전송되도록 해 놓았다.
									댓글의 그룹번호는 원글의 댓글의 글번호이다.	
								--%>
								<form id="reForm${tmp.num }" class="animate__animated comment-form re-insert-form" action="comment_insert.do" method="post">
									<input type="hidden" name="room_num" value="${dto.num }"/>
									<input type="hidden" name="target_id" value="${tmp.writer }"/>
									<input type="hidden" name="comment_num" value="${tmp.comment_num }"/>
									<textarea name="content"></textarea>
									<button type="submit">등록</button>
								</form>
							<%-- 만일 글 작성자가 로그인한 사용자 본인이면 댓글 수정 폼도 준비해 놓고 hidden. --%>
							<c:if test="${tmp.writer eq id }">
								<form id="updateForm${tmp.num }" class="comment-form update-form" action="comment_update.do" method="post">
									<input type="hidden" name="num" value="${tmp.num }" />
									<textarea name="content">${tmp.content }</textarea>
									<button type="submit">수정</button>
								</form>
							</c:if>
					</c:otherwise>
				</c:choose>
			</c:forEach>
		</ul>
	</div>

	<!-- 원글에 댓글을 작성할 폼 --> 
	<form class="comment-form insert-form" action="comment_insert.do" method="post">
		<!-- 원글의 글번호가 댓글의 room_num 번호가 된다. -->
		<input type="hidden" name="room_num" value="${dto.num }"/>
		<!-- 객실이름 == 후기의 target -->
		<input type="hidden" name="target_id" value="${dto.room_name }"/>
		<textarea name="content">${empty id ? '후기 작성을 위해 로그인이 필요 합니다.' : '' }</textarea>
		<button type="submit">등록</button>
	</form>
</div>
<script src="${pageContext.request.contextPath}/resources/js/gura_util.js"></script>
<script>
	
	//클라이언트가 로그인 했는지 여부
	let isLogin=${ not empty id };
	
	// 원 글의 댓글 폼에 submit 이벤트가 일어났을 경우 실행할 함수 등록
	document.querySelector(".insert-form")
		.addEventListener("submit", function(e){
			//로그인 없이 sumbit 누를 경우
			if(!isLogin){
				//폼 전송을 막고 
				e.preventDefault();
				//로그인 폼으로 이동 시킨다.
				location.href=
					"${pageContext.request.contextPath}/users/loginform.do?url=${pageContext.request.contextPath}/room/detail.do?num=${dto.num}";
			}
		});
	
	/*
		detail 페이지 로딩 시점에 만들어진 
		1 페이지에 해당하는 댓글에 이벤트 리스너 등록 하기 
	*/
	addUpdateFormListener(".update-form");
	addUpdateListener(".update-link");
	addDeleteListener(".delete-link");
	addReplyListener(".reply-link");

	//인자로 전달되는 선택자를 이용해서 이벤트 리스너를 등록하는 함수 
	function addUpdateListener(sel){
		//댓글 수정 링크의 참조값을 배열에 담아오기 
		let updateLinks=document.querySelectorAll(sel);
		for(let i=0; i<updateLinks.length; i++){
			updateLinks[i].addEventListener("click", function(){
				//click 이벤트가 일어난 바로 그 요소의 data-num 속성의 value 값을 읽어온다. 
				const num=this.getAttribute("data-num"); //댓글의 글번호
				document.querySelector("#updateForm"+num).style.display="block";
				
			});
		}
	}
	function addDeleteListener(sel){
		//댓글 삭제 링크의 참조값을 배열에 담아오기 
		let deleteLinks=document.querySelectorAll(sel);
		for(let i=0; i<deleteLinks.length; i++){
			deleteLinks[i].addEventListener("click", function(){
				//click 이벤트가 일어난 바로 그 요소의 data-num 속성의 value 값을 읽어온다. 
				const num=this.getAttribute("data-num"); //댓글의 글번호
				console.log(num); // num 들어오는지 확인용
				const isDelete=confirm("후기를 삭제 하시겠습니까?");
				if(isDelete){
					location.href="comment_delete.do";
				} else{}
				/*
				if(isDelete){
					// gura_util.js 에 있는 함수들 이용해서 ajax 요청
					ajaxPromise("comment_delete.do", "post", "num="+num)
					.then(function(response){
						return response.json();
					})
					.then(function(data){
						//만일 삭제 성공이면 
						if(data.isSuccess){
							//댓글이 있는 곳에 삭제된 댓글입니다를 출력해 준다. 
							document.querySelector("#reli"+num).innerText="삭제된 댓글입니다.";
						}
					});
				}
				*/
			});
		}
	}
	function addReplyListener(sel){
		//댓글 링크의 참조값을 배열에 담아오기 
		let replyLinks=document.querySelectorAll(sel);
		//반복문 돌면서 모든 링크에 이벤트 리스너 함수 등록하기
		for(let i=0; i<replyLinks.length; i++){
			replyLinks[i].addEventListener("click", function(){
				
				if(!isLogin){
					const isMove=confirm("로그인이 필요 합니다. 로그인 페이지로 이동 하시겠습니까?");
					if(isMove){
						location.href=
							"${pageContext.request.contextPath}/users/loginform.do?url=${pageContext.request.contextPath}/room/detail.do?num=${dto.num}";
					}
					return;
				}
				
				//click 이벤트가 일어난 바로 그 요소의 data-num 속성의 value 값을 읽어온다. 
				const num=this.getAttribute("data-num"); //댓글의 글번호
				const form=document.querySelector("#reForm"+num);
				
				let current = this.innerText; //현재 문자열을 읽어온다 ( "답글" or "취소" )
				if(current == "답글"){
					//번호를 이용해서 댓글의 댓글폼을 선택해서 보이게 한다. 
					form.style.display="block";
					form.classList.add("animate__flash");
					this.innerText="취소";	
					form.addEventListener("animationend", function(){
						form.classList.remove("animate__flash");
					}, {once:true});
				}else if(current == "취소"){
					form.classList.add("animate__fadeOut");
					this.innerText="답글";
					form.addEventListener("animationend", function(){
						form.classList.remove("animate__fadeOut");
						form.style.display="none";
					},{once:true});
				}
			});
		}
	}
	
	function addUpdateFormListener(sel){
		//댓글 수정 폼의 참조값을 배열에 담아오기
		let updateForms=document.querySelectorAll(sel);
		for(let i=0; i<updateForms.length; i++){
			//폼에 submit 이벤트가 일어 났을때 호출되는 함수 등록 
			updateForms[i].addEventListener("submit", function(e){
				//submit 이벤트가 일어난 form 의 참조값을 form 이라는 변수에 담기 
				const form=this;
				//폼 제출을 막은 다음 
				e.preventDefault();
				//이벤트가 일어난 폼을 ajax 전송하도록 한다.
				ajaxFormPromise(form)
				.then(function(response){
					return response.json();
				})
				.then(function(data){
					if(data.isSuccess){

						const num=form.querySelector("input[name=num]").value;
						const content=form.querySelector("textarea[name=content]").value;
						//수정폼에 입력한 value 값을 pre 요소에도 출력하기 
						document.querySelector("#pre"+num).innerText=content;
						form.style.display="none";
					}
				});
			});
		}
	}
</script>
</body>
</html>