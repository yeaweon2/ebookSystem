<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>버킷BOOK</title>
<style type="text/css">

.line {
 	boder-bottom:2px solid red;
}
</style>
</head>
<body>


		
<h2 class="title text-center">버킷북 등록</h2>
<div class="media commnets">
	
	<table class="line"> 	
		<tr class="line">
			<td><i style="font-size:60px" class="fa">&#xf002;</i></td>
			<td class="line"></td>	
		</tr>
	</table>
</div>

<h2 class="title text-center">버킷북 목록</h2>
<c:forEach var="bucket" items="${lists}">
	<div class="media commnets">
		<a class="pull-left" href="#">
		<img class="media-object" height="210" width="160" src="/prj/fileUp${bucket.bookCoverPath}${bucket.bookCover}" alt="">
		</a>
		<div class="media-body">
			<h4 class="media-heading">${bucket.bookNm}</h4>
			<h5>${bucket.bookPublCo} / ${bucket.bookWriter}</h5>
			<p>${bucket.bookIntro}</p>
			<div class="blog-socials">
				<ul>
					<li><a href=""><i class="fa fa-facebook"></i></a></li>
					<li><a href=""><i class="fa fa-twitter"></i></a></li>
					<li><a href=""><i class="fa fa-dribbble"></i></a></li>
					<li><a href=""><i class="fa fa-google-plus"></i></a></li>
				</ul>
				<a class="btn btn-primary" href="">Other Posts</a>
			</div>
		</div>
		
	</div><!--Comments-->
</c:forEach>

</body>
</html>