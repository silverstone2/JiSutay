<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>About JiSutay</title>

<link rel="shorcut icon" href="${pageContext.request.contextPath }/resources/Jisutayimage/Logo_Icon/favicon.ico">

<!-- 폰트적용 -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&family=Shadows+Into+Light&family=Zilla+Slab:wght@500&display=swap" rel="stylesheet">

<script type="text/javascript" async="" src="https://www.google-analytics.com/analytics.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.1/jquery.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>
<script src="https://player.vimeo.com/api/player.js"></script>

<!-- jQuery 1.8 or later, 33 KB -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>

<script type="text/javascript" charset="UTF-8" src="//t1.daumcdn.net/adfit/static/kp.js"></script>
<script type="text/javascript">
      kakaoPixel('5444030924845697113').pageView();
</script>
<script async="" src="https://www.googletagmanager.com/gtag/js?id=UA-210701482-1">
</script>

<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/css/common.css">
<script type="text/javascript" src="${pageContext.request.contextPath }/js/swiper.js" defer=""></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/modify.js" defer=""></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/common.js" defer=""></script>

<!-- Fotorama from CDNJS, 19 KB -->
<link  href="https://cdnjs.cloudflare.com/ajax/libs/fotorama/4.6.4/fotorama.css" rel="stylesheet">
<script src="https://cdnjs.cloudflare.com/ajax/libs/fotorama/4.6.4/fotorama.js"></script>

<style>
	/* 상단 동영상 CSS 설정 */
	.lb-wrap {
		width: 100%;
		margin: 10px auto;
		position: relative;
	}
	.lb-wrap img {
		width: 100%;
		vertical-align: middle;
	}
	.lb-text {
		padding: 10px 20px;
		background-color: #FFEEBC;
		text-align: center;
		position: absolute;
		top: 50%;
		left: 50%;
		transform: translate(-50%, -50%);	
		font-size:80px;
		color:#FBFCFC;
		background-color:transparent;
	}
	.lb-text2 {
		padding: 10px 20px;
		background-color: #FFEEBC;
		text-align: center;
		position: absolute;
		top: 50%;
		left: 50%;
		transform: translate(-50%, -50%);
		font-size:30px;
		color:#FBFCFC;
		margin-bottom:7%;
		background-color:transparent;
	}
	video {
		max-width: 100%; display: block; margin: 0px auto;
	}
</style>

</head>

<body id="about">
	<!-- navbar include -->
	<jsp:include page="/resources/include/navbar.jsp"></jsp:include>
	
	<section>
		<!-- 메인 비디오 -->
		<div class="section video" id="Videos">
			<div class="MyFrame" id="intro">
				<iframe id="MyVideo" width="100%" height="100%" frameborder="0" allowfullscreen="" src="https://player.vimeo.com/video/657699230?h=8f0298d0a4?autoplay=1&amp;loop=1&amp;background=1" style="width: 1310px; height: 547px;" data-ready="true"></iframe>
			</div>
			<div class="title">
				<h2>
					<img src="${pageContext.request.contextPath }/resources/Jisutayimage/Logo_Icon/welcome.png" width="600" height="150" alt="">
				</h2>
			</div>
			<div class="line"></div>
		</div>
		<!-- 소개 문구 -->
		<div class="section exterior">
			<div class="bg bg01"></div>
			<div class="bg bg02"></div>
			<div class="title" id="title">
				<h3>JiSutay</h3>
				<p>
					제주도 서귀포시에 위치한 자연 속 풀빌라 지수테이는 <br>
					<strong>地 </strong>와 <strong>水 </strong>안에 머문다는 뜻을 가진 매력적인 독채형 펜션입니다.<br>
					제주의 사랑스러운 분위기와 편안함을 전해드립니다.<br>
					지수테이에 오시는 당신에게 따뜻하고 편안한 여행을 약속드립니다.
				</p>
			</div>
			
			<!-- 소개 사진 -->
			<div class="section fotomara" id="exterior" style="display:flex;justify-content: center;align-items:center" >
				<div class="InBox" style="width:1050px;height:800px;">
					<div class="fotorama" data-allowfullscreen="true"  data-nav="thumbs" style="width: 100%;height: 900px;">
						<img src="${pageContext.request.contextPath }/resources/Jisutayimage/room/room1/1.jpg">
						<img src="${pageContext.request.contextPath }/resources/Jisutayimage/room/room1/2.jpg">
						<img src="${pageContext.request.contextPath }/resources/Jisutayimage/room/room1/10.jpg">
						<img src="${pageContext.request.contextPath }/resources/Jisutayimage/room/room2/1.jpg">
						<img src="${pageContext.request.contextPath }/resources/Jisutayimage/room/room2/2.jpg">
						<img src="${pageContext.request.contextPath }/resources/Jisutayimage/room/room2/7.jpg">
						<img src="${pageContext.request.contextPath }/resources/Jisutayimage/room/room2/10.jpg">
						<img src="${pageContext.request.contextPath }/resources/Jisutayimage/room/room3/1.jpg">
						<img src="${pageContext.request.contextPath }/resources/Jisutayimage/room/room3/5.jpg">
						<img src="${pageContext.request.contextPath }/resources/Jisutayimage/room/room3/10.jpg">
						<img src="${pageContext.request.contextPath }/resources/Jisutayimage/room/room4/2.jpg">
						<img src="${pageContext.request.contextPath }/resources/Jisutayimage/room/room4/7.jpg">
						<img src="${pageContext.request.contextPath }/resources/Jisutayimage/room/room4/8.jpg">
						<img src="${pageContext.request.contextPath }/resources/Jisutayimage/room/room5/1.jpg">
						<img src="${pageContext.request.contextPath }/resources/Jisutayimage/room/room5/6.jpg">
						<img src="${pageContext.request.contextPath }/resources/Jisutayimage/room/room5/11.jpg">
					</div>
				</div>
			</div>
		</div>
			
			
		<!-- 지도 -->
		<div class="section" id="location">
			<div class="InBox">
				<div class="txt">
					<h3>JISUTAY LOCATION</h3>
					<p>아름다운 경치와 낭만이 깃든 다양한 플레이스가 모인 서귀포에 위치해 있습니다.</p>
						<div class="Box">
							<br />
							<p>
								<strong>Address.</strong>
								<span>제주특별자치도 서귀포시<br>보목동 33-7</span>
							</p>
							<br />
							<br />
							<p>
								<strong>Tel.</strong>
								<span>064) 987-6543</span>
								<span><b>(AM 08:00 ~ PM 09:00)</b></span>
							</p>
						</div>
					<iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d8227.838785001877!2d126.60693487671817!3d33.247661509261135!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x350c54acb05917bf%3A0x244f3c142f579012!2z7KCc7KO87Yq567OE7J6Q7LmY64-EIOyEnOq3gO2PrOyLnCDrs7Trqqnrj5kgMzM!5e0!3m2!1sko!2skr!4v1664240934872!5m2!1sko!2skr" width="100%" height="600" style="border:0;" allowfullscreen="" loading="lazy"></iframe>
				</div>
			</div>
		</div>
	</section>
	<!-- footer include -->
	<jsp:include page="/resources/include/footer.jsp"></jsp:include>
</body>
</html>