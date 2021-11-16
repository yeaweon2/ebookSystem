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
<script>

$(document).ready(function(){
	
	$("#payImport").on("click",function () {
		console.log("==============");
		console.log(${man.mcnfmAmt });
		var mcnfmId = $("#mcnfmId").val();
		console.log(mcnfmId);
		
		var IMP = window.IMP; // 생략가능
		IMP.init('imp33573268');
		IMP.request_pay({
			pg: "html5_inicis",
		    pay_method: "${pay.subspPaySt}",
		    merchant_uid: "${pay.impUid}",
		    name: "상품명",
		    amount: "${man.mcnfmAmt }",
			merchant_uid: 'merchant_' + new Date().getTime(),
			name: 'E로운생활 매니저 계약권',
		}, function (rsp) {
			console.log(rsp);
				if (rsp.success) {
					
					var PayHistoryVO = {
							payMthd :rsp.apply_num,
							payAmt : rsp.paid_amount,
							impUid : rsp.imp_uid,
							mcnfmId : mcnfmId
					}
					
				 	$.ajax({
						url : 'SuccessPay' ,
						type : 'post',
						dataType : 'text',
						data : PayHistoryVO,
						success : function(){
							Swal.fire({
			                    icon: 'success',
			                    title: '결제완료',
			                    text: '결제내역 조회 페이지로 이동됩니다.',
			                });
							window.location.href = "myInfo";
							
						},
						error : function(rej){
							console.log(rej);
						}
					}); 
				 	 
				} else {
					Swal.fire({
	                    icon: 'error',
	                    title: '결제실패',
	                    text: '실패이유 :  '+ rsp.error_msg,
	                });
				}
			});
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
							<th>계약상태</th>
							<th>계약시작일자</th>
							<th>계약종료일자</th>
							<th>계약예상가격</th>
							<c:if test="${man.mcnfmStCd eq '02'}">
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
								<td><fmt:formatDate pattern="yyyy-MM-dd"  value="${man.mcnfmCntrSdt}"/></td>
								<td><fmt:formatDate pattern="yyyy-MM-dd"  value="${man.mcnfmCntrEdt}"/></td>
								<td>${man.mcnfmAmt }</td>
									<c:if test="${man.mcnfmStCd eq '02'}">
								<td><button type="button" id="payImport" class="btn ebookBtn" >계약하기</button></td>
								</c:if>
							</tr>
						</tbody>
					</table>
						<input type="hidden" id="mcnfmId" name="mcnfmId" value="${man.mcnfmId }" >
			</div>
		</div>
	</div>	
</section>	


<form action="" method="post" id="frm">
	<input type="hidden" id="memberId" name="memberId" >
	<input type="hidden" id="mcnfmPrice" name="mcnfmPrice" value="${man.mcnfmAmt }">
</form>	




</body>
</html>