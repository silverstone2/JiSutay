<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:forEach var="tmp" items="${commentsList }" varStatus="status">
	<c:choose>
		<c:when test="${tmp.deleted eq 'yes' }">
			<li style="border-top:none;	padding: 15px 0 15px 50px;">삭제된 댓글입니다.</li>
		</c:when>
		<c:otherwise>
			<%--관리자 답글(대댓글) --%>
			<c:if test="${tmp.num ne tmp.comment_num }">
				<%-- 왼쪽 padding 50px로 들여쓰기 효과 + 화살표 아이콘 추가 --%>
				<li id="reli${tmp.num }" style="width:1000px;padding:10px 0 15px 50px;display:flex;border-top:none;flex-wrap:wrap;">
					<svg class="reply-icon" xmlns="http://www.w3.org/2000/svg" width="14" height="14" fill="currentColor" class="bi bi-arrow-return-right" viewBox="0 0 16 16">
 						<path fill-rule="evenodd" d="M1.5 1.5A.5.5 0 0 0 1 2v4.8a2.5 2.5 0 0 0 2.5 2.5h9.793l-3.347 3.346a.5.5 0 0 0 .708.708l4.2-4.2a.5.5 0 0 0 0-.708l-4-4a.5.5 0 0 0-.708.708L13.293 8.3H3.5A1.5 1.5 0 0 1 2 6.8V2a.5.5 0 0 0-.5-.5z"/>
					</svg>
			</c:if>
					<dl style="margin:0 300px 0 10px">
						<dt>
							<c:if test="${ empty tmp.profile }">
								<svg class="profile-image" xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-person-circle" viewBox="0 0 16 16">
									<image href="${pageContext.request.contextPath }/resources/Jisutayimage/user.png" width="16" height="16"></image>
								</svg>
							</c:if>
							<c:if test="${not empty tmp.profile }">
								<img class="profile-image" src="${pageContext.request.contextPath}${tmp.profile }"/>
							</c:if>
							<%-- 관리자 답글(대댓글)이라면 누구를 향한 답글인지 옆에 @~ 텍스트 출력 --%>
							<div style="width:100%">
								<div style="margin-left:10px">
									<span style="font-size: 17.5px; font-weight: bold; color: #646F75; font-family: system-ui;">${tmp.writer }</span>
									<span style="font-size: 15px; color: #D7D7D7;;">&nbsp;&nbsp;|&nbsp;&nbsp;</span>
									<span style="font-size: 14px; color: #799097;">${tmp.regdate }</span>
									<%-- 답글 링크를 눌렀을 때 해당 댓글의 글번호 얻어오기 위해 data-num 속성에 댓글의 번호 넣어두기 --%>
									<span style="font-size: 14px; color: #D7D7D7;;">&nbsp;&nbsp;|&nbsp;&nbsp;</span>
									<a data-num="${tmp.num }" href="javascript:" class="re-reply-link" style="font-size:15px;color:#354A54">답글</a>
									<%-- 댓글 작성자와 로그인한 사용자가 같다면 수정/삭제 버튼 활성화 (우선은 전체 답글 활성화) --%>
									<%-- 
										<c:if test="${ (id ne null) and (tmp.writer eq sessionScope.id) }">
									 --%>
									 <c:if test="${ tmp.writer eq sessionScope.id }">
										<span style="font-size: 14px; color: #D7D7D7;;">&nbsp;|&nbsp;</span>
										<a data-num="${tmp.num }" class="re-update-link" href="javascript:" style="font-size:15px;color:#354A54">수정</a>
										<span style="font-size: 14px; color: #D7D7D7;;">&nbsp;|&nbsp;</span>
										<a data-num="${tmp.num }" class="re-delete-link" href="javascript:" style="font-size:15px;color:#354A54">삭제</a>
									</c:if>
								</div>
							</div>
						</dt>
						<dd style="display:flex; margin: 0 5px 0 50px;">
							<%-- 
								댓글은 textarea 로  입력 > tab, 공백, 개행기호 있음.
								pre 요소의 innerText 로 댓글을 출력하면 입력한 내용 형식을 그대로 출력 가능.
								해당 댓글 JAVASCRIPT 로 바로 수정할 수 있도록 댓글 번호 조합해서 아이디 부여.
							--%>
							<div>
							<c:if test="${tmp.num ne tmp.comment_num }">
								<i style="font-size: 16; font-weight: bold; color: #47C088; font-family: system-ui;">@${tmp.target_id }</i>
							</c:if>
							</div>
							<div style="margin-left:10px; color: #4D565B; font-family: system-ui">
							<pre id="pre${tmp.num }">${tmp.content }</pre>
							</div>
						</dd>
					</dl>
					<%--
						답글 폼은 미리 만들어서 hidden >> 답글 링크 클릭시 활성화 
						답글은 고유한 댓글 그룹번호(tmp.comment_num)로 form 전송시 같이 전송(답글의 그룹번호는 원댓글의 글번호).	
					--%>
					<form id="reForm${tmp.num }" class="animate__animated comment-form re-re-insert-form" action="re_comment_insert.do" method="post" style="display:none;margin:15px 100px 0px 75px;width:450px;">
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
					<form id="updateForm${tmp.num }" class="comment-form re-update-form" action="comment_update.do" method="post" style="display:none;margin:15px 100px 0px 75px;width:450px;">
						<input type="hidden" name="num" value="${tmp.num }" />
						<textarea name="content">${tmp.content }</textarea>
						<button type="submit" style="height: 28px;width: 47px;margin: 0 0 0 10px;background: #ffffff;border-radius: 5px;border: 2.5px solid lightgrey;cursor: pointer;font-size:14px;color:#354A54">수정</button>
					</form>
				</c:if>
		</c:otherwise>
	</c:choose>
	<div id="commComments${tmp.num }">
	
	</div>
	</li>
</c:forEach>