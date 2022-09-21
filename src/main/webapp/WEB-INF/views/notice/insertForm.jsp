<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/views/notice/insertForm.jsp</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
<style>
	
	.container{
	margin-left: 33%;
	margin-right: 33%;
	}
	
	.insertTable {
		width:575px;
		border-right:none;
		border-left:none;
		border-top:none;
		border-bottom:none;
		
	}
	#insertForm{
		margin-top:10%;
	}
	.buttonEffect{
   		/* border-width: 1px 1px 1px 1px; */
		border-style: thin;
		border-color: pink; 
	}
	.form-control {
		font-size: 30px;
		border:0px;
	}
}
</style>
</head>
<body>
<div class="container">
	<form action="insert.do" method="post" id="insertForm">
		<div class="insertTable input-group mb-3" >
			<!-- <label for="title" style="width:40px; margin-top:5px ">제   목</label> -->
			<input type="text" name="title" id="title" class="form-control" placeholder="제목을 적으세요." 
			aria-label="Username" aria-describedby="basic-addon2" style="width:500px; border-radius: 10px 10px 10px 10px;">
		</div>
		<div class="insertTable">
			<label for="content" style="display:none">내용</label>
			<textarea name="<content></content>" id="content" cols="30" rows="10"></textarea>
		</div>
		<div style="text-align:center; width:575px;">
			<button type="button" onclick="location.href='list.do'" >취소</button>
			<button type="submit" >저장</button>
		</div>
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