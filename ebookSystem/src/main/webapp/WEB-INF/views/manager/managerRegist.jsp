<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>매니저등록신청</title>
<script src="resources/js/form-validation.js"></script>
<script src="resources/assets/dist/js/bootstrap.bundle.min.js"></script>
<script type="text/javascript">
function mcnfmBizNoApi(){
	 $.ajax({
		 
	 })
}

</script>
</head>
<body>
<div class="inner-page pt-4">
	<div class="container">
		<div class="row mb-1" style="margin-top: 40px">
			<div class="section-header">
          		<h2>업체등록 신청</h2>
        	</div>
        	<div><h4 class="text-danger" align="center">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;계약서</h4></div>
		</div>
		<div class="row">
			<div class="col-lg-6 mb-6 mb-lg-0">
				<form action="managerRegistInsert" class="needs-validation"  method="post" id="frm" name ="frm" enctype = "multipart/form-data" novalidate>
					<table class="table">
						<tr>
							<th>상호명</th> 
							<td colspan="3">
								<input type="text" id="manfmconm" name="manfmconm" class="form-control" required> 
							</td>
						</tr>
						<tr> 
							<th>사업자 등록번호</th>
							<td colspan="1">
								<input type="text" id="mcnfmbizno" name="mcnfmbizno" size="50px" class="form-control" required>
							</td>
							<td colspan="2">
								<button id="biznoSearch" type="button" class="btn btn-primary" data-toggle="modal" data-target="#mcnfmBizNoApiModal"> 조회 </button>
							</td>
						</tr>
						<tr>
							<th>대표자명</th>
							<td colspan="3">
								<input type="text" id="mcnfmrpspr" name="mcnfmrpspr" size="100px" class="form-control" required>
							</td>
						</tr>
						<tr>
							<th>회사번호</th>
							<td colspan="3">
								<input type="tel" id="mcnfmcotel" name="mcnfmcotel" size="100px" class="form-control" required>
							</td>
						</tr>
						<tr>
							<th>계약기간</th>
							<td>
								<div class="form-check-inline" style="word-spacing :10px">
									<input id="mcnfmCntr1" name="mcnfmCntr" type="radio" value="A" class="form-check-input" checked="checked" required>
									<label class="form-check-label" for="mcnfmCntr">1개월 : 100,000원</label><br>
									<input id="mcnfmCntr2" name="mcnfmCntr" type="radio" value="B" class="form-check-input" required>
									<label class="form-check-label" for="mcnfmCntr">6개월 : 500,000원</label><br>
									<input id="mcnfmCntr3" name="mcnfmCntr" type="radio" value="C" class="form-check-input" required>
									<label class="form-check-label" for="mcnfmCntr">12개월 : 990,000원</label><br>
								</div>
							</td>
						</tr>
					</table>
					<div align="right">					
						<button class="btn btn-primary btn-lg"  onClick="alert('업체등록신청이 완료되었습니다. 홈으로 이동합니다.')" type="submit">등록</button>
					</div>
				</form>
			</div>
			<div class="col-lg-6 mb-6 mb-lg-0">
				<div class="package text-center bg-white">
					<textarea name="content" cols="150" rows="15" readonly="readonly" class="container-fluid">
