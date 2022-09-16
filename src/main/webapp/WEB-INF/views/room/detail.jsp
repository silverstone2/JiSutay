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
	${param.num }
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

	<!-- 후기 작성 폼 -->
	<form class="comment-form insert-form" action="comment_insert.do" method="post">
		<!-- 객실번호 == 후기의 ref_group 번호 -->
		<input type="hidden" name="room_num" value="${dto.num }"/>
		<!-- 객실이름 == 후기의 target -->
		<input type="hidden" name="target_id" value="${dto.room_name }"/>
		<textarea name="content">${empty id ? '후기 작성을 위해선 로그인이 필요합니다.' : '' }</textarea>
		<button type="submit">등록</button>
	</form>
	</div>
	<!-- JAVASCRIPT  -->
	<script src="${pageContext.request.contextPath}/resources/js/gura_util.js"></script>
	<script>
		//로그인 여부 확인
		let isLogin=${not empty id };
		//객실 후기 폼에서 submit 할 시 실행함수
		document.querySelector(".insert-form")
		.addEventListener("submit", function(event){
			//로그인 없이 sumbit 누를 경우
			if(!isLogin){
				event.prventDefault();
				location.href=
					"${pageContext.request.contextPath}/users/loginform.do?url=${pageContext.request.contextPath}/room/detail.do?num=${dto.num}";
			}
		});
		
		addUpdateFormListener(".update-form");
		addUpdateListener(".update-link");
		addDeleteListener(".delete-link");
		addReplyListener(".reply-link");
		
		let currentPage=1;
		let lastPage=${totalPageCount};
		let isLoading=false; //현재 로딩중인지 여부 

		/*
		window.scrollY => 위쪽으로 스크롤된 길이
		window.innerHeight => 웹브라우저의 창의 높이
		document.body.offsetHeight => body 의 높이 (문서객체가 차지하는 높이)
		*/
		window.addEventListener("scroll", function(){
			//바닥 까지 스크롤 했는지 여부 
			const isBottom = 
				window.innerHeight + window.scrollY  >= document.body.offsetHeight;
			let isLast = currentPage == lastPage;				//현재 페이지가 마지막 페이지인지 여부 알아내기
			if(isBottom && !isLoading && !isLast){			//현재 바닥까지 스크롤 했고 로딩중이 아니고 현재 페이지가 마지막이 아니라면
				document.querySelector(".loader").style.display="block";				//로딩바 띄우기
				isLoading=true; 				//로딩 작업중이라고 표시
				currentPage++;				//현재 댓글 페이지를 1 증가 시키고 
				/*
					해당 페이지의 내용을 ajax 요청을 통해서 받아온다.
					"pageNum=xxx&num=xxx" 형식으로 GET 방식 파라미터를 전달한다.
					pageNum은 새로 받아올 댓글의 페이지 번호
					num은 권글의 글번호(ref_group 번로)
				*/
				ajaxPromise("ajax_comment_list.do","get",
						"pageNum="+currentPage+"&num=${dto.num}") 	//댓글의 페이지번호와 원글의 글번호를 들고 간다
				.then(function(response){
					return response.text();						//json 이 아닌 html 문자열을 응답 >>  return response.text()
				})
				.then(function(data){
					console.log(data);
					document.querySelector(".comments ul")
						.insertAdjacentHTML("beforeend", data); //insertAdjacentHTML : 인접한 html 해석을 해서 출력해라.
						//새로운 댓글목록 li 를 추가할 수 있는 html 을 추가하고 해석해서 출력해 주는 것
					isLoading=false;
					//새로 추가된 댓글 li 요소 안에 있는 a 요소를 찾아서 이벤트 리스너 등록 하기 
					addUpdateListener(".page-"+currentPage+" .update-link");
					addDeleteListener(".page-"+currentPage+" .delete-link");
					addReplyListener(".page-"+currentPage+" .reply-link");
					//새로 추가된 댓글 li 요소 안에 있는 댓글 수정폼에 이벤트 리스너 등록하기
					addUpdateFormListener(".page-"+currentPage+" .update-form");
					document.querySelector(".loader").style.display="none";					//로딩바 숨기기
				});
			}
		});
		//인자로 전달되는 선택자를 이용해서 이벤트 리스너를 등록하는 함수 
		function addUpdateListener(sel){
			//댓글 수정 링크의 참조값을 배열에 담아오기 
			let updateLinks=document.querySelectorAll(sel);
			for(let i=0; i<updateLinks.length; i++){
				updateLinks[i].addEventListener("click", function(){
					const num=this.getAttribute("data-num"); //data-num 은 폼에서 클릭 이벤트 시 등장 // 댓글의 글번호
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
					const isDelete=confirm("댓글을 삭제 하시겠습니까?");
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
								"${pageContext.request.contextPath}/users/loginform.do?url=${pageContext.request.contextPath}/cafe/detail.do?num=${dto.num}";
						}
						return;
					}
					
					//click 이벤트가 일어난 바로 그 요소의 data-num 속성의 value 값을 읽어온다. 
					const num=this.getAttribute("data-num"); //댓글의 글번호
					
					const form=document.querySelector("#reForm"+num);
					
					//현재 문자열을 읽어온다 ( "답글" or "취소" )
					let current = this.innerText;
					
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
							/*
								document.querySelector() 는 html 문서 전체에서 특정 요소의 
								참조값을 찾는 기능
								
								특정문서의 참조값.querySelector() 는 해당 문서 객체의 자손 요소 중에서
								특정 요소의 참조값을 찾는 기능
							*/
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
		/* -------------- 스크립트 작성 중 -------------- */ 
	</script>
	
	
</body>
</html>