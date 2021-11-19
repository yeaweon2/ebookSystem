<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>책리뷰 상세페이지</title>

<style type="text/css">
.pointer {
	cursor: pointer;
}
</style>
<script>
$(function() {
	$("#likeItBtn").on("click", function(){
		var reviewId = $("#reviewId").val();
	 	 $.ajax({
			url : 'reviewLikeItUpdate' ,
			method : 'POST' ,
			data : JSON.stringify({ reviewId : reviewId }),
			contentType : 'application/json',					
			dataType : 'json',
			success : function(res){
				console.log(res);
				    if(res.result=="01"){
					alert("추천완료");	
					 var likeCnt = $("#LikeIt").text();
					 $("#LikeIt").text(parseInt(likeCnt)+1);
					 
				}  
			}
		}); 
	});
})


</script>
</head>
<body>
	<div class="inner-page pt-6">
		<div class="container">
			<div class="row mb-1" style="margin-top: 40px">
				<div class="section-header">
					<h2>상세페이지</h2><br><br>
				</div>
			</div>
			
			<!-- 게시글 -->
			<table class="table">
				<tr>
					<th colspan="6">${list.reviewTitle}</th>
				</tr>
				<tr>
					<td rowspan="2"><img width='80px' height='120px' src='${pageContext.request.contextPath}/fileUp${list.bookCoverPath}${list.bookCover}'></td>
					<td ><h5>${list.bookNm}</h5></td>
					<td>${list.bookWriter}</td>
					<td>추  천:</td>
					<td id="LikeIt"> ${list.reviewLikeit}</td>
					<td><button id="likeItBtn" class="bucketBtn" ><i class="fa fa-thumbs-o-up"></i></button></td>
				</tr>
				<tr>
					<td>작성자: ${list.reviewWriter}</td>
					<td>작성일자:<fmt:formatDate pattern="yyyy-MM-dd hh:mm:ss" value="${list.insDt}" /></td>
					<td>조회수: ${list.reviewHit}</td>
				</tr>
				<tr>
					<td colspan="6" height="300">${list.reviewContents}</td>
				</tr>
				
			</table>
					<!-- 댓글 입력-->
			<div id="replyput">
			<c:if test="${not empty id}">
				<table class="table">
				
					<tr>
					    <!--  프로필 -->
						
						<td colspan="3"><textarea id="replyinput" name="replyinput" placeholder="댓글입력.." rows="3" cols="160"></textarea>
					</tr>
					<tr>
						<td>${nicknm}<td>
						<td class="pull-right"><button type="button" id="replyInputBtn" data-reviewId="${list.reviewId}"class="btn-primary" >댓글등록</button></td>
					</tr>
				</table>
			</c:if>
			</div><hr><div>
					<input type="button" onclick="location.href='bookReviewList'" class="btn-primary" value="목록보기"> 
					<c:if test="${id eq list.reviewWriter}">
					<input type="button" onclick="reviewEdit('U')" class="btn-primary" value="수정">
					</c:if>
					<c:if test="${id eq list.reviewWriter || auth eq 'A' }">
					<input type="button" onclick="reviewEdit('D')"class="btn-primary" value="삭제">
					</c:if>
					</div><br><br>
			<!--  댓글 조회 -->
			<div id="comments-list" class="rList" style="margin : auto">
			</div>

	</div>
</div>
	
		<form id="frm" name="frm" method="post">
			<input type="hidden" id="reviewId" name="reviewId" value="${list.reviewId}">
		</form>
	<br><br>

	<script>
      
	//원글 수정,삭제
      function reviewEdit(str) {
         if (str == 'U') {
            frm.action = "reviewUpdateForm";
     	 } else {
              if (confirm('삭제하시면 적립된 500포인트가 소멸됩니다.') == true) {
               frm.action = "bookReviewDelete";
              } else {
               return false;
            } //else
         }//else
         frm.submit();
      }
   </script>
</body>
</html>