"use strict";
document.write(
"<!--[if lte IE 9]>"
+ "<script type='text/javascript' src='//cdnjs.cloudflare.com/ajax/libs/jquery-ajaxtransport-xdomainrequest/1.0.3/jquery.xdomainrequest.min.js'></script>"
+ "<script type='text/javascript'>alert('브라우저를 최신 버전으로 업그레이드하세요.'); window.open('http://outdatedbrowser.com/ko','_blank');</script>"
+ "<![endif]-->"
);

$(function(){
	/*---------------------------------------------------------------*/	
	//variable
	let video = document.getElementById("MyVideo");
	let path = (location.href.substr(location.href.lastIndexOf("/") + 1)).split(".")[0]; 	//path
	let split = (location.href.substr(location.href.lastIndexOf("/") + 1)).split("&idx")[1]; //split
	let detailPath = ((location.href.substr(location.href.lastIndexOf("=") + 1)).slice(0, 2) - 1 + 1) - 1; //detail Path

	/*---------------------------------------------------------------*/	
	//header
	$("header nav > ul > li.gb").hover(function(){
		var hdHeit = $("header nav > ul > li.gb ul li").height() + 1;
		$(this).find("ul li").each(function(e){
			$(this).parent("ul").css({"height":hdHeit * (e + 1),"opacity":"1","z-index":"0"});
		});	
	},function(){
		$("header nav > ul > li.gb ul").css({"height":0, "opacity":"0", "z-index":"0"});
	});

	$("header nav .family > a").on("click",function(){
		var hdHeit = $("header nav .family ul li").height() + 1;
		$(this).parent("div.family").find("ul li").each(function(e){
			$(this).parent("ul").css({"height":hdHeit * (e + 1),"opacity":"1","z-index":"0"});
		});	
		return false;
	});
	$("header nav .family").on("mouseleave",function(){
		$("header nav .family ul").css({"height":0, "opacity":"0", "z-index":"0"});
	});

	/*---------------------------------------------------------------*/	
	//body
	switch(path){
		//index Page
		case '' :
		case 'index' : videoControl(video);
			new Vimeo.Player(video).on('play',function(){
				$("#Videos .title h2 img").css({"transform":"translateY(0)","opacity":"1"});
			}); 
			//Swipers
			for(var i=0; i < img[0]; i++){
				$(".Swipers .swiper-image").append(
					'<div class="swiper-slide">' + 
						'<div style="background-image:url('+ url +'/main/' + (i + 1) + '.jpg)"></div>' + 
					'</div>'
				);
			} $(".swiper-numb b").eq(1).text(img[0]); 
			Swipers(".Swipers", "1", true, 0, false); fullpage(800);
		break;

		//video Page
		case 'video' :	

		break;

		//about Page
		case 'about' : videoControl(video);
			new Vimeo.Player(video).on('play',function(){
				$("#Videos .title h2").css({"transform":"translateY(0)","opacity":"1"});
				$("#Videos .line").css({"transform":"translateY(0)","opacity":"1"});
			});
			$(window).on("scroll",function(){
				var thisTop = $(this).scrollTop();
				var textTop = $(".exterior .title h3").offset().top - $(window).height();
				if(thisTop > textTop) $(".exterior .title").css({"transform":"translateY(0)","opacity":"1"});
				else $(".exterior .title").css({"transform":"translateY(12.5%)","opacity":"0"});
			});
			//Swipers
			for(var i=0; i < img[1]; i++){
				$(".Swipers .swiper-image").append(
					'<div class="swiper-slide">' + 
						'<div style="background-image:url('+ url +'/exterior/' + (i + 1) + '.jpg)"></div>' + 
					'</div>'
				);
			} $(".swiper-numb b").eq(1).text(img[1]); Swipers(".Swipers", "1", true, 0, false);
			$.getJSON('http://digitalnow.co.kr/reserve/pensionInfo/'+ account +'/4',
			function(data){
				$(".addBox").append(
					'<p>' +
						'<strong>Address.</strong>' +
						'<span>' + data.result.NEW_USER_ADDR + '<br>' + data.result.USER_ADDR +'</span>' +
					'</p>' +
					'<p>' +
						'<strong>Tel.</strong>' +
						'<span>'+ data.result.USER_TEL1 +'</span>' +
						'<span><b>AM 09:00 ~ PM 07:00</b></span>' +
					'</p>'
				);
			});
		break;

		//travel Page
		case 'travel' :	
			$.getJSON("http://digitalnow.co.kr/reserve/pensionInfo/" + account + "/10", 
			function(data){
				let orderedList = [];
				for (let i = 0; i < data.result.length; i++){
					for (let j = 0; j < data.result.length; j++){
						if (Number(data.result[j]["ORDER_NUM"]) - 1 === i) orderedList.push(data.result[j]);
					}
				} $.each(data.result,function(key,val){
					$(".frame ul").append(
						'<li>' +
							'<div class="img"><img src="images/travel/'+ (key + 1) +'.jpg" width="100%" height="auto" alt="" /></div>' +
							'<div class="txt">' +
								'<h4>' +
									'<strong>'+ orderedList[key]["TITLE"] +'</strong>' +
									'<span>&nbsp;|&nbsp; '+ orderedList[key]["DISTANCE"] +'</span>' +
								'</h4>' +
								'<span>'+ orderedList[key]["CONTENT"] +'</span>' +
							'</div>' +
						'</li>'
					);
				});
			}); vidParallax("#Banner .bg","",""); exJumpy()
		break;	

		//rooms preview Page
		case 'rooms_pv' : videoControl(video);
			new Vimeo.Player(video).on('play',function(){
				$("#Videos .title h2").css({"transform":"translateY(0)","opacity":"1"});
				$("#Videos .line").css({"transform":"translateY(0)","opacity":"1"});
			});
			$.getJSON('http://digitalnow.co.kr/reserve/pensionInfo/'+ account +'/8',
			function(data){
				$.each(data.result,function(key,val){
					$(".lists .InBox").append(
						'<div>' +
							'<div class="img">' +
								'<div style="background-image:url('+ url +'/room/'+ (key + 1) +'/1.jpg);"></div>' +
							'</div>' +
							'<div class="btn">' +
								'<a href="rooms.html?num='+ numbering(key) +'">' +
									'<h3><img src="images/ttl_pv_small.png" width="173" height="24" alt=""><strong>소랑제 '+ data.result[key]["TYPE_NM"] +'</strong></h3>' +
									'<span>농어촌민박사업자 신고번호 :<br>'+ farmNum[key] +'</span>' +
									'<div><div></div><span>Detail</span></div>' +
								'</a>' +
							'</div>' +
						'</div>'	
					);	
				});	
			});	
		break;

		//rooms Page
		case 'rooms' :	
			$.getJSON('http://digitalnow.co.kr/reserve/pensionInfo/'+ account +'/8',
			function(data){
				$("#Visuals").append(
					'<div class="InnerBox" style="background:url('+ url +'/room/'+ (detailPath + 1) +'/1.jpg) no-repeat 50% 50%;background-size:cover">' +
						'<h2>' +
							'<img src="images/ttl_pv_large.png" width="300" height="42" alt="" />' +
							'<span>소랑제 '+ data.result[detailPath]["TYPE_NM"] +'</span>' +
						'</h2>' +
						'<div id="scroll"><a href="#"><img src="images/scroll.png" alt="" width="80" height="80"></a></div>' +
					'</div>'
				);
				$(".infos .InBox").prepend(
					'<div>' +
						'<h3>객실정보</h3>' +
						'<ul>' +
							'<li><strong>객실구조</strong><span>'+ data.result[detailPath]["ROOM_TYPE"] +'</span></li>' +
							'<li><strong>객실크기</strong><span>'+data.result[detailPath]["ROOM_EXTN"] +'평형</span></li>' +
							'<li>' +
								'<strong>입실인원</strong>' +
								'<span>기준 ' + data.result[detailPath]["ADLT_BASE_PERS"] + '명 / 최대 ' + data.result[detailPath]["ADLT_MAX_PERS"] + '명</span>' +
							'</li>' +
							'<li>' +
								'<strong>객실비품</strong>' +
								'<ul class="eq"></ul>' +
							'</li>' +
						'</ul>' +
					'</div>'
				);
				$(".infos .InBox .write").prepend('<li>'+ data.result[detailPath]["ETC_DETL"] +'</li>');	

				var intr = data.result[detailPath]['INTERIOR'].split(',');
				for (var i = 0; i < intr.length; i++) $(".eq").append('<li>' + intr[i] + ', </li>');
				var last = $(".eq").find("li").eq(intr.length - 1).text().replace(/,/g, '');
				$(".eq").find("li").eq(intr.length - 1).text(last);	



			
				//btn - info	
				$("#scroll").on("click",function(){
					$("html,body").animate({scrollTop:$(".infos").offset().top},700);
					return false;
				});	
				$(".InfoBtn").on("click",function(){
					$("html,body").animate({scrollTop:$(".infos").offset().top},700);
					return false;
				});	
				$(window).on("scroll",function(){
					var thisTop = $(this).scrollTop();
					var InfoTop = $(".infos").offset().top;
					var FootTop = $("footer").offset().top - $(window).height();
					if(thisTop > InfoTop && thisTop < FootTop) $(".InfoBtn").fadeIn();
					else $(".InfoBtn").fadeOut();
					return false;
				});	
				$(".FarmBtn").append('<span>농어촌민박사업자 신고번호<br>'+ farmNum[detailPath] +'</span>');
			});
			//Images
			for(var i=1; i < img[2][detailPath]; i++){
				$(".images .InBox").append('<img src="'+ url +'/room/'+ (detailPath + 1) +'/'+ (i + 1) +'.jpg" width="100%" height="auto" alt="" />');
			} 
			$(window).on("scroll",function(){ ImgScale(this);}); 
			$(window).on("resize",function(){ ImgScale(this); });
			function ImgScale(e){
				var thisTop = $(e).scrollTop();
				for(var i = 0; i < img[2][detailPath]-1; i++){
					var list = $(".images .InBox img").eq(i).offset().top;
					if((list - $(window).height() / 10 * 9) < thisTop && (list + $(".images .InBox img").height()) > thisTop){
						$(".images .InBox img").eq(i).css({'transform':'translateY(0)','transform':'scale(1)','opacity':'1'});
					}else{
						$(".images .InBox img").eq(i).css({'transform':'translateY(10%)','transform':'scale(0.95)','opacity':'0.5'});
					}
				}
			} vidParallax("#Visuals .InnerBox","","#scroll"); exJumpy()
		break;

		//special preview Page
		case 'special_pv' :	videoControl(video);	 
			new Vimeo.Player(video).on('play',function(){
				$("#Videos .title h2").css({"transform":"translateY(0)","opacity":"1"});
				$("#Videos .line").css({"transform":"translateY(0)","opacity":"1"});
			});	
		
			$.getJSON('http://digitalnow.co.kr/reserve/pensionInfo/'+ account +'/9',
			function(data){
				let specialList = [];
				for (let i = 0; i < data.result.length; i++){
					for (let j = 0; j < data.result.length; j++){
						if (Number(data.result[j]["ORDER_NUM"]) - 1 === i) specialList.push(data.result[j]);
					}
				}
				for(var i = 0; i < specialList.length; i++){
					$(".lists .InBox").append(	
						'<div>' +
							'<div class="notice">' +
								'<div class="ttl"><h3>'+ data.result[i]["TITLE_EN"] +'</h3><p>'+ data.result[i]["CONTENT"] +'</p></div>' +
							'</div>' +
							'<div class="spvList">' +
								'<div class="btn">' +
									'<span><img src="images/ttl_spv_'+ numbering(i) +'.png" alt="" width="400" height="150" /></span>' +
									'<a href="special.html?num='+ numbering(i) +'"><img src="images/btn_spv.png" alt="" width="152" height="45" /></a>' +
								'</div>' +
								'<div class="img">' +
									'<div style="background-image:url('+ url +'/special/'+ (i + 1) +'/1.jpg);"></div>' +
								'</div><div class="bg"></div>' +
							'</div>' +
						'</div>'
					);
				}
				$(".spvList .btn a").hover(function(){
					$(this).parents(".spvList").find(".bg").stop(true,false).animate({"opacity":"0.1"},200);
					$(this).parents(".spvList").find(".img > div").css({"transform": "scale(1.05)"});
				},function(){
					$(this).parents().find(".bg").stop(true,false).animate({"opacity":"0.6"},200);
					$(".img > div").css({"transform": "scale(1)"});
				});
			});
		break;

		//special Page
		case 'special' :
			$.getJSON('http://digitalnow.co.kr/reserve/pensionInfo/'+ account +'/9',
			function(data){
				$("#Visuals").append(
					'<div class="InnerBox" style="background:url('+ url +'/special/'+ (detailPath + 1) +'/1.jpg) no-repeat 50% 50%;background-size:cover">' +
						'<h2>' +
							'<strong>' + data.result[detailPath]["TITLE_EN"]  + '</strong>' +
							'<span>'+ data.result[detailPath]["TITLE_KR"] +'</span>' +
						'</h2>' +
						'<div id="scroll"><a href="#"><img src="images/scroll.png" alt="" width="80" height="80"></a></div>' +
					'</div>'
				);
				$(".infos .InBox").prepend(
					'<div>' +
						'<h3>INFORMATION</h3>' +
						'<p>' + 
							data.result[detailPath]["CONTENT"] +
							'<span>' + data.result[detailPath]["CONTENT1"] + '</span>' +
							'<span>' + data.result[detailPath]["CONTENT2"] + '</span>' +
							'<span>' + data.result[detailPath]["CONTENT3"] + '</span>' +
						'</p>' +
					'</div>'
				);
				//btn - info	
				$("#scroll").on("click",function(){
					$("html,body").animate({scrollTop:$(".infos").offset().top},700);
					return false;
				});
			});	
			//Swipers
			for(var i = 0; i < img[3][detailPath]; i++){
				$(".Swipers .swiper-image").append(
					'<div class="swiper-slide">' + 
						'<div style="background-image:url('+ url +'/special/'+ (detailPath + 1) +'/' + (i + 1) + '.jpg)"></div>' + 
					'</div>'
				);
			}Swipers(".Swipers", "auto", true, 5, false); vidParallax("#Visuals .InnerBox","","#scroll"); exJumpy()
		break;

		//reserve Page
		case 'reserve' :
			$(".banner .snb li a").on("click",function(){ 
				var nb = $(this).parent("li").index();
				$(".banner .snb > li").removeClass("active");
				$(".banner .snb > li").eq(nb).addClass("active");
				if(nb == 0){
					$("#Banner h2 strong").text("RESERVATION");
					$("#Banner h2 span").text("실시간 예약");
					$(".frame").hide(); $(".frame_01").show();
				}else if(nb == 1){
					$("#Banner h2 strong").text("GUIDE");
					$("#Banner h2 span").text("예약안내");
					$(".frame").hide(); $(".frame_02").show();
				}return false;
			}); reserInfo(account);
			vidParallax("#Banner .bg","",""); exJumpy()
		break;
		
		//community Page
		case 'community' :
			$(".banner .snb li a").on("click",function(){ 
				var nb = $(this).parent("li").index();
				$(".banner .snb > li").removeClass("active");
				$(".banner .snb > li").eq(nb).addClass("active");
				if(nb == 0){
					$("#Banner h2 strong").text("NOTICE");
					$("#Banner h2 span").text("공지사항");
	
					$(".frame h3 strong").text("공지사항");
					$(".frame h3 span").text("공지사항과 다양한 소식을 확인해보세요.");
					$(".frame iframe").attr("src","/board/bbs/board.php?bo_table=notice");
					return false;
				}else if(nb == 1){
					$("#Banner h2 strong").text("Q&A");
					$("#Banner h2 span").text("문의사항");
				
					$(".frame h3 strong").text("문의하기");
					$(".frame h3 span").text("궁금하신 사항을 남겨주세요.");
					$(".frame iframe").attr("src","/board/bbs/board.php?bo_table=qna");
					return false;
				}
			}); vidParallax("#Banner .bg","",""); exJumpy()
		break;

		//None Page
		default : location.href = "index.html";
		break;
	}

	/*---------------------------------------------------------------*/
	//footer
	$.getJSON('http://digitalnow.co.kr/reserve/pensionInfo/'+ account +'/4',	//User Info
	function(data){
		const USER_TEL1 = data.result.USER_TEL1;				//전화번호 1
		const USER_TEL2 = data.result.USER_TEL2;				//전화번호 2
		const NEW_USER_ADDR = data.result.NEW_USER_ADDR;		//도로명주소
		const USER_ADDR = data.result.USER_ADDR;				//지번주소
		const BUSI_NM = data.result.BUSI_NM;					//상호명
		const USER_ACCO = data.result.USER_ACCO;				//계좌번호
		const COMM_SALE_NO = data.result.COMM_SALE_NO;			//통신판매업번호

		$("footer").append(
			'<div class="inner">'+
				'<div class="ft01">' +
					'<div class="InBox">' +
						'<a href="video.html">' +
							'<div class="imgs"><div></div></div><div class="bg"></div>'+
							'<img src="images/more_btn.png" width="" height="" />' +
						'</a>' +
						'<div>' +
							"<strong><b></b>Watch Full Version Video</strong>" +
							'<span>풀버전 영상으로 풀스테이 소랑제를 먼저 만나보세요!</span>' +
						'</div>' +
					'</div>' +
				'</div>' +
				'<div class="ft02">'+
					'<h5><a href="index.html"><img src="images/f_logo.png" width="200" height="200" /></a></h5>'+
					'<ul class="sns">'+
						'<li><a href="#" class="sns_01"><img src="images/sns_01.png" width="38" height="38" /></a></li>'+	
						'<li><a href="#" class="sns_02"><img src="images/sns_02.png" width="38" height="38" /></a></li>'+	
						'<li><a href="#" class="sns_03"><img src="images/sns_03.png" width="38" height="38" /></a></li>'+	
					'</ul>'	+
					'<ul class="add">'+
						'<li>TEL : ' + USER_TEL1 + '</li>'+	
						'<li>주소: ' + NEW_USER_ADDR + '</li>'+
						'<li>상호명 : ' + BUSI_NM +' | 대표 : <span class="BUSI_PRE_NM"></span></li>'+
						// '<li>계좌번호 : ' + USER_ACCO + '</li>'+
						'<li>사업자등록번호 : <span class="BUSI_NO"></span></li>'+
						'<li>통신판매업번호 : ' + COMM_SALE_NO + '</li>'+
					'</ul>'+
					'<div>' +
						'<div>' +
						'<span>(주)풀스테이는 숙박 광고 대행만을 <br> 하는 업체입니다.</span>' +
							// '<span>풀빌라시공 및 도소매<br>(주)풀스테이 대표 : 이승호</span>' +
							// '<a href="http://fullstay.net" target="_blank">http://fullstay.net</a>' +
						'</div>'+
						'<div><a href="http://gonylab.com/" target="_blank" class="website">홈페이지 제작 | GONYLAB</a></div>'+
					'</div>' +
				'</div>'+
			'</div>'
		);

		//사업자 정보	
		$.getJSON('http://digitalnow.co.kr/reserve/pensionInfo/'+ account +'/11', //User Info
		function(data){
			var BUSI_PRE_NM = new Array(); 						//대표자
			var BUSI_NO = new Array();							//사업자번호
			$.each(data.result,function(key,val){
				BUSI_PRE_NM.push(val["BUSI_PRE_NM"]); BUSI_NO.push(val["BUSI_NO"]);
				$(".BUSI_PRE_NM").text(BUSI_PRE_NM); $(".BUSI_NO").text(BUSI_NO);
			});
		});
		//sns - href
		$(".sns_01").attr("href",INTRAGRAM); 
		$(".sns_02").attr("href",FACEBOOK); 
		$(".sns_03").attr("href",NV_BLOG);
		$(".sns_04").attr("href",NV_CAFE);
		$(".sns_05").attr("href",KAKAO);

		if(INTRAGRAM == "#"){$(".sns_01").on('click',function(){alert('준비중입니다.');return false;});}
		if(FACEBOOK == "#"){$(".sns_02").on('click',function(){alert('준비중입니다.');return false;});}
		if(NV_BLOG == "#"){$(".sns_03").on('click',function(){alert('준비중입니다.');return false;});}
		if(NV_CAFE == "#"){$(".sns_04").on('click',function(){alert('준비중입니다.');return false;});}
		if(KAKAO == "#"){$(".sns_05").on('click',function(){alert('준비중입니다.');return false;});}
	});
});

