<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c" %> 

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>베스트셀러</title>

<style type="text/css">
* {
  box-sizing: border-box;
}


.content {
  position: relative;
  width: 80%;
  max-width: 300px;
}
.image {
  display: block;
  width: 100%;
  height: auto;
}

.overlay {
  position: absolute; 
  bottom: 0; 
  background: rgb(0, 0, 0);
  background: rgba(0, 0, 0, 0.5); /* Black see-through */
  color: #f1f1f1; 
  width: 100%;
  transition: .5s ease;
  opacity:0;
  color: white;
  font-size: 16px;
  padding: 10px;
  text-align: center;
}

.content:hover .overlay {
  opacity: 1;
}

/* Center website */
.main {
  max-width: 1000px;
  margin: auto;
}

h1 {
  font-size: 50px;
  word-break: break-all;
}

.row {
  margin: 8px -16px;
}

/* Add padding BETWEEN each column (if you want) */
.row,
.row > .column {
  padding: 8px;
}

/* Create three equal columns that floats next to each other */
.column {
  float: left;
  width: 25%;
  display: none; /* Hide columns by default */
}

/* Clear floats after rows */
.row:after {
  content: "";
  display: table;
  clear: both;
}

/* Content */
.content {
  background-color: white;
  padding: 10px;
}

/* The "show" class is added to the filtered elements */
.show {
  display: block;
}

/* Style the buttons */
.btn {
  border: none;
  outline: none;
  padding: 12px 16px;
  background-color: white;
  cursor: pointer;
}

/* Add a grey background color on mouse-over */
.btn:hover {
  background-color: #ddd;
}

/* Add a dark background color to the active button */
.btn.active {
  background-color: #666;
   color: white;
}

</style>
<script type="text/javascript">

	$(function(){
		$(".column").on("click", function(){
			$("#bookId").val($(this).find("#bookKey").val());
			frm.submit();
		});
	});


	function bookDetail(bookId){
		$("#bookId").val(bookId);
		frm.submit();
	}
</script>
</head>
<body>
	<div class="inner-page pt-6">
		<div class="container">
			<div class="row mb-1" style="margin-top: 40px">
				<div class="section-header">
	          		<h2>BestSeller</h2>
	        	</div>
			</div>	
	       <div class="container" data-aos="fade-up">
			<div id="myBtnContainer">
				<button class="btn active" onclick="filterSelection('all')"> 전 체</button>
				<button class="btn" onclick="filterSelection('bestSeller')"> 베스트셀러</button>
				<button class="btn" onclick="filterSelection('bucket')"> 추천순</button>
				<button class="btn" onclick="filterSelection('likeit')"> 조회순</button>
			</div>
			<div class="row">
				<c:forEach var="book" items="${lists}">
					<div class="column ${book.bookStd}" style="cursor: pointer;">
						<div class="content col-4">
							<img src="/prj/fileUp${book.bookCoverPath}${book.bookCover}" alt="${book.bookNm}" width="300" height="320" class="image">
							<div class="overlay">${book.bookNm}</div>
							<input type="hidden" id="bookKey" name="bookKey" value="${book.bookId}" >
						</div>
					</div>
				</c:forEach>
			</div>
		</div>
	</div>
</div>	
<form action="bookDetail" method="post" id="frm">
	<input type="hidden" id="bookId" name="bookId" >
</form>
<script type="text/javascript">

filterSelection("all") // Execute the function and show all columns
function filterSelection(c) {
  var x, i;
  x = document.getElementsByClassName("column");
  if (c == "all") c = "";
  // Add the "show" class (display:block) to the filtered elements, and remove the "show" class from the elements that are not selected
  for (i = 0; i < x.length; i++) {
    w3RemoveClass(x[i], "show");
    if (x[i].className.indexOf(c) > -1) w3AddClass(x[i], "show");
  }
}

// Show filtered elements
function w3AddClass(element, name) {
  var i, arr1, arr2;
  arr1 = element.className.split(" ");
  arr2 = name.split(" ");
  for (i = 0; i < arr2.length; i++) {
    if (arr1.indexOf(arr2[i]) == -1) {
      element.className += " " + arr2[i];
    }
  }
}

// Hide elements that are not selected
function w3RemoveClass(element, name) {
  var i, arr1, arr2;
  arr1 = element.className.split(" ");
  arr2 = name.split(" ");
  for (i = 0; i < arr2.length; i++) {
    while (arr1.indexOf(arr2[i]) > -1) {
      arr1.splice(arr1.indexOf(arr2[i]), 1);
    }
  }
  element.className = arr1.join(" ");
}

// Add active class to the current button (highlight it)
var btnContainer = document.getElementById("myBtnContainer");
var btns = btnContainer.getElementsByClassName("btn");
for (var i = 0; i < btns.length; i++) {
  btns[i].addEventListener("click", function(){
    var current = document.getElementsByClassName("active");
    current[0].className = current[0].className.replace(" active", "");
    this.className += " active";
  });
}
</script>	
</body>
</html>