<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c" %>

	<div class="left-sidebar">
		<h2>Category</h2>
			<div class="panel-group category-products" id="accordian"><!--category-productsr-->
			<c:forEach var="ctgyGr" items="${ctgyGrs}">	
				<div class="panel panel-default">
					<div class="panel-heading">
						<h4 class="panel-title">
							<a data-toggle="collapse" data-parent="#accordian" href="#${ctgyGr.ctgyId}">
								<span class="badge pull-right"><i class="fa fa-plus"></i></span>
								${ctgyGr.ctgyNm}
							</a>
						</h4>
					</div>
						
						<div id="${ctgyGr.ctgyId}" class="panel-collapse collapse">
							<div class="panel-body">
								<ul>
									<c:forEach var="ctgy" items="${ctgys}">
										<c:if test="${ctgy.ctgyGrId eq ctgyGr.ctgyId}">
											<li><a href="#">${ctgy.ctgyNm}</a></li>
										</c:if>
									</c:forEach>	
								</ul>
							</div>
						</div>
					</div>
				</c:forEach>
			</div>			
		<!--/category-products-->
	
		<div class="brands_products"><!--brands_products-->
			<h2>COMMUNITY</h2>
			<div class="brands-name">
				<ul class="nav nav-pills nav-stacked">
					<li><a href="noticeList"> <span class="pull-right"></span>공지사항</a></li>
					<li><a href="boardList"> <span class="pull-right"></span>자유게시판</a></li>
					<li><a href="inquireList"> <span class="pull-right"></span>1 : 1 문의</a></li>
					<li><a href="faqList"> <span class="pull-right"></span>F A Q</a></li>
					<li><a href="reviewList"> <span class="pull-right"></span>Review</a></li>
				</ul>
			</div>
		</div><!--/brands_products-->
		
		<div class="price-range"><!--price-range-->
			
		</div><!--/price-range-->
		
		<div class="shipping text-center"><!--shipping-->
			<img src="resources/images/home/shipping.jpg" alt="" />
		</div><!--/shipping-->
	
	</div>
