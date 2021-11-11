<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	#proimg{
		width:195px; 
		height:240px;
		position:absolute; 
		left:20px; 
		top:10px; 
		width:195px; 
		height:240px;
	}
</style>
</head>
<body>
	<div class="container">
		<div class="row mb-1" style="margin-top: 40px">
			<div class="section-header">
				<h4>${member.memberNm } 님의 My Page</h4> 
			</div><br><br>
		</div>
		<div class="row">
			<div class="col-lg-2 mb-2 mb-lg-0" style="margin-right: 40px;">
				<div id="Card" class="row" style="height:250px; width:200px; border-style: solid; border-width: 1px; margin:2px; padding:10px"><br><br>
					<c:if test="${not empty member.memberProfilePath}">
						<img id="proimg" src="${pageContext.request.contextPath}/fileUp/profile/${member.memberProfileNm}" >&nbsp;&nbsp;
					</c:if>
					
					<form id="frm" name="frm" action="#" style="margin-top: 220px">
						<table id="lcodeTb" class="table table-hover">
							<tr>
								<td style="width:400px;">아이디 : </td>
								<th style="width:400px;">${member.memberId } </th>
							</tr> 
							<tr>
								<td style="width:400px;">회원명 : </td>
								<th style="width:400px;">${member.memberNm } 님</th>
							</tr>
							<tr>
								<td style="width:400px;">구분 : </td>
								<th style="width:400px;">${member.memberFlNm }</th>
							</tr>
							<c:if test="${auth eq 'U'}">
							<tr>
								<th style="width:900px;">월정액기간</th>
								<th style="width:300px;"></th>
							</tr>
							<tr>
								<td style="width:300px;">시작일자 :  </td>
								<th style="width:650px;"><fmt:formatDate pattern="yyyy-MM-dd"  value="${sub.subspSdt }" /></th>
							</tr>
							<tr>
								<td style="width:300px;">종료일자 :  </td>
								<th style="width:650px;"><fmt:formatDate pattern="yyyy-MM-dd"  value="${sub.subspEdt }" /></th>
							</tr>
							</c:if>
						</table>
					</form>
				</div>
			</div>
			<div class="col-lg-8 mb-8 mb-lg-0">
				<div style="height:150px; width:600px; background-color: SeaShell; border-radius: 20px; border-width: 1px;"><br>
			    <h4 align="left" style="margin-left: 20px; font-weight: bold">기본정보 관리</h4>
					<h5 align="left" style="margin-left: 25px;">내 정보</h5>
					<h6 align="left" style="margin-left: 25px;">프로필 사진 및 내 개인정보 변경</h6>


			    		<div align="right" style="margin-right: 20px;">
							<button type="button" id="check_module" class="btn btn-outline-primary" onclick="location.href='myPage'" value="보기"> 보기</button>
						</div><br><br><br>
			    </div><br><br>
		    </div> 
		    	<c:if test="${auth ne 'A'}">
		    <div class="col-lg-8 mb-8 mb-lg-0">
				<div style="height:150px; width:600px; background-color: SeaShell; border-radius: 20px; border-width: 1px;"><br>
				<c:if test="${auth eq 'U'}">
			    	<h4 align="left" style="margin-left: 20px; font-weight: bold">도서대여 관리</h4>
					<h5 align="left" style="margin-left: 25px;">내 대여정보</h5>
					<h6 align="left" style="margin-left: 25px;">대여도서 목록보기에서 바로보기 </h6>
					
					<div align="right" style="margin-right: 20px;">
						<button type="button" id="check_module" class="btn btn-outline-primary" onclick="location.href='lendList'" value="보기"> 보기</button>
					</div><br><br><br>
				</c:if>
				<c:if test="${auth eq 'M'}">
			    	<h4 align="left" style="margin-left: 20px; font-weight: bold">도서등록 관리</h4>
					<h5 align="left" style="margin-left: 25px;">내 등록도서 정보</h5>
					<h6 align="left" style="margin-left: 25px;">등록도서 목록 바로보기 </h6>
			    	
		    		<div align="right" style="margin-right: 20px;">
						<button type="button" id="check_module" class="btn btn-outline-primary" onclick="location.href='bookList'" value="보기"> 보기</button>
					</div><br><br><br>
				</c:if>
			    </div><br><br>
		    </div> 
				</c:if>
		     <div class="col-lg-8 mb-8 mb-lg-0" style="margin-left: 270px;">
				<c:if test="${auth eq 'M'}">
				<div style="height:150px; width:600px; background-color: SeaShell; border-radius: 20px; border-width: 1px;"><br>
			    	<h4 align="left" style="margin-left: 20px; font-weight: bold">내 신청 관리</h4>
					<h5 align="left" style="margin-left: 25px;">업체등록신청 바로 확인</h5>

		    		<div align="right" style="margin-right: 20px;">
						<button type="button" id="check_module" class="btn btn-outline-primary" onclick="location.href='registList'" value="보기"> 보기</button>
					</div><br><br><br>
			    </div><br><br>
				</c:if>			    
			    <c:if test="${subYn eq 'Y'}">
			    <div style="height:200px; width:600px; background-color: SeaShell; border-radius: 20px; border-width: 1px;"><br>
			    	<h4 align="left" style="margin-left: 20px; font-weight: bold">월정액 결제내역</h4>
					<h5 align="left" style="margin-left: 25px;">상품 금액 : ${sub.subspAmt} 원</h5>
					<h5 align="left" style="margin-left: 25px;">실 결제금액 : ${sub.subspPayAmt} 원</h5>
					<h5 align="left" style="margin-left: 25px;">사용 마일리지 : ${sub.subspMile} point</h5>
					<h5 align="left" style="margin-left: 25px;">현재 마일리지 : ${member.memberMile} point</h5>
					<h5 align="left" style="margin-left: 25px;">결제코드 : ${sub.impUid} </h5>
			    </div><br><br>
			   	</c:if>	
		    </div> 
		</div> 
     </div>
</body>
</html>