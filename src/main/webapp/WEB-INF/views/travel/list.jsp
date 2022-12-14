<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JISUTAY - Travel</title>

<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/css/common.css">

<link rel="shorcut icon" href="${pageContext.request.contextPath }/resources/Jisutayimage/Logo_Icon/favicon.ico">

<!-- 폰트 적용 -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&family=Shadows+Into+Light&family=Zilla+Slab:wght@500&display=swap" rel="stylesheet">

<script type="text/javascript" async="" src="https://www.google-analytics.com/analytics.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.1/jquery.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/common.js"></script>
<style>
   *{
      margin: 0px;
      padding: 0px;
   }
   .frame{
      width: 100%;
      height: 100%;
   }
   ul{
      text-align: center;
      list-style:none;
   }
   .grid{
      margin-top: 100px;
      display: grid;
      grid-template-columns: 1fr 1fr;
      justify-items: start;
      grid-gap: 5px;
   }
   .contentMapping:nth-child(odd){
      justify-self:end;
   }
   .contentMapping{
      margin-bottom: 100px;
   }
   .img{
      width: 600px;
      height: 400px;
   }
   .img2{
      margin-left:35px;
      width: 300px;
      height: 300px;
   }
   strong {
   font-size: 2em;
   }
   a {
   text-decoration-line: none;
   }
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
   .ct img{
   width: 600px;
   height: 400px;
   }
</style>

</head>
<body>
<jsp:include page="/resources/include/navbar.jsp"></jsp:include>
<div class="container">
<div class="lb-wrap">
   <div class="lb-text">
      <p style="font-family: 'Zilla Slab', serif;">TRAVEL</p><br/>
   </div>
   <div class="lb-text2">
      <br>
      <br>
      <p style="font-family: 'Gowun Dodum', sans-serif;">주변 여행지</p>
   </div>
   <div class="lb-image">
      <video muted autoplay loop>
            <source src="${pageContext.request.contextPath}/resources/video/travel.mp4" type="video/mp4">
       </video>
   </div>
</div>
   <div class="section contents">
      <ul>
         <div class="grid">
            <c:forEach var="tmp" items="${list }" >
               <div class="contentMapping">
                  <li class="ct">
                     <div class="img">
                        <img src="${pageContext.request.contextPath }${tmp.imgPath}" height="auto" alt="">
                     </div>
                     <div><br><br></div>
                     <div class="txt">
                        <h4>
                           <strong style="font-family: 'Gowun Dodum', sans-serif;font-weight:bold;">${tmp.title }</strong>
                           <span>&nbsp;|&nbsp; 지수테이에서 약 ${tmp.distance } 소요</span>
                           <pre><br>${tmp.caption }</pre>
                        </h4>
                     </div>
                  <c:if test="${sessionScope.id eq 'admin' }">
                     <div class="btn" style="margin-top:20px;">
                        <a href="${pageContext.request.contextPath }/travel/updateform.do?num=${tmp.num }" style="margin-right:10px;">
                           <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="black" class="bi bi-pencil" viewBox="0 0 16 16">
                                <path d="M12.146.146a.5.5 0 0 1 .708 0l3 3a.5.5 0 0 1 0 .708l-10 10a.5.5 0 0 1-.168.11l-5 2a.5.5 0 0 1-.65-.65l2-5a.5.5 0 0 1 .11-.168l10-10zM11.207 2.5 13.5 4.793 14.793 3.5 12.5 1.207 11.207 2.5zm1.586 3L10.5 3.207 4 9.707V10h.5a.5.5 0 0 1 .5.5v.5h.5a.5.5 0 0 1 .5.5v.5h.293l6.5-6.5zm-9.761 5.175-.106.106-1.528 3.821 3.821-1.528.106-.106A.5.5 0 0 1 5 12.5V12h-.5a.5.5 0 0 1-.5-.5V11h-.5a.5.5 0 0 1-.468-.325z"/>
                           </svg>
                        </a>
                        <a href="${pageContext.request.contextPath }/travel/delete.do?num=${tmp.num }" style="margin-left:10px;">
                           <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="black" class="bi bi-trash" viewBox="0 0 16 16">
                                <path d="M5.5 5.5A.5.5 0 0 1 6 6v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm2.5 0a.5.5 0 0 1 .5.5v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm3 .5a.5.5 0 0 0-1 0v6a.5.5 0 0 0 1 0V6z"/>
                                <path fill-rule="evenodd" d="M14.5 3a1 1 0 0 1-1 1H13v9a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2V4h-.5a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1H6a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1h3.5a1 1 0 0 1 1 1v1zM4.118 4 4 4.059V13a1 1 0 0 0 1 1h6a1 1 0 0 0 1-1V4.059L11.882 4H4.118zM2.5 3V2h11v1h-11z"/>
                           </svg>
                        </a>
                     </div>
                  </c:if>
               </li>
            </div>
         </c:forEach>
         <c:if test="${sessionScope.id eq 'admin' }">
            <div class="contentMapping">
               <li>
                  <div class="img">
                     <a href="${pageContext.request.contextPath }/travel/uploadform.do">
                        <img src="${pageContext.request.contextPath}/resources/Jisutayimage/Logo_Icon/plus.png" style="height:100%;opacity:0.2;">
                     </a>
                  </div>
                  <div> </div>
                  <div class="txt">
                     <h1 style="margin:20px">관광지 추가하기</h1>
                  </div>
               </li>
            </div>
         </c:if>            
         </div>
      </ul>
   </div>
</div>
<!-- footer include -->
<jsp:include page="/resources/include/footer.jsp"></jsp:include>
</body>
</html>