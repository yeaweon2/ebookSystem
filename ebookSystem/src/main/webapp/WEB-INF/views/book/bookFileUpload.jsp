<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
    	
    	console.log(tr); 
    	
    	tr.insertBefore(tr.prev());
    });
    
    $("#attchFiles").on("click", ".downBtn",function(){
    	event.stopPropagation();
    	var tr = $(this).closest("tr")
    	console.log(tr);
    	tr.insertAfter(tr.next());
    });
    
    
    $("#fileInsert").on("click", function(){
    	if( files == null ){
    		alert("파일 등록후 진행해주세요.");
    		return false;
    	}
    });

});



//파일 멀티 업로드
function F_FileMultiUpload(files, obj) {
     if(confirm(files.length + "개의 파일을 업로드 하시겠습니까?") ) {
         var data = new FormData();
         
         if( files.length > 0){
        	 
        	 $("#noFileTxt").html("");
	         $("#attchFiles").empty();
	         $("#attchFiles").append( $("<table id='fileList' class='table'>")
	         							.append($("<tr>")
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
			$("#fileList")
			.append($("<tr class='fileTr' data-filename='"+ fileNm +"'>")
						.append( $("<td class='filenoTd'>").html(i+1))
						.append( $("<td class='fileNmTd'>").html(fileNm))
						.append( $("<td>").append( $("<button class='upBtn btn btn-primary'>").append( $("<i class='fa fa-chevron-up'>")) ))
						.append( $("<td>").append( $("<button class='downBtn btn btn-primary'>").append( $("<i class='fa fa-chevron-down'>")) ))
						.append( $("<td>").append($("<button type='button' class='fileDelBtn btn btn-primary'>").append($("<i class='fa fa-trash-o'>")) )));
		 	
			var reader = new FileReader();
			reader.onload = function(e){
				
			}
			reader.readAsDataURL(files[i]);
         }
         
         
        /*  var url = "<서버 파일업로드 URL>";
         $.ajax({
            url: url,
            method: 'post',
            data: data,
            dataType: 'json',
            processData: false,
            contentType: false,
            success: function(res) {
                F_FileMultiUpload_Callback(res.files);
            }
         }); */
     }
}

// 파일 멀티 업로드 Callback
function F_FileMultiUpload_Callback(files) {
     for(var i=0; i < files.length; i++)
         console.log(files[i].file_nm + " - " + files[i].file_size);
}




</script>
</head>
<body>



	<h2 class="title">BOOK 정보</h2>

<div class="row">
	<div class="col-sm-4" >
		<img width="200" height="270" style="margin-top:20px" src="/prj/fileUp${book.bookCoverPath}${book.bookCover}">
	</div>
	<div class="col-sm-8 bInfo">
		<div style="margin-left:20px">	
			<h2 class="display-5 fw-bold">${book.bookNm}</h2>
			<h4>${book.bookPublCo} ( ${book.bookWriter} )</h4>
		</div>
		<div>
		</div>	
	</div>
</div>

<div class="row">
	<div class="col-sm-12" >
		<h2 class="title" style="top:20px">File UPLOAD</h2>
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
<div class="row">
	<div class="col-sm-12">
		<button id="fileInsert" type="button" class="button pull-right" id="bookCartForm"><span>파일등록 </span></button>
	</div>
</div>
</body>
</html>
