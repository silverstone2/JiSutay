<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>About JiSutay</title>

<link rel="stylesheet" type="text/css" href="css/common.css">
<script type="text/javascript" src="js/swiper.js" defer=""></script>
<script type="text/javascript" src="js/modify.js" defer=""></script>
<script type="text/javascript" src="js/common.js" defer=""></script>

<link rel="shorcut icon" href="${pageContext.request.contextPath }/Jisutayimage/Logo_Icon/favicon.ico">

<script type="text/javascript" async="" src="https://www.google-analytics.com/analytics.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.1/jquery.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>
<script src="https://player.vimeo.com/api/player.js"></script>

<script type="text/javascript" charset="UTF-8" src="//t1.daumcdn.net/adfit/static/kp.js"></script>
<script type="text/javascript">
      kakaoPixel('5444030924845697113').pageView();
</script>
<script async="" src="https://www.googletagmanager.com/gtag/js?id=UA-210701482-1">
</script>

<!-- jQuery 1.8 or later, 33 KB -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<!-- Fotorama from CDNJS, 19 KB -->
<link  href="https://cdnjs.cloudflare.com/ajax/libs/fotorama/4.6.4/fotorama.css" rel="stylesheet">
<script src="https://cdnjs.cloudflare.com/ajax/libs/fotorama/4.6.4/fotorama.js"></script>

</head>

