<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>도서등록</title>
<link href="resources/css/form-validation.css" rel="stylesheet">
<link href="resources/assets/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="canonical" href="https://getbootstrap.com/docs/5.1/examples/checkout/">
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
				<form action="bookInsert" class="needs-validation"  method="post" id="frm" name ="frm" novalidate>
					<table class="table">
						<tr>
							<th>카테고리</th>
							<td><input type="text" id="ctgyId" name="ctgyId" class="form-control"> 
								<input type="button" class="btn btn-primary" value="카테고리조회">
								<div class="invalid-feedback">
									카테고리를 입력해주세요.
								</div>								
							</td>
							<th>도서구분</th>
							<td>
								<div class="form-check-inline" style="word-spacing :10px">
									<input id="eBook" name="bookFlCd" type="radio" value="E" class="form-check-input" checked required>
									<label class="form-check-label" for="eBook">eBook</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									<input id="audioBook" name="bookFlCd" type="radio" value="A" class="form-check-input" required>
									<label class="form-check-label" for="audioBook">오디오북</label>
									<div class="invalid-feedback">
										구분을 선택해주세요.
									</div>
								</div>
							</td>
						</tr>
						<tr> 
							<th>BOOK명</th>
							<td colspan="3">
								<input type="text" id="bookNm" name="bookNm" size="100px" class="form-control">
								<button id="bookSearch" type="button" class="btn btn-primary" data-toggle="modal" data-target="#bookApiModal"> BOOK조회 </button>
								<div class="invalid-feedback">
									BOOK명을 입력해주세요.
								</div>
							</td>
						</tr>
						<tr>
							<th>출판사</th>
							<td><input type="text" id="bookPublCo" name="bookPublCo" class="form-control" ></td>
							<th>저 자</th>
							<td><input type="text" id="bookWriter" name="bookWriter" class="form-control" ></td>
						</tr>
						<tr>
							<th>출간일</th>
							<td><input type="date" id="bookPublDt" name="bookPublDt" class="form-control" ></td>
							<th>가 격</th>
							<td><input type="text" id="bookAmt" name="bookAmt" class="form-control"></td>
						</tr>
						<tr>
							<th>도서ISBN</th>
							<td><input type="text" id="bookIsbn" name="bookIsbn" class="form-control"></td>
							<th>할인율</th>
							<td><input type="text" id="bookDisCnt" name="bookDisCnt" class="form-control"></td>
						</tr>
						<tr>
							<th>표지디자인</th>
							<td><input type="file" value="파일조회" class="form-control"></td>
							<th>BOOK파일</th>
							<td><input type="file" value="파일조회" class="form-control"></td> 
						</tr>				
						<tr>
							<th>책소개</th>
							<td colspan="3"><textarea rows="6" cols="90" id="bookIntro" name="bookIntro" class="form-control"></textarea></td>
						</tr>
						<tr>
							<th>목차</th>
							<td colspan="3"><textarea rows="6" cols="90" id="bookContent" name="bookContent" class="form-control"></textarea></td>
						</tr>
						<tr>
							<th>저자소개</th>
							<td colspan="3"><textarea rows="6" cols="90" id="bookWriterIntro" name="bookWriterIntro" class="form-control"></textarea></td>
						</tr>
					</table>
					<div>
						<button type="submit" id="bookInsertBtn" class="btn btn-outline-primary">등록</button>
						<button type="button" id="home" class="btn btn-outline-primary" onclick="location.href='bookList'">BOOK목록</button>
					</div>
				</form>
			
			</div>
		</div>
	</div>	
<div  class="modal fade" id="bookApiModal">
	<div class="modal-dialog modal-lg">
		<div class="modal-content">
			<form class="needs-validation" target="iframe1" novalidate>	
				<!--Header-->
			    <div class="modal-header">
			    	<h4 class="modal-title" id="myModalLabel">BOOK검색</h4>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">×</span>
			        </button>
			    </div>
				<!--Body-->
				<div class="modal-body">
					<input type="text" class="form-control" id="bookNm" placeholder="" value="" required>
					<div class="invalid-feedback">
						검색할 BOOK명을 입력해주세요.
					</div>	
					<button type="submit" id="bookApiSearch" class="btn btn-primary" onclick="bookApi()" >검 색</button>			
				</div>
	      		<!--Footer-->
		      	<div class="modal-footer">
		        	<button type="button" class="btn btn-outline-primary" data-dismiss="modal">Close</button>
				</div>
			</form>
		</div>
	</div>
</div>
<iframe id="iframe1" name="iframe1" style="display:none"></iframe>

<script src="resources/js/form-validation.js"></script>
<script src="resources/assets/dist/js/bootstrap.bundle.min.js"></script>
<script type="text/javascript">

	function bookApi(){
		console.log($("#bookNm"));
		$.ajax({
			method : "get",
			url : "https://dapi.kakao.com/v3/search/book",
			data : { query : $("#bookNm").val() },
			headers : { Authorization : "KakaoAK f1d4b3c07a4bac151a4340d72fcf349d"} ,
			success : function(res){
				console.log(res);	
			},
			error : function(rej){
				console.log(rej);
				
			}
		});
		
		return false;
	}
	

</script>
</body>
</html>