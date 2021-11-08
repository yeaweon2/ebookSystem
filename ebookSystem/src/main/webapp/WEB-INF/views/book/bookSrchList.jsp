<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BOOK조회</title>
<style type="text/css">
.row {
	margin-bottom : 10px;
}

</style>
<script type="text/javascript">
	$(function(){
		// 화면 진입시 카테고리 대분류 조회 후 셋팅 --------------------------------------------------------------------------------------
		$.ajax({
			url: 'ctgyLcodeList',    
			method: 'GET',
			contentType : 'application/json;charset=utf-8',
			dataType: 'json',
			success: function(res){
				
				$("#lcodeSelBox").empty();
				
				$("#lcodeSelBox").append($("<option>").val("").text("전체"));
				$.each(res, function(idx,item){
					$("#lcodeSelBox").append($("<option>").val(item.ctgyId).text(item.ctgyNm)); 
				});
				
				
				$("#lcodeSelBox").change();
			}
		});

		// 대분류 카테고리 선택시 소분류 select box에 셋팅 -------------------------------------------------------------------------------- 
		$("#lcodeSelBox").on("change", function(){
			var ctgyGrId = $(this).find("option:selected").val();
			$("#ctgyGrId").val($(this).find("option:selected").val());
				
			$.ajax({
				url: 'ctgyDetailList',    
				method: 'POST',
				data : JSON.stringify({ ctgyGrId : ctgyGrId }),
				contentType : 'application/json',
				dataType: 'json',
				success: function(res){
					
					$("#scodeSelBox").empty();
					$("#scodeSelBox").append($("<option>").val("").text("전체"));
					$.each(res, function(idx,item){
						$("#scodeSelBox").append($("<option>").val(item.ctgyId).text(item.ctgyNm));
					});
					$("#ctgyId").val($("#scodeSelBox").find("option:selected").val());
				}
			});
		});
		
		// 소분류 카테고리 선택시 카테고리 값 셋팅 -------------------------------------------------------------------------------
		$("#scodeSelBox").on("change", function(){
			$("#ctgyId").val($(this).find("option:selected").val());
		});
		
		$("#srchBtn").on("click", function(){
			
			var bookNm = $("#bookNm").val();
			var bookPublCo = $("#bookPublCo").val();
			var bookWriter = $("#bookWriter").val();
			var bookPublSDt = $("#bookPublSDt").val();
			var bookPublEDt = $("#bookPublEDt").val();
			
			if( bookPublSDt != null && bookPublEDt == null ){
				alert("출간일 조회시 시작 및 종료일자를 모두 입력해주세요.");
				return false;
			}
			
			
			var ctgyId = $("#ctgyId").val();
			var ctgyGrId = $("#ctgyGrId").val();
			
			var bookFlCd = "";

			if( $("input[name='bookFlCd']:checked").val() != ""){
				bookFlCd = $("input[name='bookFlCd']:checked").val();
			}
			
			start = 1;
			end = 8;
			
			
			$.ajax({
				url: 'bookSrchPage',    
				method: 'POST',
				data :  JSON.stringify(
						{ 
							  bookNm : bookNm
							, bookPublCo : bookPublCo
							, bookWriter : bookWriter 
							, bookPublSDt : bookPublSDt
							, bookPublEDt : bookPublEDt
							, bookFlCd : bookFlCd
							, ctgyId : ctgyId
							, ctgyGrId : ctgyGrId
							, start : start 
							, end : end			
						}
					),
				contentType : 'application/json',
				dataType: 'json',
				success: function(res){
					console.log(res);
					
					$("#srchBody").empty();
					$.each(res.lists,function(idx,item){
						
						$("#srchBody").append( 
								$("<tr class='srchTr' data-id='" + item.bookId + "'>").append( $("<td>").html( item.bookFlCd) )
										 .append( $("<td>").html( item.ctgyGrNm + ">" + item.ctgyIdNm ) )
										 .append( $("<td>").append($("<img width='50' height='70'>").attr("src", "/prj/fileUp" + item.bookCoverPath + item.bookCover ) ) )
										 .append( $("<td>").html( item.bookNm) )		 
										 .append( $("<td>").html( item.bookPublCo) )
										 .append( $("<td>").html( item.bookWriter ) )
										 .append( $("<td>").html( item.bookPublDt ) )
						)	
					});
				}
			});
		});
		
		
		$("#srchBody").on("click", "tr", function(){
			console.log($(this).data("id"));
			
			if( $(this).data("id") != "null" ){
				$(".bookId").val( $(this).data("id"));
				detailFrm.submit();
			}else{
				return false;
			}
		});
	});

