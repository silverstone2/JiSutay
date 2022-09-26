<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/views/notice/insertForm.jsp</title>
<link rel="shortcut icon" href="${pageContext.request.contextPath }/Jisutayimage/Logo_Icon/favicon.ico">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
<style>
	
	.container{
	margin-left: 20%;
	margin-right: 20%;
	}
	
/* 	.insertTable {
		width:768px;
		border-right:none;
		border-left:none;
		border-top:none;
		border-bottom:none;
		
	} */
	#insertForm{
		width:995px;
		border-right:none;
		border-left:none;
		border-top:none;
		border-bottom:none;
		
		margin-top:5%;
	}

	.buttonEffect {
		margin-left: 36%;
		margin-right: 36%;
		width:250px;
		height: 50px;
		text-align:center;
		vertical-align: baseline;
		background-color:#E0E0E0;
		margin-top: 10px;
		padding: 10px 0 10px;
		font-size: 15px;
	}
	.buttonEffect > a{
		text-decoration: none;
		color: #808080;
	}
	.buttonA{
		/* background-color:rgba(0,0,0,0); */
		border:0;
		outline:0;
	}
	.form-control{
		font-size:20px;
	}
 	h1 {
		width:1000px;
        text-align:center;
        margin-top:3%;
	}
}
</style>
</head>
<body>
<div class="container">
	<h1>새 글</h1>
	<form action="insert.do" method="post" id="insertForm">
		<div class="insertTable " >
			<!-- <p style="width:50px; margin-top:10px; font-size:20px;">제   목</p>  -->
			<input type="text" name="title" id="title" class="form-control" placeholder="제목..." style="margin-bottom:3%">
		</div>
		<div class="insertTable">
			<label for="content" style="display:none">내용</label>
			<textarea name="content" id="content" cols="130" rows="25"></textarea>
		</div>
		<button type="button" class="buttonA buttonEffect" onclick="location.href='list.do'">취소</button>		
		<button type="submit" class="buttonA buttonEffect">저장</button>
	</form>
</div>

<!-- SmartEditor 에서 필요한 javascript 로딩 시작 -->
<script src="${pageContext.request.contextPath }/SmartEditor/js/HuskyEZCreator.js"></script>
<script>
	var oEditors = [];
	
	//추가 글꼴 목록
	//var aAdditionalFontSet = [["MS UI Gothic", "MS UI Gothic"], ["Comic Sans MS", "Comic Sans MS"],["TEST","TEST"]];
	
	nhn.husky.EZCreator.createInIFrame({
		oAppRef: oEditors,
		elPlaceHolder: "content",
		sSkinURI: "${pageContext.request.contextPath}/SmartEditor/SmartEditor2Skin.html",	
		htParams : {
			bUseToolbar : true,				// 툴바 사용 여부 (true:사용/ false:사용하지 않음)
			bUseVerticalResizer : true,		// 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음)
			bUseModeChanger : true,			// 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음)
			//aAdditionalFontList : aAdditionalFontSet,		// 추가 글꼴 목록
			fOnBeforeUnload : function(){
				//alert("완료!");
			}
		}, //boolean
		fOnAppLoad : function(){
			//예제 코드
			//oEditors.getById["ir1"].exec("PASTE_HTML", ["로딩이 완료된 후에 본문에 삽입되는 text입니다."]);
		},
		fCreator: "createSEditor2"
	});
	
	function pasteHTML() {
		var sHTML = "<span style='color:#FF0000;'>이미지도 같은 방식으로 삽입합니다.<\/span>";
		oEditors.getById["content"].exec("PASTE_HTML", [sHTML]);
	}
	
	function showHTML() {
		var sHTML = oEditors.getById["content"].getIR();
		alert(sHTML);
	}
	
	
	function setDefaultFont() {
		var sDefaultFont = '궁서';
		var nFontSize = 24;
		oEditors.getById["content"].setDefaultFont(sDefaultFont, nFontSize);
	}
	
	//폼에 submit 이벤트가 일어났을때 실행할 함수 등록
	document.querySelector("#insertForm").addEventListener("submit", function(e){
		
		//에디터에 입력한 내용이 textarea 의 value 값이 될수 있도록 변환한다. 
		oEditors.getById["content"].exec("UPDATE_CONTENTS_FIELD", []);
		
		//textarea 이외에 입력한 내용을 여기서 검증하고 
		const title=document.querySelector("#title").value;
		
		//만일 폼 제출을 막고 싶으면  
		//e.preventDefault();
		//을 수행하게 해서 폼 제출을 막아준다.
		if(title.length < 5){
			alert("제목을 5글자 이상 입력하세요!");
			e.preventDefault();
		}	
	});
</script>
<!-- SmartEditor 에서 필요한 javascript 로딩 끝 -->
</body>
</html>