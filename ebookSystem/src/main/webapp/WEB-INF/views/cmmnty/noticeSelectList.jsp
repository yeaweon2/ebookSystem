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
.pointer {
	cursor: pointer;
}

.circle{
width: 80px;
height: 80px;
border-radius : 50%;
}
</style>

<script>
   $(function() {
      replySelect();			//댓글 조회
      deletReply(); 			//댓글 삭제
      updateReply();			//댓글 수정
      rBtnCancle();				//댓글 취소
      
      rRBtnCancle(); 			//대댓글 취소
      rReplyInputForm(); 		//대댓글양식 작성
      
      
      
      //댓글 입력
      $("#replyInputBtn").on("click", function(){
 
        var newReply = $("#replyinput").val().trim();
        var cmmntyId = $("#cmmntyId").val();
  	   
      //댓글이 널값인경우
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
                  	     $("#replyinput").val('');
                        }
            }); 
      }//else끝 
    });
      
      //다운로드
      $("#download").click(function(){
    	  var filePath = "";
    	  var fileName = "";
    	  
    	  location.href="fileUp/notice/?"
    	  
      })
  });
   
   //댓글 입력양식
    function rReplyInputForm(){
	   $("#comments-list").on("click", "#rreplyInputBtn",function(){
		   event.stopPropagation();
		
		$(this).closest('table').next().append(
			    		  $('<table class="table">').append($('<tr>').html()),
		        		             $('<tr>').append($('<td>').html($("<textarea id='rReplyinput' cols='100' placeholder='답글을 입력해보세요'>"))),
		        		     		 $('<tr>').append($('<td>').html(),
		        		     					$('<td class="pull-right">').html($("<a class='pointer' id='rRbtnSave'>").html("등록")),
		        		     					$('<td>').html($("<a class='pointer' id='rRbtnCancle' >").html("취소")),
		        		     				    $('<td>').html($("<a class='rRbtnUp pointer' id='rRbtnUp' style='display :none'>").html("수정")),
		        		     				    $('<td>').html($("<a class='rRbtnDel pointer' id='rRbtnDel' style='display :none'>").html("삭제"))		   						        		     				   
		        		     					)
			)
	   }); 
   } 
   

   //댓글 조회
   function replySelect() {
      console.log($('#cmmntyId').val());
      $.ajax({
         url : 'replyList',
         method : 'GET',
         dataType : 'json',
         data : {cmmntyId : $('#cmmntyId').val()},
         success : makeReply
         
      });
   }
   function makeReply(data) {
      $('#comments-list').empty();
      $.each(data,function(idx, item) {
	      $('#comments-list').append(
	         
	    		  $('<table class="table replyTb">')
	    		  			.append($('<tr class="noimg">').append( $('<td>').append($('<img class="circle">'))
	    		  					$('<tr>').append($('<td id="rContents">').html(item.creplyContents)),		
	    		  			),
	         						($('<tr>').append('<td>').html(item.creplyWriter)),
	        		             			   $('<tr>').append($('<td id="rContents">').html(item.creplyContents)),
	        		     					   $('<tr>').append($('<td>').append('<small>').html(item.insDt),
				        		     				   		   // $('<td>').html($("<a class='rreplyInputBtn pointer' id='rreplyInputBtn'>").html("답글쓰기")),
				        		     				 		    $('<td>').html($("<a class='btnUp pointer' id='btnUp'>").html("수정")),
				        		     				 		    $('<td>').html($("<a class='pointer' id='btnSave' style='display :none'>").html("저장")),
				        		     				 		    $('<td>').html($("<a class='btnDel pointer' id='btnDel' >").html("삭제")),
				        		     				 		    $('<td>').html($("<a class='pointer' id='btnCancle' style='display :none'>").html("취소")),
	        		     				)//마지막 tr행끝
	        		     				.data("cid", item.cmmntyId )
	        		     				.data("id", item.creplyId )
	        		    	            .data("writer", item.creplyWriter )
	        		    	            .data("contents", item.creplyContents)
	        		    	            .data("crclass", item.creplyClass)
	        		    	            .data("crgr", item.creplyGr)
	        		    	            .data("udtDt", item.udtDt)
	        		    	            .data("insDt", item.insDt)		
	        ).attr("id", "rplyTb" + item.creplyId),// 댓글table끝
	         $('<table class="table">').attr("id", "rRplyTb" + item.creplyId)
	      
	      );//comments-list
	      
	      console.log(idx + " / " + item.memberProfileNm);
	      console.log("/prj/fileUp/profile/" + item.memberProfileNm);
	      console.log($(".replyTb:last").find("tr:first"));
	      if(item.memberProfileNm != null){
	    	  $(".replyTb:last").find("tr:first").find("img").attr("src","/prj/fileUp/profile/" + item.memberProfileNm);
	      }else{
	    	  $(".replyTb:last").find("tr:first").find("img").attr("src","/prj/fileUp/profile/" + "기본이미지.png");
	      }
      })
   }
   
   //댓글 삭제
   function deletReply(){
      $("#comments-list").on("click", '.btnDel', function(){
         event.stopPropagation();
         var creplyId = $(this).closest('tr').data("id");
         var cmmntyId = $(this).closest('tr').data("cid");
         
         
            $.ajax({
            url : 'replyDelete',
            data : JSON.stringify({creplyId : creplyId , cmmntyId : cmmntyId}),
            method : 'DELETE',
            contentType : 'application/json;charset=utf-8',
            dataType : 'json',
            success : function(){
               replySelect();
               
            } 
         }) 
      });
   }
   
   //댓글 수정
   function updateReply(){
	   $("#comments-list").on("click", '.btnUp', function(){
		   event.stopPropagation();
		   
		   var creplyId = $(this).closest('tr').data("id");
		   var contents = $(this).closest('tr').data("contents");
		   console.log(contents);
		   
		   $(this).closest('tr').prev().find("#rContents").empty();
		   $(this).closest('tr').prev().find("#rContents").append($("<textarea rows='3' >").html(contents));
		   $(this).closest('tr').find("#btnDel").css('display', 'none');
		   $(this).closest('tr').find("#btnUp").css('display', 'none');
		   $(this).closest('tr').find("#btnSave").css('display', 'block');
		   $(this).closest('tr').find("#btnCancle").css('display', 'block');
		  
		   $.ajax({
			   url : 'replyUpdate',
			   data : JSON.stringify({creplyId : creplyId , creplyContents : contents}),
			   method : 'PUT',
			   contentType: 'application/json',
			   dataType : 'json' ,
			   success : function(data){
				   		   rBtnSave();

			   }
				
		   }) 
	   })
   }
   
   //댓글 취소
   function rBtnCancle(){
	   $("#comments-list").on("click", '#btnCancle', function(){
		   event.stopPropagation();
		   
		   var contents = $(this).closest('tr').data("contents");
		   
		   $(this).closest('tr').prev().find("#rContents").empty();
		   $(this).closest('tr').prev().find("#rContents").html(contents);
		   $(this).closest('tr').find("#btnSave").css('display', 'none');
		   $(this).closest('tr').find("#btnCancle").css('display', 'none');
		   $(this).closest('tr').find("#btnDel").css('display', 'block');
		   $(this).closest('tr').find("#btnUp").css('display', 'block');
	   })
   }
   
   //대댓글 취소
   function rRBtnCancle(){
	   $("#comments-list").on("click", '#rRbtnCancle', function(){
		   event.stopPropagation();
			 $(this).closest('tr').prev().prev().remove();
			 $(this).closest('tr').prev().remove();
			 $(this).closest('tr').remove(); 
			 
	   })
   }
   
   //댓글 저장(수정후 등록)
   function rBtnSave(){
	   $("#comments-list").on("click", '#btnSave', function(){
		   event.stopPropagation();
		   
		   var creplyId = $(this).closest('tr').data("id");
		   var contents = $(this).closest('table').find("textarea").val();
			
		   $.ajax({
			   url : 'replyUpdate',
			   data : JSON.stringify({creplyId : creplyId , creplyContents : contents}),
			   method : 'PUT',
			   contentType: 'application/json',
			   dataType : 'json' ,
			   success : function(data){
				   replySelect();

			   }
				
		   }) 
	   })
   }
   
   
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
					<th colspan="6">${notice.cmmntyTitle}</th>
				</tr>
				<tr>
					<td>작성자: ${notice.cmmntyWriter}</td>
					<td>작성일자:<fmt:formatDate pattern="yyyy-MM-dd hh:mm:ss" value="${notice.insDt}" /></td>
					<td>조회수: ${notice.cmmntyHit}</td>
				</tr>
				<tr>
					<td colspan="6" height="300">${notice.cmmntyContents}</td>
				</tr>
				<tr>
					<td>
					첨부파일: <a href ="download?cmmntyAtchNm=${notice.cmmntyAtchNm}">${notice.cmmntyAtchNm}</a> 
					</td>
				</tr>
			</table>

			<!-- 댓글 입력-->
			<div id="replyput">
			<c:if test="${not empty id}">
				<table class="table">
				<tr><td>
					<c:if test="${empty memf}">
							<img id="proimg1" src="resources/assets/img/noimg.jpg" >
						</c:if>
					<c:if test="${not empty memf}">
							<img id="proimg1" src="${pageContext.request.contextPath}/fileUp/profile/${memfn}" >&nbsp;&nbsp;
					</c:if></td>
					<td>
					<td colspan="3"><textarea id="replyinput" name="replyinput" placeholder="댓글입력.." rows="3" cols="160"></textarea>
					</td>
				</tr>
				<tr>
					<th>${nicknm}</th>
					<td colspan="2"></td>
					<td class="pull-right"><button type="button" id="replyInputBtn" data-cmmntyId="${notice.cmmntyId}"class="btn-primary" >댓글등록</button></td>
				</tr>
				</table>
			</c:if>
			</div><hr><div>
					<input type="button" onclick="location.href='noticeList'" class="btn-primary" value="목록보기"> 
					<c:if test="${auth eq 'A'}">
					<input type="button" onclick="NoticeEdit('U')" class="btn-primary" value="수정">
					<input type="button" onclick="NoticeEdit('D')"class="btn-primary" value="삭제">
					</c:if>
					</div><br><br>
			<!--  댓글 조회 -->
			<div id="comments-list" class="rList" style="margin : auto">
			</div>
					
		</div>
</div>
	
		<form id="frm" name="frm" method="post">
			<input type="hidden" id="cmmntyId" name="cmmntyId" value="${notice.cmmntyId}">
		</form>
	<br><br>

	<script>
      
	//원글 수정,삭제
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