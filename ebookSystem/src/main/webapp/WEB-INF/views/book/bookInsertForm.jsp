<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>도서등록</title>
<script type="text/javascript">
$(function(){
	$(".modal").hide();
	
	$("#bookSearch").on("click" , function(){
		$(".modal").show();	
			
	});
	
	
	
	
});


</script>
</head>
<body>
	<div class="inner-page pt-6">
		<div class="container">
			<div class="row mb-1" style="margin-top: 40px">
				<div class="section-header">
	          		<h2>BOOK 등록</h2>
	        	</div>
			</div>	
			<div>
				<form action="bookInsert" method="post" id="frm" name ="frm">
					<table class="table">
						<tr>
							<th>카테고리</th>
							<td><input type="text" id="ctgyId" name="ctgyId" > 
								<input type="button" value="카테고리조회">
							</td>
							<th>도서구분</th>
							<td>
								<input type="radio" class="form-check-input" id="radio1" name="optradio" value="option1" checked>&nbsp;eBook&nbsp;&nbsp;
			  					<input type="radio" class="form-check-input" id="radio1" name="optradio" value="option1" checked>&nbsp;오디오북
							</td>
						</tr>
						<tr> 
							<th>BOOK명</th>
							<td colspan="3"><input type="text" id="bookNm" name="bookNm" size="100px" >
								<input type="button" id="bookSearch" value="BOOK조회" >
							</td>
						</tr>
						<tr>
							<th>출판사</th>
							<td><input type="text" id="bookPublCo" name="bookPublCo" ></td>
							<th>저 자</th>
							<td><input type="text" id="bookWriter" name="bookWriter" ></td>
						</tr>
						<tr>
							<th>출간일</th>
							<td><input type="date" id="bookPublDt" name="bookPublDt" ></td>
							<th>가 격</th>
							<td><input type="text" id="bookAmt" name="bookAmt" ></td>
						</tr>
						<tr>
							<th>도서ISBN</th>
							<td><input type="text" id="bookIsbn" name="bookIsbn" ></td>
							<th>할인율</th>
							<td><input type="text" id="bookDisCnt" name="bookDisCnt" ></td>
						</tr>
						<tr>
							<th>표지디자인</th>
							<td><input type="file" value="파일조회"></td>
							<th>BOOK파일</th>
							<td><input type="file" value="파일조회"></td> 
						</tr>				
						<tr>
							<th>책소개</th>
							<td colspan="3"><textarea rows="6" cols="90" id="bookIntro" name="bookIntro"></textarea></td>
						</tr>
						<tr>
							<th>목차</th>
							<td colspan="3"><textarea rows="6" cols="90" id="bookContent" name="bookContent"></textarea></td>
						</tr>
						<tr>
							<th>저자소개</th>
							<td colspan="3"><textarea rows="6" cols="90" id="bookWriterIntro" name="bookWriterIntro"></textarea></td>
						</tr>
					</table>
					<div>
						<button type="submit" id="bookInsertBtn">등록</button>
						<button type="button" onclick="location.href='bookList'">BOOK목록</button>
					</div>
				</form>
			
			</div>
		</div>
	</div>
	
	


<div class="modal" >
  <div class="screen">
    <div class="layerpop">
      <p class="layerpop__container">
      	도서를 검색하세요
      	<input type="text" id="bookNm"> 
      	<button type="button" id="bookApiSearch"></button>
      </p>
      <button type="button" value="close" class="btn modal--close">Close</button>
    </div>
  </div>
</div>


<script type="text/javascript">

$(function(){
	$("#bookApiSearch").click(function(){
		$.ajax({
			method : "get",
			url : "https://dapi.kakao.com/v3/search/book",
			data : { query : $("#bookNm").val()},
			headers : { Authorization : "KakaoAK f1d4b3c07a4bac151a4340d72fcf349d"} ,
			success : function(res){
				console.log(res);	
			}
		});
	});

});

</script>	
</body>
</html>