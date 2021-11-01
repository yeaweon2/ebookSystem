<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>도서목록</title>
<script type="text/javascript">
$(function(){
	// 테이블 클릭시 상세보기로 이동 
	$("table").on("click", "tr", function(){ 
		event.stopPropagation();
		var id = $(this).closest("tr").data("id");
		$("#bookId").val(id);
		frm.submit();
	});
	
	// 승인버튼 클릭시
	$("#bookCnfmBtn").on("click", function(){

		var tdArr = []; 
		$("#chkInput:checked").each(function(){
			
			var id = $(this).closest("tr").data("id");
			console.log(id);
			if( id != "" ){
				tdArr.push(id);	
			}
	    });
	
 		 $.ajax({
			url : 'bookCnfrmReq' ,
			data : { tdArr : tdArr } ,
			method : 'POST' ,
			dataType : 'json' ,
			success : function(data){
				console.log(data);
			}
		});  
	});
	
	// 체크박스가 있는 Column 클릭시, 
	$(".chkTd").on("click",  function(){
		event.stopPropagation();
		
		if($(event.target).find("#chkInput").prop('checked') == false){
			$(event.target).find("#chkInput").prop('checked', true);
			$(event.target).closest("tr").css("backgroundColor" , "#50d8af");
		}else{
			$(event.target).find("#chkInput").prop('checked', false);
			$(event.target).closest("tr").css("backgroundColor" , "");
		}
	});
});
</script>
</head>
<body>
	<div class="inner-page pt-6">
		<div class="container">
			<div class="row mb-1" style="margin-top: 40px">
				<div class="section-header">
	          		<h2>BOOK 목록</h2>
	        	</div>
			</div>	
			<div class="row">
				<table id="bookTb" class="table table-hover" style="cursor: pointer;">
					<tr>
						<th></th>
						<th>No</th>
						<th>구분</th>
						<th>등록일자</th> 
						<th>BOOK명</th>
						<th>출판사</th>
						<th>저자</th>
						<th>금액</th>
						<th>할인율</th>
						<th>매니저</th>
						<th>승인상태</th>
					</tr>
					<tbody>
						<c:forEach var="list" items="${lists}" >
							<tr data-id="${list.bookId}">
								<td class="chkTd" ><input type="checkbox" id="chkInput" ></td>
								<td>${list.bookNo}</td>
								<td>${list.bookFlCd}</td>
								<td><fmt:formatDate pattern="yyyy-MM-dd"  value="${list.insDt}"/></td>
								<td>
									<c:if test="${not empty list.bookCoverPath}">
										<img width="50" height="70" src="${pageContext.request.contextPath}/fileUp${list.bookCoverPath}${list.bookCover}">&nbsp;&nbsp;
									</c:if>
									${list.bookNm}</td>
								<td>${list.bookPublCo}</td>
								<td>${list.bookWriter}</td>
								<td>${list.bookAmt}</td>
								<td>${list.bookDiscnt}</td>
								<td>${list.memberNm}</td>
								<c:if test="${list.cnfmStNm eq '승인'}">
									<td style="color:red;font-weight:bold">${list.cnfmStNm}</td>
								</c:if>
								<c:if test="${list.cnfmStNm eq '보류'}">
									<td style="color:#0c2e8a;font-weight:bold">${list.cnfmStNm}</td> 
								</c:if>
								<c:if test="${list.cnfmStNm eq '처리중'}">
									<td>${list.cnfmStNm}</td>
								</c:if>
								<c:if test="${empty list.cnfmStNm}">
									<td>${list.cnfmStNm}</td>
								</c:if>								
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
			<div class="btn-group">
				<button id="bookCnfmBtn" class="btn btn-primary">승인신청</button>
			</div>
		</div>
	</div>
	
<form action="bookUpdateForm" method="post" id="frm">
	<input type="hidden" id="bookId" name="bookId" >
</form>	
</body>
</html>

