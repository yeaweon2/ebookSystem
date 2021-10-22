<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BOOK 관리</title>
<link href="resources/css/form-validation.css" rel="stylesheet">
<link href="resources/assets/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="canonical" href="https://getbootstrap.com/docs/5.1/examples/checkout/">
<script type="text/javascript">
	$(function(){
		
		// 화면 진입시 카테고리 대분류 조회 후 셋팅 --------------------------------------------------------------------------------------
		$.ajax({
			url: 'ctgyLcodeList',    
			method: 'GET',
			contentType : 'application/json;charset=utf-8',
			dataType: 'json',
			success: function(res){
				
				var ctgyId = $("#ctgyId").val();
				var grId = ctgyId.substring(0,1) + "00";
				
				$("#lcodeSelBox").empty();
				$.each(res, function(idx,item){
					
					if( grId == item.ctgyId ){
						$("#lcodeSelBox").append($("<option>").val(item.ctgyId).text(item.ctgyNm).prop("selected", true));
					}else{
						$("#lcodeSelBox").append($("<option>").val(item.ctgyId).text(item.ctgyNm));
					}
				});
				
				$("#lcodeSelBox").change();
				$("#scodeSelBox").find("option").val(ctgyId).prop("selected",true);
				
				
			}
		});

		// 대분류 카테고리 선택시 소분류 select box에 셋팅 -------------------------------------------------------------------------------- 
		$("#lcodeSelBox").on("change", function(){
			var ctgyGrId = $(this).find("option:selected").val();
				
			$.ajax({
				url: 'ctgyDetailList',    
				method: 'POST',
				data : JSON.stringify({ ctgyGrId : ctgyGrId }),
				contentType : 'application/json',
				dataType: 'json',
				success: function(res){
					
					$("#scodeSelBox").empty();
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
		
		
		// 첨부파일 선택시 이미지 파일 및 파일 사이즈 체크 ------------------------------------------------------------------------
		$("#attchFile").on("change", function(){
			
			if($("#attchFile").val() != "") {		
				
				var ext = $("#attchFile").val().split(".").pop().toLowerCase();
				console.log(ext);
				if($.inArray(ext, ["jpg", "jpeg", "png", "gif", "bmp"]) == -1) {
					alert("첨부파일은 이미지 파일만 등록 가능합니다.\n ( 첨부가능 확장자 : 'jpg', 'jpeg', 'png', 'gif', 'bmp' )");
					$("#attchFile").val("");
					return false;
				}
			}
			
			var maxSize = 5 * 1024 * 1024; // 5MB

			var fileSize = $("#attchFile")[0].files[0].size;
			console.log(fileSize);
			if(fileSize > maxSize){
				alert("첨부파일 사이즈는 5MB 이내로 등록 가능합니다.");
				$("#attchFile").val("");
				return false;
			}
		});
		
		
		
		// 수정버튼 클릭시 -----------------------------------------------------------
		$("#bookUpdateBtn").on("click",function(){
			//console.log($('#frm').serializeObject());
			$.ajax({
				url : 'bookUpdate' ,
				data : JSON.stringify( $('#frm').serializeObject() ) ,
				method : 'PUT' ,
				contentType : 'application/json',
				dataType : 'json' ,
				success : function(data){
					console.log();
					console.log($("#msg"));
					if($("#msg").val() == "Success"){
						alert("수정이 완료되었습니다.");
					}else{
						alert("수정시 오류가 발생하였습니다.");
					}
					
				}
			});
		});
		
		$("#bookCoverClick").on("click", function(){
				
		});
		
		
		$("#bookCoverEditBtn").on("click", function(){
			$("#bookCoverTd").empty();
			$("#bookCover").css("display", "block");
		});
	});
	
</script>
</head>
<body>
	<div class="inner-page pt-6">
		<div class="container">
			<div class="row mb-1" style="margin-top: 40px">
				<div class="section-header">
	          		<h2>BOOK 관리</h2>
	        	</div>
			</div>	
			<div> 
				<form class="needs-validation form-horizontal" id="frm" name ="frm" enctype = "multipart/form-data" novalidate>
					<table class="table">
						<tr>
							<th>카테고리</th>
							<td>
								<select id="lcodeSelBox" class="form-select form-select-sm w-30">
								</select>
								<select id="scodeSelBox" class="form-select form-select-sm">
								</select>
								<input type="hidden" id="ctgyId" name="ctgyId"  value="${books.ctgyId}" class="form-control"> 
								<div class="invalid-feedback">
									카테고리를 입력해주세요.
								</div>								
							</td>
							<th>도서구분</th>
							<td>
								<div class="form-check-inline" style="word-spacing :10px">
									<c:if test="${books.bookFlCd eq 'E'}">
										<input id="eBook" name="bookFlCd" type="radio" value="E" class="form-check-input" checked required>
										<label class="form-check-label" for="eBook">eBook</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										<input id="audioBook" name="bookFlCd" type="radio" value="A" class="form-check-input" required>
										<label class="form-check-label" for="audioBook">오디오북</label>
									</c:if>
									<c:if test="${books.bookFlCd eq 'A'}">
										<input id="eBook" name="bookFlCd" type="radio" value="E" class="form-check-input"  required>
										<label class="form-check-label" for="eBook">eBook</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										<input id="audioBook" name="bookFlCd" type="radio" value="A" class="form-check-input" checked required>
										<label class="form-check-label" for="audioBook">오디오북</label>
									</c:if>
									<div class="invalid-feedback">
										구분을 선택해주세요.
									</div>
								</div>
							</td>
						</tr>
						<tr> 
							<th>BOOK명</th>
							<td colspan="3">
								<input type="text" id="bookNm" name="bookNm" size="100px" class="form-control"  value="${books.bookNm}">
								<button id="bookSearch" type="button" class="btn btn-primary" data-toggle="modal" data-target="#bookApiModal"> BOOK조회 </button>
								<div class="invalid-feedback">
									BOOK명을 입력해주세요.
								</div>
							</td>
						</tr>
						<tr>
							<th>출판사</th>
							<td><input type="text" id="bookPublCo" name="bookPublCo" class="form-control" value="${books.bookPublCo}" ></td>
							<th>저 자</th>
							<td><input type="text" id="bookWriter" name="bookWriter" class="form-control" value="${books.bookWriter}"></td>
						</tr>
						<tr>
							<th>출간일</th>
							<td><input type="date" id="bookPublDt" name="bookPublDt" class="form-control" value="${books.bookPublDt}" ></td>
							<th>가 격</th>
							<td><input type="text" id="bookAmt" name="bookAmt" class="form-control" value="${books.bookAmt}"></td>
						</tr>
						<tr>
							<th>도서ISBN</th>
							<td><input type="text" id="bookIsbn" name="bookIsbn" class="form-control" value="${books.bookIsbn}"></td>
							<th>할인율</th>
							<td><input type="text" id="bookDisCnt" name="bookDisCnt" class="form-control" value="${books.bookDiscnt}"></td>
						</tr>
						<tr>
							<th>표지디자인</th>
							<td id="bookCoverTd">
							 	&nbsp;&nbsp;<a href="#" id="bookCover" onclick="bookCoverClick()">${books.bookCover}</a>
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								<c:if test="${empty books.bookCover }">
									<button id="bookCoverEditBtn" type="button" class="btn btn-primary"> 파일등록 </button>
								</c:if>
								<c:if test="${not empty books.bookCover }">
									<button id="bookCoverEditBtn" type="button" class="btn btn-primary"> 파일수정 </button>
								</c:if>
								<input type="file" id="bookCover" name="bookCover" class="form-control" style="display: none"></td>
							<th>BOOK파일</th>
							<td><button id="bookFileForm" type="button" class="btn btn-primary"> BOOK파일등록 </button></td> 
						</tr>				
						<tr>
							<th>책소개</th>
							<td colspan="3"><textarea rows="6" cols="90" id="bookIntro" name="bookIntro" class="form-control">${books.bookIntro}</textarea></td>
						</tr>
						<tr>
							<th>목차</th>
							<td colspan="3"><textarea rows="6" cols="90" id="bookContent" name="bookContent" class="form-control">${books.bookContent}</textarea></td>
						</tr>
						<tr>
							<th>저자소개</th>
							<td colspan="3"><textarea rows="6" cols="90" id="bookWriterIntro" name="bookWriterIntro" class="form-control">${books.bookWriterIntro}</textarea></td>
						</tr>
					</table>
					<div>
						<button type="button" id="bookUpdateBtn" class="btn btn-outline-primary">수 정</button>
						<button type="button" class="btn btn-outline-primary" onclick="location.href='bookList'">BOOK목록</button>
					</div>
					<input type="hidden" id="bookId" name="bookId" value="${books.bookId}" >
					<input type="hidden" id="msg" name="msg" value="${msg}" >
				</form>
			
			</div>
		</div>
	</div>	
<div  class="modal fade" id="bookApiModal">
	<div class="modal-dialog modal-lg">
		<div class="modal-content">
			<form class="needs-validation" target="iframe1" novalidate>	
				<!--Header-->
			    <div class="modal-header">
			    	<h4 class="modal-title" id="myModalLabel">BOOK검색</h4>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">×</span>
			        </button>
			    </div>
				<!--Body-->
				<div class="modal-body">
					<div class="row">
						<input type="text" class="form-control" id="bookApiNm" placeholder=""  required>
						<div class="invalid-feedback">
							검색할 BOOK명을 입력해주세요.
						</div>	
						<button type="submit" id="bookApiSearch" class="btn btn-primary" onclick="bookApi()" >검 색</button>
					</div>
					<div class="row">
						<table id="apiTb" class="table table-hover">
							<tr>
								<th>No</th>
								<th>제목</th>
								<th>출판사</th>
								<th>저자</th>
								<th>정가</th>
								<th>ISBN</th>
								<th>상태</th>
								<th>책소개</th>
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
<iframe id="iframe1" name="iframe1" style="display:none"></iframe>

<script src="resources/js/form-validation.js"></script>
<script src="resources/assets/dist/js/bootstrap.bundle.min.js"></script>
<script type="text/javascript">

	function bookApi(){
		$.ajax({
			method : "get",
			url : "https://dapi.kakao.com/v3/search/book",
			data : { query : $("#bookApiNm").val() },
			headers : { Authorization : "KakaoAK f1d4b3c07a4bac151a4340d72fcf349d"} ,
			success : function(res){
				$("#apiTbody").empty();
				
				$.each(res.documents,function(idx,item){
					//console.log(item.contents);
					$("#apiTbody").append($("<tr id='apiTr'>")
								.append( $("<td>").html((idx+1)) )
								.append( $("<td id='apiTitle'>").html(item.title) )
								.append( $("<td id='apiPublisher'>").html(item.publisher) )
								.append( $("<td id='apiAuthors'>").html(item.authors) )
								.append( $("<td id='apiPrice'>").html(item.price) )
								.append( $("<td id='apiIsbn'>").html(item.isbn) )
								.append( $("<td id='apiStatus'>").html(item.status))
								.append( $("<td id='apiIntro'>").append( $("<input type='hidden' id='apiIntroTxt'>").val(item.contents)))					
					);	
				});
				
				$("#apiTbody").on("dblclick", "tr#apiTr" , function(){
					event.stopPropagation();
					console.log($(event.target).closest("tr").find("#apiContents").html());
					$("#bookNm").val($(event.target).closest("tr").find("#apiTitle").html());
					$("#bookPublCo").val($(event.target).closest("tr").find("#apiPublisher").html());
					$("#bookIsbn").val($(event.target).closest("tr").find("#apiIsbn").html());
					$("#bookAmt").val($(event.target).closest("tr").find("#apiPrice").html());
					$("#bookWriter").val($(event.target).closest("tr").find("#apiAuthors").html());
					$("#bookIntro").val($(event.target).closest("tr").find("#apiIntroTxt").val());
					$("#apiCloseBtn").click();
				});
			},
			error : function(rej){
				console.log(rej);
			}
		});
		return false;
	}
</script>
</body>
</html>
