<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">

.rutinDiv {
	position: relative;
	background-color:white;
	width : 180px;
	heigth : 200px;
	border-radius: 10px;
	padding-top:20px;
	padding-bottom:20px;
}

.rutinLabel {
	font-weight: bold;
	font-size: 18px;
}

.directionDiv {
	position: relative;
}

.directionDiv img:hover  {
	position: relative;
	cursor : pointer;
	width:50px;
	height:50px;
}

#prevMM , #nextMM {

	font-family: 'Dancing Script', cursive;
	color : white;
	font-size: 50px;
	opacity: 0.5;
}

.mmhover {
	font-size: 55px;
}

.today {
	font-size:50px;
	position: relative;
	color: #f0ebeb;
	
}
</style>
<script type="text/javascript">
	
	var today = `${todayMM}`;
	var yy = today.substring(0,4);
	var mm = today.substring(4,6);
	
	$(function(){
		$("#yy").html(yy);
		$("#mm").html(mm);
		
		$("#nextMM").html(parseInt(mm)+1);
		$("#prevMM").html(parseInt(mm)-1);
		
		$(".nextImg").on("mouseover", function(){
			$("#nextMM").addClass("mmhover");
		});
		
		$(".prevImg").on("mouseover", function(){
			$("#prevMM").addClass("mmhover");
		});	
		
		$(".nextImg").on("mouseleave", function(){
			$("#nextMM").removeClass("mmhover");
		});
		
		$(".prevImg").on("mouseout", function(){
			$("#prevMM").removeClass("mmhover");
		});					
		
		$(".nextImg").on("click", function(){
			var nextMM = $("#nextMM").html();
			var prevMM = $("#prevMM").html();
			mm = $("#mm").html();
			yy = $("#yy").html();

			if( mm == '12'){
				$("#yy").html(parseInt(yy)+1);
				$("#mm").html("1");
				$("#nextMM").html("2");
				$("#prevMM").html("12");
			}else if( mm == '11'){
				$("#mm").html("12");
				$("#nextMM").html("1");
				$("#prevMM").html("11");
			}else if( mm == '1'){
				$("#mm").html("2");
				$("#nextMM").html("3");
				$("#prevMM").html("1");
			}else{
				$("#mm").html(parseInt(mm)+1);
				$("#nextMM").html(parseInt(nextMM)+1);
				$("#prevMM").html(parseInt(prevMM)+1);
			}

			var grMM = "";
			if( parseInt($("#mm").html())  < 10 ){
				grMM = "0" + $("#mm").html()
			}else{
				grMM = $("#mm").html();
			}
			
			var	grDt = $("#yy").html() + grMM; 
			console.log( grMM + " / " + grDt + " / " + $("#mm").html());
			
			$.ajax({
				url : 'bookRestRutin' ,
				method : 'POST' ,
				data : JSON.stringify({ grDt : grDt }),
				contentType : 'application/json',					
				dataType : 'json',
				success : function(res){
					
					$("#lendList").find("tbody").empty();
					$("#bucketList").find("tbody").empty();
					
					if(res.bucketRutin.length > 0){
						if( res.bucketRutin.length == 1 ){
							$("#bucketDoneCnt").html("0 회 / ");
						}
						$.each(res.bucketRutin,function(idx,item){
							if( item.flag == 'all'){
								$("#bucketAllCnt").html(item.rutinCnt + "회");	
							}else{
								$("#bucketDoneCnt").html(item.rutinCnt+ "회 / ");	
							}
						});
						
						$.each(res.bucketRutinList,function(idx,item){
							$("#bucketList").find("tbody").append( $("<tr>")
												.append( $("<td>").append($("<img width='50' height='70'>").attr("src" , "/prj/fileUp" + item.bookCoverPath + item.bookCover ) ) )
												.append( $("<td>").html("<label>" + item.bookNm + "</label><br/>" + item.bookPublCo + "(" + item.bookWriter + ")" )) 
												.append( $("<td>").html(item.bucketDoneDt)  )
							)
						});						
					}else{
						$("#bucketAllCnt").html("/ 0 회");	
						$("#bucketDoneCnt").html("0 회");
						$("#bucketList").find("tbody").append( $("<tr>").append($("<td colspan='3'>").html("해당 자료가 존재하지않습니다.")));
						
					}
					
					if(res.lendRutin.length > 0){
						$.each(res.lendRutin,function(idx,item){
							$("#lendCnt").html(item.rutinCnt+ "회");
						});	
						
						$.each(res.lendRutinList,function(idx,item){
							$("#lendList").find("tbody")
										.append( $("<tr>")
											.append( $("<td>").append($("<img width='50' height='70'>").attr("src" , "/prj/fileUp" + item.bookCoverPath + item.bookCover ) ) )
											.append( $("<td>").html("<label>" + item.bookNm + "</label><br/>" + item.bookPublCo + "(" + item.bookWriter + ")" ))
											.append( $("<td>").html(item.insDt)  )
							)
						});						
					}else{
						$("#lendCnt").html("0 회");
						$("#lendList").find("tbody").append( $("<tr>").append($("<td colspan='3'>").html("해당 자료가 존재하지않습니다.")));
					}
				
					if(res.loginRutin.length > 0){
						$.each(res.loginRutin,function(idx,item){
							$("#loginCnt").html(item.rutinCnt+ "회");
						});	
					}else{
						$("#loginCnt").html("0 회");
					}
					
					
					
					
				}
			});
		});
		
		$(".prevImg").on("click", function(){
			var nextMM = $("#nextMM").html();
			var prevMM = $("#prevMM").html();
			mm = $("#mm").html();
			yy = $("#yy").html();
			
			if( mm == '1'){
				$("#yy").html(parseInt(yy)-1);
				$("#mm").html("12");
				$("#nextMM").html("1");
				$("#prevMM").html("11");
			}else if( mm == '2'){
				$("#mm").html("1");
				$("#nextMM").html("2");
				$("#prevMM").html("12");
			}else if( mm == '12'){
				$("#mm").html("11");
				$("#nextMM").html("12");
				$("#prevMM").html("10");
			}else{
				$("#mm").html(parseInt(mm)-1);
				$("#nextMM").html(parseInt(nextMM)-1);
				$("#prevMM").html(parseInt(prevMM)-1);
			}
			
			var grMM = "";
			if( parseInt($("#mm").html())  < 10 ){
				grMM = "0" + $("#mm").html();
			}else{
				grMM = $("#mm").html();
			}
			
			var	grDt = $("#yy").html() + grMM; 
			console.log( grMM + " / " + grDt + " / " + $("#mm").html());
			
			$.ajax({
				url : 'bookRestRutin' ,
				method : 'POST' ,
				data : JSON.stringify({ grDt : grDt }),
				contentType : 'application/json',					
				dataType : 'json',
				success : function(res){
					console.log(res);
					
					$("#lendList").find("tbody").empty();
					$("#bucketList").find("tbody").empty();
					
					if(res.bucketRutin.length > 0){
						if( res.bucketRutin.length == 1 ){
							$("#bucketDoneCnt").html("0 회 / ");
						}
						
						$.each(res.bucketRutin,function(idx,item){
							if( item.flag == 'all'){
								$("#bucketAllCnt").html(item.rutinCnt + "회");	
							}else{
								$("#bucketDoneCnt").html(item.rutinCnt+ "회 / ");	
							}
						});
						
						$.each(res.bucketRutinList,function(idx,item){
							$("#bucketList").find("tbody").append( $("<tr>")
												.append( $("<td>").append($("<img width='50' height='70'>").attr("src" , "/prj/fileUp" + item.bookCoverPath + item.bookCover ) ) )
												.append( $("<td>").html("<label>" + item.bookNm + "</label><br/>" + item.bookPublCo + "(" + item.bookWriter + ")" ))
												.append( $("<td>").html(item.bucketDoneDt)  )
										)
						});
					}else{
						$("#bucketAllCnt").html("/ 0 회");	
						$("#bucketDoneCnt").html("0 회");
						$("#bucketList").find("tbody").append( $("<tr>").append($("<td colspan='3'>").html("해당 자료가 존재하지않습니다.")));
					}
					
					if(res.lendRutin.length > 0){
						$.each(res.lendRutin,function(idx,item){
							$("#lendCnt").html(item.rutinCnt+ "회");
														
						});
						
						$.each(res.lendRutinList,function(idx,item){
							$("#lendList").find("tbody")
								.append( $("<tr>")
									.append( $("<td>").append($("<img width='50' height='70'>").attr("src" , "/prj/fileUp" + item.bookCoverPath + item.bookCover ) ) )
									.append( $("<td>").html("<label>" + item.bookNm + "</label><br/>" + item.bookPublCo + "(" + item.bookWriter + ")" ))
									.append( $("<td>").html(item.insDt)  )
								)
						});
					}else{
						$("#lendCnt").html("0 회");
						$("#lendList").find("tbody").append( $("<tr>").append($("<td colspan='3'>").html("해당 자료가 존재하지않습니다.")));
					}
				
					if(res.loginRutin.length > 0){
						$.each(res.loginRutin,function(idx,item){
							$("#loginCnt").html(item.rutinCnt+ "회");
						});	
					}else{
						$("#loginCnt").html("0 회");
					}
				}
			});			
			
			
		});			
		
	});
	
