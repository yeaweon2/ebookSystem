<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c" %>        
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.card {
  box-shadow: 0 4px 8px 0 rgba(0,0,0,0.2);
  transition: 0.3s;
  width: 20%;
  padding:20px;
  margin-left:10px;
}

.card:hover {
  box-shadow: 0 8px 16px 0 rgba(0,0,0,0.2);
}
</style>    
    <link rel="stylesheet" href="resources/morris/morris.css">
    <script src="resources/js/modernizr-2.6.2-respond-1.1.0.min.js"></script>
    
</head>
<body>
<section>
	<div class="section-inner">		
		<div class="container">
			<div class="row mb-1" style="margin-bottom:60px">
				<div class="section-header" style="height:20px">
	          		<h2><img width="60px" height="60px" src="resources/img/menuicon/menu1.png"> BOOK 현황</h2>
	        	</div>
			</div>	
			<div class="row">
				<div class="card col-md-3">
					<div class="container">
					  <h4><b>BOOK COUNT</b><span style="margin-left:40px;font-size:30px;color:green">${list.bookCnt }</span></h4>
					</div>			
				</div>
				<div class="card col-md-3">
					<div class="container">
					  <h4><b>대여 COUNT</b><span style="margin-left:50px;font-size:30px;color:green">${list.lendCnt }</span></h4>
					</div>			
				</div>
				<div class="card col-md-3">
					<div class="container">
					  <h4><b>버킷 COUNT</b><span style="margin-left:40px;font-size:30px;color:green">${list.bucketCnt }</span></h4>
					</div>			
				</div>
				<div class="card col-md-3">
					<div class="container">
					  <h4 ><b>책리뷰 COUNT</b><span style="margin-left:40px;font-size:30px;color:green">${list.reviewCnt }</span></h4>
					</div>			
				</div>
			</div>
			<div class="row" style="margin-top:50px">
 				<div class="row-fluid">
					<div class="block">
						<div class="col-md-10 box">
						    <div class="navbar navbar-inner block-header" >
						        <div class="muted pull-left"><h3>월별현황</h3><label>BOOK등록건수 , 대여건수, 버킷건수</label></div>
						        
						    </div>
						    <div class="block-content collapse in" >
						        <div class="span12">
						            <div id="hero-area" style="height: 250px;"></div>
						        </div>
						    </div>
					    </div>
					</div>
				</div>			
				
			</div>
			<div class="row">	
                    <div class="row-fluid section">
                        <div class="block">
                            <div class="block-content collapse in" style="margin-top:20px">
                                <div class="col-md-5 chart box">
                                    <h3>카테고리별 BOOK현황</h3>
                                    <div id="hero-bar" style="height: 250px;"></div>
                                </div>
                                <div class="col-md-5 chart box">
                                    <h3>BOOK 승인현황</h3>
                                    <div id="hero-donut" style="height: 250px;"></div>    
                                </div>
                            </div>
                        </div>
                    </div>
			</div>
		</div>
	</div>
	<table id="blist" style="visibility: hidden;">
		<c:forEach var="bl" items="${blist}">
			<tr data-stnm="${bl.bcnfmStNm}" data-stcnt="${bl.bcnfmStCnt}" data-allcnt="${bl.bcnfmStAll }"><td>1</td></tr>
		</c:forEach>
	</table>
	<table id="clist" style="visibility: hidden;">
		<c:forEach var="cl" items="${clist}">
			<tr data-ctgynm="${cl.ctgyNm}" data-ctgycnt="${cl.ctgyCnt}" ><td>1</td></tr>
		</c:forEach>
	</table>	
	<table id="mlist" style="visibility: hidden;">
		<c:forEach var="ml" items="${mlist}">
			<tr data-months="${ml.months}" data-lendcnt="${ml.lendCnt}" data-bucketcnt="${ml.bucketCnt}" data-bookcnt="${ml.bookCnt}" ><td>1</td></tr>
		</c:forEach>
	</table>		
</section>
  <script src="resources/morris/morris.min.js"></script>  
        <script src="resources/morris/jquery.knob.js"></script>
        <script src="resources/morris/raphael-min.js"></script>
        

        
        <script src="resources/morris/jquery.flot.js"></script>
        <script src="resources/morris/jquery.flot.categories.js"></script>
        <script src="resources/morris/jquery.flot.pie.js"></script>
        <script src="resources/morris/jquery.flot.time.js"></script>
        <script src="resources/morris/jquery.flot.stack.js"></script>
        <script src="resources/morris/jquery.flot.resize.js"></script>  
  <script type="text/javascript">

  var blist = `${blist}`;
  var clist = `${clist}`;
  var mlist = `${mlist}`;

  var bcnfmList = [];
  $("#blist").find("tr").each(function(){
	  var stcnt = $(this).data("stcnt");
	  var allcnt = $(this).data("allcnt");
	  
	  var percent = parseInt(stcnt)/parseInt(allcnt)*100;
	  
	  var data = {
				label : $(this).data("stnm"),
				value : Math.round(percent)
			};  
	  bcnfmList.push(data);
  });
  
  var ctgyList = [];
  $("#clist").find("tr").each(function(){
	  var sel = {
			  device : $(this).data("ctgynm"),
			  sells : $(this).data("ctgycnt")
			};  
	  ctgyList.push(sel);
  });  
  
  var monthList = [];
  $("#mlist").find("tr").each(function(){

	  var data = {
					  period: $(this).data("months"),
					  book: $(this).data("bookcnt"), 
					  lend: $(this).data("lendcnt"),
					  bucket: $(this).data("bucketcnt"), 
					};  
	  monthList.push(data);
  });  
  
  Morris.Donut({
      element: 'hero-donut',
      data: bcnfmList ,
      colors: ["#30a1ec", "#76bdee", "#c4dafe"],
      formatter: function (y) { return y + "%" }
  });
  

  // Morris Bar Chart
  Morris.Bar({
      element: 'hero-bar',
      data: ctgyList,
      xkey: 'device',
      ykeys: ['sells'],
      labels: ['건수'],
      barRatio: 0.4,
      xLabelMargin: 10,
      hideHover: 'auto',
      barColors: ["#3d88ba"]
  });

  // Morris Area Chart
  Morris.Area({
      element: 'hero-area',
      data: monthList,
      xkey: 'period',
      ykeys: ['book', 'lend', 'bucket'],
      labels: ['BOOK', '대여', '버킷'],
      lineWidth: 2,
      hideHover: 'auto',
      lineColors: ["#81d5d9", "#a6e182", "#67bdf8"]
    });

  
  </script>
</body>
</html>