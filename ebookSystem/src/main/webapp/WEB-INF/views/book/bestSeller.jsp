<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c" %> 

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>베스트셀러</title>
<link rel="stylesheet" href="resources/just/justifiedGallery.css" />
<script src="resources/just/jquery.justifiedGallery.js"></script>
<style type="text/css">
#bookNm {
	font-weight: bold;
}

img {
	margin : 5px;
}

</style>
<script type="text/javascript">

	$(function(){
		$(".column").on("click", function(){
			$("#bookId").val($(this).find("#bookKey").val());
			frm.submit();
		});   
		  
		$("#mygallery").justifiedGallery();
		
		
		$("#mygallery").on("click", "#bookClick", function(){
			event.preventDefault();
			
			$("#bookId").val($(this).data("id"));
			frm.submit();
		});
		
	});

</script>
</head>
<body>
 <body>
		<div class="main">
			<h1>Best Seller</h1>
			<div id="mygallery" >
			<c:forEach var="book" items="${lists}">
			    <a id= "bookClick" href="#" data-id="${book.bookId}">
			        <img alt="${book.bookNm}" src="/prj/fileUp${book.bookCoverPath}${book.bookCover}"/>
			    </a>
			    </c:forEach>
			</div>
		</div><!--/main-->
<form action="bookDetail" method="post" id="frm">
	<input type="hidden" id="bookId" name="bookId" >
</form>
</body>
</html>