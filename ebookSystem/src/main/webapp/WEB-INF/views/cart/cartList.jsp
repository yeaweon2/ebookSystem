<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BOOK 카트</title>
<link rel="canonical" href="https://getbootstrap.com/docs/5.1/examples/modals/">
<style type="text/css">
.pointer {
	cursor: pointer;
}

.removeBtn , .bucketBtn {
	background-color: #0c2e8a;
	border: none;
	color: white;
	padding: 10px 14px;
	font-size: 18px;
	cursor: pointer;
	border-radius: 50%;
}


.removeBtn i , .bucketBtn i {
	color: white;
}

.bucketBtn:hover {
	opacity: 0.6;
  	background-color: red;
}

.removeBtn:hover {
	opacity: 0.6;
  	background-color: #50d8af;
}
</style>
<script type="text/javascript">
	$(function(){
		
		// 카트에서 book 삭제
		function itemDel(id){
			event.preventDefault();
			$("#itemDel").css("display", "block");
		}

		$("#closeBtn").on("click", function(){
			$("#modalChoice").css("display", "none");
		});
		
		// 선택삭제
		$("#chkDelBtn").on("click", function(){
			
			var books = [];
			$("#cartTbody").find("#chkInput:checked").each(function(){
				   
				var bookId = $(this).closest("tr").data("bookid");
				
				var data = {
						bookId : bookId
					};
				
				if( data != "" ){
					books.push(data);	
				}
			});
			
			 $.ajax({
				url : 'cartDelete' ,
				data :  JSON.stringify(books) ,
				contentType : 'application/json',
				method : 'DELETE' ,
				dataType : 'json' ,
				success : function(data){
					console.log(data);
					cartList();
				}
			});  
		});
		
		$("#cartDelete").on("click", function(){
			var bookId = $(this).closest("tr").data("bookid");
			$.ajax({
				url : 'cartDelete' ,
				method : 'DELETE' ,
				data :  JSON.stringify({bookId : bookId}) ,
				contentType : 'application/json',
				dataType : 'json' ,
				success : function(data){
					console.log(data);
				}
			});
		});
		
		$("#cartTbody").on("click", "tr" ,function(){
			event.stopPropagation();
			console.log($(this));
			$("#frm").find("#bookId").val($(this).data("bookid"));
			frm.submit();
		});
		
		
		
		function cartList(){
			
			$.ajax({
				url : 'cartRestList' ,
				method : 'GET' ,
				contentType : 'application/json',
				dataType : 'json' ,
				success : function(data){
					console.log(data);
					$("#cartTbody").empty();
					
					$.each(data,function(idx,item){
						$("#cartTbody")
						.append($("<tr class='pointer'>")
									.append($("<td>").append( $("<input id='chkInput' type='checkbox'>")))
									.append($("<td>").html(item.insDt))
									.append($("<td>").append( $("<img>") ).html(item.bookNm))
									.append($("<td>").append( $("<button class='bucketBtn'>").append($("<i class='fa fa-heart'>")) )
													 .append( $("<button class='removeBtn' data-toggle='modal' data-target=''#itemDel'>").append($("<i class='fa fa-remove'>")))
											
									).data("bookid", item.bookId) 							
						)
					});
				}
			}); 
		} 
		
	});
	
	

</script>
</head>
<body>
	<div class="inner-page pt-6">
		<div class="container">
			<div class="row mb-1" style="margin-top: 40px">
				<div class="section-header">
	          		<h2>BOOK 카트</h2>
	        	</div>
			</div>	
			
			<div class="row">
				<table class="table table-hover">
					<tr>
						<th><input type="checkbox"></th>
						<th>등록일자</th>
						<th>BOOK</th>
						<th>버킷 / 삭제</th>
						<th></th>
					</tr>
					<tbody id="cartTbody">
					<c:if test="${empty lists}">
					
						<tr height="50px">
							<td colspan="5">카트에 담긴 BOOK이 존재하지 않습니다. </td>
						</tr>
						
					</c:if>
					<c:forEach var="list" items="${lists}">
						<tr class="pointer" data-bookid="${list.bookId}">
							<td><input id="chkInput" type="checkbox"></td>
							<td><fmt:formatDate pattern="yyyy-MM-dd"  value="${list.insDt}"/></td>
							<td>
								<c:if test="${not empty list.bookCoverPath}">
									<img width="50" height="70" src="/prj/fileUp${list.bookCoverPath}${list.bookCover}">&nbsp;&nbsp;
								</c:if>
								${list.bookNm}
							</td>
							<td><button class="bucketBtn" ><i class="fa fa-heart"></i></button><button class="removeBtn" data-toggle="modal" data-target="#itemDel" ><i class="fa fa-remove"></i></button></td>
						</tr>
					</c:forEach>
					</tbody>
				</table>
			</div>
			<div class="btn-group">
				<button id="chkBucBtn" class="btn btn-outline-secondary">선택버킷</button>
				<button id="chkDelBtn" class="btn btn-outline-secondary">선택삭제</button>
				<button id="lendBtn" class="btn btn-outline-secondary">전체대여</button>
			</div>
	</div>
</div>	 
<div  class="modal fade" id="itemDel" style="display: none">
	<div class="modal-dialog modal-sm">
		<div class="modal-content">
			<div class="modal-body p-4 text-center">
				<h5 class="mb-0">삭제하시겠습니까?</h5>
			</div>
			<div class="modal-footer flex-nowrap p-0">
				<button type="button" id="cartDelete" class="btn btn-lg btn-link fs-6 text-decoration-none col-6 m-0 rounded-0 border-right"><strong>확인</strong></button>
				<button type="button" class="btn btn-lg btn-link fs-6 text-decoration-none col-6 m-0 rounded-0" data-dismiss="modal">취소</button>
			</div>
		</div>
	</div>
</div>
<iframe id="iframe1" name="iframe1" style="display:none"></iframe>
<form action="bookDetail" method="post" id="frm">
	<input type="hidden" id="bookId" name="bookId" >
</form>
</body>

</html>