도서 판매 계약서
 도서 발행사 (이하 ‘발행사’라고 함)과(와) 도서 유통사 (이하‘유통사’라고 함)는(은) 도서에 대한 판매 또는 구독서비스를 제공하는 것과 관련하여 다음과 같이 계약을 체결한다. 
 
 제1조 (목적) 이 계약은 발행사가 유통사에게 납품하는 도서의 판매 또는 구독 서비스에 관한 제반 사항을 정하는 데 그 목적이 있다. 
 
 제2조 (정의) 이 계약에서 사용하는 용어의 뜻은 다음과 같다. 
 	1. 오디오북 : 전문성우나 저작자 등이 직접 책의 내용을 낭독하여 눈으로 읽는 대신 귀로 들을 수 있게 제작한 전자출판물을 말한다. 음성 및 음향 출력이 가능한 모든 기기를 이용하여 들을 수 있다. 
 	2. 공중송신 : 저작물, 실연‧음반‧방송 또는 데이터베이스(이하 ‘저작물 등’이라고 함)를 공중이 수신하거나 접근하게 할 목적으로 무선 또는 유선통신의 방법에 의하여 송신하거나 이용에 제공하는 것을 말한다. 
 	3. 전송(傳送) : 공중송신 중 공중의 구성원이 개별적으로 선택한 시간과 장소에서 접근할 수 있도록 저작물 등을 이용에 제공하는 것을 말하며, 그에 따라 이루어지는 송신을 포함한다.
 	4. 계약의 해지 : 계속적으로 효과가 이어지는 계약관계에서 일방적인 의사표시로 향후 계약관계가 종료되는 것을 말한다.
 	5. 분쟁 조정 : 저작권에 관한 분쟁이 생겼을 때 한국저작권위원회의 조정을 통해 분쟁을 해결하는 절차이다. 신청 취지와 원인을 기재한 조정신청서를 제출하면 조정이 개시되며 조정부가 당사자사이의 의견교환을 통해 합의를 유도한다. 조정절차는 비공개를 원칙으로 한다. 제3조 (권리와 보증)
 
 제3조 (권리와 보증)  
 ① 발행사는 도서의 복제 및 전송을 허락할 수 있는법적인 권한을 보유하고 있음을 보증한다.
 ② 이 계약의 내용에 따라 유통사는 복제 및 전송 등의 방법으로 도서 판매하거나 구독서비스에 제공할 수 있는 권한을 가진다.
 ③ 유통사는 이 계약 대상 저작물을 판매 또는 구독서비스에 제공함에 있어 복제방지장치 등 저작권을 보호할 수 있는 기술적인 조치를 취하여야 한다. 
 ④ 유통사는 이 계약 대상 저작물의 이용을 촉진하기 위해 노력하여야 한다.
 ⑤ 유통사는 발행사가 그 판매 및 구독 제공을 확인할 수 있도록 관련 정보시스템을 제공함으로써 그 이용 내역을 투명하게 공개하여야 한다. 제4조 (계약기간 및 효력의 발생)
 
 제4조 (계약기간 및 효력의 발생)
 ① 이 계약의 유효기간은 결제일로부터 결제기간까지로 한다. 

 제5조 (도서의 서비스)
 ① 도서 서비스 유형은 다음과 같이 정한다. 
 ⏹서비스 유형
	판매방식
		대여 ( )
 ⏹유료 여부  
 	유료 ( ), 무료 ( )
 ② 유통사는 제1항에서 정한 조건과 방식으로 서비스할 수 있으며, 그 밖의 경우에 대하여는 발행사와 협의를 거쳐 별도의 부속 합의서를 작성하여야 한다. 
 ③ 도서에 대한 홍보․광고, 판매의 방법 등은 유통사가 결정한다.
 
 제6조 (오디오북 대여 및 정산)
 ① 발행사는 유통사와의 원활한 거래를 위하여 제작한 도서에 대한 정보 등을 유통사에게 사전에 제공하고, 유통사가 특정 도서에 대한 정보를 요청할 경우 이에 대한 사항을 충실히 제공하여야 한다.
 ② 이용료의 정산은 개월 단위로 한다. 
 
 제7조 (판매 및 이용허락에 대한 정산보고 등)
 ① 유통사는 발행사가 등록한 도서에 대한 판매 내역 및 가격, 수량, 이용료 등을 발행사가 열람할 수 있도록 정보시스템 등 상호합의한 방식에 따라 제공하여야 한다.

 제8조 (서비스 중단 및 손해배상 등)
 ① 이 계약기간 동안 어느 일방이 그 책임과 의무를 다하지 못하여 손해가 발생하는 경우 그 책임의 범위에 따라 상대방에게 배상의 책임을 진다. 
 ② 제3조 제1항에 따른 보증에도 불구하고 발행사가 납품한 도서와 관련하여 저작권법 또는 기타 법률 위반을 이유로 제3자가 이의를 제기하는 경우 유통사는 해당 도서에 대하여 판매 또는 서비스를 중단할 수 있다.
 ③ 제2항의 이유로 유통사가 제3자와 분쟁이 발생하여 손해가 발생한 경우, 발행사는 유통사의 손해액을 전액 배상하여야 한다. 다만, 유통사의 책임 있는 사유로 인하여 분쟁이 발생한 경우에는 그러하지 아니한다. 
 
 제9조 (계약의 해지)
 ① 발행사와 유통사가 이 계약을 이행하지 않거나 계약상 중대한 의무사항을 위반한 때에는 이 계약을 해지할 수 있다.
 ② 당사자 일방에게 다음의 사유가 발생한 경우, 이 계약은 자동으로 해지된 것으로 본다. 
 	1. 부도로 인한 지급 불능 상태가 발생하거나 회사 정리, 화의 또는 파산의 개시 신청이 있는 경우
 	2. 법인인 경우 청산, 합병 등으로 인하여 법인격의 변경이 있고, 이에 대하여 상대방 당사자의 동의를 구하지 못한 경우
 ③ 위 제1항 및 제2항에 따라 이 계약이 해지된 경우, 이 계약을 위반한 당사자는 상대방이 이 계약의 해지에 따라 입게 될 손해를 배상하여야 한다.
 ④ 발행사 또는 유통사의 소속 임직원이 상대방에게 관련 법률에 따른 성희롱, 성폭력을 저지른 경우 그 상대방은 이 계약을 해지할 수 있으며, 그로 인한 손해배상을 청구할 수 있다. 
 
 제10조 (성희롱 등의 피해 구제) 
  제9조 제4항에도 불구하고 계약자(계약단체의 대표를 포함하여 단체에 소속되어 있는 임직원 및 자문‧기획위원 등 지휘‧감독하는 지위에 있는 자) 및 계약대상자 중 어느 일방이 
  상대 구성원으로부터의 성희롱 등 행위로 정상적인 직무 수행을 하지 못한 경우, 계약을 해지하지 않고 그 내용을 국가인권위원회에 진정하거나 문화체육관광부 장관에게 신고하여 분쟁을 해결할수 있다. 
 
 제11조 (계약 만료 또는 해지 후의 유통사의 의무)
 ① 이 계약이 만료되거나 해지되는 경우에 유통사는 지체 없이 발행사가 납품한 도서의 신규 사용을 중단하여야 하며, 해당 오디오북과 관련된 모든 파일을 영구 삭제하여야 한다.
 ② 발행사는 이 계약이 만료되거나 해지되는 경우 도서의 사용 중단을 위하여 필요한 준비기간을 일의 범위 내에서 인정할 수 있다.
 ③ 이 계약의 만료 또는 해지 이후에 유통사가 부득이한 사유로 해당 도서의 전부 또는 일부를 사용할 필요가 있을 경우에는 사전에 발행사와 협의해야 하고, 이용료 정산방식은 상호합의에 따른다. 

 제12조 (부칙)
 1. 이 계약에 명시되지 않은 사항은 쌍방이 협의하여 정할 수 있다. 해석상 이견이 있는 경우 저작권법 및 관련 법률 및 사회 상규에 따라 이를 해결한다.
 2. 이 계약의 내용을 변경하고자 하는 경우에는 쌍방이 문서로 합의하여 결정한다. 
					</textarea>								
				</div>
			</div>
		</div>
	</div>
