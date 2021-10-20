<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>카테고리 관리</title>
<style type="text/css">	
 .package {
 	border-radius: 7px;
 }
 
 
 .btnDisplay {
 	display: none;
 }
 
 table {
 	cursor : pointer;
 }
</style>
<script type="text/javascript">

function btnLToggle(flag){
	
	if(flag == "A"){  // 추가 버튼 클릭시, 저장 취소 버튼만 보이게 
		$("#lcodeABtn").addClass("btnDisplay");
		$("#lcodeUBtn").addClass("btnDisplay");
		$("#lcodeSBtn").removeClass("btnDisplay");
		$("#lcodeCBtn").removeClass("btnDisplay");	
	}else{				// 취소 버튼 클릭시, 추가, 수정 버튼만 보이게
		$("#lcodeABtn").removeClass("btnDisplay");
		$("#lcodeUBtn").removeClass("btnDisplay");
		$("#lcodeSBtn").addClass("btnDisplay");
		$("#lcodeCBtn").addClass("btnDisplay");
	}	
}

// 대분류 테이블 색상 전체 제거
function lTableBgColorReset(){
	$("#lcodeTb").find("tr").css("backgroundColor" , "");
}

function btnSToggle(flag){
	if(flag == "A"){  // 추가 버튼 클릭시, 저장 취소 버튼만 보이게 
		$("#scodeABtn").addClass("btnDisplay");
		$("#scodeUBtn").addClass("btnDisplay");
		$("#scodeSBtn").removeClass("btnDisplay");
		$("#scodeCBtn").removeClass("btnDisplay");	
	}else{				// 취소 버튼 클릭시, 추가, 수정 버튼만 보이게
		$("#scodeABtn").removeClass("btnDisplay");
		$("#scodeUBtn").removeClass("btnDisplay");
		$("#scodeSBtn").addClass("btnDisplay");
		$("#scodeCBtn").addClass("btnDisplay");
	}
}

