<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 상세페이지</title>
<style type="text/css">

.hidden {
	display: none;
}

</style>
<script>
   $(function() {
      replySelect();
      deletReply();
      updateReply();      
      
      //댓글 입력
      $("#replyInputBtn").on("click", function(){
         var newReply = $("#replyinput").val();
         var cmmntyId = $("#cmmntyId").val();
         
         console.log(cmmntyId);
         if (newReply == null || newReply == '') {
            alert("댓글을 입력해주세요.");
            $("#replyinput").focus();
            return false;   
         } else{
            
             $.ajax({
               url : 'replyInsert',
               method : 'POST',
               contentType : 'application/json' ,
               dataType : 'json',
               data : JSON.stringify({creplyContents : newReply , cmmntyId : cmmntyId }),
               success : function(data){
                  replySelect();
               }
            }); 
         }
      });
   });
   
   //댓글 조회
   function replySelect() {
      $.ajax({
         url : 'replyList',
         method : 'GET',
         dataType : 'json',
         data : { cmmntyId : $('#cmmntyId').val()},
         success : makeReply
      });
   }
   function makeReply(data) {
      $('#rList').empty();
      $.each(data,function(idx, item) {
	      $('#rList').append(
	         $('<tr>').append($('<td>').html(item.creplyWriter))
	                .append($('<td id="rContents">').html(item.creplyContents))
	                .append($('<td>').html(item.insDt))
	                .append($('<td>').html($("<input type='button' value='삭제' class='btnDel' id='btnDel'>")))
	                .append($('<td>').html($("<input type='button' value='수정' class='btnUp' id='btnUp'>")))
	                .data("id", item.creplyId )
	                .data("writer", item.writer )
	                .data("contents", item.creplyContents)
	                .data("udtDt", item.udtDt)
	                .data("insDt", item.insDt)
	             
	      ); //RList
      })
   }
   
   //댓글삭제
   function deletReply(){
      $("#rList").on("click", '.btnDel', function(){
         event.stopPropagation();
         var no = $(this).closest('tr').data("id");
         
          $.ajax({
            url : 'replyDelete' + no,
            method : 'DELETE',
            contentType : 'application/json;charset=utf-8',
            dataType : 'json',
            success : function(){
               replySelect();
            }
         }) 
      });
   }
   
   //댓글수정
   function updateReply(){
	   $("#rList").on("click", '.btnUp', function(){
		   event.stopPropagation();
		 
		   var no = $(this).closest('tr').data("id");
		   var contents = $(this).closest('tr').data("contents");
		   
		   $(this).closest('tr').find("#rContents").empty();
		   $(this).closest('tr').find("#rContents").append($("<input type='text'>").val(contents));
		   $(this).closest('tr').find("#btnUp").
		   
		   
/* 		   $.ajax({
			   url : 'replyUpdate',
			   data : JSON.stringify({creplyId : no , creplyContents : contents}),
			   method : 'PUT',
			   contentType: 'application/json',
			   dataType : 'json' ,
			   success : function(data){  
			   }
				
		   }) ; */
	   })
   }
   
</script>

</head>
<body>
   <div class="inner-page pt-6">
      <div class="container">
         <div class="row mb-1" style="margin-top: 40px">
            <div class="section-header">
               <h2>상세페이지</h2>
            </div>
         </div>
         <div>
            <table class="table">
               <tr>
                  <th colspan="6">${notice.cmmntyTitle}</th>
               </tr>
               <tr>
                  <td>작성자: ${notice.cmmntyWriter}</td>
                  <td>작성일자:<fmt:formatDate pattern="yyyy-MM-dd"
                        value="${notice.insDt}" /></td>
                  <td>조회수: ${notice.cmmntyHit}</td>
               </tr>

               <tr>
                  <td colspan="6" height="300">${notice.cmmntyContents}</td>
               </tr>
            </table>

            <div id="replyput">
               ${nicknm}
               <input type="text" id="replyinput" name="replyinput" placeholder="댓글입력.."> 
               <button type ="button" id ="replyInputBtn" data-cmmntyId="${notice.cmmntyId}">댓글등록</button>
            </div>
            <hr>

            <div id="replyout">
               <table id="rList">
               
               </table>
            </div>

            <input type="button" onclick="location.href='noticeList'" value="목록보기" class="btn btn-success"> 
            <input type="button" onclick="NoticeEdit('U')" value="수정" class="btn btn-primary">
            <input type="button" onclick="NoticeEdit('D')" value="삭제" class="btn btn-danger">

         </div>
      </div>
   </div>
   <form id="frm" name="frm" method="post">
      <input type="hidden" id="cmmntyId" name="cmmntyId" value="${notice.cmmntyId}">
   </form>
   <script>
      //버튼클릭시 글수정,삭제
      function NoticeEdit(str) {
         if (str == 'U') {
            frm.action = "noticeUpdateForm";
         } else {
            if (confirm('삭제하시겠습니까?') == true) {
               frm.action = "noticeDelete";
            } else {
               return false;
            } //else
         }//else
         frm.submit();
      }
   </script>
</body>
</html>