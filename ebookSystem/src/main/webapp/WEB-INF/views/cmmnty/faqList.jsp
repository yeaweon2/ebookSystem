<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.accordion {
	margin-block-start: 1em;
	margin-block-end: 1em;
	margin-inline-start: 0px;
	margin-inline-end: 0px;
	border-radius: 12px;
	background-color: #eee;
	
	margin-right: 33px;
    font-weight: 600;
    font-size: 18px;
    line-height: 24px;
    letter-spacing: -.6px;
    color: #242424;

	cursor: pointer;
	padding: 18px;
	width: 800px;
	border: none;
	text-align: left;
	outline: none;
	transition: 0.4s;
}

.active, .accordion:hover {
	background-color: #B2CCFF;
}

.panel {
    margin-block-start: 1em;
    margin-block-end: 1em;
    margin-inline-start: 0px;
    margin-inline-end: 0px;

	display: none;
	background-color: white;
	overflow: hidden;
	width: 800px;
	
	line-height: 24px;
    letter-spacing: -.6px;
    color: #555;
    padding-top: 5px;
    font-size: 16px;
}
}
}
</style>
</head>
<body>
	<div class="inner-page pt-6">
		<div class="container">
			<div class="row mb-1" style="margin-top: 40px">
				<div class="section-header">
					<h2>자주 묻는 질문</h2>
					<br> <br>
				</div>
			</div>
			<c:forEach var="faq" items="${faqs }">
				<button class="accordion" id="btnImg" onclick="imgUp()">${faq.cmmntyTitle}<i class="fa fa-angle-down pull-right" aria-hidden="true"></i>
					<c:if test="${id eq 'admin'}">
						<input type="button" onclick="BoardEdit('U')"
							class="btn-primary pull-right" value="수정">
						<input type="button" onclick="BoardEdit('D')"
							class="btn-danger pull-right" value="삭제">
					</c:if>
				</button>
				<div class="panel">
					<p>${faq.cmmntyContents}</p>
				</div>
			</c:forEach>

			<c:if test="${id eq 'admin'}">
				<hr>
				<button type="button" onclick="location.href='faqsertForm'"class="btn-primary">글쓰기</button>

			</c:if>
		</div>
	</div>
	<script>
		function imgUp(){
			event.stopPropagation();
			var a =$(event.target)
			if(a.find(".fa-angle-up").length > 0){
				a.find(".fa-angle-up").addClass("fa-angle-down");
				a.find(".fa-angle-up").removeClass("fa-angle-up");
			}else {
				a.find(".fa-angle-down").addClass("fa-angle-up");
				a.find(".fa-angle-down").removeClass("fa-angle-down");
			} 
			//a.find("i").attr("class", "fa fa-angle-up pull-right");
			console.log(a);
		}
		
		var acc = document.getElementsByClassName("accordion");
		var i;

		for (i = 0; i < acc.length; i++) {
			acc[i].addEventListener("click", function() {
				this.classList.toggle("active");
				var panel = this.nextElementSibling;
				if (panel.style.display === "block") {
					panel.style.display = "none";
				} else {
					panel.style.display = "block";
				}
			});
		}
	</script>

</body>
</html>