</div>

<div  class="modal fade" id="mcnfmBizNoApiModal">
	<div class="modal-dialog modal-lg">
		<div class="modal-content">
			<form class="needs-validation" target="iframe1" novalidate>	
				<!--Header-->
			    <div class="modal-header">
			    	<h4 class="modal-title" id="myModalLabel">사업자등록번호 검색</h4>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">×</span>
			        </button>
			    </div>
				<!--Body-->
				<div class="modal-body">
					<div class="row">
						<input type="text" class="form-control" id="mcnfmBizNoNm" placeholder=""  required>
						<div class="invalid-feedback">
							검색할 회사명을 입력해주세요.
						</div>	
						<button type="submit" id="biznoSearch" class="btn btn-primary btn-lg" onclick="mcnfmBizNoApi()" >검 색</button>
					</div>
					<div class="row">
						<table id="apiTb" class="table table-hover">
							<tr>
								<th>No</th>
								<th>상호명</th>
								<th>사업자번호</th>
								<th>대표자명</th>
								<th>회사번호</th>
							</tr>
							<tbody id="apiTbody">
							</tbody>
						</table>
					</div>			
				</div>
	      		<!--Footer-->
		      	<div class="modal-footer">
		        	<button id="apiCloseBtn" type="button" class="btn btn-outline-primary" data-dismiss="modal">Close</button>
				</div>
			</form>
		</div>
	</div>
</div>
</body>
</html>