<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c" %>
<!-- Header -->
<header id="headerwrap" class="dark-wrapper backstretched special-max-height no-overlay">
    <div class="container vertical-center">
        <div class="intro-text vertical-center text-left smoothie">
        
        <c:if test="${not empty nicknm }">
            <div class="intro-heading wow fadeIn heading-font" data-wow-delay="0.2s" style="text-transform:lowercase;">${nicknm}'s 서재</div>
        </c:if>
        <c:if test="${empty nicknm }">
        	<div class="intro-heading wow fadeIn heading-font" data-wow-delay="0.2s">THIS IS e-로운 생활</div>
        </c:if>
            <div class="intro-sub-heading wow fadeIn secondary-font" data-wow-delay="0.5s"> <span class="rotate">The world belongs to those who read, Today a reader tomorrow a leader, reading is dreaming with your eyes open</span></div>
        </div>
    </div>
</header>
 