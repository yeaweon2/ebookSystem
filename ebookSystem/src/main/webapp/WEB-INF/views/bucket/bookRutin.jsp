<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">

.rutinDiv {
	position: relative;
	background-color:white;
	width : 200px;
	heigth : 300px;
	border-radius: 10px ;
}

</style>
</head>
<body>
<section>
	<div class="section-inner">		
		<div class="container">
			<div class="row text-center" >
				<img src="resources/img/bookRutinBg.jpg" width="1000px" height="600px" style="opacity:0.6;position: relative;">
				<div class="col-sm-4">
					<div id="lendDiv" class="rutinDiv" style="left:300px;top:-190px">
						<p><img src="resources/img/lendCnt.png"></p>
						<p><label>대여횟수</label></p>
						<label>회</label>
					</div>
				<div class="col-sm-4">
					<div id="bucketDiv" class="rutinDiv" style="left:500px;top:-330px">
						<p><img src="resources/img/bucketCnt.png"></p>
						<p><label>대여횟수</label></p>
						<label>회</label>
					</div>
				</div>
				<div class="col-sm-4">
					<div id="loginDiv" class="rutinDiv"  style="left:700px;top:-350px">
						<p><img src="resources/img/bucketCnt.png"></p>
						<p><label>접속횟수</label></p>
						<label>회</label>					
					</div>
				</div>		
						
						
						
						
				</div>
			</div>
		</div>
	</div>
</section>
</body>
</html>