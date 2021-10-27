<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">

.ppDiv {
	padding : 20pt;
}

.button {
  border-radius: 4px;
  background-color: #0c2e8a;
  border: none;
  color: white;
  text-align: center;
  font-size: 24px;
  padding: 10px;
  width: 170px;
  transition: all 0.5s;
  cursor: pointer;
  margin: 5px;
}

.button span {
  cursor: pointer;
  display: inline-block;
  position: relative;
  transition: 0.5s;
}

.button span:after {
  content: '\00bb';
  position: absolute;
  opacity: 0;
  top: 0;
  right: -20px;
  transition: 0.5s;
}

.button:hover span {
  padding-right: 20px;
}

.button:hover span:after {
  opacity: 1;
  right: 0;
}


.bucketBtn {
	background-color: red;
	border: none;
	color: white;
	padding: 12px 16px;
	font-size: 21px;
	cursor: pointer;
	border-radius: 50%;
}


.bucketBtn i {
	color: white;
}

.bucketBtn:hover {
	opacity: 0.6;
  	background-color: red;
}
</style>
<script type="text/javascript">
	$(function(){
		
		// 장바구니 클릭시 
		$("#bookCartForm").on("click", function(){
			
			var bookId = $("#bookId").val();
	 		 $.ajax({
	 			url : 'cartDuplCheck' ,
	 			data : JSON.stringify({ bookId : bookId }) ,
	 			contentType : 'application/json',
	 			method : 'POST' ,
	 			dataType : 'json' ,
	 			success : function(data){
	 				console.log(data);
	 				if(data.result == "01"){
	 					alert("이미 카트에 담겨있는 BOOK입니다. ");
	 					return;
	 				}else{
	 					frm.submit();		
	 				}
	 			}
	 		}); 			
		});
	});
</script>
</head>
<body>
<div class="inner-page pt-6">
	<div class="container">
		<div class="row mb-1" style="margin-top: 40px">
			<div class="section-header">
          		<h2>Book상세</h2>
        	</div>
		</div>
		<div class="row">
			<div class="container">
				
				<div class="row p-5 mb-4 bg-light rounded-3">
					<div class="col-md-8">
						<div class="container-fluid py-5">
							<h1 class="display-5 fw-bold">${book.bookNm}</h1>
							<h3>${book.bookPublCo} ( ${book.bookWriter} )</h3>
							<p class="col-md-8 fs-7">대여가격: ${book.bookAmt}</p> 
							<p class="col-md-8 fs-7">할인가격 : ${book.bookDiscnt}</p>
							<hr>
							<div>
								<button type="button" class="button" id="bookCartForm"><span>장바구니 </span></button>
								<button type="button" class="button" id="bookLendForm"><span>BOOK대여 </span></button>
								
								<button class="bucketBtn" ><i class="fa fa-heart"></i></button>							
							</div>
						</div>
					</div> 
					<div class="col-md-4" style="margin-right:30;">
							<img width="300" height="330" src="/prj/fileUp${book.bookCoverPath}${book.bookCover}">
					</div> 
				</div>
				<div class="row g-5">
				    <div class="col-md-8">			
				      <article class="blog-post ppDiv">
				        <h2 class="blog-post-title">책소개</h2>
				        <p class="blog-post-meta">${book.bookIntro}</p>
				        
				        
				      </article>
					  <hr>
				      <article class="blog-post ppDiv">
				       <h2 class="blog-post-title">저자소개</h2>
				        <p class="blog-post-meta">${book.bookWriterIntro}</p>
				      </article>
					  <hr>
				      <article class="blog-post ppDiv">
				       <h2 class="blog-post-title">목차</h2>
				        <p class="blog-post-meta">${book.bookContent}</p> 
				      </article>
				
				      <nav class="blog-pagination" aria-label="Pagination">
				        <a class="btn btn-outline-primary" href="#">Older</a>
				        <a class="btn btn-outline-secondary disabled">Newer</a>
				      </nav>
				
				    </div>
				
				    <div class="col-md-4">
				      <div class="position-sticky" style="top: 2rem;">
				        <div class="p-4 mb-3 bg-light rounded">
				          <h4 class="fst-italic">About</h4>
				          <p class="mb-0">Customize this section to tell your visitors a little bit about your publication, writers, content, or something else entirely. Totally up to you.</p>
				        </div>
				
				        <div class="p-4">
				          <h4 class="fst-italic">Archives</h4>
				          <ol class="list-unstyled mb-0">
				            <li><a href="#">March 2021</a></li>
				            <li><a href="#">February 2021</a></li>
				            <li><a href="#">January 2021</a></li>
				            <li><a href="#">December 2020</a></li>
				            <li><a href="#">November 2020</a></li>
				            <li><a href="#">October 2020</a></li>
				            <li><a href="#">September 2020</a></li>
				            <li><a href="#">August 2020</a></li>
				            <li><a href="#">July 2020</a></li>
				            <li><a href="#">June 2020</a></li>
				            <li><a href="#">May 2020</a></li>
				            <li><a href="#">April 2020</a></li>
				          </ol>
				        </div>
				
				        <div class="p-4">
				          <h4 class="fst-italic">Elsewhere</h4>
				          <ol class="list-unstyled">
				            <li><a href="#">GitHub</a></li>
				            <li><a href="#">Twitter</a></li>
				            <li><a href="#">Facebook</a></li>
				          </ol>
				        </div>
				      </div>
				    </div>
				  </div>
	       </div>
		</div>
	</div>
</div>	
<form action="cartInsert" method="post" id="frm" name="frm">
	<input type="hidden" id="bookId" name="bookId" value="${book.bookId}">
</form>
</body>
</html>