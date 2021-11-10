<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>등록신청내역보기</title>
<style type="text/css">
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
	  width: 50%; /* Full width */
	  height: 30%; /* Full height */	  
	  padding: 40px;
	  border: 1px solid #888;
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
	
select {
	width:110px;
}	
</style>
<script type="text/javascript">
	$(function(){
		$("#cnfmBtn").on("click", function(){
			var chkCnt = 0;
			var book = [];
			$(".chkInput:checked").each(function(){
				
				var filecnt = $(this).closest("tr").data("filecnt");
				if( filecnt == '0'){
					chkCnt++;
				} 
				
				var bcnfmId = $(this).closest("tr").data("bcnfmid");
				var bookId = $(this).closest("tr").data("bookid");
				var data = {
					bcnfmId : bcnfmId,
					bookId : bookId
				};
				
				book.push(data);
		    });
			
			console.log(book);
			if( book == null ){
				alert("승인처리건을 선택한 후 진행해주세요.");
				return false;
			}
			if( chkCnt > 0 ){
				alert("파일이 등록되지 않은 BOOK은 승인할 수 없습니다.");
				return false;	
			}
			
			 $.ajax({
				url : 'bookAdminCnfm' ,
				data :  JSON.stringify(book)  ,
				contentType : 'application/json',
				method : 'POST' ,
				dataType : 'json' ,
				success : function(data){
					console.log(data);
				}
			}); 
		});
		
		$("#rejectBtn").on("click", function(){
			$("#myModal").css("display", "none");
			var rejectMsg = $("#rejectMsg").val();
			if(rejectMsg == ""){
				alert("보류사유를 작성해주세요.");
				return false;
			}
			
			var book = [];
			$(".chkInput:checked").each(function(){
					
				var bcnfmId = $(this).closest("tr").data("bcnfmid");
				var bookId = $(this).closest("tr").data("bookid");
				
				var data = {
					bcnfmId : bcnfmId ,
					bookId : bookId ,
					bcnfmReject : rejectMsg
				};
				
				book.push(data);
		    });
			
			if( book == null ){
				alert("승인처리건을 선택한 후 진행해주세요.");
				return false;
			}
			
			 $.ajax({
				url : 'bookAdminReject' ,
				data :  JSON.stringify(book)  ,
				contentType : 'application/json',
				method : 'POST' ,
				dataType : 'json' ,
				success : function(data){
					console.log(data);
				}
			}); 
		});
		
		$("#bcnfmTb").find("tbody").on("click", ".chkTd", function(){
			event.stopPropagation();
		});
		
		$("#bcnfmTb").find("tbody").on("click", "tr", function(){
			event.stopPropagation();
			var bcnfmId = $(this).data("bcnfmid");
			var bookId = $(this).data("bookid");
			$("#frm").find("#bookId").val(bookId);
			frm.submit();
		});
	});
	
	

</script>
</head>
<body>
<section>
	<div class="section-inner">		
		<div class="container">
			
			<div class="row mb-1" style="margin-top: 40px">
				<div class="section-header">
	          		<h2>업체등록 신청 내역</h2>
	        	</div>
			</div>
			<div class="row pull-right" style="margin-top:10px;margin-bottom:10px;">
				<button type="button" id="cnfmBtn" class="btn ebookBtn">신청취소</button>
				<button type="button" id="rejectModalBtn" class="btn ebookBtn">수 정</button>
			</div>
				
			<div class="row">
				<table id="bcnfmTb" class="table table-hover" style="cursor: pointer;">
						<tr>
							<th>상호명</th>
							<th>대표자명</th> 
							<th>승인신청일자</th>
							<th>승인일자</th>
							<th>승인상태</th>
							<th>승인자</th>
							<th>계약시작일자</th>
							<th>계약종료일자</th>
						</tr>
						<tbody>
							<tr>
								<td>${man.mcnfmCoNm}</td>
								<td>${man.mcnfmRpspr}</td>
								<td><fmt:formatDate pattern="yyyy-MM-dd"  value="${man.mcnfmReqDt}"/></td>
								<td><fmt:formatDate pattern="yyyy-MM-dd"  value="${man.mcnfmCnfmDt}"/></td>
								<c:if test="${man.mcnfmStCd eq '승인'}">
									<td style="color:red;font-weight:bold">${man.mcnfmStCd}</td>
								</c:if>
								<c:if test="${man.mcnfmStCd eq '보류'}">
									<td style="color:#0c2e8a;font-weight:bold">${man.mcnfmStCd}</td> 
								</c:if>
								<c:if test="${man.mcnfmStCd eq '처리중' }">
									<td style="font-weight:bold">${man.mcnfmStCd}</td>
								</c:if>
								<td>${man.mcnfmCnfmr}</td>
								<td>${man.mcnfmCntrSdt}</td>
								<td>${man.mcnfmCntrEdt}</td>
							</tr>
						</tbody>
					</table>
			</div>
		</div>
	</div>	
</section>	


<form action="" method="post" id="frm">
	<input type="hidden" id="memberId" name="memberId" >
</form>	

</body>
</html>