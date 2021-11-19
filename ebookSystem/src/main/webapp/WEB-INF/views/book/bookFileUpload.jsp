<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Book 파일 업로드</title>
<style type="text/css">
#dropzone
{
    border:2px dotted #3292A2;
    width:100%;
    height:100%;
    color:#92AAB0;
    text-align:center;
    font-size:24px;
    padding:20px;
    margin-top:10px;
    margin-bottom:50px;
}

.fileNmTd {
	text-align:left;
	padding-left:20px;
}

table {
	font-size:17px;
}

.row {
	margin-bottom : 20px;
}



.button {
  border-radius: 4px;
  background-color: #0c2e8a;
  border: none;
  color: white;
  text-align: center;
  font-size: 20px;
  padding: 10px;
  width: 150px;
  transition: all 0.5s;
  cursor: pointer;
  margin: 5px;
}

.button span {
  cursor: pointer;
  display: inline-block;
  position: relative;
  transition: 0.5s;
}

.button span:after {
  content: '\00bb';
  position: absolute;
  opacity: 0;
  top: 0;
  right: -20px;
  transition: 0.5s;
}

.button:hover span {
  padding-right: 20px;
}

.button:hover span:after {
  opacity: 1;
  right: 0;
}


</style>
<script type="text/javascript">
$(function () {
	
	var files = null;
	
    var obj = $("#dropzone");

    obj.on('dragenter', function (e) {
         e.stopPropagation();
         e.preventDefault();
         $(this).css('border', '2px solid #5272A0');
    });

    obj.on('dragleave', function (e) {
         e.stopPropagation();
         e.preventDefault();
         $(this).css('border', '2px dotted #8296C2');
    });

    obj.on('dragover', function (e) {
         e.stopPropagation();
         e.preventDefault();
    });

    obj.on('drop', function (e) {
         e.preventDefault();
         $(this).css('border', '2px dotted #8296C2');

         files = e.originalEvent.dataTransfer.files;
         if(files.length < 1)
              return;

         F_FileMultiUpload(files, obj);
    });
    
    
    $("#attchFiles").on("click", ".fileDelBtn", function(){
    	event.stopPropagation();
    	var fileNm = $(this).closest("tr").data("filename");
    	console.log(fileNm);

    	console.log("삭제전-------------------");
    	console.log(files);
    	
    	if( files.length > 0 ){
    		
    		const dataTranster = new DataTransfer();
    		
    		Array.from(files)
    			.filter( file => file.name != fileNm )
    			.forEach( file => {
    				dataTranster.items.add(file);
    			});
    		
    		files = dataTranster.files;
    		
    		console.log("삭제후-------------------");
    		console.log(files);
    	}
    	
    	$(this).closest("tr").remove();
    	
    	
    	for( var i = 0 ; i < $(".filenoTd").length ; i++){
    		$(".filenoTd").eq(i).html(i+1);
    	}
    	
    	
    });
    
    
    $("#attchFiles").on("click", ".upBtn",function(){
    	event.stopPropagation();
    	
    	var tr = $(this).closest("tr");
    	var firstTr = $("#fileList tr:first").attr("id");
    	
    	if( tr.prev().attr("id") != firstTr  ){
    		tr.insertBefore(tr.prev());	
        	for( var i = 0 ; i < $(".filenoTd").length ; i++){
        		$(".filenoTd").eq(i).html(i+1);
        	}
    	}else{
    		return false;
    	}
    });
    
    $("#attchFiles").on("click", ".downBtn",function(){
    	event.stopPropagation();
    	var tr = $(this).closest("tr")
    	tr.insertAfter(tr.next());
    	for( var i = 0 ; i < $(".filenoTd").length ; i++){
    		$(".filenoTd").eq(i).html(i+1);
    	}
    });
    
    
    $("#fileClear").on("click", function(){
    	event.preventDefault()
    	$("#attchFiles").empty();
		$("#noFileTxt").html("Drag & Drop Files Here");
    });
    
    $("#fileInsert").on("click", function(){
    	if( files == null ){
    		Swal.fire({ 
			   icon: 'error',  
			   title: '파일오류',  
			   text: '파일 등록후 진행해주세요.',  
			});		
    		
    		return false;
    	}
    	
    	var bookId = $(this).data("bookid");
    	
        var formData = new FormData();
        var fileList = files;
        if(files.length > 0){
        	
        	for(var i = 0 ;i < files.length ; i++){
        	   formData.append("fileList", files[i]);
               console.log(files[i]);
            };
        }        	
    	
    	formData.append("bookId" , bookId );
    	
         $.ajax({
			url: 'batchInsert',
			method: 'post',
			data: formData ,
			dataType: 'json',
			enctype: "multipart/form-data",
			cache: false, 
			contentType: false, 
			processData: false,
			success: function(res) {
			    console.log(res);
			    
			    Swal.fire({ 
				   icon: 'success',  
				   title: '파일등록완료',  
				   text: '정상적으로 처리되었습니다.',  
				});	
			    
			    $("#bfileTbody").empty();
			    $.each(res,function(idx,item){
			    	$("#bfileTbody")
			    		.append($("<tr data-batchid='" + item.batchId + "'>")
			    					.append( $("<td class='bfileNoTd'>").html(item.batchOrd))
			    					.append( $("<td>").html(item.batchNm))
			    					.append( $("<td>").html(item.batchWriterNm))
			    					.append( $("<td>").html(item.insDt))
			    					.append( $("<td>").append($("<button class='bfileUpBtn btn btn-default'>")
			    												.append($("<i class='fa fa-chevron-up'>")) ))
			    					.append( $("<td>").append($("<button class='bfileDownBtn btn btn-default'>")
			    												.append($("<i class='fa fa-chevron-down'>")) ))
			    					.append( $("<td>").append($("<button class='bfileDelBtn btn btn-default'>")
			    												.append($("<i class='fa fa-trash-o'>")) ))			    												
			    				);
			    	
			    });
			    
			    $("#attchFiles").empty();
				$("#noFileTxt").html("Drag & Drop Files Here");
			}
        });  
    });
    
    
    $("#bfileTbody").on("click" , ".bfileUpBtn" , function(){
    	event.stopPropagation();
    	var tr = $(this).closest("tr");
    	var prevTr = tr.prev();
    	
    	tr.insertBefore(prevTr);
    	for( var i = 0 ; i < $(".bfileNoTd").length ; i++){
    		$(".bfileNoTd").eq(i).html(i+1);
    	}
    	
    	var batchs = [];
    	
    	var data = {
    		batchId : tr.data("batchid") ,
    		batchOrd : tr.find(".bfileNoTd").html() 
    	};
    	
    	batchs.push(data);
    	
    	data = {
   			batchId : prevTr.data("batchid") ,
       		batchOrd : prevTr.find(".bfileNoTd").html()	
    	}
    	
    	batchs.push(data); 	
		
    	 $.ajax({
    			url : 'batchOrderUpdate' ,
    			data :  JSON.stringify(batchs)  ,
    			contentType : 'application/json',
    			method : 'POST' ,
    			dataType : 'json' ,
    			success : function(data){
    				console.log(data);
    			}
    		}); 
    	
    });
    
	$("#bfileTbody").on("click" , ".bfileDownBtn" , function(){
		event.stopPropagation();
    	var tr = $(this).closest("tr");
    	var nextTr = tr.next();
    	tr.insertAfter(nextTr);
    	for( var i = 0 ; i < $(".bfileNoTd").length ; i++){
    		$(".bfileNoTd").eq(i).html(i+1);
    	}
    	
    	
		var batchs = [];
    	
    	var data = {
    		batchId : tr.data("batchid") ,
    		batchOrd : tr.find(".bfileNoTd").html() 
    	};
    	
    	batchs.push(data);
    	
    	data = {
   			batchId : nextTr.data("batchid") ,
       		batchOrd : nextTr.find(".bfileNoTd").html()	
    	}
    	
    	batchs.push(data); 	    	
    	
    	$.ajax({
			url : 'batchOrderUpdate' ,
			data :  JSON.stringify(batchs)  ,
			contentType : 'application/json',
			method : 'POST' ,
			dataType : 'json' ,
			success : function(data){
				console.log(data);
			}
		});     	
    });
	
	$("#bfileTbody").on("click" , ".bfileDelBtn" , function(){
		event.stopPropagation();
		var tr = $(this).closest("tr");
		var batchId = tr.data("batchid");
		var bookId = $("#bookId").val();
		
		$.ajax({
			url : 'batchDelete' ,
			method : 'DELETE' ,
			data :  JSON.stringify({batchId : batchId, bookId : bookId }) ,
			contentType : 'application/json',
			dataType : 'json' ,
			success : function(data){
				console.log(data);
				
				tr.remove();
			}
		});
    });

});



