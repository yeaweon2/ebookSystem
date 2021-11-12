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
	
	$("#srchBtn").click();
	
	var clickPageNo = 0;
	// 테이블 클릭시 상세보기로 이동 
	$("table").on("click", "tr", function(){ 
		event.stopPropagation();
		var id = $(this).closest("tr").data("id");
		$("#bookId").val(id);
		frm.submit();
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
			alert("BOOK 파일을 등록하지 않은 건은 승인신청 할 수 없습니다.");
			return false;
		}
		 
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
			url : 'bookSrchList' ,
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
					.append( $("<tr>")
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
				<button id="bookCnfmBtn" class="btn ebookBtn-sm pull-right" >승인신청</button>
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
							<tr data-id="${list.bookId}" data-filecnt="${list.fileCnt}">
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
								<td>${list.fileCnt}</td>
								<td>${list.memberNm}</td>
								<c:if test="${list.cnfmStNm eq '승인'}">
									<td style="color:red;font-weight:bold">${list.cnfmStNm}</td>
								</c:if>
								<c:if test="${list.cnfmStNm eq '보류'}">
									<td style="color:#0c2e8a;font-weight:bold">${list.cnfmStNm}</td> 
								</c:if>
								<c:if test="${list.cnfmStNm eq '처리중'}">
									<td style="color:green;font-weight:bold">${list.cnfmStNm}</td>
								</c:if>
								<c:if test="${list.cnfmStNm eq '미신청'}">
									<td>${list.cnfmStNm}</td>
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


