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

.ac_panel {
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

/* The Modal (background) */
.modal {
  display: none; /* Hidden by default */
  position: fixed; /* Stay in place */
  z-index: 1; /* Sit on top */
  padding-top: 100px; /* Location of the box */
  left: 0;
  top: 0;
  width: 100%; /* Full width */
  height: 100%; /* Full height */
  overflow: auto; /* Enable scroll if needed */
  background-color: rgb(0,0,0); /* Fallback color */
  background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
}

/* Modal Content */
.modal-content {
  background-color: #fefefe;
  margin: auto;
  padding: 20px;
  border: 1px solid #888;
  width: 800px;
}

/* The Close Button */
.close {
  color: #aaaaaa;
  float: right;
  font-size: 28px;
  font-weight: bold;
}

.close:hover,
.close:focus {
  color: #000;
  text-decoration: none;
  cursor: pointer;
}
</style>
  <link href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
<script>
 $(function(){
	//FAQ수정
	var modal = document.getElementById("myModal");
	var span = document.getElementsByClassName("close")[0];
	
	$(".myBtn").on("click", function(){
		 modal.style.display = "block";
		 
		 var faq = $(this).closest(".faq");
		 $("#cmmntyTitle").val(faq.find("#title").html());
		 $("#summernote").val(faq.find(".ac_panel").html());
		 $("#cmmntyId").val($(this).data("id"));
		 $("#cmmntyWriter").val($(this).data("writer"));
		 //썸머노트높이
	 	 $('.summernote').summernote({
			 height: 300
	 	}); 
	})
	
	span.onclick = function() {
	 	 modal.style.display = "none";
	}
	window.onclick = function(event) {
	 	 if (event.target == modal) {
		   modal.style.display = "none";
	    }
	}
	
	//FAQ글쓰기
	var modal = document.getElementById("myModal");
	var span = document.getElementsByClassName("close")[0];
	
	$(".faqInsert").on("click", function(){
		 modal.style.display = "block";
		 
		 $("#cmmntyTitle").val();
		 $("#summernote").val();
		 $("#cmmntyWriter").val("${sessionScope.id}");
		 $('.summernote').summernote({
			 height: 300
	 	}); 
		 
	$("#frm").attr("action", "faqInsert");
	});
	
	//FAQ삭제
	$(".faqDelete").on("click", function(){
		var a = $(this).data("id");
        location.href="${pageContext.request.contextPath}/faqDelete?cmmntyId="+a
	});
	
 })

</script>
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
			<div class="faq">
				<div class="accordion" id="btnImg" onclick="imgUp()"><span id="title">${faq.cmmntyTitle}</span><i class="fa fa-angle-down pull-right" aria-hidden="true"></i>
					<c:if test="${id eq 'admin'}">						
						<!-- Trigger/Open The Modal -->
						<button class="myBtn pull-right btn-primary" data-id="${faq.cmmntyId}" data-writer="${faq.cmmntyWriter}">수정</button>
						<button class="faqDelete btn-danger pull-right" data-id="${faq.cmmntyId}">삭제</button>
					</c:if>
				</div>
				<div class="ac_panel">${faq.cmmntyContents}</div>
			</div>
			</c:forEach>

			<c:if test="${id eq 'admin'}">
				<hr>
				<button type="button" class="faqInsert btn-primary"> 글쓰기</button>
			</c:if>
		</div>
	</div>
	
	
	<!-- The Modal -->
	<div id="myModal" class="modal">
		<!-- Modal content -->
		<div class="modal-content">
			 <span class="close">&times;</span>
			 <form id="frm" name="frm" action="faqUpdate" method="post">
				<div>
					<label for="title">제목</label>
					<input type="text" class="form-control" name="cmmntyTitle" id="cmmntyTitle" placeholder="제목을 입력해 주세요" >
				</div>
				<div>
					<label for="reg_id">작성자</label>	
					<input type="text" class="form-control" name="cmmntyWriter" id="cmmntyWriter"  readonly="readonly" >
				</div>
				<div>
					<label for="content">내용</label>
					<textarea name="cmmntyContents" id="summernote" class="summernote" placeholder="내용을 입력해 주세요" ></textarea>
				</div>
					
				<input type="submit" value="등록" class="btn-primary">
				<input type="button" onclick="location.href='faqList'" value="취소" class="btn-danger">
				<input type="hidden" name="cmmntyId" id="cmmntyId" value="${feq.cmmntyId}">
			</form>
				</div>
		</div>
	<script>
		//제목 이미지(^)반전
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