</script>

</head>
<body>
<section>
	<div class="section-inner">		
		<div class="container">
			<div class="row">
				<h2 class="section-heading">BOOK 검색</h2>
			</div>
			<div class="row">
				<form id="frm" name="frm" >
					<div class="box row">
						<div class="col-md-10">
							<div class="row">	
								<div class="col-md-6" style="padding-left:0;">	
									<div class="col-md-3">		
										<label>카테고리</label>
									</div>
									<div class="col-md-9">
										<select id="lcodeSelBox" class="form-control" style="float:left;width:150px;margin-right:10px"></select><select id="scodeSelBox" class="form-control" style="float:left;width:150px;" ></select>
									</div>
									<input type="hidden" id="ctgyId" name="ctgyId" >
									<input type="hidden" id="ctgyGrId" name="ctgyGrId" >
								</div>
								<div class="col-md-6">
									<label style="margin-right:20px">BOOK구분</label>
									<input id="eBook" name="bookFlCd" type="radio" value="E" class="form-check-input" checked required>
									<label class="form-check-label" for="eBook">eBook</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									<input id="audioBook" name="bookFlCd" type="radio" value="A" class="form-check-input" required>
									<label class="form-check-label" for="audioBook">오디오북</label>
								</div>
							</div>
							<div class="row">
								<div class="col-md-6">
									<label>BOOK명</label>
									<input id="bookNm" name="bookNm" type="text" class="form-control">
								</div>
								<div class="col-md-6">
									<label>ISBN</label>
									<input id="bookIsbn" name="bookIsbn" type="text" class="form-control">
								</div>
							</div>
							<div class="row">
								<div class="col-md-6">
									<label>출판사</label>
									<input id="bookPublCo" name="bookPublCo" type="text" class="form-control">
								</div>
								<div class="col-md-6">
									<label>저자</label>
									<input id="bookWriter" name="bookWriter" type="text" class="form-control">
								</div>
							</div>
							<div class="row">
								<div class="col-md-6" style="padding-left:0;">
									<div class="col-md-3">		
										<label>출간일</label>
									</div>
									<div class="col-md-4" style="padding-left:0;">		
										<input id="bookPublSDt" name="bookPublSDt" type="date" class="form-control" style="width:180px;float:left;"> 
									</div>
									<div class="col-md-1" style="align-items : center;">
										<h3>~</h3>
									</div>
									<div class="col-md-4" style="padding-left:0;">
										<input id="bookPublEDt" name="bookPublEDt" type="date" class="form-control" style="width:180px">
									</div>
								</div>
								<div class="col-md-6">
								</div>
							</div>
						</div>
						<div class="col-md-2">
							<button type="button" id="srchBtn" class="btn ebookBtn" style="position: relative;top:200px;left:40px">조 회</button>
						</div>	
					</div><!-- Box End -->
					<div class="row box">
						<table class="table table-striped table-hover pointer">
							<thead>
								<tr>
									<th>구분</th>
									<th>카테고리</th>
									<th>BOOK</th>
									<th></th>
									<th>출판사</th>
									<th>저자</th>
									<th>출간일</th>
								</tr>
							</thead>
							<tbody id="srchBody">
								<c:if test="${ not empty lists }">
									<c:forEach var="book" items="${lists}">
										<tr data-id='${book.bookId}'>
											<td>${book.bookFlCd}</td>
											<td>${book.ctgyGrNm}${book.ctgyNm}</td>
											<td><img width="50" height="70" src="${pageContext.request.contextPath}/fileUp${book.bookCoverPath}${book.bookCover}"></td>
											<td>${book.bookNm}</td>
											<td>${book.bookPublCo}</td>
											<td>${book.bookWriter}</td>
											<td>${book.bookPublDt}</td>
										</tr>
									</c:forEach>
									
								</c:if>
								<c:if test="${ empty lists }">
									<tr height="300px" style="text-align : center;" data-id="null">
										<td colspan="7" style="text-align : center;"><h5>검색조건을 입력한 후 조회해주세요.</h5></td>
									</tr>
								</c:if>
								
							</tbody>
						</table>
					</div>
				</form>
			</div>
		</div>
	</div>
</section>
<form action="bookDetail" method="post" id="detailFrm">
	<input type="hidden" class="bookId" name="bookId" >
</form>

</body>
</html>
