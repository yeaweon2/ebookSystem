<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <!-- jQuery -->
  <script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
  <!-- iamport.payment.js -->
  <script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-{SDK-최신버전}.js">
  
	function iamportApi(){
		//가맹점 식별코드
		IMP.init('imp33573268');
		IMP.request_pay({
		    pg : 'kcp',
		    pay_method : 'card',
		    merchant_uid : 'merchant_' + new Date().getTime(),
		    name : '상품1' , //결제창에서 보여질 이름
		    amount : 100, //실제 결제되는 가격
		    buyer_email : 'iamport@siot.do',
		    buyer_name : '구매자이름',
		    buyer_tel : '010-1234-5678',
		    buyer_addr : '서울 강남구 도곡동',
		    buyer_postcode : '123-456'
		}, function(rsp) {
			console.log(rsp);
			// 결제검증
			$.ajax({
	        	type : "POST",
	        	url : "/verifyIamport/" + rsp.imp_uid 
	        }).done(function(data) {
	        	
	        	console.log(data);
	        	
	        	// 위의 rsp.paid_amount 와 data.response.amount를 비교한후 로직 실행 (import 서버검증)
	        	if(rsp.paid_amount == data.response.amount){
		        	alert("결제 및 결제검증완료");
	        	} else {
	        		alert("결제 실패");
	        	}
	        });
		});
	}
   
  </script>




</head>
<body>
<div class="site-section">
		<div class="container">
			<div class="row mb-1" style="margin-top: 40px">
				<div class="section-header">
					<h2>월정액 가입</h2>
				</div>
			</div>
			<div>
				<div class="row g-3">
						<div class="col-sm-8">
						<br />
						<table id="lcodeTb" class="table table-hover">
							<tr>
								<th>ID</th>
								<td>${member.memberId }</td>
							</tr>
							<tr>
								<th>회원명</th>
								<td>${member.memberNm }</td>
							</tr>
							<tr>
								<th>마일리지</th>
								<td>${member.memberMile }</td>
							</tr>
							<tr>
								<th>월정액 기간선택</th><br>
								<td><br>
									<div class="form-check-inline">
										<input id="mcnfmCntr1" name="mcnfmCntr" type="radio" value="A" class="form-check-input" checked="checked" required>
										<label class="form-check-label" for="mcnfmCntr">1개월 : 9,900원</label><br>
										<input id="mcnfmCntr2" name="mcnfmCntr" type="radio" value="B" class="form-check-input" required>
										<label class="form-check-label" for="mcnfmCntr">3개월 : 25,900원</label><br>
										<input id="mcnfmCntr3" name="mcnfmCntr" type="radio" value="C" class="form-check-input" required>
										<label class="form-check-label" for="mcnfmCntr">12개월 : 90,000원</label><br>
									</div>
								</td>
							</tr>
						</table>
						<div align="right">
							<button type="submit" id=""subscription class="btn btn-outline-primary" onclick = "iamportApi()" value="가입하기"> 가입하기</button>
					</div><br><br><br>
					</div>
				</div>
			</div>
		</div>
	</div>
	<form action="memberSelect" method="post" id="frm">
		<input type="hidden" id="memberId" name="memberId">
	</form>













</body>
</html>