<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>매니저리스트</title>
<link href="resources/css/form-validation.css" rel="stylesheet">
<link href="resources/assets/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="canonical" href="https://getbootstrap.com/docs/5.1/examples/checkout/">

<script  src="http://code.jquery.com/jquery-latest.min.js"></script>

<script src="resources/js/form-validation.js"></script>
<script src="resources/assets/dist/js/bootstrap.bundle.min.js"></script>
<script type="text/javascript">

//  업체회원 승인
	function confirmManager() { 
		var managerArr = [];
		
		$("input[name=checkManager]:checked").each(function() { 
			console.log($(this).val());
			managerArr.push($(this).val());
		});
	
		$.ajax({
			url : 'managerCfChange' ,
			type : 'post',
			dataType: 'json',
			data : { managerArr : managerArr },
			success: function(res){
				alert("success");
				},
			error : function(rej){
				console.log(rej);
			}
		});
		alert("업체등록 승인완료.");
	}


</script>
</head>
<body>
<div class="site-section">
		<div class="container">
			<div class="row mb-1" style="margin-top: 40px">
				<div class="section-header">
					<h2>매니저(업체회원) 목록</h2>
				</div>
			</div>
			<div>
				<div class="row">
					<div class="package text-center bg-white">
						<br />
						<table id="lcodeTb" class="table table-hover">
							<tr>
								<th>선택</th>
								<th>승인ID</th>
								<th>회원ID</th>
								<th>상호명</th>
								<th>대표자명</th>
								<th>승인신청일자</th>
								<th>승인처리일자</th>
								<th>승인상태</th>
								<th>계약시작일자</th>
								<th>계약종료일자</th>
								<th>계약구분</th>
								<th>승인자ID</th>
							</tr>
							<c:forEach items="${lists}" var="managerConfirm" varStatus="status">
								<tr>
									<td><input type="checkbox" id="member${status.index}" name="checkManager" value="${managerConfirm.mcnfmId}"></td>
									<td>${managerConfirm.mcnfmId }</td>
									<td>${managerConfirm.memberId }</td>
									<td>${managerConfirm.mcnfmCoNm }</td>
									<td>${managerConfirm.mcnfmRpspr }</td>
									<td>${managerConfirm.mcnfmReqDt }</td>
									<td>${managerConfirm.mcnfmCnfmDt }</td>
									<td>${managerConfirm.mcnfmStNm }</td>
									<td>${managerConfirm.mcnfmCntrSdt }</td>
									<td>${managerConfirm.mcnfmCntrEdt }</td>
									<td>${managerConfirm.mcnfmCntrFlNm }</td>
									<td>${managerConfirm.mcnfmCnfmr}</td>
								</tr>
							</c:forEach>
						</table>
					</div>
					<div>
						<button type="submit" onclick="confirmManager()" class="btn btn-outline-primary">승인</button>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>