<body id="about">

	<!-- navbar include -->

	<section>
		<!-- 메인 비디오 -->
		<div class="section video" id="Videos">
			<div class="MyFrame" id="intro">
				<iframe id="MyVideo" width="100%" height="100%" frameborder="0" allowfullscreen="" src="https://player.vimeo.com/video/657699230?h=8f0298d0a4?autoplay=1&amp;loop=1&amp;background=1" style="width: 1310px; height: 547px;" data-ready="true"></iframe>
			</div>
			<div class="title">
				<h2 style="transform: translateY(0px); opacity: 1;">
					<img src="${pageContext.request.contextPath }/Jisutayimage/Logo_Icon/welcome.png" width="600" height="150" alt="">
				</h2>
			</div>
			<div class="line" style="transform: translateY(0px); opacity: 1;"></div>
		</div>
		
		<!-- 소개 문구 -->
		<div class="section exterior">
			<div class="bg bg01"></div>
			<div class="bg bg02"></div>
			<div class="title">
				<h3>JiSutay</h3>
				<p>
					제주도 서귀포시에 위치한 풀빌라 지수테이는 <strong>地 </strong>와 <strong>水 </strong>안에 머문다는 뜻을 가진<br>
					자연 속의 편안한 분위기와 제주도의 돌담이 매력적인 독채형 펜션입니다.<br>

					제주도의 사랑스러운 분위기와 나의 집같은 편안함을 전해드립니다.<br>
					지수테이에 오시는 당신에게 따뜻하고 편안한 여행을 약속드립니다.
				</p>
			</div>
			<div class="section fotomara" id="exterior">
				<div class="InBox">
					<div class="fotorama" data-nav="thumbs" data-width="100%" data-ratio="800/600"  data-minwidth="400" data-maxwidth="1000" data-minheight="300" data-maxheight="100%">
						<img src="${pageContext.request.contextPath }/Jisutayimage/about/1.jpg" width="150" height="100">
		  				<img src="${pageContext.request.contextPath }/Jisutayimage/about/2.jpg" width="150" height="100">
		  				<img src="${pageContext.request.contextPath }/Jisutayimage/about/3.jpg" width="150" height="100">
		  				<img src="${pageContext.request.contextPath }/Jisutayimage/about/4.jpg" width="150" height="100">
		  				<img src="${pageContext.request.contextPath }/Jisutayimage/about/5.jpg" width="150" height="100">
		  				<img src="${pageContext.request.contextPath }/Jisutayimage/about/6.jpg" width="150" height="100">
		  				<img src="${pageContext.request.contextPath }/Jisutayimage/about/7.jpg" width="150" height="100">
		  				<img src="${pageContext.request.contextPath }/Jisutayimage/about/8.jpg" width="150" height="100">
		  				<img src="${pageContext.request.contextPath }/Jisutayimage/about/9.jpg" width="150" height="100">
		  				<img src="${pageContext.request.contextPath }/Jisutayimage/about/10.jpg" width="150" height="100">
					</div>
				</div>
			</div>
		</div>
			
			
			<!-- 이미지 swiper
			<div class="section Swipers" id="exterior">
				<div class="InBox">
					<div class="swiper-container swiper swiper-container-horizontal">
						<div class="swiper-wrapper swiper-image">
							<div class="swiper-slide swiper-slide-active" style="width: 1000px;">
								<div style="background-image:url(${pageContext.request.contextPath }/Jisutayimage/about/1.jpg)"></div>
							</div>
							<div class="swiper-slide swiper-slide-next" style="width: 1000px;">
								<div style="background-image:url(${pageContext.request.contextPath }/Jisutayimage/about/2.jpg)"></div>
							</div>
							<div class="swiper-slide" style="width: 1000px;">
								<div style="background-image:url(${pageContext.request.contextPath }/Jisutayimage/about/3.jpg)"></div>
							</div>
							<div class="swiper-slide" style="width: 1000px;">
								<div style="background-image:url(${pageContext.request.contextPath }/Jisutayimage/about/4.jpg)"></div>
							</div>
							<div class="swiper-slide" style="width: 1000px;">
								<div style="background-image:url(${pageContext.request.contextPath }/Jisutayimage/about/5.jpg)"></div>
							</div>
							<div class="swiper-slide" style="width: 1000px;">
								<div style="background-image:url(${pageContext.request.contextPath }/Jisutayimage/about/6.jpg)"></div>
							</div>
							<div class="swiper-slide" style="width: 1000px;">
								<div style="background-image:url(${pageContext.request.contextPath }/Jisutayimage/about/7.jpg)"></div>
							</div>
							<div class="swiper-slide" style="width: 1000px;">
								<div style="background-image:url(${pageContext.request.contextPath }/Jisutayimage/about/8.jpg)"></div>
							</div>
							<div class="swiper-slide" style="width: 1000px;">
								<div style="background-image:url(${pageContext.request.contextPath }/Jisutayimage/about/9.jpg)"></div>
							</div>
							<div class="swiper-slide" style="width: 1000px;">
								<div style="background-image:url(${pageContext.request.contextPath }/Jisutayimage/about/10.jpg"></div>
							</div>
							<div class="swiper-slide" style="width: 1000px;">
								<div style="background-image:url(${pageContext.request.contextPath }/Jisutayimage/about/11.jpg)"></div>
							</div>
						</div>
						<div class="swiper-button">
							<div class="swiper-button-prev sbtn swiper-button-disabled"></div>
							<div class="swiper-button-next sbtn"></div>
							<div class="swiper-numb"><b>1</b>/<b>11</b></div>
						</div>
					</div>
				</div>
			</div>

		 -->

		<!-- 지도 -->
		<div class="section" id="location">
			<div class="InBox">
				<div class="txt">
					<h3>JISUTAY LOCATION</h3>
					<p>제주 서귀포의 아름다운 경치와 낭만이 깃든 다양한 플레이스가 모인 안덕면에 위치해 있습니다.</p>
						<div class="Box">
							<br />
							<p>
								<strong>Address.</strong>
								<span>제주 서귀포시 안덕면 소기왓로 81<br>서귀포시 안덕면 창천리 707-8</span>
							</p>
							<br />
							<br />
							<p>
								<strong>Tel.</strong>
								<span>02) 539-8879</span>
								<span><b>(AM 08:00 ~ PM 09:00)</b></span>
							</p>
						</div>
					<iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3165.3827632557472!2d127.02936071526797!3d37.49888957981069!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x357ca159d4b10f83%3A0xc672380e5228aa2e!2z7JeQ7J207L2Y7JWE7Lm0642w66-4IOqwleuCqOygkA!5e0!3m2!1sko!2skr!4v1663230306723!5m2!1sko!2skr" width="100%" height="600" style="border:0;" allowfullscreen="" loading="lazy"></iframe>
				</div>
			</div>
		</div>
	</section>
	
	<!-- footer include -->
		
</body>
</html>