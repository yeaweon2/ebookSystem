<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>카테고리 관리</title>
<style type="text/css">	
 .package {
 	border-radius: 7px;
 }
</style>

</head>
<body>
<div class="site-section">
	<div class="container">
		<div class="row mb-1" style="margin-top: 40px">
			<div class="section-header">
          		<h2>카테고리</h2>
        	</div>
		</div>
		<div class="row">
			<div class="col-lg-6 mb-6 mb-lg-0">
				<div class="package text-center bg-white">
					<br/>
					<h3 class="text-success">대분류</h3>
						<table id="lcodeTb" class="table table-hover">
							<tr>
								<th>대분류</th>
								<th>대분류명</th>
							</tr>
							<c:forEach var="list" items="${lists}" >
								<tr id="lcodeTr">
									<td>${list.ctgyId}</td>
									<td>${list.ctgyNm}</td>
								</tr>
							</c:forEach>	
						</table>					
					<p>
						<a href="#" class="btn btn-warning btn-custom-1 mt-4">추가</a>
						<a href="#" class="btn btn-warning btn-custom-1 mt-4">수정</a>
						<a href="#" class="btn btn-warning btn-custom-1 mt-4">삭제</a>
					</p>
				</div>
			</div>
			<div class="col-lg-6 mb-6 mb-lg-0">
				<div class="package text-center bg-white">
					<br/>
					<h3 class="text-danger">소분류</h3>
						<table id="scodeTb" class="table table-hover">
						</table>
					<p>
						<a href="#" class="btn btn-success btn-custom-1 mt-4">추가</a>
						<a href="#" class="btn btn-success btn-custom-1 mt-4">수정</a>
						<a href="#" class="btn btn-success btn-custom-1 mt-4">삭제</a>
					</p>
				</div>
			</div>
		</div>
	</div>
</div>
    	
<script type="text/javascript">
	
	var lcodeTr = $("#lcodeTr");
	lcodeTr.on("click", function(event){
		console.log(event.target);
		
		var id = "A00";
		$.ajax({
			  type: "GET",
			  url: "ctgyDetailList",  
			  data: { id : id },  
			  dataType: "JSON",
			  success: function(res){
				  console.log(res);
			  },
			  error : function(rej){
				  console.log(rej);
			  }
			});  
		
		
	});
</script>
</body>
</html>