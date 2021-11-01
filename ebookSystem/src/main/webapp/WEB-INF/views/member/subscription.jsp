<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script>

function txInput(Obj,Str)
{
  document.getElementById(Obj).value = Str;
}



$(function(){
	$("#check_module").click(function () {
		var IMP = window.IMP; // 생략가능
		IMP.init('imp33573268');
		IMP.request_pay({
		pg: 'html5_inicis', 
		pay_method: 'card',

		merchant_uid: 'merchant_' + new Date().getTime(),
		name: '주문명:월정액1개월',
		amount: 9900,
		buyer_email: 'iamport@siot.do',
		buyer_name: '김미미',
		buyer_tel: '010-1234-5678',
		buyer_addr: '서울특별시 강남구 삼성동',
		buyer_postcode: '123-456',
		m_redirect_url: 'https://localhost/prj/payments/complete'
		
		}, function (rsp) {
			console.log(rsp);
			if (rsp.success) {
			var msg = '결제가 완료되었습니다.';
			msg += '고유ID : ' + rsp.imp_uid;
			msg += '상점 거래ID : ' + rsp.merchant_uid;
			msg += '결제 금액 : ' + rsp.paid_amount;
			msg += '카드 승인번호 : ' + rsp.apply_num;
			} else {
				var msg = '결제에 실패하였습니다.';
				msg += '에러내용 : ' + rsp.error_msg;
			}
			alert(msg);
			});
		});
});

</script>


</head>
<body>
		<div class="container">
			<div class="row mb-1" style="margin-top: 40px">
				<div class="section-header">
					<h3>E로운생활을 즐기기 위한</h3> 
					<h3>구독방식을 선택해 주세요.</h3>
				</div><br><br>
			</div>
			<div>
				<div class="row g-3">
						<div class="col-sm-6" align="center">
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
								<th>마일리지 / 사용가능 마일리지</th>
								<td>${member.memberMile } point / ${member.memberMile } point</td>
							</tr>
							<tr>
								<th>월정액 기간선택<p style="color: #ac2925">★결제할 기간을 선택하세요.</p></th>
								<td>
									<input id="mcnfmCntr1" name="mcnfmCntr" type="radio" value="9,900원" class="form-check-input" checked="checked" required onclick="txInput('textArea',this.value)">
									<label class="form-check-label" for="mcnfmCntr">1개월 : 9,900원</label><br>
									<input id="mcnfmCntr2" name="mcnfmCntr" type="radio" value="25,900원" class="form-check-input" required onclick="txInput('textArea',this.value)">
									<label class="form-check-label" for="mcnfmCntr">3개월 : 25,900원</label><br>
									<input id="mcnfmCntr3" name="mcnfmCntr" type="radio" value="90,000원" class="form-check-input" required onclick="txInput('textArea',this.value)">
									<label class="form-check-label" for="mcnfmCntr">12개월 : 90,000원</label><br>
								</td>
							</tr>
						</table>
						<div class="row g-3">
							<div class="row">
							  <div class="col-75">
							    
							  </div>
							  <div class="col-25">
							      <h4>총 금액 <textarea id="textArea" rows="1" cols="1"></textarea></h4>
							      <h4>사용 마일리지 <textarea id="textArea" rows="1" cols="1"></textarea></h4>
							      <hr>
							     <h2><p>Total <span class="price" style="color:black"><textarea id="textArea"  rows="1" cols="1"></textarea></span></p></h2>
							  </div>
							</div>
						</div>
						<div align="right">
							<button type="button" id="check_module" class="btn btn-outline-primary"  value="가입하기"> 가입하기</button>
					</div><br><br><br>
					</div>
				</div>
			</div>
		</div>
</body>
</html>