<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BOOK 관리</title>

<link href="resources/css/form-validation.css" rel="stylesheet"> 
<link rel="canonical" href="https://getbootstrap.com/docs/5.1/examples/checkout/">
<style type="text/css">
.row {
	margin-top:10px;
}
</style>
<script type="text/javascript">
	$(function(){
		
		$('.summernote').summernote({
			 height: 300
	 	});
		 
		// 첨부파일 수정여부
		var attchUpFlag = false;
		$("#attchUpFlag").val("false");
		
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
			
			attchUpFlag = true;
			$("#attchUpFlag").val("true");
			
			var reader = new FileReader();
			reader.onload = function(e){
				$(".bookCoverCard").find("img").attr("src", e.target.result);
				
			};
			
			$(".bookCoverCard").find("h3").html(event.target.files[0].name);
			console.log(event.target.files[0]);
			reader.readAsDataURL(event.target.files[0]);
		});
		
		
		
		// 수정버튼 클릭시 -----------------------------------------------------------
		$("#bookUpdateBtn").on("click",function(){
		    $("#bookUpdateBtn").prop("disabled", true);   
			
		    if( ! attchUpFlag ){
		    	$("attchFile").val("");	
		    }
		    
		    var formData = new FormData($("#frm")[0]);

			 $.ajax({
				url : 'bookUpdate' ,
				data : formData , 
				method : 'POST' ,
				enctype: "multipart/form-data",
				cache: false, 
				contentType: false, 
				processData: false,
				success : function(res){
					$("#bookUpdateBtn").prop("disabled", false);
					console.log(res.msg);
					if($("#msg").val() == "success"){
						alert("수정이 완료되었습니다.");
					}else{
						alert("수정시 오류가 발생하였습니다.");
					}
					
				},
				error : function(rej){
					console.log(rej);
					$("#bookUpdateBtn").prop("disabled", false);
				}
			}); 
		});
		
		// 파일 수정버튼 클릭시 
		$("#bookCoverEditBtn").on("click", function(){
			$("#attchFile").click();
		});
		
		$("#bookFileForm").on("click", function(){
			frm.action = "bookFileUpload";
			frm.submit();
		});
		
	});
	
	
	function bookDelete(){
		frm.action = "bookDelete";
		frm.submit();
	}

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
				<form class="needs-validation form-horizontal" enctype="multipart/form-data" method="POST" id="frm" name ="frm" novalidate>
					<div class="row box">
						<div class="row">
							<div class="col-sm-4">
								<div class="row">
									<label style="float: left">BOOK COVER</label>	
								</div>			
								<div class="row">
									<c:if test="${empty books.bookCover }">
										<div class="bookCoverCard">
											<img src="resources/assets/img/noimg.jpg"  style="width:100%">
											<h3>No Image</h3>
											<p><button type="button" id="bookCoverEditBtn" class="bookCoverCardBtn">파일등록</button></p>
										</div>
									
									
										<div id="imgContainer"><img id="bookCoverImg" src="resources/assets/img/noimg.jpg" width="150" height="170"></div>
										<input type="file" id="attchFile" name="attchFile" value="파일조회" class="form-control" style="display: none">
									</c:if>
									<c:if test="${not empty books.bookCover }">
										<div class="bookCoverCard">
											<img src="/prj/fileUp${books.bookCoverPath}${books.bookCover}"  style="width:100%">
											<h3>${books.bookCover}</h3>
											<p><button type="button" id="bookCoverEditBtn" class="bookCoverCardBtn">파일수정</button></p>
										</div>	

										<input type="hidden" id="bookCover" name="bookCover" value="${books.bookCover}">
										<input type="hidden" id="bookCoverPath" name="bookCoverPath" value="${books.bookCoverPath}">
										<input type="file" id="attchFile" name="attchFile" class="form-control" style="display: none">									
									</c:if>
								</div>									
							</div>
							<div class="col-sm-7 col-sm-offset-1">
								<div class="row" >
									<div class="col-sm-3">
										<label style="float: left">카테고리</label>
									</div>
									<div class="col-sm-4">
										<select id="lcodeSelBox" class="form-control" style="float: left">
										</select>
									</div>
									<div class="col-sm-4">
										<select id="scodeSelBox" class="form-control" >
										</select>
									</div>
									<input type="hidden" id="ctgyId" name="ctgyId"  value="${books.ctgyId}" class="form-control"> 
								</div>
								<div class="row">
									<label class="col-sm-3" style="float: left">BOOK구분</label>
									<div class="col-sm-9 form-check-inline" style="word-spacing :10px">
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
									</div>
								</div>
								<div class="row">
									<label class="col-sm-3 title">BOOK명</label>
									<div class="col-sm-9" style="padding-left:0px;">
										<div class="row">	
											<div class="col-sm-8">
												<input type="text" id="bookNm" name="bookNm" value="${books.bookNm}" class="form-control">
											</div>
											<div class="col-sm-4">
												<button id="bookSearch" type="button" class="btn pull-right ebookBtn-sm" style="float:left"> BOOK조회 </button>
											</div>
										</div>
									</div>
								</div>
								<div class="row">
									<div class="col-sm-12">
										<label class="title" style="float: left">출판사</label>
										<input type="text" id="bookPublCo" name="bookPublCo" value="${books.bookPublCo}" class="col-sm-3 form-control" style="float:left">
									</div>
								</div>
								<div class="row">
									<div class="col-sm-12">
										<label class="title">저자</label>
										<input type="text" id="bookWriter" name="bookWriter" class="form-control"  value="${books.bookWriter}" style="float:left">				
									</div>
								</div>
								<div class="row">
									<div class="col-sm-12">
										<label class="title" style="float: left">출간일</label>
										<input type="date" id="bookPublDt" name="bookPublDt" value="${books.bookPublDt}"  class="form-control" >				
									</div>
								</div>
								<div class="row">
									<div class="col-sm-12">
										<label class="title">도서ISBN</label>
										<input type="text" id="bookIsbn" name="bookIsbn" value="${books.bookIsbn}" class="form-control">				
									</div>
								</div>
								<div class="row"></div>
								<div class="row pull-right">
									<div class="col-sm-12">
										<button id="bookFileForm" type="button" class="btn ebookBtn"> BOOK파일등록 </button>
									</div>
								</div> 
								<div class="row pull-right" style="margin-top:100px">
									<div class="col-sm-12">
										<button type="button" id="bookUpdateBtn" class="btn ebookBtn">수 정</button>
										<button type="button" id="bookDeleteBtn" class="btn ebookBtn" onclick="bookDelete()">삭 제</button>
										<button type="button" class="btn ebookBtn" onclick="location.href='bookList'">BOOK목록</button>
									</div>
								</div>																								
							</div>
						</div>		
						
						<div class="row">
							<div class="col-sm-12">
								<label class="title">책소개</label>
								<textarea rows="6" cols="90" id="bookIntro" name="bookIntro" class="form-control summernote">${books.bookIntro}</textarea>				
							</div>
						</div>
						<div class="row">
							<div class="col-sm-12">
								<label class="title">목차</label>
								<textarea rows="6" cols="90" id="bookContent" name="bookContent" class="form-control summernote">${books.bookContent}</textarea>				
							</div>
						</div>
						<div class="row">
							<div class="col-sm-12">
								<label class="title">저자소개</label>
								<textarea rows="6" cols="90" id="bookWriterIntro" name="bookWriterIntro" class="form-control summernote">${books.bookWriterIntro}</textarea>				
							</div>
						</div>
						<div class="row">
							<div class="col-sm-12">
								<label class="title">책설명</label>
								<textarea rows="6" cols="90" id="bookDesc" name="bookDesc" class="form-control summernote">${books.bookDesc}</textarea>				
							</div>
						</div>		
						<input type="hidden" id="bookId" name="bookId" value="${books.bookId}" >
						<input type="hidden" id="msg" name="msg" value="${msg}" >
						<input type="hidden" id="attchUpFlag" name="attchUpFlag"  >
					</div>
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
						<button type="submit" id="bookApiSearch" class="btn btn-default" onclick="bookApi()" >검 색</button>
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
		        	<button id="apiCloseBtn" type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				</div>
			</form>
		</div>
	</div>
</div>
<iframe id="iframe1" name="iframe1" style="display:none"></iframe>


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
						<button type="submit" id="bookApiSearch" class="btn btn-default" onclick="bookApi()" >검 색</button>
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
		        	<button id="apiCloseBtn" type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				</div>
			</form>
		</div>
	</div>
</div>


<script src="resources/js/form-validation.js"></script>
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
