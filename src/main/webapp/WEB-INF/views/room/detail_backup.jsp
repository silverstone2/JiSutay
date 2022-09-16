<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>views/room/detail.jsp</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css"/>

<style>
	.content{
		border: 1px dotted gray;
	}
	
	/* 후기 프로필 이미지 원형 프레임 */
	.profile-image{
		width: 50px;
		height: 50px;
		border: 1px solid #cecece;
		border-radius: 50%;
	}
	
	/* ul default style 제거 */
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
		
	/* 관리자 답글(대댓글) 은 기본값을 보이지 않음으로 */
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
	.loader{
		/* 로딩 이미지를 가운데 정렬하기 위해 */
		text-align: center;
		/* 일단 숨겨 놓기 */
		display: none;
	}
	.loader svg{
		animation: rotateAni 1s ease-out infinite;
	}
	
	@keyframes rotateAni{
		0%{
			transform: rotate(0deg);
		}
		100%{
			transform: rotate(360deg);
		}
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
		<c:forEach var="tmp" items="${commentList }">
			<c:choose>
				<c:when test="${tmp.deleted eq 'yes' }">
					<li>삭제된 댓글 입니다.</li>
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
									<%-- 관리자 답글(대댓글)이라면 누구를 향한 답글인지 옆에 @~ 텍스트 출력 --%>
									<span>${tmp.writer }</span>
									<c:if test="${tmp.num ne tmp.comment_num }">
										@<i>${tmp.target_id }</i>
									</c:if>
									<span>${tmp.regdate }</span>
									<%-- 답글 링크를 눌렀을 때 해당 댓글의 글번호 얻어오기 위해 data-num 속성에 댓글의 번호 넣어두기 --%>
									<a data-num="${tmp.num }" href="javascript:" class="reply-link">답글</a>
									<%-- 댓글 작성자와 로그인한 사용자가 같다면 수정/삭제 버튼 활성화 (우선은 전체 답글 활성화) --%>
									<c:if test="${ tmp.writer eq sessionScope.id }">
										<a data-num="${tmp.num }" class="update-link" href="javascript:">수정</a>
										<a data-num="${tmp.num }" class="delete-link" href="javascript:">삭제</a>
									</c:if>
								</dt>
								<dd>
									<%-- 
										댓글은 textarea 로  입력 > tab, 공백, 개행기호 있음.
										pre 요소의 innerText 로 댓글을 출력하면 입력한 내용 형식을 그대로 출력 가능.
										해당 댓글 JAVASCRIPT 로 바로 수정할 수 있도록 댓글 번호 조합해서 아이디 부여.
									--%>
									<pre id="pre${tmp.num }">${tmp.content }</pre>						
								</dd>
							</dl>
							<%--
								답글 폼은 미리 만들어서 hidden >> 답글 링크 클릭시 활성화 
								답글은 고유한 댓글 그룹번호(tmp.comment_num)로 form 전송시 같이 전송(답글의 그룹번호는 원댓글의 글번호).	
							--%>
							<form id="reForm${tmp.num }" class="animate__animated comment-form re-insert-form" action="comment_insert.do" method="post">
								<input type="hidden" name="room_num" value="${dto.num }"/>
								<input type="hidden" name="target_id" value="${tmp.writer }"/>
								<input type="hidden" name="comment_num" value="${tmp.comment_num }"/>
								<textarea name="content"></textarea>
								<button type="submit">등록</button>
							</form>
						<%-- 
							댓글 주인이 로그인 본인이면 댓글 수정 폼도 준비, hidden. 이후 필요시 JAVASCRIPT에서 바로 출력.	 
						--%>
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

<!-- 스크롤 내려서 후기 요청 시 로딩 스크롤 ajax -->
<div class="loader">
	<svg xmlns="http://www.w3.org/2000/svg" width="100" height="100" fill="currentColor" class="bi bi-arrow-clockwise" viewBox="0 0 16 16">
		  <path fill-rule="evenodd" d="M8 3a5 5 0 1 0 4.546 2.914.5.5 0 0 1 .908-.417A6 6 0 1 1 8 2v1z"/>
		  <path d="M8 4.466V.534a.25.25 0 0 1 .41-.192l2.36 1.966c.12.1.12.284 0 .384L8.41 4.658A.25.25 0 0 1 8 4.466z"/>
	</svg>
</div>

<!-- 후기 작성 폼 -->
<form class="comment-form insert-form" action="comment_insert.do" method="post">
	<!-- 객실번호 == 후기의 room_num 번호 -->
	<input type="hidden" name="room_num" value="${dto.num }"/>
	<!-- 객실이름 == 후기의 target -->
	<input type="hidden" name="target_id" value="${dto.room_name }"/>
	<textarea name="content">${empty id ? '후기 작성을 위해선 로그인이 필요합니다.' : '' }</textarea>
	<button type="submit">등록</button>
</form>
</div>
<script src="${pageContext.request.contextPath}/resources/js/gura_util.js"></script>
<script>
	//로그인 여부 확인
	let isLogin=${ not empty id };
	//객실 후기 폼에서 submit 할 시 실행함수
	docyment.querySelector(".insert-form")
	.addEventListener("submit", function(event){
		//로그인 없이 sumbit 누를 경우
		if(!isLogin){
			event.prventDefault();
			location.href=
				"${pageContext.request.contextPath}/users/loginform.do?url=${pageContext.request.contextPath}/room/detail.do?num=${dto.num}";
		}
	});
	
	<%-- 이벤트 리스너 --%> 	
	addUpdateFormListener(".update-form");
	addUpdateListener(".update-link");
	addDeleteListener(".delete-link");
	addReplyListener(".reply-link");

	let currentPage=1;
	let lastPage=${totalPageCount};
	
	let isLoading=false; // 현재 로딩중여부 기본값 false
	
	window.addEventListener("scroll", function(){
		//바닥까지 스크롤했는지 여부
		const isBottom = window.innerheight + window.scrollY >= document.body.offsetHeight;
		let isLast=currentPafe==lastPage;
		if(isBottom && !isLoading && !isLast){
			document.querySelector(".loader").style.display="block"; //로딩 스크롤
			isLoading=true;
			currentPage++; // 현재 후기 페이지 +1 증가
			
			// ajax
			ajaxPromise("ajax_comment_list.do","get","pageNum="+currentPage+"&num=${dto.num}")
			.then(function(response){
				return response.text(); //json 아니고 html 문자열이라 return text
			})			
			.then(function(data){
				console.log(data);
				document.querySelector(".comments ul")
				.insertAdjacentHTML("beforeend", data);
				isLoading=false;
				//새로 로딩된 후기들에 리스너 부여
				addUpdateListener(".page-"+currentPage+" .update-link");
				addDeleteListener(".page-"+currentPage+" .delete-link");
				addReplyListener(".page-"+currentPage+" .reply-link");
				addUpdateFormListener(".page-"+currentPage+" .update-form");
				//로딩 스크롤 비활성화
				document.querySelector(".loader").style.display="none";
			});
		}
	});

		
	
	
	
	
	
	
/* -------------- 스크립트 작성 중 -------------- */ 
	</script>
</body>
</html>