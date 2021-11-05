<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c" %>
<!-- Header -->
<header id="headerwrap" class="dark-wrapper backstretched special-max-height no-overlay">
    <div class="container vertical-center">
        <div class="intro-text vertical-center text-left smoothie">
        
        <c:if test="${not empty nicknm }">
            <div class="intro-heading wow fadeIn heading-font" data-wow-delay="0.2s">${nicknm}님의 e-로운 생활</div>
        </c:if>
        <c:if test="${empty nicknm }">
        	<div class="intro-heading wow fadeIn heading-font" data-wow-delay="0.2s">THIS IS e-로운 생활</div>
        </c:if>
            <div class="intro-sub-heading wow fadeIn secondary-font" data-wow-delay="0.4s">Take a look our <span class="rotate">awesome home pages, sexy portfolio items, flexible blog examples</span></div>
        </div>
    </div>
</header>
 