/*------------------------------------------------------------------------------------------------*/
//function - numbering
function numbering(n) { // 이미지 넘버링 10 보다 작을때
	var num = ''; var n = n + 1; var n = n.toString();
	if (n.length < 2){for (var i = 0; i < 2 - n.length; i++){num += '0';}}
	return num + n;
}
//function - swipers
function Swipers(value, view, center, Between, boolean){
	var swiper = new Swiper(value + ' .swiper', {
		paginationClickable: true,
		nextButton: '.swiper-button-next',
		prevButton: '.swiper-button-prev',
		pagination: '.swiper-pagination',
		slidesPerView: view,
		centeredSlides: center,
		spaceBetween: Between,
		loop: boolean,
		onSlideChangeStart: function (swiper) {
			var numb = swiper.activeIndex + 1;
			$(".swiper-numb b").eq(0).text(numb);
			//$(".swiper-numb b").eq(1).text(swiperTotal);
		},
	});
}
//function - video
function videoControl(control){
	videoScale(control);
	$(window).on("resize",function(){ videoScale(control); });
	$(window).on("scroll",function(){
		var thisTop = $(this).scrollTop();
		var stopTop = $(".section").eq(0).height() - 50;
		var player = new Vimeo.Player(control);
		if(thisTop > stopTop) player.pause();
		else player.play();
	});
}
//function - videocontrol
function videoScale(control){
	control.style.width = Math.round($(window).height() / 9 * 16) + "px";
	control.style.height = Math.round($(window).width() / 16 * 9) + "px";
}
//function - VidParallax
function vidParallax(value,name,btn){
	var max = 750;
	if(!navigator.userAgent.match(/Trident\/7\./)) { // if IE
		$(window).on("scroll",function(){
			$(value).css("transform","translate3d(0px, "+ $(this).scrollTop() / 1.5  +"px, 0px)");
			$(name).css({"transform":"translate3d(0px, "+ $(this).scrollTop() / 1.5  +"px, 0px)","opacity":(max - $(this).scrollTop()) / max});
			$(btn).css({"opacity":(max - $(this).scrollTop()) / max});
		});
	}
}
// function - ie background-fixed 
function exJumpy(){
    if(navigator.userAgent.match(/Trident\/7\./)) { // if IE
        $('body').on("mousewheel", function(){
            // remove default behavior
            event.preventDefault(); 
             //scroll without smoothing
            var wheelDelta = event.wheelDelta;
            var currentScrollPosition = window.pageYOffset;
            window.scrollTo(0, currentScrollPosition - wheelDelta);
        });
		$('body').keydown(function(e){
			e.preventDefault(); // prevent the default action (scroll / move caret)
			var currentScrollPosition = window.pageYOffset;
			switch (e.which) {
				case 38: window.scrollTo(0, currentScrollPosition - 120); /* up */
					break;
				case 40: window.scrollTo(0, currentScrollPosition + 120); /* down */
					break;
				default: return; // exit this handler for other keys
			} 
		});
    }
}
//function - fullpage
function fullpage(s,v){ //s - speed / v - video
	$('#fullpage').fullpage({
		licenseKey: 'OPEN-SOURCE-GPLV3-LICENSE',
		navigation: true,
		navigationPosition: 'right',
		scrollingSpeed: s,
		//autoScrolling: true,
		//normalScrollElements : 'scroll',
		scrollHorizontally: true,
		onLeave: function(s, n, b){
			var total = $(".section").length - 1;
			if(b == "up"){	
				if(n.index == 0){
					$(".fp-prev").stop(true,false).fadeOut();
				}else if(n.index === (total - 1)){
					$(".fp-next").delay(300).fadeIn();
				}	
			}else if(b == "down"){
				if(n.index == total){
					$(".fp-prev").stop(true,false).fadeIn();
					$(".fp-next").stop(true,false).fadeOut(100);
				}else if(n.index === (total - 1)){
					$(".fp-next").stop(true,false).fadeIn();
				}else{
					$(".fp-prev").stop(true,false).fadeIn();
				} 
			}
			if($("body").is(".vid") == true){
				var iframe = document.getElementById("MyVideo");	
				var player = new Vimeo.Player(iframe);
				if(s.index == 1 && b == 'up') player.play();
				else player.pause();	
			}

			//index
			if($("body").is("#index") == true){
				var Movies = document.getElementById("Movies");	
				var controller = new Vimeo.Player(Movies);
				controller.pause();

				if(n.index === (total - 2)) $(".Maps .InBox").css({"transform":"translateY(0)","opacity":"1"});
				else $(".Maps .InBox").css({"transform":"translateY(25%)","opacity":"0"});
			}
		}
	});

	//fp-arrow / fp-scroll - ADD
	$("#fp-arrow").append('<a href="#" class="fp-prev"><span class="alt">이전</span></a><a href="#" class="fp-next"><span class="alt">다음</span></a>');
	$("section .section").eq(0).append('<div id="scroll"><a href="#"><img src="images/scroll.png" alt="" width="80" height="80" /></a></div>');

	//fp-arrow - btn
	$(".fp-prev").on("click",function(){$.fn.fullpage.moveSectionUp();return false;});
	$(".fp-next").on("click",function(){$.fn.fullpage.moveSectionDown();return false;});
	$("section #scroll").on("click",function(){$.fn.fullpage.moveSectionDown();return false;});
	
	//fp-nav - last - remove
	$("#fp-nav ul li").eq($("#fp-nav ul li").length - 1).hide();
	$("#fp-nav ul li").on("click",function(){
		if($(this).index() == 0) $(".fp-prev").stop(true,false).fadeOut();
		else $(".fp-prev").stop(true,false).fadeIn();
	});

}