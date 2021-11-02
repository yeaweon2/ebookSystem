<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>도서목록</title>
<style type="text/css">

.box {
	margin: 0 0 0 0;
    border: 1px solid #e4e1e3;
    border-radius: 2px;
    padding: 1em 1em 1em 1em;
}

select {
	width:110px;
}
</style>
<script src='https://kit.fontawesome.com/a076d05399.js' crossorigin='anonymous'></script>
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
	
	$("#srchBtn").on("click", function(){
		
		var srchVal = $("#srchVal option:selected").val();
		var srchTxt = $("#srchTxt").val();
		var srchCnfmCd = $("#srchCnfmCd option:selected").val();
		var srchDate = $("#srchDate").val();
		
		var bookPublCo = "";
		var bookWriter = "";
		var bookNm = "";
		
		if( srchVal == "01"){
			bookNm = srchTxt;
		}else if( srchVal == "02"){
			bookPublCo = srchTxt;
		}else{
			bookWriter = srchTxt;
		}
		
		var bookFlCd = "";

		if( $("input[name='bookFlCd']:checked").val() != "ALL"){
			bookFlCd = $("input[name='bookFlCd']:checked").val();
		}
		console.log(srchDate);
		
		$.ajax({
			url : 'bookSrchList' ,
			method : 'POST' ,
			data : JSON.stringify(
				{ bookNm : bookNm
				, bookPublCo : bookPublCo
				, bookWriter : bookWriter 
				, insDt : srchDate
				, srchCnfmCd : srchCnfmCd
				, bookFlCd : bookFlCd }
			),
			contentType : 'application/json',
			dataType : 'json' ,
			success : function(res){
				console.log(res);
				
				$("#bookTb").find("tbody").empty();
				
				$.each(res,function(idx,item){
					$("#bookTb").find("tbody")
					.append( $("<tr>")
								.append($("<td class='chkTd'>").append( $("<input type='checkbox' id='chkInput' >")))
								.append($("<td>").html(item.bookNo) )
								.append($("<td>").html(item.bookFlCd) )
								.append($("<td>").html(item.insDt) )
								.append($("<td>").append( $("<img width='50' height='70'>").attr("src", "/prj/fileUp" + item.bookCoverPath + item.bookCover )))
								.append($("<td>").html(item.bookNm) )
								.append($("<td>").html(item.bookPublCo) )
								.append($("<td>").html(item.bookWriter) )
								.append($("<td>").html(item.memberNm) )
								.append($("<td class='cnfmStNm'>").html(item.cnfmStNm) )
								.data("id", item.bookId)
					);
				});
				
				
				$(".cnfmStNm").each(function (index, item) {
					if(item.innerText == "승인"){
						item.style.color = "red";
						item.style.fontWeight = "bold"; 
						
					}else if(item.innerText == "보류"){
						item.style.color = "#0c2e8a";
						item.style.fontWeight = "bold"; 
					}					
				});
				
			}
		});  
	});
});
</script>
</head>
<body>
	<div class="inner-page pt-6">
		<div>
			<div class="row mb-1" style="margin-top: 40px">
				<div class="section-header">
	          		<h2><i class='fas fa-book' style='font-size:24px'></i> BOOK 목록</h2>
	        	</div>
			</div>	
			<div class="row">
				<div class="box">
					<label> 검색조건 : </label>
					<select id="srchVal" class="form-select form-select-sm">
						<option value="01" selected>제목</option>
						<option value="02">출판사</option>
						<option value="03">저자</option>
					</select>
					<input type="text" id="srchTxt">
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<label>승인상태 : </label>
					<select id="srchCnfmCd" class="form-select form-select-sm">
						<option value="00" selected>전체</option>
						<option value="04">미신청</option>
						<option value="01">처리중</option>
						<option value="03">보류</option>
						<option value="02">승인</option>
					</select>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<label>등록일자 : </label>
					<input type="date" id="srchDate">
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<button type="button" id="srchBtn" class="btn btn-primary" >조회</button>
					<label>BOOK 구분 : </label>
					<input type="radio" id="bookFlCd" name="bookFlCd" value="ALL" checked >전체
					<input type="radio" id="bookFlCd" name="bookFlCd" value="E" >eBook
					<input type="radio" id="bookFlCd" name="bookFlCd" value="A" >오디오북
				</div>
				
			</div>
			<div class="row" style="margin-top:20px">
				<table id="bookTb" class="table table-hover" style="cursor: pointer;">
					<thead>
						<tr>
							<th></th>
							<th>No</th>
							<th>구분</th>
							<th>등록일자</th>
							<th></th> 
							<th>BOOK</th>
							<th>출판사</th>
							<th>저자</th>
							<th>매니저</th>
							<th>승인상태</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="list" items="${lists}" >
							<tr data-id="${list.bookId}">
								<td class="chkTd" ><input type="checkbox" id="chkInput" ></td>
								<td>${list.bookNo}</td>
								<td>${list.bookFlCd}</td>
								<td><fmt:formatDate pattern="yyyy-MM-dd hh:mm:ss"  value="${list.insDt}"/></td>
								<td>
									<c:if test="${not empty list.bookCoverPath}">
										<img width="50" height="70" src="${pageContext.request.contextPath}/fileUp${list.bookCoverPath}${list.bookCover}">&nbsp;&nbsp;
									</c:if>
								</td>									
								<td>${list.bookNm}</td>
								<td>${list.bookPublCo}</td>
								<td>${list.bookWriter}</td>
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
								<c:if test="${list.cnfmStNm eq '미신청'}">
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