$(function(){
	
	var lcodeTr = $(".lcodeTr");
	
	// 대분류 Row 클릭시 소분류 조회 ----------------------------------------
	lcodeTr.on("click", function(event){

		// 클릭시 Row행 색상변경
		lTableBgColorReset();
		$(this).closest("tr").css("backgroundColor" , "#50d8af");
		
		var ctgyGrId = $(this).closest("tr").data("id");	

		// 소분류 조회
		$.ajax({
			url: 'ctgyDetailList',    
			method: 'POST',
			data : JSON.stringify({ ctgyGrId : ctgyGrId }),
			contentType : 'application/json',
			dataType: 'json',
			success: function(res){
				console.log(res);
				$("#scodeContents").empty();
				$.each(res,function(idx,item){
					
					var option1 = $("<option>사용</option>");
					var option2 = $("<option>미사용</option>");
					
					$("#scodeContents").append( 
							$("<tr>").append($("<input type='checkbox' class='form-check-input'>"))
									.append($("<td>").html(item.ctgyId))
									.append($("<td>").html(item.ctgyNm))
									.append($("<td>").append($("<select class='form-control form-control-sm'>").append(option1).append(option2)))
									.data("ctgyGrId", item.ctgyGrId ) 
					);
				});
			},
			error : function(rej){
				console.log(rej);
			}
		});  
	});	
	
	// Row의 CheckBok Col 클릭시 이벤트 전파중지, 체크토글
	$(".chkTd").on("click", function(){
		event.stopPropagation();
		if($(this).find("#chkInput").prop('checked') == false){
			$(this).find("#chkInput").prop('checked', true);
		}else{
			$(this).find("#chkInput").prop('checked', false);
		}
	});
	
	
	// 추가버튼 클릭시 --------------------------------------------------------
	$("#lcodeABtn").on("click", function(){
		
		lTableBgColorReset();
		
		$("#lcodeTb").append($("<tr>").css("backgroundColor", "#50d8af")
						.append($("<td>").append($("<input type='checkbox' class='form-check-input'>")))
						.append($("<td>").append($("<input type='text' id='lcodeId' class='form-control'>")))
						.append($("<td>").append($("<input type='text' id='lcodeNm' class='form-control'>")))
						.append($("<td>").append($("<select id='lcodeSel' class='form-control form-control-sm'>")
														.append($("<option>사용</option>")).append($("<option>미사용</option>")))));
		
		btnLToggle("A");
		
	});
	
	$("#scodeABtn").on("click", function(){
		
		$("#scodeTb").append($("<tr>").css("backgroundColor", "#50d8af")
				.append($("<td>").append($("<input type='checkbox' class='form-check-input'>")))
				.append($("<td>").append($("<input type='text' id='scodeId' class='form-control'>")))
				.append($("<td>").append($("<input type='text' id='scodeNm' class='form-control'>")))
				.append($("<td>").append($("<select id='scodeSel' class='form-control form-control-sm'>")
												.append($("<option>사용</option>")).append($("<option>미사용</option>")))));
		btnSToggle("A");
	});
	
	// 취소버튼 클릭시 --------------------------------------------------------
	$("#lcodeCBtn").on("click", function(){
		$("#lcodeContents").children(":last").empty();
		btnLToggle("C");
	});
	
	$("#scodeCBtn").on("click", function(){
		$("#scodeContents").children(":last").empty();
		btnSToggle("C");
	});
	
	// 수정버튼 클릭시 --------------------------------------------------------
	
	
	// 저장버튼 클릭시 --------------------------------------------------------
		$("#lcodeSBtn").on("click", function(){
			console.log( $("#lcodeContents").children(":last").find("#lcodeId").val() );
			console.log( $("#lcodeContents").children(":last").find("#lcodeNm").val() );	
			console.log( $("#lcodeContents").children(":last").find("#lcodeSel").children("option:selected").text() );
		
			var ctgyId = $("#lcodeContents").children(":last").find("#lcodeId").val();
			var ctgyNm = $("#lcodeContents").children(":last").find("#lcodeNm").val();
			var ctgyUseYnTxt = $("#lcodeContents").children(":last").find("#lcodeSel").children("option:selected").text(); 
			var ctgyUseYn = "";
			
			if( ctgyUseYnTxt == "사용"){
				ctgyUseYn = "Y";
			}else{
				ctgyUseYn = "N";
			}
			
			
			$.ajax({
				url: 'ctgyInsert',    
				method: 'POST',
				data : JSON.stringify({ ctgyId : ctgyId , ctgyNm : ctgyNm , ctgyUseYn : ctgyUseYn }),
				contentType : 'application/json',
				dataType: 'json',
				success: function(res){
					console.log(res);
					$("#lcodeContents").children(":last").empty();
					$("#lcodeTb").append($("<tr>")
							.append($("<td>").append($("<input type='checkbox' class='form-check-input'>")))
							.append($("<td>").html(ctgyId))
							.append($("<td>").html(ctgyNm))
							.append($("<td>").append($("<select id='lcodeSel' class='form-control form-control-sm'>")
												.append($("<option>사용</option>")).append($("<option>미사용</option>")))));
					
					btnLToggle("C");
				},
				error : function(rej){
					console.log(rej);
				}
			});
		});
	
		$("#scodeSBtn").on("click", function(){
			console.log( $("#scodeContents").children(":last").data("ctgyGrId") );
			console.log( $("#scodeContents").children(":last").find("#scodeNm").val() );	
			console.log( $("#scodeContents").children(":last").find("#scodeSel").children("option:selected").text() );
		
			var ctgyGrId = $("#scodeContents").children(":last").data("ctgyGrId");
			var ctgyId = $("#scodeContents").children(":last").find("#scodeId").val();
			var ctgyNm = $("#scodeContents").children(":last").find("#scodeNm").val();
			var ctgyUseYnTxt = $("#scodeContents").children(":last").find("#scodeSel").children("option:selected").text(); 
			var ctgyUseYn = "";
			
			if( ctgyUseYnTxt == "사용"){
				ctgyUseYn = "Y";
			}else{
				ctgyUseYn = "N";
			}
			
			
			$.ajax({
				url: 'ctgyInsert',    
				method: 'POST',
				data : JSON.stringify({ ctgyId : ctgyId , ctgyNm : ctgyNm , ctgyUseYn : ctgyUseYn , ctgyGrId : ctgyGrId }),
				contentType : 'application/json',
				dataType: 'json',
				success: function(res){
					console.log(res);
					$("#scodeContents").children(":last").empty();
					$("#scodeTb").append($("<tr>")
							.append($("<td>").append($("<input type='checkbox' class='form-check-input'>")))
							.append($("<td>").html(ctgyId))
							.append($("<td>").html(ctgyNm))
							.append($("<td>").append($("<select id='scodeSel' class='form-control form-control-sm'>")
												.append($("<option>사용</option>")).append($("<option>미사용</option>")))));
					btnSToggle("C");
				},
				error : function(rej){
					console.log(rej);
				}
			});
		});	
		
	
});
</script>
</head>
<body>
<div class="inner-page pt-4">
	<div class="container">
		<div class="row mb-1" style="margin-top: 40px">
			<div class="section-header">
          		<h2>카테고리</h2>
        	</div>
		</div>
		<div class="row">
			<div class="col-lg-6 mb-6 mb-lg-0">
				<div class="package text-center bg-white">
					<br/>
					<h3 class="text-success">대분류</h3>
						<table id="lcodeTb" class="table table-hover">
							<thead>
								<tr>
									<th></th>
									<th>대분류</th>
									<th>대분류명</th>
									<th>사용여부</th>
								</tr>
							</thead>
							<tbody id="lcodeContents">
								<c:forEach var="list" items="${lists}" >
									<tr class="lcodeTr" data-id="${list.ctgyId}">
										<td class="chkTd" ><input id="chkInput" type='checkbox' class='form-check-input'></td>
										<td>${list.ctgyId}</td>
										<td>${list.ctgyNm}</td>
										<td>
											<select class="form-control form-control-sm" >
												<option>사용</option>
												<option>미사용</option>
											</select>
										</td>
									</tr>
								</c:forEach>	
							</tbody>
						</table>					
					<p>
						<button type="button" id="lcodeABtn" class="btn btn-warning btn-custom-1 mt-4">추가</button>
						<button type="button" id="lcodeUBtn" class="btn btn-warning btn-custom-1 mt-4">수정</button>
						<button type="button" id="lcodeSBtn" class="btn btn-warning btn-custom-1 mt-4 btnDisplay">저장</button>
						<button type="button" id="lcodeCBtn" class="btn btn-warning btn-custom-1 mt-4 btnDisplay">취소</button>
					</p>
				</div>
			</div>
			<div class="col-lg-6 mb-6 mb-lg-0">
				<div class="package text-center bg-white">
					<br/>
					<h3 class="text-danger">소분류</h3>
						<table id="scodeTb" class="table table-hover">
							<thead>
								<tr>
									<th></th>
									<th>소분류</th>
									<th>소분류명</th>
									<th>사용여부</th>
								</tr>
							</thead>
							<tbody id="scodeContents">
							</tbody>
						</table>
					<p>
						<button type="button" id="scodeABtn" class="btn btn-warning btn-custom-1 mt-4">추가</button>
						<button type="button" id="scodeUBtn" class="btn btn-warning btn-custom-1 mt-4">수정</button>
						<button type="button" id="scodeSBtn" class="btn btn-warning btn-custom-1 mt-4 btnDisplay">저장</button>
						<button type="button" id="scodeCBtn" class="btn btn-warning btn-custom-1 mt-4 btnDisplay">취소</button>
					</p>
				</div>
			</div>
		</div>
	</div>
</div>
</body>
</html>