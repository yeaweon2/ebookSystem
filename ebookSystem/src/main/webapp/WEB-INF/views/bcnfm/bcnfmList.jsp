<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BOOK 승인목록</title>
<style type="text/css">
	.modal {
	  display: none; /* Hidden by default */
	  position: fixed; /* Stay in place */
	  z-index: 1; /* Sit on top */
	  padding-top: 100px; /* Location of the box */
	  left: 0;
	  top: 0;
	  width: 100%; /* Full width */
	  height: 100%; /* Full height */
	  overflow: auto; /* Enable scroll if needed */
	  background-color: rgb(0,0,0); /* Fallback color */
	  background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
	}
	
	/* Modal Content */
	.modal-content {
	  background-color: #fefefe; 
	  margin: auto;
	  width: 50%; /* Full width */
	  height: 30%; /* Full height */	  
	  padding: 40px;
	  border: 1px solid #888;
	}
	
	/* The Close Button */
	.close {
	  color: #aaaaaa;
	  float: right;
	  font-size: 28px;
	  font-weight: bold;
	}
	
	.close:hover,
	.close:focus {
	  color: #000;
	  text-decoration: none;
	  cursor: pointer;
	}
</style>
<script type="text/javascript">
	$(function(){
		$("#cnfmBtn").on("click", function(){
			
			var book = [];
			$("#chkInput:checked").each(function(){
					
				var bcnfmId = $(this).closest("tr").data("id");
				var bookId = $(this).closest("tr").data("book");
				var data = {
					bcnfmId : bcnfmId,
					bookId : bookId
				};
				
				book.push(data);
		    });
			
			console.log(book);
			if( book == null ){
				alert("승인처리건을 선택한 후 진행해주세요.");
				return false;
			}
			
			 $.ajax({
				url : 'bookAdminCnfm' ,
				data :  JSON.stringify(book)  ,
				contentType : 'application/json',
				method : 'POST' ,
				dataType : 'json' ,
				success : function(data){
					console.log(data);
				}
			}); 
		});
		
		$("#rejectBtn").on("click", function(){
			$("#myModal").css("display", "none");
			var rejectMsg = $("#rejectMsg").val();
			if(rejectMsg == ""){
				alert("보류사유를 작성해주세요.");
				return false;
			}
			
			var book = [];
			$("#chkInput:checked").each(function(){
					
				var bcnfmId = $(this).closest("tr").data("id");
				var bookId = $(this).closest("tr").data("book");
				
				var data = {
					bcnfmId : bcnfmId ,
					bookId : bookId ,
					bcnfmReject : rejectMsg
				};
				
				book.push(data);
		    });
			
			if( book == null ){
				alert("승인처리건을 선택한 후 진행해주세요.");
				return false;
			}
			
			 $.ajax({
				url : 'bookAdminReject' ,
				data :  JSON.stringify(book)  ,
				contentType : 'application/json',
				method : 'POST' ,
				dataType : 'json' ,
				success : function(data){
					console.log(data);
				}
			}); 
			
			
			
		});
	});

</script>
</head>
<body>
<div class="inner-page pt-6">
	<div>
		<div class="row mb-1" style="margin-top: 40px">
			<div class="section-header">
          		<h2>BOOK 승인목록</h2>
        	</div>
		</div>	
		<div class="row">
			<table id="bcnfmTb" class="table table-hover" style="cursor: pointer;">
					<tr>
						<th></th>
						<th>No</th>
						<th>신청일자</th>
						<th>신청자</th> 
						<th>BOOK명</th>
						<th>상태</th>
						<th>승인일자</th>
						<th>승인자</th>
					</tr>
					<tbody>
						<c:forEach var="list" items="${lists}" >
							<tr data-id="${list.bcnfmId}" data-book="${list.bookId}">
								<td><input type="checkbox" id="chkInput"></td>
								<td>${list.bcnfmNo}</td>
								<td><fmt:formatDate pattern="yyyy-MM-dd"  value="${list.bcnfmReqDt}"/></td>
								<td>${list.bcnfmReqNm}</td>
								<td>
									<c:if test="${not empty list.bookCoverPath}">
										<img width="50" height="70" src="/prj/fileUp${list.bookCoverPath}${list.bookCover}">&nbsp;&nbsp;
									</c:if>
								${list.bookNm}</td>
								<c:if test="${list.bcnfmStCd eq '승인'}">
									<td style="color:red;font-weight:bold">${list.bcnfmStCd}</td>
								</c:if>
								<c:if test="${list.bcnfmStCd eq '보류'}">
									<td style="color:#0c2e8a;font-weight:bold">${list.bcnfmStCd}</td> 
								</c:if>
								<c:if test="${list.bcnfmStCd eq '처리중'}">
									<td>${list.bcnfmStCd}</td>
								</c:if>
								<td><fmt:formatDate pattern="yyyy-MM-dd"  value="${list.bcnfmCnfmDt}"/></td>
								<td>${list.bcnfmCnfmr}</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<div>
					<button type="button" id="cnfmBtn" class="btn btn-primary">승 인</button>
					<button type="button" id="rejectModalBtn" class="btn btn-primary">보 류</button>
				</div>
		</div>
	</div>
</div>		

<div id="myModal" class="modal">
  <!-- Modal content -->
  <div class="modal-content">
    <span id="close" class="close">&times;</span>
    <p>승인 보류 사유를 입력해주세요.</p>
    <input type="text" id="rejectMsg" name="rejectMsg">
    <button type="button" id="rejectBtn" class="btn btn-primary">확인</button>
  </div>
</div>
<script>
	 
	$("#rejectModalBtn").on("click", function(){
		$("#myModal").css("display", "block");	
	});
	
	$("#close").on("click", function(){
		$("#myModal").css("display", "none");
	});
	
	window.onclick = function(event) {
		if (event.target == modal) {
			$("#myModal").css("display", "none");
		}
	}
</script>
</body>
</html>