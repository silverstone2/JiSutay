//userAgent Check
const dataUser = document.documentElement;
dataUser.className = dataUser.className.replace('no-js','js');
dataUser.setAttribute("data-useragent",  navigator.userAgent);
dataUser.setAttribute("data-platform", navigator.platform );

//None Mouse Rgiht click
$(document).bind("contextmenu",function(e){return false;});
$(document).bind("ondragstart",function(e){return false;});
$(document).bind("onselectstart",function(e){return false;}); 

/* ------------------------------------------------------------------------------- */
/* 실시간예약 - account */
let account = "sorangje";

/* 실시간예약 - Type */
let type = "N";

/* 영상 - Url */
let url = "http://gonylab6.speedgabia.com/fullstay/sorangje";
let vid = [''];
let farmNum = [
	'안덕-2019-11호', //+ 소랑제 오름 
	'안덕-2018-49호', //+ 소랑제 자미
	'안덕-2019-15호', //+ 소랑제 바람
	'안덕-2018-26호', //+ 소랑제 해바르
	'안덕-2020-35호', //+ 소랑제 마농
	'안덕-2017-74호', //+ 소랑제 돌담
	'안덕-2019-28호', //+ 소랑제 밤별
	'안덕-2017-52호' //+ 소랑제 달빛
];

/* 이미지 - Number */
let img = [
	//index
	[16],
	//exterior
	[11],
	//room
	[
		17, 14, 13, 18,
		15, 14, 19, 12,
	],
	//special
	[6, 4, 8, 3, 4],
];


/* ------------------------------------------------------------------------------- */
/* SNS */
let	INTRAGRAM = "#";				
let	FACEBOOK = "#";
let	NV_BLOG = "https://blog.naver.com/fullstay";
let	NV_CAFE = "#";
let	KAKAO = "#";