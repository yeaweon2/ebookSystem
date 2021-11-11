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
    
    .batch:hover{
    	text-decoration: underline;
    	font-size: 17px;
    	font-weight: bold; 
    	cursor: pointer;
    }

  </style>
  <script type="text/javascript">
  	$(function(){
  		
  		$("#batchList").on("click", "tr" , function(){
  			
  			
  		});
  		
  		
  		$("#batchList").find("tr").first().click();
  		
  	});
  </script>
</head>
<body>
<section>
	<div class="section-inner">		
		<div class="container">
			<div class="row box">
				<div class="row">
					<div class="col-sm-3">
						<div class="row">
							<img width="140" height="200" src="${pageContext.request.contextPath}/fileUp${lend.bookCoverPath}${lend.bookCover}">
							<h3>${lend.bookNm}</h3>
							<h4>${lend.bookPublCo}(${lend.bookWriter})</h4>
						</div>
					</div>
					<div class="col-sm-9">
						<div class="row">
							<h4 >BOOK 파일 LIST</h4>
							<table id="batchList" class="table">
							<c:forEach var="batch" items="${batchList}">
								<tr class="row batch" data-batchnm="${batch.batchNm}" data-batchpath="${batch.batchPath}">
									<td>${batch.batchOrd}.${batch.batchNm}</td>
									<td>
										<audio controls>
											<source src="${pageContext.request.contextPath}/fileUp${batch.batchPath}${batch.batchNm}">
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