<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BOOK READING</title>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jszip/3.1.5/jszip.min.js"></script>
</head>
<body>
<section>
	<div class="section-inner">		
		<div class="container">
			<div class="row box">
				<div class="row">
					<div class="col-sm-3">
						<img width="140" height="200" src="${pageContext.request.contextPath}/fileUp${lend.bookCoverPath}${lend.bookCover}">
					</div>
					<div class="col-sm-9">
						<div class="row">
							<h3>${lend.bookNm}</h3>
							<h4>${lend.bookPublCo}(${lend.bookWriter})</h4>
							<span>${lend.bookIntro}</span>
						</div>
						<div class="row">
							<div id="area"></div>
						</div>
					</div>
				</div>
				
			</div>
			
			
		</div>
	</div>
</section>
<script src="resources/epub/epub.min.js"></script>
<script>
  var book = ePub("url/to/book/package.opf");
  var rendition = book.renderTo("area", {width: 600, height: 400});
  var displayed = rendition.display();
  
  book.renderTo("area", { method: "default", width: "100%", height: "100%" });
  
  
  var rendition = book.renderTo("area", {
	    width: 600,
	    height: 400,
	    allowScriptedContent: true
	  });
</script>
</body>
</html>