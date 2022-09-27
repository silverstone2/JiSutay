<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
</div>

<!-- 하단 페이징 버튼 -->
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