</script>
</head>
<body>
<section>
	<div class="section-inner">		
		<div class="container">
			<div class="row" >
				<div class="section-header" >
	          		<h2><img width="50px" height="50px" src="resources/img/books.png"> ${nicknm}님의 독서루틴</h2>
	        	</div>
			</div>	
			<div class="row" style="background-image:url(resources/img/rutingrbg.png);width:1200px;height:500px;background-repeat: no-repeat;background-size: 100% 100%; border-radius: 1%;" >
				<div class="col-sm-12" >
					<div class="row" style="padding-top:80px;padding-bottom:20px" >
						<div class="col-sm-12" style='padding-left:350px' > 
							<label class="today"><span id="yy"></span>년 <span id="mm"></span>월</label>
						</div>
					</div>
					<div class="row" >
						<div class="col-sm-7">
							<div class="row" >
								<div class="col-sm-2 col-sm-offset-1" > 
								
									<div class="row">
										<div class="directionDiv" style="left:40px;width:50px">
											<h1 id="prevMM" >1</h1>
										</div>
									</div>
									<div class="row">
										<div class="directionDiv" style="left:40px;width:50px">
											<img class="prevImg" width="40" height="40" src="resources/img/whitePrev.png">
										</div>    
									</div>
								</div>
		
								<div class="col-sm-2 " > 
									<div id="lendDiv" class="rutinDiv text-center">
										<img width="60" height="80" src="resources/img/lendCnt.png">
										<p><label class="rutinLabel">대여횟수</label></p>
										<c:forEach var="lend" items="${lendRutin}">
											<label id="lendCnt" class="rutinLabel">${lend.rutinCnt} 회</label>
										</c:forEach>
									</div>
								</div>
								<div class="col-sm-2" >
									<div id="bucketDiv" class="rutinDiv text-center" style="margin-left:80px;">
										<p><img width="50" height="70" src="resources/img/bucketCnt.png"></p>
										<p><label class="rutinLabel">버킷횟수</label></p>
										<span>
									 	<c:forEach var="buck" items="${bucketRutin}">
											<c:if test="${buck.flag =='gr'}"><label id="bucketDoneCnt" class="rutinLabel">${buck.rutinCnt} 회 / </label></c:if>
											<c:if test="${buck.flag =='all'}"><label id="bucketAllCnt" class="rutinLabel">${buck.rutinCnt} 회 </label></c:if>				
										</c:forEach>
										</span>
									</div>
								</div>
								<div class="col-sm-2" >
									<div id="loginDiv" class="rutinDiv text-center"  style="margin-left:160px;">
										<p><img width="60" height="70" src="resources/img/loginCnt.png" ></p>
										<p><label class="rutinLabel">접속횟수</label></p>
										<c:forEach var="login" items="${loginRutin}">
									 		<label id="loginCnt" class="rutinLabel">${login.rutinCnt} 회</label>
										</c:forEach>
									</div>
								</div>
								<div class="col-sm-2 col-sm-offset-1" style="margin-left:50px;">
									<div class="row">
										<div class="directionDiv" style="left:240px;width:50px">
											<h1 id="nextMM" class="directionImg" style="font-family: 'Dancing Script', cursive;">3</h1>
										</div>
									</div>
									<div class="row">
										<div class="directionDiv" style="left:240px;width:50px">
											<img class="nextImg" width="40" height="40" src="resources/img/whiteNext.png">
										</div>    
									</div>
									
								</div>
							</div> 
						</div>
					</div>
				</div>
			</div>
			<div class="row " style="margin-top:50px">
				<div class="col-sm-5 box">
					<div class="row mb-1" >
						<div class="section-header" >
			          		<h2><img width="40px" height="40px" src="resources/img/lendTitle.png"> ${nicknm}님의 대여내역</h2>
			        	</div>
					</div>	
					<div class="row">
						<table id="lendList" class="table">
							<thead>
								<tr>
								<td colspan="2">대여BOOK</td>
								<td>대여일자</td>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="lendList" items="${lendRutinList}" >
									<tr>
										<td>
											<img width="50" height="70" src="/prj/fileUp${lendList.bookCoverPath}${lendList.bookCover}">
										</td>
										<td><label>${lendList.bookNm}</label><br>${lendList.bookPublCo}(${lendList.bookWriter})</td>
										<td>${lendList.insDt}</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
				<div class="col-sm-5 col-sm-offset-2 box">
					<div class="row mb-1">
						<div class="section-header" >
			          		<h2><img width="40px" height="40px" src="resources/img/bucketTitle.png"> ${nicknm}님의 버킷BOOK</h2>
			        	</div>
					</div>
					<div class="row">
						<table id="bucketList" class="table">
							<thead>
								<tr>
								<td colspan="2">버킷BOOK</td>
								<td>버킷완료일자</td>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="bucketList" items="${bucketRutinList}" >
									<tr>
										<td>
											<img width="50" height="70" src="/prj/fileUp${bucketList.bookCoverPath}${bucketList.bookCover}">
										</td>
										<td><label>${bucketList.bookNm}</label><br>${bucketList.bookPublCo}(${bucketList.bookWriter})</td>
										<td>${bucketList.bucketDoneDt}</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					
					</div>
				</div>
			</div>
		</div>
	</div>
</section>
</body>
</html>
