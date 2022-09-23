<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="canonical" href="https://getbootstrap.com/docs/5.2/examples/headers/">

<link href="/docs/5.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx" crossorigin="anonymous">

<link rel="apple-touch-icon" href="/docs/5.2/assets/img/favicons/apple-touch-icon.png" sizes="180x180">
<link rel="icon" href="/docs/5.2/assets/img/favicons/favicon-32x32.png" sizes="32x32" type="image/png">
<link rel="icon" href="/docs/5.2/assets/img/favicons/favicon-16x16.png" sizes="16x16" type="image/png">
<link rel="manifest" href="/docs/5.2/assets/img/favicons/manifest.json">
<link rel="mask-icon" href="/docs/5.2/assets/img/favicons/safari-pinned-tab.svg" color="#712cf9">
<link rel="icon" href="/docs/5.2/assets/img/favicons/favicon.ico">
<meta name="theme-color" content="#712cf9">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx" crossorigin="anonymous">
<link
    rel="stylesheet"
    href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css"
/>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<style>
	.bd-placeholder-img {
	  font-size: 1.125rem;
	  text-anchor: middle;
	  -webkit-user-select: none;
	  -moz-user-select: none;
	  user-select: none;
	}
	
	@media (min-width: 768px) {
	  .bd-placeholder-img-lg {
	    font-size: 3.5rem;
	  }
	}
	
	.b-example-divider {
	  height: 3rem;
	  background-color: rgba(0, 0, 0, .1);
	  border: solid rgba(0, 0, 0, .15);
	  border-width: 1px 0;
	  box-shadow: inset 0 .5em 1.5em rgba(0, 0, 0, .1), inset 0 .125em .5em rgba(0, 0, 0, .15);
	}
	
	.b-example-vr {
	  flex-shrink: 0;
	  width: 1.5rem;
	  height: 100vh;
	}
	
	.bi {
	  vertical-align: -.125em;
	  fill: currentColor;
	}
	
	.nav-scroller {
	  position: relative;
	  z-index: 2;
	  height: 2.75rem;
	  overflow-y: hidden;
	}
	
	.nav-scroller .nav {
	  display: flex;
	  flex-wrap: nowrap;
	  padding-bottom: 1rem;
	  margin-top: -1px;
	  overflow-x: auto;
	  text-align: center;
	  white-space: nowrap;
	  -webkit-overflow-scrolling: touch;
	}
	
	.sidebar .nav-link {
	  font-weight: 500;
	  color: #333;
	}
	
	.sidebar .nav-link .feather {
	  margin-right: 4px;
	  color: #727272;
	}
	
	.sidebar .nav-link.active {
	  color: #2470dc;
	}
	
	#profileATag {
		color: #b4b4b4;
	}
	
	#profileATag:hover {
		color: #828282;
	}
	
	#profileImage{
		width: 100px;
		height: 100px;
		border: 1px solid #cecece;
		border-radius: 50%;
	}
	
	#lockImg{
		width: 24px;
		height: 24px;
	}
	
	#mainImg{
		width: 34px;
		height: 34px;
	}
	
	#navProfileImg1{
		width: 24px;
		height: 24px;
		border: 1px solid #cecece;
		border-radius: 50%;
	}
	
	#navProfileImg2{
		width: 34px;
		height: 34px;
		border: 1px solid #cecece;
		border-radius: 50%;
	}
</style>