//파일 멀티 업로드
function F_FileMultiUpload(files, obj) {
	
	Swal.fire({
		  title: '파일업로드?',
		  text: files.length + "개의 파일을 업로드 하시겠습니까?",
		  icon: 'warning',
		  showCancelButton: true,
		  confirmButtonColor: '#3085d6',
		  cancelButtonColor: '#d33',
		  confirmButtonText: '확인'
		}).then((result) => {
		  if (result.isConfirmed) {
		    
			  var data = new FormData();
		         
		         if( files.length > 0){
		        	 
		        	 $("#noFileTxt").html("");
			         $("#attchFiles").empty();
			         $("#attchFiles").append( $("<table id='fileList' class='table'>")
			         							.append($("<tr id='headTr'>")
			         									.append($("<td>").html("No"))
			         									.append($("<td>").html("File"))
			         									.append($("<td>").html("순서"))
			         									.append($("<td>").html(""))
			         									.append($("<td>").html("삭제"))
			         									
			         									));
		         }
		         
		         for (var i = 0; i < files.length; i++) {
		        	 
		       	 	data.append('file', files[i]);
		            
		            var fileNm = files[i].name;
		            var ext = fileNm.split(".").pop().toLowerCase();
						console.log(ext);
						
						if( `${book.bookFlCd}` == 'E' ){
							if($.inArray(ext, ["epub"]) == -1) {
								
								Swal.fire({ 
								   icon: 'error',  
								   title: '파일형식오류',  
								   text: 'epub 파일만 등록 가능합니다.',  
								});
							
								$("#attchFiles").empty();
								$("#noFileTxt").html("Drag & Drop Files Here");
								return false;
							}	
						}else{
							if($.inArray(ext, ["mp3"]) == -1) {
								Swal.fire({ 
								   icon: 'error',  
								   title: '파일형식오류',  
								   text: 'mp3 파일만 등록 가능합니다.',  
								});
								
								$("#attchFiles").empty();
								$("#noFileTxt").html("Drag & Drop Files Here");
								return false;
							}
						}
		            
					$("#fileList")
					.append($("<tr id='bodyTr' class='fileTr' data-filename='"+ fileNm +"'>")
								.append( $("<td class='filenoTd'>").html(i+1))
								.append( $("<td class='fileNmTd'>").html(fileNm))
								.append( $("<td>").append( $("<button class='upBtn btn btn-default'>").append( $("<i class='fa fa-chevron-up'>")) ))
								.append( $("<td>").append( $("<button class='downBtn btn btn-default'>").append( $("<i class='fa fa-chevron-down'>")) ))
								.append( $("<td>").append($("<button type='button' class='fileDelBtn btn btn-default'>").append($("<i class='fa fa-trash-o'>")) )));
				 	
					var reader = new FileReader();
					reader.onload = function(e){
						
					}
					reader.readAsDataURL(files[i]);
		         }
			}
		})
}

