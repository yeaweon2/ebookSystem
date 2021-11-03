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
<script>
$(function(){
	
	
	$("#check_module").click(function () {
		var IMP = window.IMP; // 생략가능
		IMP.init('imp33573268');
		IMP.request_pay({
			pg: 'html5_inicis', 
			pay_method: 'card',
			merchant_uid: 'merchant_' + new Date().getTime(),
			name: 'E로운생활 월정액권',
			amount: $("#total").val(),
		}, function (rsp) {
			console.log(rsp);
				if (rsp.success) {
				
					$('#myModal').modal();
					$("#resultTxt").html('고유ID : ' + rsp.imp_uid);
					$("#resultTxt2").html('결제 금액 : ' + rsp.paid_amount +' 원');
					$("#resultTxt3").html('카드 승인번호 : ' + rsp.apply_num);
					
				} else {
					alert("결제에 실패하였습니다.   " + '  실패이유 : ' + rsp.error_msg);
				}
			});
		});
	
	

//  모달창	

	// Get the modal
	var modal = $('#myModal');
	// Get the button that opens the modal
	var span = $('.close')[0];
	// When the user clicks on <span> (x), close the modal
	span.onclick = function() {
	  modal.style.display = "none";
	}
	// When the user clicks anywhere outside of the modal, close it
	window.onclick = function(event) {
	  if (event.target == modal) {
	    modal.style.display = "none";
	  }
	}
		
	
	
//  기본 라디오버튼값 세팅	
	$(document).ready(function(){
		var amt = $("#amtCd:checked").val();
			$("#txArea").val(amt);
			$("#chArea").val("0");
			$("#total").val(amt);
	});


	
//  체크박스 클릭 시 전체 선택
	$("#chkuse").on("click", function(){
		var amt = $("#amtCd:checked").val();
		var chkMile = $("#chkuse").data("membermile");
		var chk = $(this).is(":checked");
		console.log(chkMile);
		if(chk){
			$("#chkuse").prop('checked', true);
			$("#useMile").attr("disabled",true);
			$("#chArea").val(chkMile);
			$("#total").val(amt-chkMile);
		}else{
			$("#chkuse").prop('checked', false);
			$("#useMile").attr("disabled",false);
			$("#chArea").val("0");
			$("#total").val(amt);
		}
	});
	
	
	
	
//	체크박스 이벤트중지
	$("#membermile").on("click", function() {
		event.stopPropagation();
		if ($(event.target).find("#allMile").prop('checked') == false) {
			$(event.target).find("#allMile").prop('checked', true);
		} else {
			$(event.target).find("#allMile").prop('checked', false);
		}
	});
	
	

//  금액 text박스에 넣어주기(total값)
	$("#amtCdTd").on("click", "input", function(){
		
		var amt = $("#amtCd:checked").val();
		var mile = $("#useMile").val();
		
			$("#txArea").val(amt);
			$("#chArea").val(mile);
			$("#total").val(amt-mile);
		
	});
	
//  마일리지 사용
	$("#useMile").on("keyup" , function(){
		var amt = $("#amtCd:checked").val();
		var mile = $(this).val();
		var membermile = $("#membermile").data("membermile");
		console.log(  mile + " / " +  membermile );
		if( membermile <  mile || mile < 0 ){
			alert("마일리지를 바르게 입력해주세요.");
			$(this).val("0");
			$("#chArea").val("0");
			$("#total").val(amt);
		}else{
			$("#chArea").val(mile);
			$("#total").val(amt-mile);
		}
			
		
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
					<table id="lcodeTb" class="table table-hover" >
						<tr>
							<th>ID</th>
							<td >${member.memberId }</td>
						</tr>
						<tr>
							<th>회원명</th>
							<td id="memberNm" data-membermane="${member.memberNm }">${member.memberNm }</td>
						</tr>
						<tr>
						<th>월정액 기간선택<p style="color: #ac2925">★결제기간을 선택하세요.</p></th>
							<td id="amtCdTd">
								<input id="amtCd" name="amtCd" type="radio" value="9900" class="form-check-input" checked="checked" required>
								<label class="form-check-label" for="amtCd">1개월 : 9,900원</label><br>
								<input id="amtCd" name="amtCd" type="radio" value="25900" class="form-check-input" required>
								<label class="form-check-label" for="amtCd">3개월 : 25,900원</label><br>
								<input id="amtCd" name="amtCd" type="radio" value="90000" class="form-check-input" required >
								<label class="form-check-label" for="mcnfmCntr">12개월 : 90,000원</label><br>
							</td>
						</tr>
						<tr>
							<th>마일리지 / 사용가능 마일리지</th>
							<td id="membermile" data-membermile="${member.memberMile }">${member.memberMile } point /  &nbsp;&nbsp;&nbsp;
								<input type="number" class="form-check-input" id="useMile" name="useMile" value="0" style="text-align:right; width:90px;"> point &nbsp;&nbsp;&nbsp;
								<input type="checkbox" class="form-check-input" id=chkuse name="chkuse" data-membermile="${member.memberMile }" > 전체사용</td>
						</tr>
					</table>
				</div>
			</div>
			<div class="col-lg-2 mb-2 mb-lg-0">
			     <h4>총 금액<textarea id="txArea" rows="1" cols="1"  style="text-align:right; " ></textarea></h4>
			     <h4>사용 마일리지<textarea id="chArea" rows="1" cols="1"  style="text-align:right; "></textarea></h4><hr>
			     <h2><p>Total <span class="price" style="color:black"><textarea id="total"  rows="1" cols="1"  style="text-align:right; " id="resultMile"></textarea></span></p></h2>
	       </div>
		</div>
			<div align="right" style="margin-right: 400px;">
				<button type="button" id="check_module" class="btn btn-outline-primary"  value="가입하기"> 가입하기</button>
			</div><br><br><br>
	</div>
	
	
	
<!-- The Modal -->
<div id="myModal" class="modal" style="display:none;">

  <!-- Modal content -->
  <div class="modal-content" style="align-content: 'center';">
    <div class="modal-header">
      <span class="close">&times;</span>
      <h2>E로운생활 구독권 결제가 완료되었습니다.</h2>
    </div>
    <div class="modal-body">
      
      
      <div id="resultTxt"></div>
      <div id="resultTxt2"></div><br>
      <div>
      	구매자 ID : ${member.memberId}<br>
      	구매자 성함 : ${member.memberNm}<br>
      	구매자 연락처 : ${member.memberTel}<br>
      	구매자 email : ${member.memberEmail}<br>
      </div>
    </div>
    	<div>
        	<span  class="btn btn-default get" style="background-color: #1E90FF" id="confirm" onclick="location.href='home'">대여하러 가기</span>
        	<span class="btn btn-default get" style="background-color: #90EE90" id="close" onclick="location.href='myPage'">닫기</span>
      </div>
    </div>
</div>
</body>
</html>