<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="my" tagdir="/WEB-INF/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BOOK 승인목록</title>
<style type="text/css">
	.modal {
	  display: none; /* Hidden by default */
	  position: fixed; /* Stay in place */
	  z-index: 1; /* Sit on top */
	  padding-top: 50px; /* Location of the box */
	  left: 0;
	  top: 0;
	  width: 100%; /* Full width */
	  height: 100%; /* Full height */
	  overflow: auto; /* Enable scroll if needed */
	  background-color: rgb(0,0,0); /* Fallback color */
	  background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
	}
	
	/* Modal Content */
	.modal-content {
	  background-color: #fefefe; 
	  margin: auto;
	  width: 50%; /* Full width */
	  height: 30%; /* Full height */	  
	  padding: 30px;
	  border: 1px solid #888;
	}
	
	/* The Close Button */
	.close {
	  color: #aaaaaa;
	  float: right;
	  font-size: 40px;
	  font-weight: bold;
	}
	
	.close:hover,
	.close:focus {
	  color: #000;
	  text-decoration: none;
	  cursor: pointer;
	}
	
select {
	width:110px;
}	
</style>
<script type="text/javascript">
	$(function(){
		var pageFlag= 'sub';
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
				data : JSON.stringify({ ctgyGrId : ctgyGrId , pageFlag : pageFlag }),
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
		
		
		$("#srchCnfmCd").on("change", function(){
			$("#bcnfmStCd").val($(this).find("option:selected").val());
		});
		
		// 승인취소
		$("#cnfmCancelBtn").on("click", function(){
			var chkCnt = 0;
			var book = [];
			var cnt = 0;
			$(".chkInput:checked").each(function(){
				cnt++;
				
				if( bcnfmId != "" && cnfmyn == "Y" ){
					var bcnfmId = $(this).closest("tr").data("bcnfmid");
					var bookId = $(this).closest("tr").data("bookid");
					var data = {
						bcnfmId : bcnfmId,
						bookId : bookId
					};
					
					book.push(data);
				}else{
					Swal.fire({ 
					   icon: 'error',  
					   title: '승인취소완료',  
					   text: '정상적으로 취소 처리되었습니다.',  
					});
					return false;
				}
				
				
		    });
			
			console.log(book);
			
			if( cnt == 0 ){
				Swal.fire({ 
				   icon: 'error',  
				   title: '선택된 건이 없습니다.',  
				   text: '승인처리건을 선택한 후 진행해주세요.',  
				});			
				return false;
			}
			
			Swal.fire({
                title: 'BOOK 승인취소',
                text: "해당 자료를 승인취소 하시겠습니까?",
                icon: 'warning',
                showCancelButton: true,
                confirmButtonColor: '#3085d6',
                cancelButtonColor: '#d33',
                confirmButtonText: '승인',
                cancelButtonText: '취소'
            }).then((result) => {
                if (result.isConfirmed) {        			
	      			 $.ajax({
	      				url : 'bookAdminCnfmCancel' ,
	      				data :  JSON.stringify(book)  ,
	      				contentType : 'application/json',
	      				method : 'POST' ,
	      				dataType : 'json' ,
	      				success : function(data){
	      					console.log(data);
	      					
	      					Swal.fire({ 
	      					   icon: 'success',  
	      					   title: '승인취소완료!!',  
	      					   text: '정상적으로 취소 처리되었습니다.',  
	      					});
	      					
	      					goList(1);
	      				}
	      			}); 
				}
        	});
			
		});
		
		// 승인
		$("#cnfmBtn").on("click", function(){
            	var chkCnt = 0;
    			var book = [];
    			var cnt = 0;
    			$(".chkInput:checked").each(function(){
    				cnt++;
    				var filecnt = $(this).closest("tr").data("filecnt");
    				if( filecnt == '0'){
    					chkCnt++;
    				} 
    				
    				var bcnfmId = $(this).closest("tr").data("bcnfmid");
    				var bookId = $(this).closest("tr").data("bookid");
    				var data = {
    					bcnfmId : bcnfmId,
    					bookId : bookId
    				};
    				
    				book.push(data);
    		    });
    			
    			console.log(book);
    			
    			if( cnt == 0 ){
    				Swal.fire({ 
    				   icon: 'error',  
    				   title: '선택된 건이 없습니다.',  
    				   text: '승인처리건을 선택한 후 진행해주세요.',  
    				});			
    				return false;
    			}
    			if( chkCnt > 0 ){
    				Swal.fire({ 
    				   icon: 'error',  
    				   title: '파일 미등록 BOOK',  
    				   text: '파일이 등록되지 않은 BOOK은 승인할 수 없습니다.',  
    				});				
    				return false;	
    			}
    			
    			Swal.fire({
                    title: 'BOOK 승인처리',
                    text: "해당 자료를 승인처리 하시겠습니까?",
                    icon: 'warning',
                    showCancelButton: true,
                    confirmButtonColor: '#3085d6',
                    cancelButtonColor: '#d33',
                    confirmButtonText: '승인',
                    cancelButtonText: '취소'
                }).then((result) => {
                    if (result.isConfirmed) {        			
		      			 $.ajax({
		      				url : 'bookAdminCnfm' ,
		      				data :  JSON.stringify(book)  ,
		      				contentType : 'application/json',
		      				method : 'POST' ,
		      				dataType : 'json' ,
		      				success : function(data){
		      					console.log(data);
		      					
		      					Swal.fire({ 
		      					   icon: 'success',  
		      					   title: '승인완료!!',  
		      					   text: '정상적으로 승인처리되었습니다.',  
		      					});
		      					
		      					goList(1);
		      					
		      					
		      				}
		      			}); 
					}
            });
		});
		
		$("#rejectBtn").on("click", function(){
			
			 var rejectMsg = "";
			Swal.fire({
				  title: '보류사유 입력',
				  html: `<input type="text" id="rejectmsg" class="swal2-input" placeholder="입력해주세요..">`,
				  confirmButtonText: '확인',
				  focusConfirm: false,
				  preConfirm: () => {
				    const rejectmsg = Swal.getPopup().querySelector('#rejectmsg').value
				    if (!rejectmsg ) {
				      Swal.showValidationMessage(`보류사유를 입력해주세요`);
				    }
				    return { rejectmsg: rejectmsg }
				  }
				}).then((result) => {
					rejectMsg = result.value.rejectmsg;
					
						if(rejectMsg == ""){
	        				Swal.fire({ 
	        				   icon: 'error',  
	        				   title: '보류사유 미입력',  
	        				   text: '승인 보류 사유를 작성한 후 진행해주세요.' 
	        				});				
	        				return false;
	        			}
	        			
	        			
	        			var book = [];
	        			var cnt = 0;
	        			$(".chkInput:checked").each(function(){
	        					
	        				var bcnfmId = $(this).closest("tr").data("bcnfmid");
	        				var bookId = $(this).closest("tr").data("bookid");
	        				
	        				var data = {
	        					bcnfmId : bcnfmId ,
	        					bookId : bookId ,
	        					bcnfmReject : rejectMsg
	        				};
	        				
	        				book.push(data);
	        		    });
	        			
	        			console.log(book);
	        			if( book.length == 0 ){
	        				Swal.fire({ 
	        				   icon: 'error',  
	        				   title: '선택된 건이 없습니다.',  
	        				   text: '승인처리건을 선택한 후 진행해주세요.'
	        				});				
	        				return false;
	        			}
	        			Swal.fire({
		                       title: 'BOOK 보류처리',
		                       text: "해당 건을 보류처리 하시겠습니까?",
		                       icon: 'warning',
		                       showCancelButton: true,
		                       confirmButtonColor: '#3085d6',
		                       cancelButtonColor: '#d33',
		                       confirmButtonText: '보류',
		                       cancelButtonText: '취소'
		                   }).then((result) => {
		                       if (result.isConfirmed) {         			
		        			
			         			 $.ajax({
			         				url : 'bookAdminReject' ,
			         				data :  JSON.stringify(book)  ,
			         				contentType : 'application/json',
			         				method : 'POST' ,
			         				dataType : 'json' ,
			         				success : function(data){
			         					console.log(data);
			         					Swal.fire({ 
			         					   icon: 'success',  
			         					   title: '보류완료!!',  
			         					   text: '정상적으로 보류 처리되었습니다.'  
			         					});						
			         				}
			         			}); 
			                 }
			             })					
					})
		});
		
		$("table").on("click", "tr", function(){
			event.stopPropagation();
			var bcnfmId = $(this).data("bcnfmid");
			var bookId = $(this).data("bookid");
			$("#frm").find("#bookId").val(bookId);
			frm.submit();
		});
		
		$("#bcnfmTb").find("tbody").on("click", ".chkTd", function(){
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
			goList(1);
		});
	});
	