// 파일 멀티 업로드 Callback
function F_FileMultiUpload_Callback(files) {
     for(var i=0; i < files.length; i++)
         console.log(files[i].file_nm + " - " + files[i].file_size);
}

</script>
</head>
<body>
	<div class="inner-page pt-6">
		<div class="container">
			<div class="row" style="margin: 10px">
				<div class="col-sm-6" >
					<div class="row" style="margin-top: 40px">
						<div class="section-header">
			          		<h2>BOOK 정보</h2>
			        	</div>
					</div>	
					<div class="row">
						<div class="col-sm-4" >
							<img width="200" height="270" style="margin-top:20px" src="/prj/fileUp${book.bookCoverPath}${book.bookCover}">
						</div>
						<div class="col-sm-8 bInfo">
							<div style="margin-left:20px">	
								<h2 class="display-5 fw-bold">${book.bookNm}</h2>
								<br/>
								<h4>BOOK 출판사	: ${book.bookPublCo} </h4>
								<h4>BOOK 저 자	: ${book.bookWriter} </h4>
								<h4>BOOK 매니저	: ${book.memberNm}</h4>
								<c:if test="${book.bookFlCd eq 'A' }">
								<h4>BOOK 구 분    : 오디오북</h4>
								</c:if>
								<c:if test="${book.bookFlCd eq 'E' }">
								<h4>BOOK 구 분    : eBook</h4>
								</c:if>
								<input type="hidden" id="bookId" name="bookId" value="${book.bookId}">
							</div>
							<div>
							</div>	
						</div>
					</div>
					<div class="row">
						<div class="section-header" style="margin-top: 40px">
			          		<h2>BOOK FILE 정보</h2>
			        	</div>
			        	<div>
			        		<table class="table m-10">
			        			<thead>
				        			<tr>
				        				<th>NO</th>
				        				<th>파일명</th>
				        				<th>등록자</th>
				        				<th>등록일자</th>
				        				<th colspan="2">순서변경</th>
				        				<th>삭제</th>
				        			</tr>
			        			</thead>
			        			<tbody id="bfileTbody">
				        			<c:forEach var="bfile" items="${list}">
				        				<tr data-batchid="${bfile.batchId}">
				        					<td class="bfileNoTd">${bfile.batchOrd}</td>
				        					<td>${bfile.batchNm}</td>
				        					<td>${bfile.batchWriterNm}</td>
				        					<td><fmt:formatDate pattern="yyyy-MM-dd hh:mm:ss"  value="${bfile.insDt}"/></td>
				        					<td><button class='bfileUpBtn btn btn-default'><i class='fa fa-chevron-up'></i></button></td>
				        					<td><button class='bfileDownBtn btn btn-default'><i class='fa fa-chevron-down'></i></button></td>
				        					<td><button class='bfileDelBtn btn btn-default'><i class='fa fa-trash-o'></i></button></td>
				        				</tr>
				        			
				        			</c:forEach>
			        			</tbody>
			        		</table>
			        	</div>
					</div>
				</div>	
				<div class="col-sm-6" >	
					<div class="row" style="margin-top: 40px">
						<div class="col-sm-12">
							<div class="section-header" >
								<h2 class="title" style="top:20px">File UPLOAD</h2>
							</div>
						</div>
					</div>
					<div class="row">
						<div id="dropzone">
							<h1 id="noFileTxt">Drag & Drop Files Here</h1>
							<div id="attchFiles">
							</div>
							<div id="noImgFiles"></div>
						</div>
					</div>	
					<div class="row pull-right">
						<a href="fileAdd" id="ePubFile" class="btn-black smoothie">ePub파일만들기</a>
						<a href="#" id="fileInsert" data-bookid="${book.bookId}" class="btn-black smoothie">파일등록</a>
						<a href="#" id="fileClear" data-bookid="${book.bookId}" class="btn-black smoothie">비우기</a>
					</div>
				</div>	
			</div>
		</div>
	</div>
</body>
</html>


