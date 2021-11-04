<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c" %> 

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>베스트셀러</title>
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
		  
		
		
		
		$("#mygallery").on("click", "#bookClick", function(){
			event.preventDefault();
			
			$("#bookId").val($(this).data("id"));
			frm.submit();
		});
		
	});

</script>
</head>
<body>
<section>
	<div class="section-inner">
		<div class="container">
			<div class="row">
				<div class="col-sm-8">
					<div class="row">
						<div class="col-sm-12">
							<h2 class="section-heading">BEST SELLER</h2>
						</div>
						
					</div>
				 	<div id="mygallery" class="row mb50">
						<c:forEach var="book" items="${lists}">
							<div class="col-md-2">
								<div  class="hover-item mb30">
									<img height="200" src="/prj/fileUp${book.bookCoverPath}${book.bookCover}" class="img-responsive smoothie" alt="${book.bookNm}">
									<div class="overlay-item-caption smoothie"></div>
										<div class="hover-item-caption smoothie">
											<div class="vertical-center smoothie">
												<a id= "bookClick" data-id="${book.bookId}" href="#" class="smoothie btn btn-primary">${book.bookNm}</a>
											</div>
										</div>
								</div>
							</div>
						</c:forEach>
					</div>
				</div>
				<div class="col-sm-3 col-sm-offset-1" style="background-color: yellow">
				 	<h2 class="section-heading">카테고리</h2>
				</div>
			</div>
		</div>
	</div>
</section> 

	
		
<form action="bookDetail" method="post" id="frm">
	<input type="hidden" id="bookId" name="bookId" >
</form>

</body>
</html>