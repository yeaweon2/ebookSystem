<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
 <%@ taglib prefix="my" tagdir="/WEB-INF/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>도서목록</title>
<style type="text/css">

</style>
<script src='https://kit.fontawesome.com/a076d05399.js' crossorigin='anonymous'></script>
<script type="text/javascript">
$(function(){
	var pageFlag= 'sub';
	// 화면 진입시 카테고리 대분류 조회 후 셋팅 --------------------------------------------------------------------------------------
	$.ajax({
		url: 'ctgyLcodeList',    
		method: 'POST',
		data : JSON.stringify({ pageFlag : pageFlag }),
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
			data : JSON.stringify({ ctgyGrId : ctgyGrId,  pageFlag : pageFlag }),
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
	
	
	$("#srchBtn").click();
	
	var clickPageNo = 0;
	// 테이블 클릭시 상세보기로 이동 
	$("table").on("click", "tr", function(){ 
		event.stopPropagation();
		var id = $(this).closest("tr").data("id");
		$("#bookId").val(id);
		frm.submit();
	});
	
	// 승인취소 클릭시
	$("#bookCnfmCancelBtn").on("click", function(){
		
		var book = [];
		var chk = 0;
		
		$("#chkInput:checked").each(function(){
			var bcnfmId = $(this).closest("tr").data("bcnfmid");
			var bookId = $(this).closest("tr").data("id");
			var cnfmStNm = $(this).closest("tr").find("cnfmStNm").html();
			var cnfmyn = $(this).closest("tr").data("cnfmyn");
			
			console.log(bcnfmId + " / " + cnfmyn);
			
			if( bcnfmId != "" && cnfmyn == "N" ){
				console.log("here");
				var data = {
					bcnfmId : bcnfmId,
					bookId : bookId
				};
				book.push(data);
			}else{
				chk++;
				Swal.fire({ 
				   icon: 'error',  
				   title: '처리중인 건만 선택해주세요.',  
				   text: '승인완료건은 관리자 승인취소 후 가능합니다.',  
				});
				return false;
			}
	    });

		console.log(book);
		console.log(chk);
		
		if( chk < 1 ){
			$.ajax({
				url : 'bookCnfrmCancel' ,
				data :  JSON.stringify(book)  ,
	 			contentType : 'application/json',
				method : 'POST' ,
				dataType : 'json' ,
				success : function(data){
					console.log(data);
					$("#srchBtn").click();
				}
			});
		}
	});
	
	// 승인버튼 클릭시
	$("#bookCnfmBtn").on("click", function(){

		var fileCntChk = 0; 
		var tdArr = []; 
		$("#chkInput:checked").each(function(){
			var fileCnt = $(this).closest("tr").data("filecnt");
			var id = $(this).closest("tr").data("id");
			if( id != "" ){
				tdArr.push(id);	
			}
			
			if( fileCnt < 1 ){
				fileCntChk++;
			}
	    });
		
		if(fileCntChk > 0){
			Swal.fire({ 
			   icon: 'error',  
			   title: 'BOOK파일 미등록건',  
			   text: 'BOOK 파일을 등록 후 진행해 주세요.',  
			});
			return false;
		}
		 
 		$.ajax({
			url : 'bookCnfrmReq' ,
			data : { tdArr : tdArr } ,
			method : 'POST' ,
			dataType : 'json' ,
			success : function(data){
				console.log(data);
				console.log(data.bookNm);
				var bookNm = data.bookNm;
				var msg = "";
				var icon = "error";
				
				if( data.bcnfmStCd == "01"){
					msg = '이미 승인신청이 진행중인 BOOK입니다.';
				}else if( data.bcnfmStCd == "02"){
					msg = '이미 승인완료된 BOOK입니다.';
				}else if( data.bcnfmStCd == "00" ){
					icon = 'success' ;
					bookNm = "승인처리완료";
					msg = '정상적으로 승인처리 되었습니다.';
				}
				
				Swal.fire({ 
				   icon: icon,  
				   title: bookNm,  
				   text: msg,  
				});

			}
		});  
	});
	
	// 체크박스가 있는 Column 클릭시, 
	$("#bookTb").find("tbody").on("click", ".chkTd", function(){
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

		if( $("input[name='bookFlCd']:checked").val() != ""){
			bookFlCd = $("input[name='bookFlCd']:checked").val();
		}
	
		if( clickPageNo == 0 ){
			start = 1;
			end = 8;
			
		}else{
			start = ((clickPageNo-1)*8)+1;
			end = parseInt(clickPageNo)*8;	
		}
		
		
		console.log("페이징 클릭처리====>");
		console.log(start + " / " + end );		
		
		$.ajax({
			url : 'bookSrchBtnList' ,
			method : 'POST' ,
			data : JSON.stringify(
				{ 
					  bookNm : bookNm
					, bookPublCo : bookPublCo
					, bookWriter : bookWriter 
					, insDt : srchDate
					, srchCnfmCd : srchCnfmCd
					, bookFlCd : bookFlCd
					, start : start 
					, end : end			
				}
			),
			contentType : 'application/json',
			dataType : 'json' ,
			success : function(res){
				console.log(res);
				
				$("#bookTb").find("tbody").empty();
				
				$.each(res.lists,function(idx,item){
					$("#bookTb").find("tbody")
					.append( $("<tr>").data("bcnfmid", item.bcnfmId).data("filecnt", item.fileCnt).data("cnfmyn", item.bookCnfmYn).data("id", item.bookId)
								.append($("<td class='chkTd'>").append( $("<input type='checkbox' id='chkInput' >")))
								.append($("<td>").html(item.bookNo) )
								.append($("<td>").html(item.bookFlCd) )
								.append($("<td>").html(item.insDt) )
								.append($("<td>").append( $("<img width='50' height='70'>").attr("src", "/prj/fileUp" + item.bookCoverPath + item.bookCover )))
								.append($("<td>").html(item.bookNm) )
								.append($("<td>").html(item.bookPublCo) )
								.append($("<td>").html(item.bookWriter) )
								.append($("<td>").html(item.fileCnt) )
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
					}else if(item.innerText == "처리중"){
						item.style.color = "green";
						item.style.fontWeight = "bold"; 
					}										
				});
				
				$("#pagingDiv").empty();
				
				var startPage = res.paging.startPage;
				var endPage = res.paging.endPage;
				var lastPage = res.paging.lastPage;
				
				var pageNum = 0;
				
				if( startPage > 2){
					startPage = startPage-1;
				}else{
					startPage = 1;
				}
				
				if( endPage < lastPage ){
					endPage = endPage + 1;
				}
				
				$("#pagingDiv").append($("<ul class='pagination'>")
											.append($("<li class='page-item'>")
													.append($("<a class='page-link' href='#')'>").html("이전"))));
				for(var i = res.paging.startPage ; i <= res.paging.endPage; i++ ){
					$(".pagination").append(							
							$("<li>").append( $("<a class='page-link' href='#' data-pageno='"+ i +"' >").html(i))
					);
				}
				
				$(".pagination").append(							
						$("<li class='page-item'>").append($("<a class='page-link' href='#'>").html("다음"))
				);
			}
		});  
	});
	
	
	$("#pagingDiv").on("click", "a" , function(){
		event.preventDefault();
		
		clickPageNo = $(this).data("pageno");
		
		console.log("here--------------------------------->");
		console.log($(this).html());
		
		if($(this).html() == "이전"){
			clickPageNo = $(this).closest("li").next().find("a").html();
		}
		
		if($(this).html() == "다음"){
			clickPageNo = $(this).closest("li").prev().find("a").html();
		}
		
		console.log("clickPageNo ==>" + clickPageNo);
		
		
		$("#srchBtn").click();
	});
});

function goList(p) {
	searchFrm.page.value=p;
	searchFrm.submit();
}
</script>
</head>
<body>
<section>
	<div class="section-inner">		
		<div class="container">
			<div class="row mb-1" style="margin-top: 40px">
				<div class="section-header">
	          		<h2><i class='fas fa-book' style='font-size:24px'></i> BOOK 목록</h2>
	        	</div>
			</div>	
			<div class="row box" >
				<form name="searchFrm">
					
						<div class="col-md-9">
						
							<div class="row">
								<div class="col-md-6" style="padding-left:0;">	
									<div class="col-md-3">		
										<label>카테고리 :</label>
									</div>
									<div class="col-md-9">
										<select id="lcodeSelBox" class="form-control" style="float:left;width:150px;margin-right:10px"></select><select id="scodeSelBox" class="form-control" style="float:left;width:150px;" ></select>
									</div>
									<input type="hidden" id="ctgyId" name="ctgyId" >
									<input type="hidden" id="ctgyGrId" name="ctgyGrId" >
								</div>
								<div class="col-md-6">
									<label style="margin-right:20px">BOOK구분 : </label>
									<input id="all" name="bookFlCd" type="radio" value="" class="form-check-input" checked required>
									<label class="form-check-label" for="all">전체</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									<input id="eBook" name="bookFlCd" type="radio" value="E" class="form-check-input" checked required>
									<label class="form-check-label" for="eBook">eBook</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									<input id="audioBook" name="bookFlCd" type="radio" value="A" class="form-check-input" required>
									<label class="form-check-label" for="audioBook">오디오북</label>
								</div>
							</div>
							<div class="row" >
								<div class="col-md-6" style="padding-left:0px">
									<div class="col-md-3" >
										<label> 검색조건 : </label>
									</div>
									<div class="col-md-3" style="margin-left:0px">
										<select id="srchVal" class="form-control" style="width:100px;">
											<option value="01" selected>제목</option>
											<option value="02">출판사</option>
											<option value="03">저자</option>
										</select>
									</div>
									<div class="col-md-6" style="margin-left:0px">
										<input type="text" id="srchTxt" class="form-control" >
									</div>
								</div>
								<div class="col-md-6" >
									<div class="col-md-3" style="padding-left:0px; padding-right:0px;"> 
										<label>승인상태 : </label>
									</div>
									<div class="col-md-9" style="padding-left:0px">
										<select id="srchCnfmCd" class="form-control" style="width:120px;">
											<option value="00" selected>전체</option>
											<option value="04">미신청</option>
											<option value="01">처리중</option>
											<option value="03">보류</option>
											<option value="02">승인</option>
										</select>
									</div>
								</div>
							</div>
							<div class="row">
								<div class="col-md-6"> 
									<div class="col-md-3" style="padding-left:0px">
										<label>등록일자 : </label>
									</div>
									<div class="col-md-9" style="padding-left:0px">
										<input type="date" id="srchDate" class="form-control" style="width:200px;">
									</div>
								</div>
								<div class="col-md-6"></div>
							</div>
						</div>
						<div class="col-md-3">
							<button type="button" id="srchBtn" class="btn ebookBtn-sm" >조회</button>
						</div>	
					<input type="hidden" name="page" value="1"> 
				</form>
			</div>
			<div class="row" style="margin-right:20px;margin-top:20px">
				<c:if test="${not empty mcnEd}">
					<button id="bookCnfmBtn" class="btn ebookBtn-sm pull-right" >승인신청</button>
					<button id="bookCnfmCancelBtn" class="btn ebookBtn-sm pull-right" >승인취소</button>
				</c:if>
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
							<th>파일갯수</th>
							<th>매니저</th>
							<th>승인상태</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="list" items="${lists}" >
							<tr data-id="${list.bookId}" data-filecnt="${list.fileCnt}" data-bcnfmid="${list.bcnfmId}" data-cnfmyn="${list.bookCnfmYn }">
								<td class="chkTd" ><input type="checkbox" id="chkInput" ></td>
								<td>${list.bookNo}</td>
								<td>${list.bookFlCd}</td>
								<td><fmt:formatDate pattern="yyyy-MM-dd"  value="${list.insDt}"/></td>
								<td>
									<c:if test="${not empty list.bookCoverPath}">
										<img width="50" height="70" src="${pageContext.request.contextPath}/fileUp${list.bookCoverPath}${list.bookCover}">&nbsp;&nbsp;
									</c:if>
								</td>									
								<td>${list.bookNm}</td>
								<td>${list.bookPublCo}</td>
								<td>${list.bookWriter}</td>
								<td>${list.fileCnt}</td>
								<td>${list.memberNm}</td>
								<c:if test="${list.cnfmStNm eq '승인'}">
									<td style="color:red;font-weight:bold" id="cnfmStNm">${list.cnfmStNm}</td>
								</c:if>
								<c:if test="${list.cnfmStNm eq '보류'}">
									<td style="color:#0c2e8a;font-weight:bold" id="cnfmStNm">${list.cnfmStNm}</td> 
								</c:if>
								<c:if test="${list.cnfmStNm eq '처리중'}">
									<td style="color:green;font-weight:bold" id="cnfmStNm">${list.cnfmStNm}</td>
								</c:if>
								<c:if test="${list.cnfmStNm eq '미신청'}">
									<td id="cnfmStNm">${list.cnfmStNm}</td>
								</c:if>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
			<div id="pagingDiv" class="row" style="text-align: center;" >
				<my:paging jsFunc="goList" paging="${paging}" />  
			</div>		
		</div>
	</div>
</section>
<form action="bookUpdateForm" method="post" id="frm">
	<input type="hidden" id="bookId" name="bookId" >
</form>	
</body>
</html>


