<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JISUTAY</title>

<jsp:include page="/resources/include/starRating_style.jsp"></jsp:include>

<script type="text/javascript" async="" src="https://www.google-analytics.com/analytics.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.1/jquery.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>

<script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/modify.js" ></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/common.js" ></script>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/css/common.css">
<link rel="shorcut icon" href="${pageContext.request.contextPath }/resources/Jisutayimage/Logo_Icon/favicon.ico">

<!-- jQuery 1.8 or later, 33 KB -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<!-- Fotorama from CDNJS, 19 KB -->
<link  href="https://cdnjs.cloudflare.com/ajax/libs/fotorama/4.6.4/fotorama.css" rel="stylesheet">
<script src="https://cdnjs.cloudflare.com/ajax/libs/fotorama/4.6.4/fotorama.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/common.js" defer=""></script>

<style>
	.content{
		border: 1px dotted gray;
	}
		
	#review {
		width:100%; 
		display:inline-block;
	}
	
	.commentsHeader {
		margin:0px 8rem;
	}
	
	.reviewTitle {
		display:flex; 
		align-items:center; 
		height:3rem;
	}
	
	.reviewTitle > h3 {
		font-size:1.7rem; 
		font-weight:bold; 
		color:#474747; 
		letter-spacing: 5px;
	}
	
	.reviewTitle > h3 > span {
		font-size:1.4rem; 
		font-weight:normal; 
		color:#5E5E5E; 
		letter-spacing: 0px;
	}
	
	.total {
		display:flex; 
		align-items:center; 
		height:4rem; 
		justify-content: space-between;
	}
	
	.comments {
		margin:10px 8rem 10px 8rem;
	}
	
	.comments ul{
		padding: 0 0 0 10px;
		margin: 0;
		list-style-type: none;
	}
	
	.comments ul li{
		border-top: 0.9px solid #CCCCCC;
	}
	
	.comments li{
		clear: left;
		padding: 11px 10px;
	}
	
	.comments dl{
		height:100%
	}
	
	.comments dt{
		display:flex;
		align-items:center;
	}
	
	/* 후기 프로필 이미지 원형 프레임 */
	.profile-image{
		width: 40px;
		height: 40px;
		border: 1.5px solid #cecece;
		border-radius: 50%;
	}

	.comments dd{
		margin: 10px 0 10px 50px;
	}
	
	
	.comment-form textarea, .comment-form button{
		float: left;
	}


	.comment-form textarea{
		width: 84%;
		height: 80px;
		color: #4D565B; 
		font-family: system-ui;
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
	

</style>


</head>
<body id="rooms" class="detail">
	<jsp:include page="/resources/include/navbar.jsp"></jsp:include>
	<div onload="javascript:test();">
	</div>
	<section>	

<!-- 메인 이미지 -->
		<div class="section" id="Visuals">
			<div class="InnerBox">
				<img src="${pageContext.request.contextPath }/resources/Jisutayimage/main/room${dto.num }.jpg" style="width: 100%; height: 700px; opacity: 0.7">
				<h2>
					<img src="${pageContext.request.contextPath }/resources/Jisutayimage/Logo_Icon/logo_bl.png" width="240" height="40" alt="">
					<span>${dto.room_name }</span>
				</h2>
			</div>
		</div>
		
		<c:if test="${id eq 'admin' }">
			<a href="${pageContext.request.contextPath }/room/updateform.do?num=${dto.num }">
				<svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="black" class="bi bi-pencil" viewBox="0 0 16 16">
						<path d="M12.146.146a.5.5 0 0 1 .708 0l3 3a.5.5 0 0 1 0 .708l-10 10a.5.5 0 0 1-.168.11l-5 2a.5.5 0 0 1-.65-.65l2-5a.5.5 0 0 1 .11-.168l10-10zM11.207 2.5 13.5 4.793 14.793 3.5 12.5 1.207 11.207 2.5zm1.586 3L10.5 3.207 4 9.707V10h.5a.5.5 0 0 1 .5.5v.5h.5a.5.5 0 0 1 .5.5v.5h.293l6.5-6.5zm-9.761 5.175-.106.106-1.528 3.821 3.821-1.528.106-.106A.5.5 0 0 1 5 12.5V12h-.5a.5.5 0 0 1-.5-.5V11h-.5a.5.5 0 0 1-.468-.325z"/>
				</svg>
			</a>
		</c:if>
		
<!-- 객실 정보, 객실 소개 -->
		<div class="section infos">
			<!-- 후기 이동 버튼 -->
			<div id="reviewbtn" style="position:absolute;top:14px;left:75px;">
				<a href="#review"><img src="${pageContext.request.contextPath }/resources/Jisutayimage/Logo_Icon/reviewbtn.png" title="후기 보기"></a>
			</div>
			<div class="InBox">
				<div>
					<h3>객실 정보</h3>
					<ul>
						<li>
							<strong>객실구조</strong>
							<pre><span>${dto.room_structure }</span></pre>
						</li>
						<li>
							<strong>객실크기</strong>
							<span>${dto.room_size }평형</span>
						</li>
						<li>
							<strong>입실인원</strong>
							<span>${dto.room_people }</span>
						</li>
						<li>
							<strong>객실비품</strong>
							<pre><span>${dto.room_items }</span></pre>
						</li>
					</ul>
				</div>
				<div>
					<h3>객실 소개</h3>
					<ul class="write">
						<li>
							<pre>${dto.room_introduce }</pre>
						</li>
					</ul>
				</div>
			</div>
		</div>
		
		
<!-- 객실 이미지 -->
		<div class="section images" style="margin-top: 200px;">
			<div class="InBox">
				<div class="fotorama" data-nav="thumbs">
				<!--
					<img src="http://gonylab6.speedgabia.com/fullstay/sorangje/room/2/2.jpg" width="150" height="100">
					<img src="http://gonylab6.speedgabia.com/fullstay/sorangje/room/2/3.jpg" width="150" height="100">
					<img src="http://gonylab6.speedgabia.com/fullstay/sorangje/room/2/4.jpg" width="150" height="100">
					<img src="http://gonylab6.speedgabia.com/fullstay/sorangje/room/2/5.jpg" width="150" height="100">
					<img src="http://gonylab6.speedgabia.com/fullstay/sorangje/room/2/6.jpg" width="150" height="100">
					<img src="http://gonylab6.speedgabia.com/fullstay/sorangje/room/2/7.jpg" width="150" height="100">
					<img src="http://gonylab6.speedgabia.com/fullstay/sorangje/room/2/8.jpg" width="150" height="100">
					<img src="http://gonylab6.speedgabia.com/fullstay/sorangje/room/2/9.jpg" width="150" height="100">
					<img src="http://gonylab6.speedgabia.com/fullstay/sorangje/room/2/10.jpg" width="150" height="100">
					<img src="http://gonylab6.speedgabia.com/fullstay/sorangje/room/2/11.jpg" width="150" height="100">
					<img src="http://gonylab6.speedgabia.com/fullstay/sorangje/room/2/12.jpg" width="150" height="100">
					<img src="http://gonylab6.speedgabia.com/fullstay/sorangje/room/2/13.jpg" width="150" height="100">
					<img src="http://gonylab6.speedgabia.com/fullstay/sorangje/room/2/14.jpg" width="150" height="100">
				-->
					<c:forEach var="imgPath" items="${imgList }" varStatus="status">
						<img src="${pageContext.request.contextPath }${imgPath }" width="150" height="100"/>
					</c:forEach>
				</div>
			</div>
		</div>
		
<!-- 전체 후기 영역 -->
		<div id="review">
		
			<!-- 총 별점 출력 및 정렬 버튼  -->
			<div class="commentsHeader">
				<!-- 후기 개수 -->
				<div class="reviewTitle">
					<h3>후기<span>(${allCount })</span></h3>
				</div>
				<!-- 총 별점 및 정렬-->
				<div class="total">
					<!-- 총 별점 -->
					<div>
						<svg xmlns="http://www.w3.org/2000/svg" width="37" height="auto" fill="currentColor" class="bi bi-star-fill" viewBox="0 0 16 16">
						  <path id="headerStar" d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.282.95l-3.522 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z"/>
						</svg>
						<h1 style="display: inline-block; font-size: 44px; margin: 0px; color:#474747;"><strong> ${sumScore }</strong></h1>
						<span style="color: #ABABAB; font-size: 23px;">/5</span>
					</div>
					<!-- 정렬 -->
					<div>
						<fieldset>
							<select name="sort" id="sort" style="width:145px; height:33px; padding: 5px 20px 5px 5px; border-radius:5px;">
								<option value="regdate">최근 작성순</option>
								<option value="highScore">별점 높은순</option>
								<option value="lowScore">별점 낮은순</option>
							</select>
						</fieldset>
					</div>
				</div>
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
			  							<image href="${pageContext.request.contextPath }/resources/Jisutayimage/user.png" width="16" height="16"></image>
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
				  							<image href="${pageContext.request.contextPath }/resources/Jisutayimage/user.png" width="16" height="16"></image>
										</svg>
									</c:if>
											<dl>
												<dt>
													<c:if test="${ empty tmp.profile }">
														<svg class="profile-image" xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" viewBox="0 0 16 16">
															<image href="${pageContext.request.contextPath }/resources/Jisutayimage/user.png" width="16" height="16"></image>
														</svg>
													</c:if>
													<c:if test="${not empty tmp.profile }">
														<img class="profile-image" src="${pageContext.request.contextPath}${tmp.profile }"/>
													</c:if>
													<div style="width: 100%;">
														<div>
															<%-- 관리자 답글(대댓글)이라면 누구를 향한 답글인지 옆에 @~ 텍스트 출력 --%>
															<div data-num="${tmp.score }" data-value="${status.index }" id="rating-wrap${status.index }" class="ratingWrap" style="display:flex;">
																<div id="rating${status.index }" class="selfRating">
																	<div id="overlay${status.index }" class="selfOverlay"></div>
																</div>
															</div>
														</div>
														<div>
															<div style="padding:0px 0px 10px 10px">
																<span style="font-size: 18px; font-weight: bold; color: #646F75; font-family: system-ui;">${tmp.writer }</span>
																<span style="font-size: 15px; color: #D7D7D7;">&nbsp;&nbsp;|&nbsp;&nbsp;</span>
																<c:if test="${tmp.num ne tmp.comment_num }">
																	@<i>${tmp.target_id }</i>
																</c:if>
																<span style="font-size: 14.5px; color: #799097;">${tmp.regdate }</span>
																<span style="font-size: 15px; color: #D7D7D7;;">&nbsp;&nbsp;|&nbsp;&nbsp;</span>
																<%-- 답글 링크를 눌렀을 때 해당 댓글의 글번호 얻어오기 위해 data-num 속성에 댓글의 번호 넣어두기 --%>
																<a data-num="${tmp.num }" href="javascript:" class="reply-link" style="font-size:15px;color:#354A54">답글</a>
																<%-- 댓글 작성자와 로그인한 사용자가 같다면 수정/삭제 버튼 활성화 (우선은 전체 답글 활성화) --%>
																 <c:if test="${ tmp.writer eq sessionScope.id }">
																 	<span style="font-size: 15px; color: #D7D7D7;;">&nbsp;|&nbsp;</span>
																	<a data-num="${tmp.num }" class="update-link" href="javascript:" style="font-size:15px;color:#354A54">수정</a>
																	<span style="font-size: 15px; color: #D7D7D7;;">&nbsp;|&nbsp;</span>
																	<a data-num="${tmp.num }" class="delete-link" href="javascript:" style="font-size:15px;color:#354A54">삭제</a>
																</c:if>
															</div>
														</div>
													</div>
												</dt>
												<dd>
													<%-- 
														댓글은 textarea 로  입력 > tab, 공백, 개행기호 있음.
														pre 요소의 innerText 로 댓글을 출력하면 입력한 내용 형식을 그대로 출력 가능.
														해당 댓글 JAVASCRIPT 로 바로 수정할 수 있도록 댓글 번호 조합해서 아이디 부여.
													--%>
													<pre id="pre${tmp.num }" style="color:#474747;">${tmp.content }</pre>
													<div style="height:22px; width:100%;"></div>
													<!-- 답글 버튼 -->
													<c:if test="${tmp.commCount-1 ne 0}">
														<a id="commComm${tmp.num }" href="javascript:watchComm(${tmp.num }, ${tmp.comment_num }, ${tmp.commCount-1 })" style="color:#47999A; font-size:14px;">ᗐ 답글 ${tmp.commCount-1 }개</a>	
													</c:if>
												</dd>
											</dl>
											<%--
												답글 폼은 미리 만들어서 hidden >> 답글 링크 클릭시 활성화 
												답글은 고유한 댓글 그룹번호(tmp.comment_num)로 form 전송시 같이 전송(답글의 그룹번호는 원댓글의 글번호).	
											--%>
											<form id="reForm${tmp.num }" class="animate__animated comment-form re-insert-form" action="re_comment_insert.do" method="post" style="display:none;margin:15px 0px 0px 75px;width:600px;">
												<input type="hidden" name="room_num" value="${param.num }"/>
												<input type="hidden" name="target_id" value="${tmp.writer }"/>
												<input type="hidden" name="comment_num" value="${tmp.comment_num }"/>
												<textarea name="content"></textarea>
												<button type="submit" style="height: 28px;width: 47px;margin: 0 0 0 10px;background: #ffffff;border-radius: 5px;border: 2.5px solid lightgrey;cursor: pointer;font-size:14px;color:#354A54">등록</button>
											</form>
											

										<%-- 
											댓글 주인이 로그인 본인이면 댓글 수정 폼도 준비, hidden. 이후 필요시 JAVASCRIPT에서 바로 출력.	 
										--%>
										<c:if test="${tmp.writer eq id }">
											<form id="updateForm${tmp.num }" class="comment-form update-form" action="comment_update.do" method="post" style="display:none;margin:15px 0px 0px 75px;width:600px;">
												<input type="hidden" name="num" value="${tmp.num }" />
												<textarea name="content">${tmp.content }</textarea>
												<button type="submit" style="height: 28px;width: 47px;margin: 0 0 0 10px;background: #ffffff;border-radius: 5px;border: 2.5px solid lightgrey;cursor: pointer;font-size:14px;color:#354A54">수정</button>
											</form>
										</c:if>	
							</c:otherwise>
						</c:choose>
						<div id="commComments${tmp.num }">
						
						</div>
					</c:forEach>
				</ul>
				
				<!-- 하단 페이징 버튼 -->
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
			</div>
			
			
			
			<!-- 후기 작성 폼 -->
			<form class="comment-form insert-form" action="comment_insert.do" method="post" style="margin-left: 150px" >
				<div style="height:70px; weight:100%;"> </div>
				<h1 style="color:#398F81;font-weight:bolder;">☻ 객실 이용 후기를 남겨주세요 </h1>
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

				<textarea name="content" style="width:1000px;">${empty id ? '로그인 후 작성이 가능합니다.' : '' }</textarea>
				<button type="submit" style="height: 28px;width: 47px;margin: 0 0 0 10px;background: #ffffff;border-radius: 5px;border: 2.5px solid lightgrey;cursor: pointer;font-size:14px;color:#354A54">등록</button>

			</form>
		</div>
		
		
		<nav style="margin:2.2rem 9rem 10rem 8rem;">
			<ul class="pagination">
			
				<c:if test="${startPageNum ne 1 }">
					<li class="page-item">
						<a class="page-link" href="javascript:movePage(${startPageNum-1 });" style="color:black;float:left;padding:8px 16px; text-decoration:none;">&laquo;</a>
					</li>
				</c:if>
				
				<c:forEach var="i" begin="${startPageNum }" end="${endPageNum }">
					<c:choose>
						<c:when test="${pageNum eq i }">
							<li class="page-item active">
								<a class="page-link" href="javascript:movePage(${i });" style="color:black;float:left;padding:8px 16px; font-weight:bold; text-decoration:none;">${i }</a>
							</li>
						</c:when>
						<c:otherwise>
							<li class="page-item">
								<a class="page-link" href="javascript:movePage(${i });" style="color:black;float:left;padding:8px 16px; font-weight:bold; text-decoration:none;">${i }</a>
							</li>
						</c:otherwise>
					</c:choose>
				</c:forEach>
				
				<c:if test="${endPageNum lt totalPageCount }">
					<li class="page-item">
						<a class="page-link" href="javascript:movePage(${endPageNum+1 });" style="color:black;float:left;padding:8px 16px; text-decoration:none;">&raquo;</a>
					</li>
				</c:if>
				
			</ul>
		</nav>
	</section>
	
	<!-- footer include-->
	
	<!-- 상단 이동 버튼 -->
	<div id="top" style="position:fixed;bottom:14px;right:14px;">
		<a href="#Visuals"><img src="${pageContext.request.contextPath }/resources/Jisutayimage/Logo_Icon/topbtn2.png" title="위로 가기"></a>
	</div>
	
	<p></p>
	<p></p>
	
	<!-- JAVASCRIPT  -->
	<script src="${pageContext.request.contextPath}/resources/js/gura_util.js"></script>
	<jsp:include page="/resources/include/starRating_js.jsp"></jsp:include>
	<script>
		//로그인 여부 확인
		let isLogin=${not empty id };
		//객실 후기 폼에서 submit 할 시 실행함수
		document.querySelector(".insert-form")
		.addEventListener("submit", function(event){
			//로그인 없이 sumbit 누를 경우
			if(!isLogin){
				const isMove=confirm("로그인이 필요합니다. 로그인 페이지로 이동하시겠습니까?");
				if(isMove){
					location.href=
						"${pageContext.request.contextPath}/users/loginform.do?url=/room/detail.do,${dto.num},regdate";
				}
				event.preventDefault();
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
								"${pageContext.request.contextPath}/users/loginform.do?url=/room/detail.do,${dto.num},regdate";
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
			if(commCommText == "ᗐ 답글 "+comm_count+"개") {
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
				commCommForm.innerText = "ᗑ 답글 "+comm_count+"개";
			} else if(commCommText == "ᗑ 답글 "+comm_count+"개") {
				document.querySelector("#commComments"+num).innerText = "";
				commCommForm.innerText = "ᗐ 답글 "+comm_count+"개";
			}
		}
		
/* ---------------- Form 전송 제어 ---------------- */
		document.querySelector('.insert-form').addEventListener('submit', function(e) {
			let contentText = this.querySelector('textarea[name=content]').value;
			if(contentText == "") {
				alert('내용 작성 후에 등록해주세요');
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
						alert('내용 작성 후에 등록해주세요');
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