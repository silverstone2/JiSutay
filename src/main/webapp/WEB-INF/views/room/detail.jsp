<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>views/room/detail.jsp</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css"/>

<jsp:include page="/include/starRating_style.jsp"></jsp:include>
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
		/* 로딩 이미지 가운데 정렬 */
		text-align: center;
		/* default : none-display */
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
	<div onload="javascript:test();">
		aa
	</div>
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
	
	<p></p>
	<p></p>
	
	<!-- 총 별점 출력 및 정렬 버튼 추가 -->
	<div class="commentsHeader">
		<!-- 후기 텍스트 및 후기 개수 -->
		<div>
			<strong>후기</strong>
			(${allCount })
		</div>
		<p></p>
		
		<!-- 총 별점 출력 -->
		<svg xmlns="http://www.w3.org/2000/svg" width="40" height="auto" fill="currentColor" class="bi bi-star-fill" viewBox="0 0 16 16">
		  <path id="headerStar" d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.282.95l-3.522 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z"/>
		</svg>
		<h1 style="display: inline-block; font-size: 46px; margin: 0px;"><strong>${sumScore }</strong></h1>
		<span style="color: #a5b0af; font-size: 24px;">/5</span>
		
		<!-- 정렬 -->
		<fieldset>
			<select name="sort">
				<option value="regdate">최근 작성순</option>
				<option value="highScore">별점 높은순</option>
				<option value="lowScore">별점 낮은순</option>
			</select>
		</fieldset>
	</div>
	
	<!-- 댓글 목록 -->
	<div class="comments">
		<ul>
			<c:forEach var="tmp" items="${commentsList }" varStatus="status">
				<c:choose>
					<c:when test="${tmp.deleted eq 'yes' }">
						<%--일반 후기 --%>
						<c:if test="${tmp.num eq tmp.comment_num }">
							<li>삭제된 후기입니다.</li>
						</c:if>
						<%--관리자 답글(대댓글) --%>
						<c:if test="${tmp.num ne tmp.comment_num }">
							<li id="reli${tmp.num }" style="padding-left:50px;">삭제된 후기입니다.</li>
								<svg class="reply-icon" xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-arrow-return-right" viewBox="0 0 16 16">
		  							<path fill-rule="evenodd" d="M1.5 1.5A.5.5 0 0 0 1 2v4.8a2.5 2.5 0 0 0 2.5 2.5h9.793l-3.347 3.346a.5.5 0 0 0 .708.708l4.2-4.2a.5.5 0 0 0 0-.708l-4-4a.5.5 0 0 0-.708.708L13.293 8.3H3.5A1.5 1.5 0 0 1 2 6.8V2a.5.5 0 0 0-.5-.5z"/>
								</svg>							
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
											<%-- 관리자 답글(대댓글)이라면 누구를 향한 답글인지 옆에 @~ 텍스트 출력 --%>
											<div data-num="${tmp.score }" data-value="${status.index }" id="rating-wrap${status.index }" class="ratingWrap">
												<div id="rating${status.index }" class="selfRating">
													<div id="overlay${status.index }" class="selfOverlay"></div>
												</div>
											</div>
											<span>${tmp.writer }</span>
											<c:if test="${tmp.num ne tmp.comment_num }">
												@<i>${tmp.target_id }</i>
											</c:if>
											<span>${tmp.regdate }</span>
											<%-- 답글 링크를 눌렀을 때 해당 댓글의 글번호 얻어오기 위해 data-num 속성에 댓글의 번호 넣어두기 --%>
											<a data-num="${tmp.num }" href="javascript:" class="reply-link">답글</a>
											<%-- 댓글 작성자와 로그인한 사용자가 같다면 수정/삭제 버튼 활성화 (우선은 전체 답글 활성화) --%>
											<%-- 
												<c:if test="${ (id ne null) and (tmp.writer eq sessionScope.id) }">
											 --%>
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
											
											<!-- 답글 버튼 -->
											<c:if test="${tmp.commCount-1 ne 0}">
												<a id="commComm${tmp.num }" href="javascript:watchComm(${tmp.num }, ${tmp.comment_num }, ${tmp.commCount-1 });">🔽 답글 ${tmp.commCount-1 }개</a>	
											</c:if>
										</dd>
									</dl>
									<%--
										답글 폼은 미리 만들어서 hidden >> 답글 링크 클릭시 활성화 
										답글은 고유한 댓글 그룹번호(tmp.comment_num)로 form 전송시 같이 전송(답글의 그룹번호는 원댓글의 글번호).	
									--%>
									<form id="reForm${tmp.num }" class="animate__animated comment-form re-insert-form" action="re_comment_insert.do" method="post" style="display:none;">
										<input type="hidden" name="room_num" value="${param.num }"/>
										<input type="hidden" name="target_id" value="${tmp.writer }"/>
										<input type="hidden" name="comment_num" value="${tmp.comment_num }"/>
										<textarea name="content"></textarea>
										<button type="submit">등록</button>
									</form>
								<%-- 
									댓글 주인이 로그인 본인이면 댓글 수정 폼도 준비, hidden. 이후 필요시 JAVASCRIPT에서 바로 출력.	 
								--%>
								<c:if test="${tmp.writer eq id }">
									<form id="updateForm${tmp.num }" class="comment-form update-form" action="comment_update.do" method="post" style="display:none;">
										<input type="hidden" name="num" value="${tmp.num }" />
										<textarea name="content">${tmp.content }</textarea>
										<button type="submit">수정</button>
									</form>
								</c:if>	
						</c:otherwise>
					</c:choose>
					<div id="commComments${tmp.num }">
					
					</div>
				</c:forEach>
			</ul>
		</div>
		
		<!-- 후기 작성 폼 -->
		<form class="comment-form insert-form" action="comment_insert.do" method="post">
			<!-- 객실번호 == 후기의 ref_group 번호 -->
			<input type="hidden" name="room_num" value="${dto.num }"/>
			<!-- 객실이름 == 후기의 target -->
			<input type="hidden" name="target_id" value="${dto.room_name }"/>
			<!-- Score -->
			<input type="hidden" name="score" value="0.0" step="0.1" min="0" max="5" />
			<div class="rating-wrap">
				<div class="rating">
					<div class="overlay" style="width: 158px"></div>
				</div>
			</div>
			<!-- 정렬 방식 -->
			<input type="hidden" name="sort" value="" />
			<!-- Content -->
			<textarea name="content">${empty id ? '후기 작성을 위해선 로그인이 필요합니다.' : '' }</textarea>
			<button type="submit">등록</button>
		</form>
	</div>
	
	<nav>
		<ul class="pagination">
		
			<c:if test="${startPageNum ne 1 }">
				<li class="page-item">
					<a class="page-link" href="javascript:movePage(${startPageNum-1 });">◀</a>
				</li>
			</c:if>
			
			<c:forEach var="i" begin="${startPageNum }" end="${endPageNum }">
				<c:choose>
					<c:when test="${pageNum eq i }">
						<li class="page-item active">
							<a class="page-link" href="javascript:movePage(${i });">${i }</a>
						</li>
					</c:when>
					<c:otherwise>
						<li class="page-item">
							<a class="page-link" href="javascript:movePage(${i });">${i }</a>
						</li>
					</c:otherwise>
				</c:choose>
			</c:forEach>
			
			<c:if test="${endPageNum lt totalPageCount }">
				<li class="page-item">
					<a class="page-link" href="javascript:movePage(${endPageNum+1 });">▶</a>
				</li>
			</c:if>
			
		</ul>
	</nav>
	
	<!-- JAVASCRIPT  -->
	<script src="${pageContext.request.contextPath}/resources/js/gura_util.js"></script>
	<jsp:include page="/include/starRating_js.jsp"></jsp:include>
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
		
		addInsertFormListener('.re-insert-form');
		addUpdateFormListener(".update-form");
		addUpdateListener(".update-link");
		addDeleteListener(".delete-link");
		addReplyListener(".reply-link");
		
		let currentPage=1;
		let lastPage=${totalPageCount};

		//인자로 전달되는 선택자를 이용해서 이벤트 리스너를 등록하는 함수 
		function addUpdateListener(sel){
			//댓글 수정 링크의 참조값을 배열에 담아오기 
			let updateLinks=document.querySelectorAll(sel);
			for(let i=0; i<updateLinks.length; i++){
				updateLinks[i].addEventListener("click", function(){
					const num=this.getAttribute("data-num"); //data-num 은 폼에서 클릭 이벤트 시 등장 // 댓글의 글번호
					const form = document.querySelector("#updateForm"+num);
					
					let replyForm = document.querySelectorAll(".reply-link")[i];
					let replyCurrent = replyForm.innerText;
					
					let current = this.innerText;
					if(current == "수정") {
						form.style.display="block";
						this.innerText="취소";
					} else if(current == "취소") {
						form.style.display="none";
						this.innerText="수정";
					}
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
					const isDelete=confirm("정말로 삭제하시겠습니까?");
					if(isDelete){
						// gura_util.js 에 있는 함수들 이용해서 ajax 요청
						ajaxPromise("comment_delete.do", "post", "num="+num)
						.then(function(response){
							return response.json();
						})
						.then(function(data){
							//만일 삭제 성공이면 
							if(data.isSuccess){
								//댓글이 있는 곳에  출력. 
								document.querySelector("#reli"+num).innerText="삭제된 후기입니다.";
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
						const isMove=confirm("로그인이 필요합니다. 로그인 페이지로 이동하시겠습니까?");
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
						this.innerText="취소";
					}else if(current == "취소"){
						form.style.display="none";
						this.innerText="답글";
					}
				});
			}
		}
		
/* ---------------- Insert Ajax 처리 ---------------- */
		function addInsertFormListener(sel){
			let reInsertForms = document.querySelectorAll(sel);
			reInsertForms.forEach((insertTag, index) => {
				insertTag.addEventListener("submit", function(e) {
					const form = this;
					e.preventDefault();
					
					ajaxFormPromise(form)
					.then((res) => {
						return res.text();
					})
					.then((data) => {
						// 페이지 갱신(Ajax)
						movePage(pageNum);
					});
				});
			});
		}
		
/* ---------------- Update Ajax 처리 ---------------- */
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
		
/* ---------------- 페이지 이동 시, 댓글 데이터 가져오기 (Ajax) ---------------- */
		let pageNum = 1;
		let sort = "regdate";
		
		function movePage(movePageNum) {
			pageNum = movePageNum;
			
			fetch("${pageContext.request.contextPath }/room/ajax_comments.do?num=${param.num }&pageNum="+movePageNum+"&sort="+sort)
			.then(function(res) {
				return res.text();
			})
			.then(function(data) {
				// console.log(data);
				document.querySelector(".comments").innerHTML = data;
				
				addInsertFormListener('.re-insert-form');
				addInsertFormListener('.re-re-insert-form');
				addUpdateFormListener(".update-form");
				addUpdateListener(".update-link");
				addDeleteListener(".delete-link");
				addReplyListener(".reply-link");
				formControll('.re-insert-form');
				
				// 페이지 이동 시, score 갱신
				document.querySelectorAll('.ratingWrap').forEach((tag) => {
					// 현재 로딩된 페이지 후기들의 score 가져오기
					let score = tag.getAttribute('data-num');
					let index = tag.getAttribute('data-value');
					
					//별 이미지 SVG 개수만큼 생성
				    for(let i = 0;i < selfMaxStar;i++){
				        let el = document.createElement('div');
				        el.style.width = selfStarSize + 'px';
				        el.style.height = selfStarSize + 'px';
				        el.style.marginRight = selfGutter + 'px';
				        //인라인 SVG 이미지 부착
				        el.innerHTML = '<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 576 512"><path fill="none" class="starcolor" d="M381.2 150.3L524.9 171.5C536.8 173.2 546.8 181.6 550.6 193.1C554.4 204.7 551.3 217.3 542.7 225.9L438.5 328.1L463.1 474.7C465.1 486.7 460.2 498.9 450.2 506C440.3 513.1 427.2 514 416.5 508.3L288.1 439.8L159.8 508.3C149 514 135.9 513.1 126 506C116.1 498.9 111.1 486.7 113.2 474.7L137.8 328.1L33.58 225.9C24.97 217.3 21.91 204.7 25.69 193.1C29.46 181.6 39.43 173.2 51.42 171.5L195 150.3L259.4 17.97C264.7 6.954 275.9-.0391 288.1-.0391C300.4-.0391 311.6 6.954 316.9 17.97L381.2 150.3z"/></svg>';
				        document.querySelector('#rating'+index).appendChild(el);//입력 필드 최대값 재설정
				    }
					
					document.querySelector('#overlay'+index).style.width = getWidth(score);
				});
			});
		}
		
/* ---------------- 답글 띄우기 기능 구현 (Ajax) ---------------- */
		function watchComm(num, comment_num, comm_count) {
			let commCommForm = document.querySelector("#commComm"+num);
			let commCommText = commCommForm.innerText;
			console.log(commCommText);
			if(commCommText == "🔽 답글 "+comm_count+"개") {
				fetch("${pageContext.request.contextPath }/room/ajax_commComments.do?num=${param.num }&comment_num="+comment_num)
				.then(function(res) {
					return res.text();
				})
				.then(function(data) {
					// console.log(data);
					document.querySelector("#commComments"+num).innerHTML = data;
					addInsertFormListener('.re-re-insert-form');
					addUpdateFormListener(".re-update-form");
					addUpdateListener(".re-update-link");
					addDeleteListener(".re-delete-link");
					addReplyListener(".re-reply-link");
					formControll('.re-re-insert-form');
				});
				commCommForm.innerText = "🔼 답글 "+comm_count+"개";
			} else if(commCommText == "🔼 답글 "+comm_count+"개") {
				document.querySelector("#commComments"+num).innerText = "";
				commCommForm.innerText = "🔽 답글 "+comm_count+"개";
			}
		}
		
/* ---------------- Form 전송 제어 ---------------- */
		document.querySelector('.insert-form').addEventListener('submit', function(e) {
			let contentText = this.querySelector('textarea[name=content]').value;
			if(contentText == "") {
				alert('내용을 작성하세요!');
				e.preventDefault();
			}
		});
		
		window.onload = function() {
			formControll('.re-insert-form');
		}
		
		function formControll(keyword) {
			document.querySelectorAll(keyword).forEach((tag) => {
				tag.addEventListener('submit', function(e) {
					let contentText = tag.querySelector('textarea[name=content]').value;
					if(contentText == "") {
						alert('내용을 작성하세요!');
						e.preventDefault();
					}
				});
			});
		}
		
/* ---------------- 정렬 방식 선택 ---------------- */
	document.querySelector("select[name=sort]").addEventListener('change', function() {
		sort = this.value;
		movePage(pageNum);
	});
	</script>
	
	
</body>
</html>