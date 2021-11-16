<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원목록</title>
<script src="resources/js/form-validation.js"></script>
<script type="text/javascript">

$(function() {
//  클릭시 글상세조회
	$("table").on("click", "tr", function() {
		event.stopPropagation();
		var id = $(this).closest("tr").data("id");
		console.log($("#memberId").val(id));
		$("#memberId").val(id);
		frm.submit();
	})

//	체크박스 이벤트중지
	$(".ckboxTd").on("click", function() {
		event.stopPropagation();
		if ($(event.target).find("#member").prop('checked') == false) {
			$(event.target).find("#member").prop('checked', true);
		} else { 
			$(event.target).find("#member").prop('checked', false);
		}
	});
});



//  휴면회원 해제
	function sleepMember() { 
		var memberArr = [];
		
		$("input[name=checkMember]:checked").each(function() { 
			memberArr.push($(this).val());
		});  

		$.ajax({
			url : 'memberCdChange' ,
			type : 'post',
			dataType: 'json',
			data : { memArr : memberArr },
			success: function(res){
				alert("success");
				},
			error : function(rej){
				console.log(rej);
			}
		});
		 Swal.fire({
             icon: 'success',
             title: '휴면해제완료.',
             text: '정상적으로 완료되었습니다.',
         });
		 
	}
</script>
<style>
a {
    color: #333;
    text-decoration: none;
}

body, button, input, select, td, textarea, th {
    font-size: 13px;
    line-height: 1.5;
    -webkit-font-smoothing: antialiased;
}    
fieldset, img {
    border: 0;
}

.btn_login {
    margin: 20px 0 0;
    width: 100%;
    height: 48px;
    border-radius: 3px;
    font-size: 16px;
    color: #fff;
    background-color: #000;
}
</style>
</head>
<body>

<!-- <div class="row srchBox" align="center" >
	<div class="container">
				<form name="searchFrm" >
						<div class="col-md-9">
							<div class="row" >
								<div class="col-md-6" style="padding-left:0px">
									<div class="col-md-3" >
										<label> 검색조건 : </label>
									</div>
									<div class="col-md-3" style="margin-left:0px">
										<select id="srchVal" name="srchVal" class="form-control" style="width:100px;">
											<option value="01" selected>제목</option>
											<option value="02">출판사</option>
											<option value="03">저자</option>
										</select>
									</div>
									<div class="col-md-6" style="margin-left:0px">
										<input type="text" id="srchTxt" name="srchTxt" class="form-control">
									</div>
								</div>
								<div class="col-md-6" >
									<div class="col-md-3" style="padding-left:0px; padding-right:0px;"> 
										<label>승인상태 : </label>
									</div>
									<div class="col-md-9" style="padding-left:0px">
										<select id="srchCnfmCd" class="form-control" style="width:120px;padding-left:0px">
											<option value="00" selected>전체</option>
											<option value="04">미신청</option>
											<option value="01">처리중</option>
											<option value="03">보류</option>
											<option value="02">승인</option>
										</select>
										<input type="hidden" id="bcnfmStCd" name="bcnfmStCd" >
									</div>
								</div>
							</div>
							<div class="row">
								<div class="col-md-6" style="padding-left:0;"> 
									<div class="col-md-3">		
										<label>신청일자 :</label>
									</div>
									<div class="col-md-4" style="padding-left:0;">		
										<input id="bcnfmReqSDt" name="bcnfmReqSDt" type="date" class="bcnfmReqSDt form-control" style="width:180px;float:left;"> 
									</div>
									<div class="col-md-1" style="align-items : center;">
										<h3>~</h3>
									</div>
									<div class="col-md-4" style="padding-left:0;">
										<input id="bcnfmReqSDt" name="bcnfmReqEDt" type="date" class="bcnfmReqEDt form-control" style="width:180px">
									</div>
								</div>
								<div class="col-md-6" style="padding-left:0;">
									<div class="col-md-3">		
										<label>승인일자 :</label>
									</div>
									<div class="col-md-4" style="padding-left:0;">		
										<input id="bcnfmCnfmSDt" name="bcnfmCnfmSDt" type="date" class="bcnfmCnfmSDt form-control" style="width:180px;float:left;"> 
									</div>
									<div class="col-md-1" style="align-items : center;">
										<h3>~</h3>
									</div>
									<div class="col-md-4" style="padding-left:0;">
										<input id="bcnfmCnfmEDt" name="bcnfmCnfmEDt" type="date" class="bcnfmCnfmEDt form-control" style="width:180px">
									</div>
								</div>
							</div>
					</div>
					<div class="col-md-3">
						<button type="button" class="btn_login"  id="srchBtn" style="width:100px">조회</button>
					</div>	
					<input type="hidden" name="page" value="1"> 
				</form>
			</div>
		</div>				
			
			 -->
			
			

	<div class="site-section">
		<div class="container">
			<div class="row mb-1" style="margin-top: 40px">
				<div class="section-header">
					<h2>회원목록 리스트</h2>
				</div>
			</div>
			<div>
				<div class="row">
					<div class="package text-center bg-white">
						<br />
						<table id="table" class="table table-hover">
							<tr>
								<th>선택</th>
								<th>ID</th>
								<th>회원명</th>
								<th>닉네임</th>
								<th>회원구분</th>
								<th>마일리지</th>
								<th>회원상태</th>
								<th>회원등록일자</th>
								<th>회원수정일자</th>
							</tr>
							<c:forEach items="${lists}" var="member" varStatus="status">
								<tr data-id="${member.memberId}">
									<td class="ckboxTd"><input type="checkbox" id="member${status.index}" name="checkMember" value="${member.memberId}"></td>
									<td>${member.memberId }</td>
									<td>${member.memberNm }</td>
									<td>${member.memberNicknm }</td>
									<td>${member.memberFlNm }</td>
									<td>${member.memberMile }</td>
									<td>${member.memberStNm }</td>
									<td><fmt:formatDate pattern="yyyy-MM-dd"  value="${member.insDt }" /></td>
									<td><fmt:formatDate pattern="yyyy-MM-dd"  value="${member.udtDt }" /></td>
								</tr>
							</c:forEach>
						</table>
					</div>
					<div align="right">
						<button type="submit" onclick="sleepMember()" class="btn_login"  style="width:80px">휴면해제</button>
						<button type="button" class="btn_login"  onclick="fnExcelReport('table','회원리스트');" style="width:100px">다운로드</button>
					</div><br><br><br>
				</div>
			</div>
		</div>
	</div>
	<form action="memberSelect" method="post" id="frm">
		<input type="hidden" id="memberId" name="memberId">
	</form>
	
	
