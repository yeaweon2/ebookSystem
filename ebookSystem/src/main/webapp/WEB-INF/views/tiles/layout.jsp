<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>   
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c" %>  
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<style>
	#st {
	  border:1px solid LightGoldenRodYellow;
	  background-color:black;
	  text-align: center; 
	  width:120px;
	  padding-top:15px;
	  
	}

	#p {
		color : Moccasin;
		
	}
	
	#n { 
		font-weight: bolder;
		text-align: center; 
		font-size: x-large; 
	}
	
	#proimg1{
		border-radius:400px; 
		width:130px; 
		height:130px;
	}
</style>	
    <meta charset="utf-8">
    <!--[if IE]><meta http-equiv='X-UA-Compatible' content='IE=edge,chrome=1'><![endif]-->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="shortcut icon" href="resources/assets/img/ico/favicon.ico">
    <link rel="apple-touch-icon" sizes="144x144" href="resources/assets/img/ico/apple-touch-icon-144x144.png">
    <link rel="apple-touch-icon" sizes="114x114" href="resources/assets/img/ico/apple-touch-icon-114x114.png">
    <link rel="apple-touch-icon" sizes="72x72" href="resources/assets/img/ico/apple-touch-icon-72x72.png">
    <link rel="apple-touch-icon" href="resources/assets/img/ico/apple-touch-icon-57x57.png">

    <title>e로운생활</title>
	
	<!--  -->
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>

    <!-- Bootstrap Core CSS -->
    <link href="resources/assets/css/bootstrap.min.css" rel="stylesheet">
    <link href="resources/assets/css/animate.css" rel="stylesheet">
    <link href="resources/assets/css/plugins.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="resources/assets/css/style.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="resources/assets/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <link href="resources/assets/css/pe-icons.css" rel="stylesheet">
    <link href="resources/assets/css/style.css" rel="stylesheet">


    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link href="resources/css/ebook.css?after" rel="stylesheet">
    <script src="resources/assets/js/jquery.js"></script>
    <script src="resources/js/json.min.js"></script>
 	<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
	<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>   
</head>
<body id="page-top" class="index">

    <div class="master-wrapper">

        <div class="preloader">
            <div class="preloader-img">
                <span class="loading-animation animate-flicker"><img src="resources/assets/img/loading.GIF" alt="loading"/></span>
            </div>
        </div>
	<tiles:insertAttribute name="menu"/>
	<tiles:insertAttribute name="header"/>
	<tiles:insertAttribute name="body"/>
	<tiles:insertAttribute name="footer"/>
	
 	</div>
<!-- 	<div id="adviceChat">
		<img src="resources/img/chat2.png" class="avatar pointer">
	</div> -->
    <div class="flexpanel">
        <div class="viewport-wrap">
            <div class="viewport">
                <div class="widget mb50">
                    <h4 class="widget-title">My Info</h4>
                    <div align="center">
                        <c:if test="${empty memf}">
							<img id="proimg1" src="resources/assets/img/noimg.jpg" >&nbsp;&nbsp;
						</c:if>
						<c:if test="${not empty memf}">
							<img id="proimg1" src="${pageContext.request.contextPath}/fileUp/profile/${memfn}" >&nbsp;&nbsp;
						</c:if>
                    </div><br>
                    <div align="center">
                       <p id="n">${nicknm} 님</p>
                       <label>${flNm}</label>
                    </div>
					<div align="center" ><br>
						<table>
							<tr id="st"> 
								<th id="st" onclick="location.href='myInfo'" class="pointer" style="padding-top:0px;">내정보보기</th>
								<c:if test="${auth eq 'U'}">
								<th id="st">월정액종료일<p id="p"><fmt:formatDate pattern="yyyy-MM-dd"  value="${sube}" /></p></th>
								<th id="st">마일리지<p id="p">${mile} p</p></th>
								</c:if>
								<c:if test="${auth eq 'M'}">
								<th id="st">계약만료일자<p id="p"><fmt:formatDate pattern="yyyy-MM-dd"  value="${mcnEd }" /></p></th>
								</c:if>
							</tr>						
                   		</table>
                   	</div>
                   	<c:if test="${auth eq 'A' }">
                    <div align="left" style="margin-top: 50px" >
                   		<h4><b>Today 회원가입 : ${todayRegCnt } 명 </b></h4>
                    </div>
                    <div align="left" >
                   		<b>일반 회원수 : ${userCnt } 명 </b>
                    </div>
                     <div align="left" >
                   		<b>매니저 회원수 : ${managerCnt } 명 </b>
                    </div>
                    <div align="left" >
                   		<b>관리자 회원수 : ${adminCnt } 명 </b>
                    </div>
		            <div align="left" style="margin-top: 50px" >
                   		<h4><b>Today 1:1 문의사항 : ${todayQustCnt } 건</b></h4>
                    </div> 
                    <div align="left" >
                   		<h4><b>Today 공지사항 : ${todayNotiCnt } 건</b></h4>
                    </div>       	
                    <div align="left" >
                   		<h4><b>Today 댓글 : ${todayRepCnt } 건</b></h4>
                    </div> 
                    <div align="left" >
                   		<b>전체 게시글 : ${comunityCnt } 건 </b>
                    </div>   
		                     	
                     </c:if>
                </div>
            </div>
        </div>
    </div>
    
    <script src="resources/assets/js/bootstrap.min.js"></script>
    <script src="resources/assets/js/plugins.js"></script>
    <script src="resources/assets/js/init.js"></script>       

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

    <script type="text/javascript">
    $(document).ready(function() {
        'use strict';
        if( `${auth}` == 'A' ){
        	jQuery('#headerwrap').backstretch([
        		"resources/assets/img/bg/bg0rr.png",
                "resources/assets/img/bg/bg1rr.png",
                "resources/assets/img/bg/bg2rr.png"
            ], {
                duration: 8000,
                fade: 500
            });
        }else if( `${auth}` == 'M' ){
        	jQuery('#headerwrap').backstretch([
        		"resources/assets/img/bg/bg0yy.png",
                "resources/assets/img/bg/bg1yy.png",
                "resources/assets/img/bg/bg2yy.png"
            ], {
                duration: 8000,
                fade: 500
            });
        }else{
        	jQuery('#headerwrap').backstretch([
                "resources/assets/img/bg/bg0p.png",
                "resources/assets/img/bg/bg1p.png",
                "resources/assets/img/bg/bg2p.png"
            ], {
                duration: 8000,
                fade: 500
            });
        }
    });
    </script>

</body>

</html>