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

  </style>
</head>
<body>
<section>
	<div class="section-inner">		
		<div class="container">
			<div class="row box">
				<div class="row">
					<div class="col-sm-3">
						<img width="140" height="200" src="${pageContext.request.contextPath}/fileUp${lend.bookCoverPath}${lend.bookCover}">
					</div>
					<div class="col-sm-9">
						<div class="row">
							<h3>${lend.bookNm}</h3>
							<h4>${lend.bookPublCo}(${lend.bookWriter})</h4>
							<span>${lend.bookIntro}</span>
						</div>
						<div class="frame row box">
							
							<div class="col-sm-1">
								<a id="prev" href="#prev" class="arrow pull-left"><i class="fa fa-angle-double-left" style="font-size:36px"></i></a>
							</div>	
							<div class="col-sm-10">
								<div id="viewer" class="spreads"></div>
							</div>
							<div class="col-sm-1" >
								<a id="next" href="#next" class="arrow pull-right"><i class="fa fa-angle-double-right" style="font-size:36px"></i></a>
							</div>
							<div id="extras">
								<ul id="highlights"></ul>
							</div>
						</div>
					</div>
				</div>
				
			</div>
			
			
		</div>
	</div>
</section>
<script>
    // Load the opf
    var book =  ePub("fileUp/Love-in-an-Undead-Age.epub");

    var rendition = book.renderTo("viewer", {
      width: "100%",
      height: 600,
      ignoreClass: 'annotator-hl',
      manager: "continuous"
    });

    var displayed = rendition.display(6);

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

    this.rendition.themes.default({
      '::selection': {
        'background': 'rgba(255,255,0, 0.3)'
      },
      '.epubjs-hl' : {
        'fill': 'yellow', 'fill-opacity': '0.3', 'mix-blend-mode': 'multiply'
      }
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

</script>
</body>
</html>