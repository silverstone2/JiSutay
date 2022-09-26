<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<style>
	/* 별점 구현 */
	body{
	    background-color: #ffffff !important;
	}
	input[type=number]{
	    margin-bottom: 0 !important;
	    margin-left: 8px !important;
	    padding: 6px 8px !important;
	    font-size: 1em !important;
	    border: none !important;
	    border-radius: 4px !important;
	} 
	.rating-wrap{
		margin:1rem 8rem 0.3rem 0;
	    padding: 10px 10px 10px 0 !important;
	    display: flex !important;
	}
	.ratingWrap{
	    padding: 10px !important;
	    display: flex !important;
	}
	.rating {
	    display: flex !important;
	    align-items: center !important;
	    position: relative !important;
	}
	.selfRating {
		display: flex !important;
	    align-items: center !important;
	    position: relative !important;
	}
	/*#ff8844*/
	.starcolor{
	    fill: #ffd047 !important;
	}
	.star:last-of-type {
	    margin-right: 0 !important;
	}
	.overlay {
	    background-color: #000 !important;
	    opacity: 0.5 !important;
	    position: absolute !important;
	    top: 0 !important;
	    right: 0 !important;
	    bottom: 0 !important;
	    z-index: 1 !important;
	    transition: all 0.3s ease-in-out !important;
	}
	.selfOverlay {
	    background-color: #000 !important;
	    opacity: 0.5 !important;
	    position: absolute !important;
	    top: 0 !important;
	    right: 0 !important;
	    bottom: 0 !important;
	    z-index: 1 !important;
	    transition: all 0.3s ease-in-out !important;
	}
	@supports (mix-blend-mode: color) {
	    .overlay{
	        mix-blend-mode: color !important;
	        opacity: unset !important;
	    }
	    .selfOverlay{
	        mix-blend-mode: color !important;
	        opacity: unset !important;
	    }
	}
	
	/* 후기 헤더의 별점 이모지 스타일 */
	#headerStar {
		color: #ffd047 !important;
	}
</style>