function goList(p) {
	searchFrm.page.value = p;
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
	          		<h2>BOOK 승인목록</h2>
	        	</div>
			</div>
			<div class="row srchBox">
				<form name="searchFrm" >
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
									<input id="eBook" name="bookFlCd" type="radio" value="E" class="form-check-input" required>
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
						<button type="button" id="srchBtn" class="btn ebookBtn-sm" >조회</button>
					</div>	
					<input type="hidden" name="page" value="1"> 
				</form>
			</div>				
			<div class="row pull-right" style="margin-top:10px;margin-bottom:10px;">
				<button type="button" id="cnfmBtn" class="btn ebookBtn-sm">승인</button>
				<button type="button" id="cnfmCancelBtn" class="btn ebookBtn-sm">승인취소</button>
				<button type="button" id="rejectBtn" class="btn ebookBtn-sm">보류</button>
			</div>
				
			<div class="row">
				<table id="bcnfmTb" class="table table-hover" style="cursor: pointer;">
						<thead>
							<tr>
								<th></th>
								<th>No</th>
								<th>신청일자</th>
								<th>신청자</th> 
								<th>BOOK명</th>
								<th>파일갯수</th>
								<th>상태</th>
								<th>승인일자</th>
								<th>승인자</th>
							</tr>
						<thead>
						<tbody>
							<c:forEach var="list" items="${lists}" >
								<tr data-bcnfmid="${list.bcnfmId}" data-bookid="${list.bookId}" data-filecnt="${list.fileCnt}" data-cnfmyn="${list.bookCnfmYn }">
									<c:if test="${list.bcnfmStCd eq '처리중' }">
										<td class="chkTd"><input type="checkbox" class="chkInput"></td>
									</c:if>
									<c:if test="${list.bcnfmStCd != '처리중' }">
										<td></td>
									</c:if>
									<td>${list.rn}</td>
									<td><fmt:formatDate pattern="yyyy-MM-dd"  value="${list.bcnfmReqDt}"/></td>
									<td>${list.bcnfmReqNm}</td>
									<td>
										<c:if test="${not empty list.bookCoverPath}">
											<img width="50" height="70" src="/prj/fileUp${list.bookCoverPath}${list.bookCover}">&nbsp;&nbsp;
										</c:if>
										${list.bookNm}
									</td>
									<td>${list.fileCnt}</td>
									<c:if test="${list.bcnfmStCd eq '승인'}">
										<td style="color:red;font-weight:bold">${list.bcnfmStCd}</td>
									</c:if>
									<c:if test="${list.bcnfmStCd eq '보류'}">
										<td style="color:#0c2e8a;font-weight:bold">${list.bcnfmStCd}</td> 
									</c:if>
									<c:if test="${list.bcnfmStCd eq '처리중' }">
										<td style="font-weight:bold">${list.bcnfmStCd}</td>
									</c:if>
									<c:if test="${list.bcnfmStCd eq '미신청' }">
										<td>${list.bcnfmStCd}</td>
									</c:if>
									<td><fmt:formatDate pattern="yyyy-MM-dd"  value="${list.bcnfmCnfmDt}"/></td>
									<td>${list.bcnfmCnfmr}</td>
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

<div id="myModal" class="modal">
  <!-- Modal content -->
  <div class="modal-content">
  	<div class="row">
    	<span id="close" class="close" style="color:black;font-size:40px;">&times;</span>
    </div>
	<div class="row mb-1">
		<div class="section-header col-sm-8" style="height:20px">
			<h4><img width="40px" height="40px" src="resources/img/bcnfmReject.png"> 승인 보류 사유를 입력해주세요.</h4>
		</div>
		<div class="col-sm-4" style="padding-left:0">
    		<button type="button" id="rejectBtn" class="btn ebookBtn-sm pull-left">확인</button>
    	</div>	
	</div>	    
    <div class="row" style="margin-top:30px">
    	<div class="col-sm-12">
    		<textarea id="rejectMsg" name="rejectMsg" rows="4" cols="60"></textarea>
    	</div>
    	
    </div>
    
    
  </div>
</div>
<form action="bookUpdateForm" method="post" id="frm">
	<input type="hidden" id="bookId" name="bookId" >
</form>	
<script>
	 
/* 	$("#rejectModalBtn").on("click", function(){
		$("#myModal").css("display", "block");	
	});
	
	$("#close").on("click", function(){
		$("#myModal").css("display", "none");
	});
	
	window.onclick = function(event) {
		if (event.target == modal) {
			$("#myModal").css("display", "none");
		}
	} */
</script>
</body>
</html>