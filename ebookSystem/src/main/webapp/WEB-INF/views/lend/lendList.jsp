<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>대여리스트</title>	
<style type="text/css">
#bookReading:hover {
	color: red;
	background-color: yellow;
	
}

#lendCard:hover {
	background-color: #ebe8e8;
	border-style: solid;
	border-width: 1px;
}
</style>
<script type="text/javascript">
	$(function(){
		$(".bookClick").on("click", function(){
			event.preventDefault();
			$("#frm").find("#bookId").val($(this).data("bookid"));
			frm.submit();
		});
		
		$(".lendDel").on("click", function(){
			event.preventDefault();
			
			var card = $(this).closest("#card");
			
			var lendId = $(this).data("lendid");
			$.ajax({
				url : 'lendDelete' ,
				method : 'DELETE' ,
				data :  JSON.stringify({lendId : lendId}) ,
				contentType : 'application/json',
				dataType : 'json' ,
				success : function(data){
					console.log(data);
					card.remove();
				}
			});
			
		});
		
		
		$("#mainDiv").on("click", ".bookReading", function(){
			event.preventDefault();
			$("#frm").find("#bookId").val($(this).data("bookid"));
			console.log($("#frm").find("#bookId").val());
			frm.action = "bookReading";
			frm.submit();
		});
	});
</script>
</head>
<body>
<section>
	<div class="section-inner">		
		<div class="container">
			<div class="row mb-1" style="margin-left:20px;margin-bottom:50px">
				<div class="section-header" style="height:20px">
	          		<h2><img width="60px" height="60px" src="resources/img/borrowBook.png"> ${nicknm}님의 대여 LIST</h2>
	        	</div>
			</div>
			<div id="mainDiv" class="row" style="padding:5px">
				<c:forEach var="lend" items="${lends}">
					<div id="card" class="col-md-5" >
						<div id="lendCard" class="row" style="height:220px;border-style: solid;border-width: 1px;margin:2px;padding:10px">	
							<div class="col-md-7">
								<strong class="">${lend.bookPublCo} / ${lend.bookWriter}</strong>
								<h4><a href="#" class="bookClick" data-bookid="${lend.bookId}">${lend.bookNm}</a></h4>
								<h5>대여일자 : <fmt:formatDate pattern="yyyy-MM-dd"  value="${lend.lendDate}"/></h5>
								<h5>리딩횟수 : ${lend.lendHit} 번</h5>
								<br/>
								<a class="bookReading" href="#" class="stretched-link hover" data-bookid="${lend.bookId}"><i class="fa fa-hand-o-right" style="font-size:15px"></i> BOOK READING <i class="fa fa-hand-o-left" style="font-size:15px"></i></a>
								<a href="#" class="lendDel pull-right" data-lendid="${lend.lendId}" ><i class="fa fa-trash-o"></i>삭제</a>
							</div>
							<div class="col-md-5">
								<img width="140" height="200" src="${pageContext.request.contextPath}/fileUp${lend.bookCoverPath}${lend.bookCover}">
							</div>
						</div>		
					</div>
				</c:forEach>
			</div>
		</div>
	</div>
</section>
<form action="bookDetail" method="post" id="frm">
	<input type="hidden" id="bookId" name="bookId" >
</form>      
</body>
</html>