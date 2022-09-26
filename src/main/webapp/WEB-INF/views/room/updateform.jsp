<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" />
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css"/>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
	<div class="container">
		<h1>객실 수정하기.</h1>
		<a href="../detail.do?num=${param.num }&sort=regdate">
			이전 이동 버튼 넣기
		</a>
		
		<form action="update.do" method="post" enctype="multipart/form-data">
			<input type="hidden" name="num" value="${param.num }" />
		      	<div class="mb-3">
		         	<label for="room_structure" class="form-label"></label>
		         	    <div class="input-group has-validation">
	      				<span class="input-group-text">
	      					<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-pin-map" viewBox="0 0 16 16">
	  							<path fill-rule="evenodd" d="M3.1 11.2a.5.5 0 0 1 .4-.2H6a.5.5 0 0 1 0 1H3.75L1.5 15h13l-2.25-3H10a.5.5 0 0 1 0-1h2.5a.5.5 0 0 1 .4.2l3 4a.5.5 0 0 1-.4.8H.5a.5.5 0 0 1-.4-.8l3-4z"/>
	  							<path fill-rule="evenodd" d="M8 1a3 3 0 1 0 0 6 3 3 0 0 0 0-6zM4 4a4 4 0 1 1 4.5 3.969V13.5a.5.5 0 0 1-1 0V7.97A4 4 0 0 1 4 3.999z"/>
							</svg>
	      				</span>
	     				<!--
	     				<input type="text" class="form-control" name="room_structure" id="room_structure" value="${dto.room_structure }">
	     				-->
	     				<textarea class="form-control" id="room_structure" name="room_structure">${dto.room_structure }</textarea>
	      				<div id="room_structureValid" class="invalid-feedback"></div>
	    			</div>
		      	</div>
	 			<div class="mb-3">
	   				<label for="room_size" class="form-label">객실크기</label>
	    			<div class="input-group has-validation">
	      				<span class="input-group-text">
	      					<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-stopwatch" viewBox="0 0 16 16">
	  							<path d="M8.5 5.6a.5.5 0 1 0-1 0v2.9h-3a.5.5 0 0 0 0 1H8a.5.5 0 0 0 .5-.5V5.6z"/>
	  							<path d="M6.5 1A.5.5 0 0 1 7 .5h2a.5.5 0 0 1 0 1v.57c1.36.196 2.594.78 3.584 1.64a.715.715 0 0 1 .012-.013l.354-.354-.354-.353a.5.5 0 0 1 .707-.708l1.414 1.415a.5.5 0 1 1-.707.707l-.353-.354-.354.354a.512.512 0 0 1-.013.012A7 7 0 1 1 7 2.071V1.5a.5.5 0 0 1-.5-.5zM8 3a6 6 0 1 0 .001 12A6 6 0 0 0 8 3z"/>
							</svg>
	      				</span>
	     				<input type="text" class="form-control" name="room_size" id="room_size" value="${dto.room_size}" required>
	      				<div id="room_sizeValid" class="invalid-feedback"></div>
	    			</div>
	    		</div>
	 			<div class="mb-3">
	   				<label for="room_people" class="form-label">입실인원</label>
	    			<div class="input-group has-validation">
	      				<span class="input-group-text">
	      					<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-stopwatch" viewBox="0 0 16 16">
	  							<path d="M8.5 5.6a.5.5 0 1 0-1 0v2.9h-3a.5.5 0 0 0 0 1H8a.5.5 0 0 0 .5-.5V5.6z"/>
	  							<path d="M6.5 1A.5.5 0 0 1 7 .5h2a.5.5 0 0 1 0 1v.57c1.36.196 2.594.78 3.584 1.64a.715.715 0 0 1 .012-.013l.354-.354-.354-.353a.5.5 0 0 1 .707-.708l1.414 1.415a.5.5 0 1 1-.707.707l-.353-.354-.354.354a.512.512 0 0 1-.013.012A7 7 0 1 1 7 2.071V1.5a.5.5 0 0 1-.5-.5zM8 3a6 6 0 1 0 .001 12A6 6 0 0 0 8 3z"/>
							</svg>
	      				</span>
	     				<input type="text" class="form-control" name="room_people" id="room_people" value="${dto.room_people }" required>
	      				<div id="room_peopleValid" class="invalid-feedback"></div>
	    			</div>
	    		</div>
	 			<div class="mb-3">
	   				<label for="room_items" class="form-label">객실비품</label>
	    			<div class="input-group has-validation">
	      				<span class="input-group-text">
	      					<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-stopwatch" viewBox="0 0 16 16">
	  							<path d="M8.5 5.6a.5.5 0 1 0-1 0v2.9h-3a.5.5 0 0 0 0 1H8a.5.5 0 0 0 .5-.5V5.6z"/>
	  							<path d="M6.5 1A.5.5 0 0 1 7 .5h2a.5.5 0 0 1 0 1v.57c1.36.196 2.594.78 3.584 1.64a.715.715 0 0 1 .012-.013l.354-.354-.354-.353a.5.5 0 0 1 .707-.708l1.414 1.415a.5.5 0 1 1-.707.707l-.353-.354-.354.354a.512.512 0 0 1-.013.012A7 7 0 1 1 7 2.071V1.5a.5.5 0 0 1-.5-.5zM8 3a6 6 0 1 0 .001 12A6 6 0 0 0 8 3z"/>
							</svg>
	      				</span>
	     				<!--
	     				<input type="text" class="form-control" name="room_items" id="room_items" value="${dto.room_items }" required>
	     				-->
	     				<textarea class="form-control" id="room_items" name="room_items" required>${dto.room_items }</textarea>
	      				<div id="room_peopleValid" class="invalid-feedback"></div>
	    			</div>
	    		</div>
				<div class="mb-3">
	    			<label for="room_introduce" class="form-label">객실소개</label>
	       			<div class="input-group has-validation">
	      				<span class="input-group-text" id="inputGroupPrepend3">
							<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-pencil-square" viewBox="0 0 16 16">
	 							<path d="M15.502 1.94a.5.5 0 0 1 0 .706L14.459 3.69l-2-2L13.502.646a.5.5 0 0 1 .707 0l1.293 1.293zm-1.75 2.456-2-2L4.939 9.21a.5.5 0 0 0-.121.196l-.805 2.414a.25.25 0 0 0 .316.316l2.414-.805a.5.5 0 0 0 .196-.12l6.813-6.814z"/>
	  							<path fill-rule="evenodd" d="M1 13.5A1.5 1.5 0 0 0 2.5 15h11a1.5 1.5 0 0 0 1.5-1.5v-6a.5.5 0 0 0-1 0v6a.5.5 0 0 1-.5.5h-11a.5.5 0 0 1-.5-.5v-11a.5.5 0 0 1 .5-.5H9a.5.5 0 0 0 0-1H2.5A1.5 1.5 0 0 0 1 2.5v11z"/>
							</svg>
	      				</span>
	     				<textarea  class="form-control" name="room_introduce" id="room_introduce" required>${dto.room_introduce }</textarea>
	      				<div id="room_introduceValid" class="invalid-feedback"></div>
	    			</div>
	  			</div>
				<div class="mb-3">
					<label for="file" class="form-label">객실 이미지 업로드</label>
					<input multiple="multiple" type="file" name="file" class="form-control" aria-label="file example" accept=".jpg, .jpeg, .png, .JPG, .JPEG" required/>
					
					<!-- 이미지 선택 preview -->
					<div class="previewMother">
						<c:forEach begin="0" end="9" step="1" varStatus="status">
							<c:if test="${status.index == 5 }">
								<br>
							</c:if>
							<img class="imgUpload" id="imgUpload${status.index }" src="${pageContext.request.contextPath }/resources/images/imgUpload.PNG" style="width: 140px; height: 140px; margin: 10px;"/>
						</c:forEach>
					</div>
					
				</div>
			<button type="submit">수정확인</button>
			<button type="reset">되돌리기</button>
		</form>
	</div>
	
<script src="${pageContext.request.contextPath }/resources/js/jquery-3.4.1.js"></script>
<script>
	$('input[name=file]').on('change', function() {
		$(".imgUpload").attr("src", "${pageContext.request.contextPath }/resources/images/imgUpload.PNG");
		
		// 파일을 10개 초과로 선택할 경우, 선택 불가 로직
		if(this.files.length > 10) {
			this.value = "";
			alert("객실 이미지는 10개 이하 업로드 가능합니다!");
			return;
		}
		
		// 선택한 파일이 존재할 경우, FileReader 객체를 통해 preview 기능으로 화면에 출력
		if (this.files) {
			let reader = new FileReader();
			
			for(let i=0; i<this.files.length; i++) {
				let reader = new FileReader();
				
				reader.onload = function(e) {
					$("#imgUpload"+i).attr("src", e.target.result);
				};
				reader.readAsDataURL(this.files[i]);
			}
		} else {
			$(".imgUpload").attr("src", "${pageContext.request.contextPath }/resources/images/imgUpload.PNG");
		}
	});
	
	$('button[type=reset]').on('click', function() {
		$(".imgUpload").attr("src", "${pageContext.request.contextPath }/resources/images/imgUpload.PNG");
	});
</script>
</body>
</html>