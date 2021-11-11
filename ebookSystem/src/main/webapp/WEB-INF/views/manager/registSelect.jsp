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
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.5.js"></script>




<!-- <script type="text/javascript">
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
	
	

</script> -->
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
				<button type="button" id="rejectModalBtn" class="btn ebookBtn">수 정</button>
			</div>
				
			<div class="row">
				<table id="bcnfmTb" class="table table-hover" style="cursor: pointer;">
						<tr>
							<th></th>
							<th>상호명</th>
							<th>대표자명</th> 
							<th>신청일자</th>
							<th>승인일자</th>
							<th>승인상태</th>
							<th>승인자</th>
							<th>계약시작일자</th>
							<th>계약종료일자</th>
							<c:if test="${not empty mcnId }">
							<th>구분</th>
							</c:if>
						</tr>
						<tbody>
							<tr>
								<td>${sub.subspAmt }</td>
								<td>${man.mcnfmCoNm}</td>
								<td>${man.mcnfmRpspr}</td>
								<td><fmt:formatDate pattern="yyyy-MM-dd"  value="${man.mcnfmReqDt}"/></td>
								<td><fmt:formatDate pattern="yyyy-MM-dd"  value="${man.mcnfmCnfmDt}"/></td>
								<td style="color:red;font-weight:bold">${man.mcnfmStNm}</td>
								<td>${man.mcnfmCnfmrNm}</td>
								<td>${man.mcnfmCntrSdt}</td>
								<td>${man.mcnfmCntrEdt}</td>
								<c:if test="${not empty mcnId }">
								<td><button type="button" id="subImport" class="btn ebookBtn" >계약하기</button></td>
								</c:if>
							</tr>
						</tbody>
					</table>
			</div>
		</div>
	</div>	
</section>	


<form action="" method="post" id="frm">
	<input type="hidden" id="memberId" name="${mam.memberId }" >
	<input type="hidden" id="mcnfmPrice" name="mcnfmPrice" value="${man.mcnfmAmt }">
</form>	


<script>
$(function(){
	$("#subImport").on("click",function () {
		console.log("==============");
		var sAmt = $("#mcnfmPrice").val();
		
		var IMP = window.IMP; // 생략가능
		IMP.init('imp33573268');
		IMP.request_pay({
			pg: "html5_inicis",
		    pay_method: "${sub.subspPaySt}",
		    merchant_uid: "${sub.impUid}",
		    name: "상품명",
		    amount: "${sub.subspAmt}",
			merchant_uid: 'merchant_' + new Date().getTime(),
			name: 'E로운생활 매니저 계약권',
			amount: sAmt,
		}, function (rsp) {
			console.log(rsp);
				if (rsp.success) {
					
					var SubscriptionVO = {
							subspPayMthd :rsp.apply_num,
							subspPayAmt : rsp.paid_amount,
							impUid : rsp.imp_uid,
							subspAmt : sAmt,
					}
					
				 	$.ajax({
						url : 'SuccessSup' ,
						type : 'post',
						dataType : 'text',
						data : SubscriptionVO,
						success : function(){
							alert("성공됨.");
							window.location.href = "myInfo";
							
						},
						error : function(rej){
							console.log(rej);
						}
					}); 
				 	 
				} else {
					alert("결제에 실패하였습니다.   " + '\n실패이유 : ' + rsp.error_msg);
				}
			});
		});
	





</script>

</body>
</html>