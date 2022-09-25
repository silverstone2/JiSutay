<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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