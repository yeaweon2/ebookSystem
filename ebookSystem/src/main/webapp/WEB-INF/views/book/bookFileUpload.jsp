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
        width:90%;
        height:100%;
        color:#92AAB0;
        text-align:center;
        font-size:24px;
        padding:20px;
        margin-top:10px;
        margin-bottom:50px;
    }


</style>
<script type="text/javascript">
$(function () {
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

         var files = e.originalEvent.dataTransfer.files;
         if(files.length < 1)
              return;

         F_FileMultiUpload(files, obj);
    });

});



//파일 멀티 업로드
function F_FileMultiUpload(files, obj) {
     if(confirm(files.length + "개의 파일을 업로드 하시겠습니까?") ) {
         var data = new FormData();
         
         if( files.length > 0){
	         $("#attchFiles").empty();
	         $("#attchFiles").append( $("<table id='fileList'>")
	         							.append($("<tr>")
	         									.append($("<td>").html("순번"))
	         									.append($("<td>").html("File"))
	         									.append($("<td>").html("File명"))
	         									.append($("<td>").html("삭제"))));
         }
         
         for (var i = 0; i < files.length; i++) {
        	 
       	 	data.append('file', files[i]);
            
            var fileNm = files[i].name;
            var ext = fileNm.split(".").pop().toLowerCase();
            
		 	var fType = "";
			var reader = new FileReader();
			reader.onload = function(e){
				
				if($.inArray(ext, ["jpg", "jpeg", "png", "gif", "bmp"]) == -1) {
					fType = "resources/img/document.png";
				}else{
					fType = e.target.result;
				}
				
				$("#fileList")
					.append($("<tr>")
								.append( $("<td>").html(i+1))
								.append( $("<td>").append($("<img>").attr("src", fType).css("width", "70px").css("height", "100px")))
								.append( $("<td>").html(files[i].name))
								.append( $("<td>").append($("<button type='button'>").html("삭제") )));
			}
			reader.readAsDataURL(files[i]);
         }

         
/*          var reader = new FileReader();
			reader.onload = function(e){
				$("#bookCoverImg").attr("src", e.target.result);
				$("#imgContainer").append($("#bookCoverImg"));
				//$("#imgContainer").attr("display" , "block");
				$("#imgContainer").css("display" , "block");
			};
			
			console.log(event.target.files[0]);
			reader.readAsDataURL(event.target.files[0]);         
          */
         
         
         
         
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



	<h2 class="title">File Upload</h2>


	<h4>${book.bookNm}</h4> 
	
	
	
	<div id="dropzone">
		<h1 id="noFileTxt">Drag & Drop Files Here</h1>
		<div id="attchFiles">
		</div>
		<div id="noImgFiles"></div>
	</div> 


	

</body>
</html>
