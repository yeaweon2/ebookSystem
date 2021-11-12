<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BOOK READING</title>
<style type="text/css">
    
    
    .batch {
    	font-size: 16px;
    }
    
  </style>
  <script type="text/javascript">
  	$(function(){
  		$("#lendList").on("click", function(){
  			
  		});
  	});
  </script>
</head>
<body>
<section>
	<div class="section-inner">		
		<div class="container">			
			<div class="row mb-1" style="margin-top: 30px;padding-left:30px">
				<div class="section-header" style="height:20px">
	          		<h2><img width="50px" height="50px" src="resources/img/audioBook.png"> 오디오북 LISTENING</h2>
	        	</div>
			</div>			
			<div class="row box" style="margin-top: 20px">
				<div class="row">
					<div class="col-sm-3">
						<div class="row">
							<img width="140" height="200" src="${pageContext.request.contextPath}/fileUp${lend.bookCoverPath}${lend.bookCover}">
							<h3>${lend.bookNm}</h3>
							<h4>${lend.bookPublCo}(${lend.bookWriter})</h4>
						</div>
					</div>
					<div class="col-sm-9">
						<div class="row "><a href="lendList" class="btn ebookBtn-sm pull-right" id="lendList">나의대여LIST</a></div>
						<div class="row">
							<h4 >BOOK 파일 LIST</h4>
							<table id="batchList" class="table">
								<c:forEach var="batch" items="${batchList}">
									<tr class="row batch" data-batchnm="${batch.batchNm}" data-batchpath="${batch.batchPath}">
										<td style="vertical-align: middle;">${batch.batchOrd}.${batch.batchNm}</td>
										<td>
											<audio controls="controls">
												<source src="${pageContext.request.contextPath}/fileUp${batch.batchPath}${batch.batchNm}" type="audio/mp3" >
											</audio>
										</td> 
									</tr>
								</c:forEach>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>
<script>
    

</script>
</body>
</html>