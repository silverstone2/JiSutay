<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JiSutay - JAMI</title>

<link rel="stylesheet" type="text/css" href="css/common.css">
<script type="text/javascript" src="js/modify.js" defer=""></script>
<script type="text/javascript" src="js/common.js" defer=""></script>

<link rel="shorcut icon" href="${pageContext.request.contextPath }/Jisutayimage/Logo_Icon/favicon.ico">

</head>

<body id="rooms" class="detail">


	<section>	
		<!-- 메인 이미지 -->
		<div class="section" id="Visuals">
			<div class="InnerBox">
				<img src="${pageContext.request.contextPath }/Jisutayimage/room/jami/1.jpg" style="width: 100%; height: 700px; opacity: 0.7">
				<h2>
					<img src="${pageContext.request.contextPath }/Jisutayimage/Logo_Icon/logo_bl.png" width="240" height="40" alt="">
					<span>자 미</span>
				</h2>
			</div>
		</div>
		
		<!-- 객실 정보, 객실 소개 -->
		<div class="section infos">
			<!-- 후기 이동 버튼 -->
			<div id="reviewbtn" style="position:absolute;top:14px;left:75px;">
				<a href="#review"><img src="${pageContext.request.contextPath }/Jisutayimage/Logo_Icon/reviewbtn.png" title="후기 보기"></a>
			</div>
			<div class="InBox">
				<div>
					<h3>객실 정보</h3>
						<ul>
							<li>
								<strong>객실구조</strong>
								<span>실내 수영장(4m*4m, 수심80cm)<br>침대방1, 온돌방1(2층침대), 화장실2, 주방, 월풀욕조, 개별 야외바베큐장, 개별 정원</span>
							</li>
							<li>
								<strong>객실크기</strong>
								<span>30평형</span>
							</li>
							<li>
								<strong>입실인원</strong>
								<span>기준 2명 / 최대 8명</span>
							</li>
							<li>
								<strong>객실비품</strong>
								<ul class="eq">
									<li>TV, </li><li> 드럼세탁기(세제), </li><li> 에어컨, </li><li> 드라이기, </li><li> 냉장고, </li><li> 전자렌지, </li><li> 무선주전자, </li><li>  전기밥솥, </li><li> 식기세트, </li><li>  조리도구, </li><li> 1구 인덕션 </li>
								</ul>
							</li>
						</ul>
				</div>
				<div>
					<h3>객실 소개</h3>
						<ul class="write">
							<li>1. 젊은 커플들이 선호하는 객실입니다.<br> 
								2. 앞뒤에 마당이 있어 아이들이 안전하게 뛰어 놀 수 있습니다.<br> 
								3. 객실내 반려동물 동반 입실은 불가합니다.<br> 
								4. 모든 객실에서는 금연이며 화재위험이 있는 물품은 반입이 안됩니다.<br> 
								5. 우천시 야외 바베큐장은 사용이 불가합니다.(밤별은 가능)</li>
						</ul>
				</div>
			</div>
		</div>
		
		<!-- 객실 이미지 -->
		<div class="section images">
				<div class="InBox">
					<div class="fotorama" data-nav="thumbs">
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
					</div>
				</div>
			</div>
		
		
		
		<!-- 후기 -->
		<div id="review">
			후기입니다.후기입니다.후기입니다.
		</div>
	</section>
	
	<!-- footer include-->
	
	<!-- 상단 이동 버튼 -->
	<div id="top" style="position:fixed;bottom:14px;right:14px;">
		<a href="#Visuals"><img src="${pageContext.request.contextPath }/Jisutayimage/Logo_Icon/topbtn2.png" title="위로 가기"></a>
	</div>
</body>


<!-- 임시 -->