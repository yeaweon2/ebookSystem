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

//대분류 테이블 색상 전체 제거
function sTableBgColorReset(){
	$("#scodeTb").find("tr").css("backgroundColor" , "");
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
function init(){
	$("tr#lcodeTr").get(0).click();
}


$(function(){
	
	
	var ctgyGrId = "";
	var sctgySelTrDataId = "";
	
	// 수정시 사용할 수정 row id & Flag 
	var lcodeSelIndex = "";
	var lcodeUpdateFlag = false;
	var scodeSelIndex = "";
	var scodeUpdateFlag = false;
	
	// 더블클릭시 사용 
	var lctgyNmdb = "";
	var lctgyUseYndb = "";
	
	var sctgyNmdb = "";
	var sctgyUseYndb = "";

	// 대분류 Row 클릭시 소분류 조회 ----------------------------------------
	 $(document).on("click", "tr#lcodeTr", function(event){
		
		
		if ( lcodeUpdateFlag ){
			console.log("here");
			alert("수정중인 행을 저장 또는 취소한 후 진행해 주세요.");
			return false;
		}
		
		lcodeUpdateFlag = false;
		scodeUpdateFlag = false;
		
		// 클릭시 Row행 색상변경
		lTableBgColorReset();
		$(this).closest("tr").css("backgroundColor" , "#50d8af");
		
		ctgyGrId = $(this).closest("tr").data("id");	
		
		// 소분류 조회
		$.ajax({
			url: 'ctgyDetailList',    
			method: 'POST',
			data : JSON.stringify({ ctgyGrId : ctgyGrId }),
			contentType : 'application/json',
			dataType: 'json',
			success: function(res){
				// 새로 소분류가 조회되기때문에 수정중 여부 Reset 
				
				$("#scodeContents").empty();
				$.each(res,function(idx,item){
					
					var option1 = $("<option disabled='disabled' value='Y'>사용</option>");
					var option2 = $("<option disabled='disabled' value='N'>미사용</option>");
					
					$("#scodeContents").append( 
							$("<tr id='scodeTr' data-id="+ item.ctgyId +">")
									.append($("<td >").html(item.ctgyId))
									.append($("<td class='scodeCtgyNm'>").html(item.ctgyNm))
									.append($("<td>").append($("<select id='scodeSelBox' class='form-control form-control-sm'>").append(option1).append(option2)))
									.data("ctgyGrId", item.ctgyGrId ) 
					);
					
					// 사용여부 Select 선택여부 값 셋팅
					if( item.ctgyUseYn == "Y" ){
						$("#scodeContents").find("tr:last").find("select option:eq(0)").attr("selected", "selected"); 
					}else{
						$("#scodeContents").find("tr:last").find("select option:eq(1)").attr("selected", "selected");
					}
					
					 $("tr#scodeTr").on("click", function(){
						event.stopPropagation();
						
						sTableBgColorReset();
						
/* 						if ( scodeUpdateFlag ){
								alert("수정중인 행을 저장 또는 취소한 후 진행해 주세요.");
								return false;
						}  */
						 
						 $(this).closest("tr").css("backgroundColor" , "#50d8af");
						 sctgySelTrDataId = $(this).data("id");
					 });
					 
				});
			},
			error : function(rej){
				console.log(rej);
			}
		});  
	});	
	
	// 대분류 수정을 위한 더블클릭 이벤트 처리 ---------------------------------------------------
	 $(document).on("dblclick", "#lcodeTr",  function(event){
			event.stopPropagation();
			
			if ( lcodeUpdateFlag ){
				alert("수정중인 행을 저장 또는 취소한 후 진행해 주세요.");
				return false;
			}
			$("#lcodeUCBtn").removeClass("btnDisplay");
			
			$(this).closest("tr").css("backgroundColor" , "pink");
			lcodeSelIndex = $(this).closest("tr").index();	
			
			lctgyNmdb = $(this).closest("tr").find(".lcodeCtgyNm").get(0).innerText;
			lctgyUseYndb = $(this).closest("tr").find("select option:selected").val();
			
			$(this).closest("tr").find(".lcodeCtgyNm").get(0).innerText = "";
			$(this).closest("tr").find(".lcodeCtgyNm").append($("<input id='lctgyNm' type='text' class='form-control' >").val(lctgyNmdb));
			$(this).closest("tr").find("select option").prop('disabled',false);
			
			lcodeUpdateFlag = true;
		});
	
	// 소분류 수정을 위한 더블클릭 이벤트 처리 ---------------------------------------------------
	$(document).on("dblclick", "#scodeTr",  function(event){
		event.stopPropagation();

		if ( scodeUpdateFlag ){
			alert("수정중인 행을 저장 또는 취소한 후 진행해 주세요.");
			return false;
		}
		
		$("#scodeUCBtn").removeClass("btnDisplay");
		$(this).css("backgroundColor" , "pink");
		scodeSelIndex = $(this).index();	
		
		sctgyNmdb = $(this).find(".scodeCtgyNm").get(0).innerText;
		sctgyUseYndb = $(this).find("select option:selected").val();
		
		$(this).find(".scodeCtgyNm").get(0).innerText = "";
		$(this).find(".scodeCtgyNm").append($("<input id='sctgyNm' type='text' class='form-control' >").val(sctgyNmdb));
		$(this).find("select option").prop('disabled',false);
				
		scodeUpdateFlag = true;
	});
	
	// 대분류 추가버튼 클릭시 --------------------------------------------------------
	$("#lcodeABtn").on("click", function(){
		
		if ( lcodeUpdateFlag ){
			alert("수정중인 행을 저장 또는 취소한 후 진행해 주세요.");
			return false;
		}
		
		lTableBgColorReset();
		
		$("#lcodeTb").append($("<tr>").css("backgroundColor", "#50d8af")
						.append($("<td>").append($("<input type='text' id='lcodeId' class='form-control'>")))
						.append($("<td>").append($("<input type='text' id='lcodeNm' class='form-control'>")))
						.append($("<td>").append($("<select id='lcodeSel' class='form-control form-control-sm'>")
														.append($("<option>사용</option>")).append($("<option>미사용</option>")))));
		
		btnLToggle("A");
		
	});
	// 소분류 추가버튼 클릭시 --------------------------------------------------------------
	$("#scodeABtn").on("click", function(){
		
		if ( scodeUpdateFlag ){
			alert("수정중인 행을 저장 또는 취소한 후 진행해 주세요.");
			return false;
		}
		
		sTableBgColorReset();
		
		$("#scodeTb").append($("<tr>").css("backgroundColor", "#50d8af").data("ctgyGrId", ctgyGrId)
				.append($("<td>").append($("<input type='text' id='scodeId' class='form-control'>")))
				.append($("<td>").append($("<input type='text' id='scodeNm' class='form-control'>")))
				.append($("<td>").append($("<select id='scodeSel' class='form-control form-control-sm'>")
												.append($("<option>사용</option>")).append($("<option>미사용</option>")))));
		btnSToggle("A");
	});
	
	// 대분류 추가 후 저장 취소버튼 클릭시 --------------------------------------------------------
	$("#lcodeCBtn").on("click", function(){
		$("#lcodeContents").children(":last").empty();
		btnLToggle("C");
	});
	
	// 소분류 추가 후 저장 취소버튼 클릭시 --------------------------------------------------------
	$("#scodeCBtn").on("click", function(){
		$("#scodeContents").children(":last").empty();
		btnSToggle("C");
	});
	
	// 대분류 수정버튼 클릭시 --------------------------------------------------------
	$("#lcodeUBtn").on("click", function(){
		if(!lcodeUpdateFlag){
			alert("수정중인 건이 없습니다.");
			return false;
		}
		// 더블클릭시 생성된 대분류명에 input박스의 value값 가져오기
		var lctgyIdVal = $("#lcodeTb tr:eq(" + (lcodeSelIndex+1) + ")").data("id");
		var lctgyNmVal = $("#lcodeTb tr:eq(" + (lcodeSelIndex+1) + ")").find("#lctgyNm:eq(0)").val();
		var lctgyUseYnVal = $("#lcodeTb tr:eq(" + (lcodeSelIndex+1) + ")").find("#lcodeSelBox option:selected").val();
		
		
 		$.ajax({
			url: 'ctgyUpdate',    
			method: 'PUT',
			data : JSON.stringify({ ctgyId : lctgyIdVal , ctgyNm : lctgyNmVal , ctgyUseYn : lctgyUseYnVal }),
			contentType : 'application/json',
			dataType: 'json',
			success: function(res){
				// 수정행 변경
				$("#lcodeTb tr:eq(" + (lcodeSelIndex+1) + ")").find(".lcodeCtgyNm").get(0).innerHtml = "";
				$("#lcodeTb tr:eq(" + (lcodeSelIndex+1) + ")").find(".lcodeCtgyNm").get(0).innerText = lctgyNmVal;
				
				// 사용여부 Select 선택여부 값 셋팅
				if( lctgyUseYnVal == "Y" ){
					$("#lcodeTb tr:eq(" + (lcodeSelIndex+1) + ")").find("select option:eq(0)").prop("selected", true);
					$("#lcodeTb tr:eq(" + (lcodeSelIndex+1) + ")").find("select option:eq(1)").prop("selected", false);
				}else{
					$("#lcodeTb tr:eq(" + (lcodeSelIndex+1) + ")").find("select option:eq(1)").prop("selected", true);
					$("#lcodeTb tr:eq(" + (lcodeSelIndex+1) + ")").find("select option:eq(0)").prop("selected", false);
				}
				$("#lcodeTb tr:eq(" + (lcodeSelIndex+1) + ")").find("select option").prop('disabled',true);
			},
			error : function(rej){
				console.log(rej);
			}
		}); 
 		$("#lcodeUCBtn").addClass("btnDisplay");
		lcodeUpdateFlag = false;
	});
	
	// 소분류 수정버튼 클릭시 --------------------------------------------------------
	$("#scodeUBtn").on("click", function(){
		if(!scodeUpdateFlag){
			alert("수정중인 건이 없습니다.");
			return false;
		}
		
		// 더블클릭시 생성된 대분류명에 input박스의 value값 가져오기
		var sctgyIdVal = $("#scodeTb tr:eq(" + (scodeSelIndex+1) + ")").data("id");
		var sctgyNmVal = $("#scodeTb tr:eq(" + (scodeSelIndex+1) + ")").find("#sctgyNm:eq(0)").val();
		var sctgyUseYnVal = $("#scodeTb tr:eq(" + (scodeSelIndex+1) + ")").find("#scodeSelBox option:selected").val();
		
		$.ajax({
			url: 'ctgyUpdate',    
			method: 'PUT',
			data : JSON.stringify({ ctgyId : sctgyIdVal , ctgyNm : sctgyNmVal , ctgyUseYn : sctgyUseYnVal }),
			contentType : 'application/json',
			dataType: 'json',
			success: function(res){
				// 수정행 변경
				$("#scodeTb tr:eq(" + (scodeSelIndex+1) + ")").find(".scodeCtgyNm").get(0).innerHtml = "";
				$("#scodeTb tr:eq(" + (scodeSelIndex+1) + ")").find(".scodeCtgyNm").get(0).innerText = sctgyNmVal;
				
				// 사용여부 Select 선택여부 값 셋팅
				if( sctgyUseYnVal == "Y" ){
					$("#scodeTb tr:eq(" + (scodeSelIndex+1) + ")").find("select option:eq(0)").prop("selected", true);
					$("#scodeTb tr:eq(" + (scodeSelIndex+1) + ")").find("select option:eq(1)").prop("selected", false);
				}else{
					$("#scodeTb tr:eq(" + (scodeSelIndex+1) + ")").find("select option:eq(1)").prop("selected", true);
					$("#scodeTb tr:eq(" + (scodeSelIndex+1) + ")").find("select option:eq(0)").prop("selected", false);
				}
				$("#scodeTb tr:eq(" + (scodeSelIndex+1) + ")").find("select option").prop('disabled',true);
			},
			error : function(rej){
				console.log(rej);
			}
		}); 
 		$("#scodeUCBtn").addClass("btnDisplay");
		scodeUpdateFlag = false;
	});
	
	
	// 대분류 수정 취소버튼 클릭시 ---------------------------------------------------------------
	$("#lcodeUCBtn").on("click", function(){
		
		// 수정행 변경
		$("#lcodeTb tr:eq(" + (lcodeSelIndex+1) + ")").find(".lcodeCtgyNm").get(0).innerHtml = "";
		$("#lcodeTb tr:eq(" + (lcodeSelIndex+1) + ")").find(".lcodeCtgyNm").get(0).innerText = lctgyNmdb;
		$("#lcodeTb tr:eq(" + (lcodeSelIndex+1) + ")").find("select option").prop('disabled',true);
		
		// 사용여부 Select 선택여부 값 셋팅
		if( lctgyUseYndb == "Y" ){
			$("#lcodeTb tr:eq(" + (lcodeSelIndex+1) + ")").find("select option:eq(0)").prop("selected", true);
			$("#lcodeTb tr:eq(" + (lcodeSelIndex+1) + ")").find("select option:eq(1)").prop("selected", false);
		}else{
			$("#lcodeTb tr:eq(" + (lcodeSelIndex+1) + ")").find("select option:eq(0)").prop("selected", false);
			$("#lcodeTb tr:eq(" + (lcodeSelIndex+1) + ")").find("select option:eq(1)").prop("selected", true);			
		}
		
		lTableBgColorReset();
		$("#lcodeUCBtn").addClass("btnDisplay");
		lcodeUpdateFlag = false;
	});
	
	// 소분류 수정 취소버튼 클릭시 ---------------------------------------------------------------
	$("#scodeUCBtn").on("click", function(){
		
		// 수정행 변경
		$("#scodeTb tr:eq(" + (scodeSelIndex+1) + ")").find(".scodeCtgyNm").get(0).innerHtml = "";
		$("#scodeTb tr:eq(" + (scodeSelIndex+1) + ")").find(".scodeCtgyNm").get(0).innerText = sctgyNmdb;
		$("#scodeTb tr:eq(" + (scodeSelIndex+1) + ")").find("select option").prop('disabled',true);
		
		// 사용여부 Select 선택여부 값 셋팅
		if( sctgyUseYndb == "Y" ){
			$("#scodeTb tr:eq(" + (scodeSelIndex+1) + ")").find("select option:eq(0)").prop("selected", true);
			$("#scodeTb tr:eq(" + (scodeSelIndex+1) + ")").find("select option:eq(1)").prop("selected", false);
		}else{
			$("#scodeTb tr:eq(" + (scodeSelIndex+1) + ")").find("select option:eq(0)").prop("selected", false);
			$("#scodeTb tr:eq(" + (scodeSelIndex+1) + ")").find("select option:eq(1)").prop("selected", true);			
		}
		
		scodeUpdateFlag = false;
		sTableBgColorReset();
		$("#scodeUCBtn").addClass("btnDisplay");
	});
	
	// 대분류 저장 버튼 클릭시 -------------------------------------------------------------------
	$("#lcodeSBtn").on("click", function(){
		var lctgyId = $("#lcodeContents").children(":last").find("#lcodeId").val();
		var lctgyNm = $("#lcodeContents").children(":last").find("#lcodeNm").val();
		var lctgyUseYnTxt = $("#lcodeContents").children(":last").find("#lcodeSel").children("option:selected").text(); 
		var lctgyUseYn = "";
		
		if( lctgyUseYnTxt == "사용"){
			lctgyUseYn = "Y";
		}else{
			lctgyUseYn = "N";
		}
		
		
		$.ajax({
			url: 'ctgyInsert',    
			method: 'POST',
			data : JSON.stringify({ ctgyId : lctgyId , ctgyNm : lctgyNm , ctgyUseYn : lctgyUseYn }),
			contentType : 'application/json',
			dataType: 'json',
			success: function(res){
				$("#lcodeContents").children(":last").empty();
				$("#lcodeTb").append($("<tr>")
						.append($("<td>").html(lctgyId))
						.append($("<td>").html(lctgyNm))
						.append($("<td>").append($("<select id='lcodeSel' class='form-control form-control-sm'>")
											.append($("<option disabled='disabled'>사용</option>")).append($("<option disabled='disabled'>미사용</option>")))));
				
				// 사용여부 Select 선택여부 값 셋팅
				if( lctgyUseYn == "Y" ){
					$("#lcodeTb tr:last").find("select option:eq(0)").attr("selected", "selected"); 
				}else{
					$("#lcodeTb tr:last").find("select option:eq(1)").attr("selected", "");
				}				
				btnLToggle("C");
			},
			error : function(rej){
				console.log(rej);
			}
		});
	});

	// 소분류 저장 버튼 클릭시 ---------------------------------------------------------------
	$("#scodeSBtn").on("click", function(){
		var sctgyGrId = $("#scodeContents").children(":last").data("ctgyGrId");
		var sctgyId = $("#scodeContents").children(":last").find("#scodeId").val();
		var sctgyNm = $("#scodeContents").children(":last").find("#scodeNm").val();
		var sctgyUseYnTxt = $("#scodeContents").children(":last").find("#scodeSel").children("option:selected").text(); 
		var sctgyUseYn = "";
		
		if( sctgyUseYnTxt == "사용"){
			sctgyUseYn = "Y";
		}else{
			sctgyUseYn = "N";
		}

		$.ajax({
			url: 'ctgyInsert',    
			method: 'POST',
			data : JSON.stringify({ ctgyId : sctgyId , ctgyNm : sctgyNm , ctgyUseYn : sctgyUseYn , ctgyGrId : sctgyGrId }),
			contentType : 'application/json',
			dataType: 'json',
			success: function(res){
				$("#scodeContents").children(":last").empty();
				$("#scodeTb").append($("<tr>").data("ctgyGrId", sctgyGrId)
						.append($("<td>").html(sctgyId))
						.append($("<td>").html(sctgyNm))
						.append($("<td>").append($("<select id='scodeSel' class='form-control form-control-sm'>")
											.append($("<option disabled='disabled'>사용</option>")).append($("<option disabled='disabled'>미사용</option>")))));
				// 사용여부 Select 선택여부 값 셋팅
				if( sctgyUseYn == "Y" ){
					$("#scodeTb tr:last").find("select option:eq(0)").attr("selected", "selected"); 
				}else{
					$("#scodeTb tr:last").find("select option:eq(1)").attr("selected", "");
				}
				
				btnSToggle("C");
			},
			error : function(rej){
				console.log(rej);
			}
		});
	});
	
	// 대분류 삭제 취소버튼 클릭시 ---------------------------------------------------------------
	$("#lcodeDBtn").on("click", function(){
		
		$.ajax({
			url: 'ctgyDelete',    
			method: 'DELETE',
			data : JSON.stringify({ ctgyId : ctgyGrId }),
			contentType : 'application/json',
			dataType: 'json',
			success: function(res){
				console.log($("#lcodeContents tr[data-id='"+ ctgyGrId +"']"));
				$("#lcodeContents tr[data-id="+ ctgyGrId +"]").empty();
			},
			error: function(rej){
				console.log(rej);
			}
		});	
	});
	
	// 소분류 삭제 취소버튼 클릭시 ---------------------------------------------------------------
	$("#scodeDBtn").on("click", function(){
		console.log(sctgySelTrDataId);
		
 		$.ajax({
			url: 'ctgyDelete',    
			method: 'DELETE',
			data : JSON.stringify({ ctgyId : sctgySelTrDataId }),
			contentType : 'application/json',
			dataType: 'json',
			success: function(res){
				console.log($("#scodeContents tr[data-id='"+ sctgySelTrDataId +"']"));
				$("#scodeContents tr[data-id="+ sctgySelTrDataId +"]").empty();
			},
			error: function(rej){
				console.log(rej);
			}
		}); 
	});	
	
	
	init();
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
									<th>대분류</th>
									<th>대분류명</th>
									<th>사용여부</th>
								</tr>
							</thead>
							<tbody id="lcodeContents">
								<c:forEach var="list" items="${lists}" >
									<tr id="lcodeTr" data-id="${list.ctgyId}">
										<td>${list.ctgyId}</td>
										<td class="lcodeCtgyNm">${list.ctgyNm}</td>
										<td>
											<select id="lcodeSelBox" class="form-control form-control-sm">
												<c:if test="${list.ctgyUseYn eq 'Y'}">
													<option  disabled="disabled" value="Y" selected >사용</option>
													<option  disabled="disabled" value="N" >미사용</option>
												</c:if>
												<c:if test="${list.ctgyUseYn eq 'N'}">
													<option  disabled="disabled" value="Y" >사용</option>
													<option  disabled="disabled" value="N" selected >미사용</option>
												</c:if>
											</select>
										</td>
									</tr>
								</c:forEach>	
							</tbody>
						</table>					
					<p>
						<button type="button" id="lcodeABtn" class="btn btn-success btn-custom-1 mt-4">추가</button>
						<button type="button" id="lcodeUBtn" class="btn btn-success btn-custom-1 mt-4">수정</button>
						<button type="button" id="lcodeDBtn" class="btn btn-success btn-custom-1 mt-4">삭제</button>
						<button type="button" id="lcodeSBtn" class="btn btn-success btn-custom-1 mt-4 btnDisplay" data-flag="A">저장</button>
						<button type="button" id="lcodeCBtn" class="btn btn-success btn-custom-1 mt-4 btnDisplay" data-flag="A">취소</button>
						<button type="button" id="lcodeUCBtn" class="btn btn-success btn-custom-1 mt-4 btnDisplay" data-flag="A">취소</button>
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
						<button type="button" id="scodeDBtn" class="btn btn-warning btn-custom-1 mt-4">삭제</button>
						<button type="button" id="scodeSBtn" class="btn btn-warning btn-custom-1 mt-4 btnDisplay" data-flag="A">저장</button>
						<button type="button" id="scodeCBtn" class="btn btn-warning btn-custom-1 mt-4 btnDisplay" data-flag="A">취소</button>
						<button type="button" id="scodeUCBtn" class="btn btn-warning btn-custom-1 mt-4 btnDisplay" data-flag="A">취소</button>
					</p>
				</div>
			</div>
		</div>
	</div>
</div>
</body>
</html>
