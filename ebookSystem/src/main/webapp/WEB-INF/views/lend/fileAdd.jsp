<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
  
<script type = "text/javascript" src = "https://cdnjs.cloudflare.com/ajax/libs/jspdf/1.5.3/jspdf.min.js"></script>
<script type = "text/javascript" src = "https://html2canvas.hertzen.com/dist/html2canvas.min.js"></script>
<style type="text/css">

.minibox {
	margin: 0 0 0 0;
    border: 1px solid #e4e1e3;
    border-radius: 2px;
    padding: 1em 1em 1em 1em;
}

p {
	font-size: 15px;
}
</style>
<script type="text/javascript">

	$(function(){
		
		$('.summernote').summernote({
			 height: 300
		});

		
		$("#pdfAdd").on("click", function(){
			if( $("#pdfTitle").val() == "" ){
				alert("파일명을 입력한 후 진행해주세요.");
				return false;	
			}
			
			html2canvas($('#wrap')[0]).then(function(canvas) {
				
				var imgData = canvas.toDataURL('image/jpeg');
				var imgWidth = 210;
				var pageHeight = imgWidth * 1.414;
				var imgHeight = canvas.height*imgWidth/canvas.width;
				var heightLeft = imgHeight;
				var margin = 0;
				
				var doc = new jsPDF('p', 'mm', 'a4'); //jspdf객체 생성
				var position = 0;
				
				doc.addImage(imgData, 'jpeg', margin , position, imgWidth , imgHeight); //이미지를 기반으로 pdf생성
				heightLeft -= pageHeight;
				
				while( heightLeft >= 20 ){
					position = heightLeft - imgHeight;
					doc.addPage();
					doc.addImage(imgData, 'jpeg', margin , position, imgWidth , imgHeight); //이미지를 기반으로 pdf생성
					heightLeft -= pageHeight;	
				}
				
				doc.save(  $("#pdfTitle").val() + ".pdf"); //pdf저장
			});
		});
		
		$("#previewBtn").on("click", function(){
			$("#wrap").html( $("#bookContents").val() );
		});
		
		// 첨부파일 선택시 이미지 파일 및 파일 사이즈 체크 ------------------------------------------------------------------------
		$("#pdfFile").on("change", function(){
			if($("#pdfFile").val() != "") {		
				var ext = $("#pdfFile").val().split(".").pop().toLowerCase();
				console.log(ext);
				if($.inArray(ext, ["pdf"]) == -1) {
					alert("PDF 파일만 등록 가능합니다.");
					$("#pdfFile").val("");
					return false;
				}
			}
		});
			
		$("#convertFile").on("click", function(){
			if($("#pdfFile").val() == "" ){
				alert("PDF 파일을 입력한 후 진행해주세요.");
				return false;	
			}
			epubFrm.submit();
		});
	});
	
</script>
</head>
<body>
<div class="inner-page pt-6">
	<div class="container" style="margin-top:50px">
		<div class="row mb-20" style="margin-top: 40px;margin-left: 30px">
			<div class="section-header">
          		<h2>ePub 파일 생성하기</h2>
        	</div>
		</div>		
		<div class="row">
			<div class="col-sm-6">
				<div class="row" style="margin-top:10px;margin-bottom:20px;margin-left: 30px">
					<p> 1. 책의 내용을 Editer에 작성 </p>
					<p> 2. 미리보기하여 PDF파일로 생성</p>
					<p> 3. 저장된 PDF 파일을 선택하여 ePub파일로 변환</p>
					<p> 4. BOOK 파일업로드 화면에서 ePub 파일 등록</p>
				</div>
				<div class="row Ere_line" style="padding:0; margin:0"></div>
				<div class="row minibox" >
					<h4>Editer</h4>
					<div class="row" >
						<div class="col-sm-8">	
							<label>PDF 파일명 : </label>
						 	<input type="text" id="pdfTitle" >
						</div>
						<div class="col-sm-2" style="padding:0;" >
							<button type="button" id="previewBtn" class="ebookBtn-sm">미리보기</button>
						</div>	
						<div class="col-sm-2"  style="padding:0;" >							
							<button type="button" id="pdfAdd" class="ebookBtn-sm">PDF생성</button>
						</div>
					</div>
					<div class="row"  style="margin-top:30px;"> 
						<textarea rows="6" cols="90" id="bookContents" name="bookContents" class="summernote"></textarea>
					</div>
				</div>
			</div>
			<div class="col-sm-6 row" style="padding-left:40px">
			
				<div class="row minibox">
					<div class="col-sm-12">
						<div class="row" style="margin:0px">
							<h4>ePub생성</h4> 
						</div>
						<div class="row" >
							<div class="col-sm-9">
							<form id="epubFrm" name="epubFrm" action="https://api.cloudconvert.com/convert" method="POST" enctype="multipart/form-data">
							    <input type="hidden" name="input" value="upload">
							    <input type="hidden" name="apikey" value="mYwzoSavODhFp3Fwb-7XwCbX9sXdBr2D9OjP4OXfltK4Kjbqf_jQ0_od1P3ctCJQ5czOn8GQNEqDxjCzTE7Prw">
							    <input type="hidden" name="download" value="inline">
							    <input type="hidden" name="inputformat" value="pdf">
							    <input type="hidden" name="outputformat" value="epub">
							    <input type="file" name="file" id="pdfFile" >
							</form>
							</div>
							<div class="col-sm-2 col-sm-offset-1">
								<input type="button" value="ePub변환" id="convertFile" class="ebookBtn-sm" >
							</div>
						</div>
					</div>
				</div>
				<div class="Ere_line"></div>
				<div class="row">
					<h4 style="padding-left:20px">미리보기</h4>
				</div>
				<div id="wrap" class="row box">
					<p></p> 
				</div>	
			</div>
		</div>
	</div>
</div>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/1.5.3/jspdf.min.js"></script>
<script type="text/javascript" src="https://html2canvas.hertzen.com/dist/html2canvas.min.js"></script>
</body>
</html>