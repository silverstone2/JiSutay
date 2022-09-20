<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<style>
	/* 별점 구현 */
	body{
	    background-color: #ffffff;
	}
	input[type=number]{
	    margin-bottom: 0;
	    margin-left: 8px;
	    padding: 6px 8px;
	    font-size: 1em;
	    border: none;
	    border-radius: 4px;
	}
	.rating-wrap{
	    padding: 10px;
	    display: flex;
	}
	.rating {
	    display: flex;
	    align-items: center;
	    position: relative;
	}
	.starcolor{
	    fill: #ff8844;
	}
	.star:last-of-type {
	    margin-right: 0;
	}
	.overlay {
	    background-color: #000;
	    opacity: 0.5;
	    position: absolute;
	    top: 0;
	    right: 0;
	    bottom: 0;
	    z-index: 1;
	    transition: all 0.3s ease-in-out;
	}
	@supports (mix-blend-mode: color) {
	    .overlay{
	        mix-blend-mode: color;
	        opacity: unset;
	    }
	}
</style>