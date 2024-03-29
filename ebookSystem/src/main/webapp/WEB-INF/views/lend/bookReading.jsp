<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BOOK READING</title>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jszip/3.1.5/jszip.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/epubjs/dist/epub.min.js"></script>
<style type="text/css">
    ::selection {
      background: yellow;
    }

    #extras {
      width: 600px;
      margin: 40px auto;
    }

    #highlights {
      list-style: none;
      margin-left: 0;
      padding: 0;
    }

    #highlights li {
      list-style: none;
      margin-bottom: 20px;
      border-top: 1px solid #E2E2E2;
      padding: 10px;
    }

    #highlights a {
      display: block;
    }

    #viewer.spreads {
      top: 0;
      margin-top: 50px;
    }

    [ref="epubjs-mk"] {
      background: url("data:image/svg+xml;base64,PHN2ZyB2ZXJzaW9uPScxLjEnIHhtbG5zPSdodHRwOi8vd3d3LnczLm9yZy8yMDAwL3N2ZycgeG1sbnM6eGxpbms9J2h0dHA6Ly93d3cudzMub3JnLzE5OTkveGxpbmsnIHg9JzBweCcgeT0nMHB4JyB2aWV3Qm94PScwIDAgNzUgNzUnPjxnIGZpbGw9JyNCREJEQkQnIGlkPSdidWJibGUnPjxwYXRoIGNsYXNzPSdzdDAnIGQ9J00zNy41LDkuNEMxOS42LDkuNCw1LDIwLjUsNSwzNC4zYzAsNS45LDIuNywxMS4zLDcuMSwxNS42TDkuNiw2NS42bDE5LTcuM2MyLjgsMC42LDUuOCwwLjksOC45LDAuOSBDNTUuNSw1OS4yLDcwLDQ4LjEsNzAsMzQuM0M3MCwyMC41LDU1LjQsOS40LDM3LjUsOS40eicvPjwvZz48L3N2Zz4=") no-repeat;
      width: 20px;
      height: 20px;
      cursor: pointer;
      margin-left: 0;
    }
    
    .batch {
    	font-size: 16px;
    }
    
    .batch:hover{
    	text-decoration: underline;
    	font-size: 17px;
    	font-weight: bold; 
    	cursor: pointer;
    }

  </style>
  <script type="text/javascript">
  	$(function(){
  		
  		$("#batchList").on("click", "tr" , function(){
  			var epubFilePath = `${pageContext.request.contextPath}` + "/fileUp" + $(this).data("batchpath") + $(this).data("batchnm");
  			
  			// Load the epub
  		    var book =  ePub(epubFilePath);

  		    var rendition = book.renderTo("viewer", {
  		      width: "100%",
  		      height: 600,
  		      ignoreClass: 'annotator-hl',
  		      manager: "continuous"
  		    });

  		    var displayed = rendition.display(0);

  		    // Navigation loaded
  		    book.loaded.navigation.then(function(toc){
  		      // console.log(toc);
  		    });

  		    var next = document.getElementById("next");
  		    next.addEventListener("click", function(){
  		      rendition.next();
  		    }, false);

  		    var prev = document.getElementById("prev");
  		    prev.addEventListener("click", function(){
  		      rendition.prev();
  		    }, false);

  		    var keyListener = function(e){

  		      // Left Key
  		      if ((e.keyCode || e.which) == 37) {
  		        rendition.prev();
  		      }

  		      // Right Key
  		      if ((e.keyCode || e.which) == 39) {
  		        rendition.next();
  		      }

  		    };

  		    rendition.on("keyup", keyListener);
  		    document.addEventListener("keyup", keyListener, false);

  		    rendition.on("relocated", function(location){
  		      // console.log(location);
  		    });


  		    // Apply a class to selected text
  		    rendition.on("selected", function(cfiRange, contents) {
  		      rendition.annotations.highlight(cfiRange, {}, (e) => {
  		        console.log("highlight clicked", e.target);
  		      });
  		      contents.window.getSelection().removeAllRanges();

  		    });



  		    // Illustration of how to get text from a saved cfiRange
  		    var highlights = document.getElementById('highlights');

  		    rendition.on("selected", function(cfiRange) {

  		      book.getRange(cfiRange).then(function (range) {
  		        var text;
  		        var li = document.createElement('li');
  		        var a = document.createElement('a');
  		        var remove = document.createElement('a');
  		        var textNode;

  		        if (range) {
  		          text = range.toString();
  		          textNode = document.createTextNode(text);

  		          a.textContent = cfiRange;
  		          a.href = "#" + cfiRange;
  		          a.onclick = function () {
  		            rendition.display(cfiRange);
  		          };

  		          remove.textContent = "remove";
  		          remove.href = "#" + cfiRange;
  		          remove.onclick = function () {
  		            rendition.annotations.remove(cfiRange);
  		            return false;
  		          };

  		          li.appendChild(a);
  		          li.appendChild(textNode);
  		          li.appendChild(remove);
  		          highlights.appendChild(li);
  		        }
  		      })
  		    });
  		});
  		
  		
  		$("#batchList").find("tr").first().click();
  		
  	});
  </script>
</head>
<body>
<section>
	<div class="section-inner">		
		<div class="container">
			<div class="row mb-1" style="margin-top: 30px;margin-bottom: 50px;padding-left:30px">
				<div class="section-header" style="height:20px">
	          		<h2><img width="50px" height="50px" src="resources/img/lendTitle.png"> eBook Reading</h2>
	        	</div>
			</div>	
			<div class="row box">
				<div class="row">
					<div class="col-sm-3">
						<div class="row">
							<img width="190" height="230" src="${pageContext.request.contextPath}/fileUp${lend.bookCoverPath}${lend.bookCover}">
							<h3>${lend.bookNm}</h3>
							<h5>${lend.bookPublCo}(${lend.bookWriter})</h5>
						</div>
						<div class="row" style="margin-top:50px">
							<h4 >BOOK 파일 LIST</h4>
							<table id="batchList" class="table">
							<c:forEach var="batch" items="${batchList}">
								<tr class="row batch" data-batchnm="${batch.batchNm}" data-batchpath="${batch.batchPath}">
									<td>${batch.batchOrd}.${batch.batchNm}</td> 
								</tr>
							</c:forEach>
							</table>
						</div>
					</div>
					<div class="col-sm-9">
						<div class="row">
							<div id="start" class="col-sm-9" style="margin-top:10px">
								<div class="frame row box">
									<div class="col-sm-1" style="padding-top:300px">
										<a id="prev" href="#start" class="arrow pull-left"><i class="fa fa-angle-double-left" style="font-size:36px"></i></a>
									</div>	
									<div  class="col-sm-10">
										<div id="viewer" class="spreads"></div>
										<div id="extras">
											<ul id="highlights"></ul>
										</div>
									</div>
									<div class="col-sm-1" style="padding-top:300px" >
										<a id="next" href="#start" class="arrow pull-right"><i class="fa fa-angle-double-right" style="font-size:36px"></i></a>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>
<script>
    

</script>
</body>
</html>