<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>


<script>
$(function(){
	$("#check_module").click(function () {
		var sAmt = $("#amtCd:checked").val();
		var sMile = $("#chArea").val();
		
		var IMP = window.IMP; // 생략가능
		IMP.init('imp33573268');
		IMP.request_pay({
			pg: "html5_inicis",
		    pay_method: "${sub.subspPaySt}",
		    merchant_uid: "${sub.impUid}",
		    name: "상품명",
		    amount: "${sub.subspAmt}",
			merchant_uid: 'merchant_' + new Date().getTime(),
			name: 'E로운생활 매니저계약권',
			amount: $("#total").val(),
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
	
	
	
//  기본 라디오버튼값 세팅	
	$(document).ready(function(){
		var amt = $("#amtCd:checked").val();
			$("#txArea").val(amt);
			$("#chArea").val("0");
			$("#total").val(amt);
	});


	
	
	
});

</script>


</head>
<body>
	<div class="container">
		<div class="row mb-1" style="margin-top: 40px">
			<div class="section-header">
				<h4>E로운생활을 즐기기 위한</h4> 
				<h3>구독방식을 선택해 주세요.</h3>
			</div><br><br>
		</div>
		<div class="row">
			<div class="col-lg-6 mb-6 mb-lg-0" style="margin-right: 40px;">
				<div class="package text-center bg-white"><br><br>
					<form id="frm" name="frm" action="#">
						<table id="lcodeTb" class="table table-hover" >
							<tr>
								<th>ID</th>
								<td >${member.memberId }</td>
							</tr>
							<tr>
							<th>계약 기간선택<p style="color: #ac2925">★결제기간을 선택하세요.</p></th>
								<td id="amtCdTd">
									<input id="amtCd" name="amtCd" type="radio" value="100000" class="form-check-input" checked="checked" required>
									<label class="form-check-label" for="amtCd">1개월 : 100,000원</label><br>
									<input id="amtCd" name="amtCd" type="radio" value="500000" class="form-check-input" required>
									<label class="form-check-label" for="amtCd">6개월 : 500,000원</label><br>
									<input id="amtCd" name="amtCd" type="radio" value="990000" class="form-check-input" required >
									<label class="form-check-label" for="mcnfmCntr">12개월 : 990,000원</label><br>
								</td>
							</tr>
						</table>
					</form>
				</div>
			</div>
			<div class="col-lg-2 mb-2 mb-lg-0">
			     <h4>총 금액<textarea id="txArea" rows="1" cols="12"  style="text-align:right; " ></textarea></h4>
			     <h2><p>결제금액 <span class="price" style="color:black"><textarea id="total"  rows="1" cols="20"  style="text-align:right; " id="resultMile"></textarea></span></p></h2>
	       </div>
		</div>
			<div align="right" style="margin-right: 400px;">
				<button type="button" id="check_module" class="btn btn-outline-primary"  value="계약하기"> 계약하기</button>
			</div><br><br><br>
	</div>
</body>
</html>