<script type="text/javascript">
	function fnExcelReport(id, 회원리스트) {
		var tab_text = '<html xmlns:x="urn:schemas-microsoft-com:office:excel">';
		tab_text = tab_text + '<head><meta http-equiv="content-type" content="application/vnd.ms-excel; charset=UTF-8">';
		tab_text = tab_text + '<xml><x:ExcelWorkbook><x:ExcelWorksheets><x:ExcelWorksheet>'
		tab_text = tab_text + '<x:Name>Test Sheet</x:Name>';
		tab_text = tab_text + '<x:WorksheetOptions><x:Panes></x:Panes></x:WorksheetOptions></x:ExcelWorksheet>';
		tab_text = tab_text + '</x:ExcelWorksheets></x:ExcelWorkbook></xml></head><body>';
		tab_text = tab_text + "<table border='1px'>";
		var exportTable = $('#' + id).clone();
		exportTable.find('input').each(function (index, elem) { $(elem).remove(); });
		tab_text = tab_text + exportTable.html();
		tab_text = tab_text + '</table></body></html>';
		var data_type = 'data:application/vnd.ms-excel';
		var ua = window.navigator.userAgent;
		var msie = ua.indexOf("MSIE ");
		var fileName = '회원리스트' + '.xls';
	//Explorer 환경에서 다운로드
		if (msie > 0 || !!navigator.userAgent.match(/Trident.*rv\:11\./)) {
		if (window.navigator.msSaveBlob) {
			var blob = new Blob([tab_text], {
				type: "application/csv;charset=utf-8;"
			});
				navigator.msSaveBlob(blob, fileName);
			}
		} else {
			var blob2 = new Blob([tab_text], {
				type: "application/csv;charset=utf-8;"
			});
			var filename = fileName;
			var elem = window.document.createElement('a');
			elem.href = window.URL.createObjectURL(blob2);
			elem.download = filename;
			document.body.appendChild(elem);
			elem.click();
			document.body.removeChild(elem);
			}
		}
</script>
</body>
</html>