<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c" %>    
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
body {
  font-family: "Lato", sans-serif;
}

/* Fixed sidenav, full height */
.sidenav {
  height: auto;
  width: 200px;
  
  z-index: 1;
  top: 500;
  left: 0;
  background-color: #111;
  overflow-x: hidden;
  padding-top: 20px;
  padding-bottom: 20px;
}

/* Style the sidenav links and the dropdown button */
.sidenav a, .dropdown-btn {
  padding: 6px 8px 6px 16px;
  text-decoration: none;
  font-size: 15px;
  color: #818181;
  display: block;
  border: none;
  background: none;
  width: 100%;
  text-align: left;
  cursor: pointer;
  outline: none;
}

/* On mouse-over */
.sidenav a:hover, .dropdown-btn:hover {
  color: #f1f1f1;
}

/* Main content */
.main {
  margin-left: 200px; /* Same as the width of the sidenav */
  font-size: 20px; /* Increased text to enable scrolling */
  padding: 0px 10px;
}

/* Add an active class to the active dropdown button */
.active {
  background-color: green;
  color: white;
}

/* Dropdown container (hidden by default). Optional: add a lighter background color and some left padding to change the design of the dropdown content */
.dropdown-container {
  display: none;
  background-color: #262626;
  padding-left: 8px;
}

/* Optional: Style the caret down icon */
.fa-caret-down {
  float: right;
  padding-right: 8px;
}

/* Some media queries for responsiveness */
@media screen and (max-height: 450px) {
  .sidenav {padding-top: 15px;}
  .sidenav a {font-size: 18px;}
}
</style>
<script type="text/javascript">
	$(function(){
		$(".sidenav").on("click", ".ctgyMenu" , function(){
			
			if($(this).prop("tagName") == 'A'){
				event.preventDefault();
			}
			
			var ctgyGrId = "";
			var ctgyId = "";
			
			if( $(this).data("flag") == 'gr' ){
				$("#ctgyMenuTitle").html( $(this).data("ctgynm") );
				ctgyGrId = $(this).data("ctgyid");
			}else{
				$("#ctgyMenuTitle").html( $(this).data("ctgygrnm") + " > " + $(this).html() );
				ctgyId = $(this).data("ctgyid");
			}
			
			
			$.ajax({
				url: 'ctgyRestBookList',    
				method: 'POST',
				data : JSON.stringify({ ctgyGrId : ctgyGrId , ctgyId : ctgyId }),
				contentType : 'application/json',
				dataType: 'json',
				success: function(res){
					console.log(res);
					$("#bookList").find("tbody").empty();
					
					if( res.bookLists.length == 0){
						$("#bookList").find("tbody").append( $("<tr>").append($("<td colspan='5'>").html("해당하는 BOOK이 존재하지 않습니다. ")))
						
					}
					
					
					$.each(res.bookLists,function(idx,item){
						$("#bookList").find("tbody").append(
								$("<tr>")
									.append($("<td>").html( item.bookFlCd ) )
									.append($("<td>").append($("<img width='50' height='70'>").attr("src", "/prj/fileUp" + item.bookCoverPath + item.bookCover) ) )
									.append($("<td>").html( "<label>"+ item.bookNm + "</label><br>" + item.bookPublCo + "( " + item.bookWriter + " )"  ) )
									.append($("<td>").html( item.bookLikeit ) )
									.append($("<td>") ).data("bookid" , item.bookId )
									
						);	
					});
					
				}
			});
			
			
		});
		
		$("#bookList").find("tbody").on("click", "tr",function(){
			$("#bookId").val($(this).data("bookid"));
			frm.submit();
		});   
		
	});
</script>
</head>
<body>
<section>
	<div class="section-inner">		
		<div class="container">
			<div class="row">
				<div class="col-md-3">
					<div class="sidenav">
					<c:forEach var="ctgyMenu" items="${ctgyLists}">
						<c:set var="val1" value="${ctgyMenu.ctgyId}" />
						<c:if test="${ fn:substring( val1 , 1,3 ) eq '00'}">
							<c:if test="${ctgyMenu.childCnt == '0' }">
								<a href="#" class="ctgyMenu" data-flag="gr" data-ctgyid="${ctgyMenu.ctgyId}" data-ctgynm="${ctgyMenu.ctgyNm}" >${ctgyMenu.ctgyNm }</a>	
							</c:if>
							<c:if test="${ctgyMenu.childCnt != '0' }">
								<button class="dropdown-btn ctgyMenu" data-flag="gr" data-ctgyid="${ctgyMenu.ctgyId}" data-ctgynm="${ctgyMenu.ctgyNm}">${ctgyMenu.ctgyNm } 
									<i class="fa fa-caret-down"></i>
								</button>
								<div class="dropdown-container">
									<c:forEach var="ctgySub" items="${ctgyLists}">
										<c:set var="val2" value="${ctgySub.ctgyId}" />
										
										<c:if test="${fn:substring(val2,0,1) eq fn:substring(val1,0,1) }">
											<c:if test="${fn:substring(val2,1,3) != '00' }">
												<a href="#" class="ctgyMenu" data-flag="sub" data-ctgyid="${val2}" data-ctgygrnm="${ctgyMenu.ctgyNm}">${ctgySub.ctgyNm}</a>
											</c:if>
										</c:if>
									</c:forEach>			
								</div>
							</c:if>
						</c:if>
					</c:forEach>
					</div>
				</div>
				<div class="col-md-9">
					<div class="row mb-1">
						<div class="section-header" style="padding-left:30px" >
			          		<h2><img width="35px" height="35px" src="resources/img/category.png"><label id="ctgyMenuTitle" style="margin-left:20px">전 체</label> </h2>
			        	</div>
					</div>
					<div class="row box">
						<table id="bookList" class="table table-hover table-striped pointer">
							<thead>
								<tr>
									<th>구분</th>
									<th colspan="2">BOOK</th>
									<th>추천수</th>
									<th></th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="book" items="${bookLists}">
									<tr data-bookid="${book.bookId}">
										<td>${book.bookFlCd}</td>
										<td>
											<img width="50" height="70" src="/prj/fileUp${book.bookCoverPath}${book.bookCover}">
										</td>
										<td><label>${book.bookNm}</label><br>${book.bookPublCo}(${book.bookWriter})</td>
										<td>${book.bookLikeit}</td>
										<td></td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>

		
<form action="bookDetail" method="post" id="frm">
	<input type="hidden" id="bookId" name="bookId" >
</form>


<script>
var dropdown = document.getElementsByClassName("dropdown-btn");
var i;

for (i = 0; i < dropdown.length; i++) {
  dropdown[i].addEventListener("click", function() {
  this.classList.toggle("active");
  var dropdownContent = this.nextElementSibling;
  if (dropdownContent.style.display === "block") {
  dropdownContent.style.display = "none";
  } else {
  dropdownContent.style.display = "block";
  }
  });
}
</script>
</body>
</html>
