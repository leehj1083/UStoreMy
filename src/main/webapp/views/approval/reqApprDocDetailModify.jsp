<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html lang="ko">
	<!--begin::Head-->
	<head>
	<title>UStore</title>
	<meta charset="utf-8" />
	<meta name="description" content="Craft admin dashboard live demo. Check out all the features of the admin panel. A large number of settings, additional services and widgets." />
	<meta name="keywords" content="Craft, bootstrap, bootstrap 5, admin themes, dark mode, free admin themes, bootstrap admin, bootstrap dashboard" />
	<meta name="viewport" content="width=device-width, initial-scale=1" />
	<link rel="canonical" href="https://preview.keenthemes.com/craft" />
	<link rel="shortcut icon" href="<c:url value='/resource/assets/media/logos/favicon.ico' />" />
	<!--begin::Fonts(mandatory for all pages)-->
	<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Inter:300,400,500,600,700" />
	<!--end::Fonts-->
	<!--begin::Vendor Stylesheets(used for this page only)-->
	<link href="<c:url value='/resource/assets/plugins/custom/leaflet/leaflet.bundle.css' />" rel="stylesheet" type="text/css" />
	<link href="<c:url value='/resource/assets/plugins/custom/datatables/datatables.bundle.css' />" rel="stylesheet" type="text/css" />
	<!--end::Vendor Stylesheets-->
	<!--begin::Global Stylesheets Bundle(mandatory for all pages)-->
	<link href="<c:url value='/resource/assets/plugins/global/plugins.bundle.css' />" rel="stylesheet" type="text/css" />		
	<link href="<c:url value='/resource/assets/css/style.bundle.css' />" rel="stylesheet" type="text/css" />
	<!--end::Global Stylesheets Bundle-->
	<link href="<c:url value='/resource/assets/plugins/custom/jstree/jstree.bundle.css' />" rel="stylesheet" type="text/css" />
	<style>
		.signature-table {
           float: right;
           margin-left: 20px;
		}
		.signature-table td {
			border: 1px solid #ddd;
			text-align: center;
		}		
		.signature-table th{
			border: 1px solid #ddd;
			text-align: center;
			height: 25px;
		}
	</style>
	</head>
	<!--end::Head-->
	<!--begin::Body-->
	<body id="kt_body" class="header-fixed header-tablet-and-mobile-fixed toolbar-enabled aside-fixed aside-default-enabled">
		<!--begin::Theme mode setup on page load-->
		<script>var defaultThemeMode = "light"; var themeMode; if ( document.documentElement ) { if ( document.documentElement.hasAttribute("data-bs-theme-mode")) { themeMode = document.documentElement.getAttribute("data-bs-theme-mode"); } else { if ( localStorage.getItem("data-bs-theme") !== null ) { themeMode = localStorage.getItem("data-bs-theme"); } else { themeMode = defaultThemeMode; } } if (themeMode === "system") { themeMode = window.matchMedia("(prefers-color-scheme: dark)").matches ? "dark" : "light"; } document.documentElement.setAttribute("data-bs-theme", themeMode); }</script>
		<!--end::Theme mode setup on page load-->
		<%-- <jsp:include page="/views/common/header.jsp"></jsp:include> --%>
				
		<!--begin::Main-->
		<!--begin::Root-->
		<div class="d-flex flex-column flex-root">
			<!--begin::Page-->
			<div class="page d-flex flex-row flex-column-fluid">
				<!--begin::Wrapper-->
				<div class="wrapper d-flex flex-column flex-row-fluid" id="kt_wrapper">
					<!--begin::Content-->
					<div class="content fs-6 d-flex flex-column flex-column-fluid" id="kt_content" style="margin-top: 30px; background-color: #fffff8; margin-left: 30px">
					<!--================================메인 내용들어가는부분================================================-->
					<%-- <jsp:include page="/views/common/sidebar.jsp"></jsp:include> --%>
						<!--begin::Toolbar-->
						<div class="toolbar" id="kt_toolbar">
							<div class="container-fluid d-flex flex-stack flex-wrap flex-sm-nowrap">
								<!--begin::Info-->
								<div class="d-flex flex-column align-items-start justify-content-center flex-wrap me-2">
									<!--begin::Title-->
									<h1 class="text-gray-900 fw-bold my-1 fs-2">임시저장함</h1>
									<!--end::Title-->									
								</div>
								<!--end::Info-->
								<!--begin::Toolbaricon-->
								<div class="d-flex justify-content-end" data-kt-user-table-toolbar="base">
									<!--begin::Filter-->
									<button type="button" class="btn btn-light-primary me-3" id="btnSendApproval" data-kt-menu-trigger="click" data-kt-menu-placement="bottom-end">
									<i class="ki-duotone ki-filter fs-2">
										<span class="path1"></span>
										<span class="path2"></span>
									</i>결재상신</button>
									<button type="button" class="btn btn-light-primary me-3" id="btnApprovalInfo" data-kt-menu-trigger="click" data-kt-menu-placement="bottom-end" data-bs-toggle="modal" data-bs-target="#kt_modal_1">
									<i class="ki-duotone ki-filter fs-2">
										<span class="path1"></span>
										<span class="path2"></span>
									</i>결재정보</button>
									<button type="button" class="btn btn-light-primary me-3" id="btnSaveTemp" data-kt-menu-trigger="click" data-kt-menu-placement="bottom-end">
									<i class="ki-duotone ki-filter fs-2">
										<span class="path1"></span>
										<span class="path2"></span>
									</i>임시저장</button>
									<button type="button" class="btn btn-light-primary me-3" id="btnGoBack" data-kt-menu-trigger="click" data-kt-menu-placement="bottom-end">
									<i class="ki-duotone ki-filter fs-2">
										<span class="path1"></span>
										<span class="path2"></span>
									</i>뒤로가기</button>								
								</div>
								<!--end::Toolbaricon-->		
							</div>
						</div>
						<!--end::Toolbar-->
						<!-- 결재 양식 들어오는 곳 -->
						<div class="loadApprDoc">	
						${htmlContent}				
						</div>					
					</div>
				<!--end::Content--> 
    			</div>
				<!--end::Wrapper-->
			</div>
			<!--end::Page-->
		</div>
		<!--end::Root-->
		
		<!--begin::modal-->
		<div class="modal fade" tabindex="-1" id="kt_modal_1" role="dialog">
			<div class="modal-dialog modal-lg" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h3 class="modal-title">결재정보</h3>
						<!--begin::Close-->
						<div class="btn btn-icon btn-sm btn-active-light-primary ms-2" data-bs-dismiss="modal" aria-label="Close">
							<i class="ki-duotone ki-cross fs-1"><span class="path1"></span><span class="path2"></span></i>
						</div>
						<!--end::Close-->
					</div>

					<div class="modal-body">
						<div class="d-flex flex-row h-600px border">
							<!-- 왼쪽 div -->
							<div class="emptree border" style="max-height: 600px; overflow-y: auto; overflow-x: hidden; margin: 5px; position: relative;" >
								<div class="d-flex flex-column flex-row-fluid w-350px justify-content-between" style="align-items: center; margin: 5px;">
									<div class="d-flex flex-column-auto h-40px flex-center text-light-success bg-success" style="margin: 5px 0px; width: 100%;">
										<span class="text-center">조 직 도</span>						
									</div>
								</div>
								<div style="margin: 10px;">
									<input type="text" id="empName" placeholder="사원명을 입력하세요"/>
									<button onclick="empSearch()">검색</button>	
								</div>
								<div class="d-flex flex-column-fluid scroll px-5" style="max-height: 400px; overflow-y: auto;">
									<div class="text-black" id="kt_docs_jstree_basic"></div>
								</div>
								<div style="position: absolute; bottom: 20px; text-align: center; left: 25%;">
									<button id="addline" onclick="addApprovalLine()">결재선 추가</button>
									<button id="addrecv" onclick="addReceiver()">수신자 추가</button>
								</div>
							</div>		

							<!-- 오른쪽 div -->
							<div class="d-flex flex-column flex-row-fluid w-350px justify-content-between">
								<div class="apprlineSec border" style="align-items: center; margin: 5px;">
									<div class="d-flex flex-column-auto h-40px flex-center text-light-success bg-success" style="margin: 10px 0px;">
										<span class="text-center">결 재 선</span>
									</div>
									<div class="apprline d-flex flex-column scroll" id="apprlineTable" style="height: 250px;">
										<div style="overflow: auto;">
											<table class="signature-table mr-3 w-100">
												<thead>
													<tr>
														<th>결재타입</th>
														<th>이름</th>
														<th>직책</th>
														<th style="width: 86.22222px;">부서</th>
														<th style="width: 30px;"></th>
													</tr>
												</thead>
												<tbody>											
												</tbody>
											</table>
										</div>
									</div>
								</div>

								<div class="apprreceiver border"  style="align-items: center; margin: 5px;">
									<div class="d-flex flex-column-auto h-40px flex-center text-light-success bg-success" style="margin: 10px 0px;">
										<span class="text-center">수 신 자</span>
									</div>										
									<div class="d-flex flex-column receiver scroll" id="receiverTable" style="height: 200px;">
										<div style="overflow: auto;">
											<table class="signature-table mr-3 w-100">
												<thead>
													<tr>
														<th>이름</th>
														<th>직책</th>
														<th>부서</th>
														<th style="width: 30px;"></th>
													</tr>
												</thead>
												<tbody>														
												</tbody>
											</table>
										</div>										
									</div>
								</div>
							</div>
						</div>
						<!-- 아래쪽 div -->
							<div>
							<div class="comment border"  style="align-items: center; margin: 5px;">
								<div class="d-flex flex-column-auto h-40px flex-center text-light-success bg-success" style="margin: 10px 0px;">
									<span class="text-center">결재의견(반려, 수정)</span>
								</div>										
								<div class="d-flex flex-column commentTable scroll" id="commentlist" style="height: 100px;">
									<div style="overflow: auto;">
										<table class="w-100">
											<thead>
												<tr>
													<th>결재자명</th>
													<th>결재타입</th>
													<th>결재일시</th>
													<th>결재의견</th>
												</tr>
											</thead>
											<tbody>												
											</tbody>
										</table>
									</div>										
								</div>
							</div>
						</div>								
					</div>

					<div class="modal-footer" style="display: flex; justify-content: center;">
						<button type="button" class="btn btn-primary" id="checkapprinfo">확인</button>
					</div>
				</div>
			</div>
		</div>
		<sec:authorize access="isAuthenticated()">
			<sec:authentication property="principal" var="principal"/>
		</sec:authorize>						
		<!--begin::Javascript-->
		<!--begin::Global Javascript Bundle(mandatory for all pages)-->
		<script src="<c:url value='/resource/assets/plugins/global/plugins.bundle.js' />"></script>
		<script src="<c:url value='/resource/assets/js/scripts.bundle.js' />"></script>
		<!--end::Global Javascript Bundle-->
		<script src="<c:url value='/resource/assets/plugins/custom/jstree/jstree.bundle.js' />"></script>
		<!--end::Javascript-->
	</body>
	<!--end::Body-->
	<script>
	
	var queryString = window.location.search;

	// URLSearchParams를 사용하여 쿼리 문자열을 해석
	var params = new URLSearchParams(queryString);

	// apprIdx와 apprTypeIdx 값을 추출
	var apprIdx = params.get('apprIdx');
	var apprTypeIdx = params.get('apprTypeIdx');

	// 추출된 값 확인 (콘솔에 출력)
	console.log('apprIdx:', apprIdx);
	console.log('apprTypeIdx:', apprTypeIdx);
	
	var apprContent;
	var approvalLines = [];
	var receivers = [];
	var readonly = false; /* ckEditor 있는 폼 불러올때, true이면 읽기전용(결재 상신중인 문서 확인시에는 수정 안되게 처리) */
    function loadFormPage(formPage, common_idx, apprTypeIdx) {
        $.ajax({
            type: 'GET',
            url: "/gethtml?common_idx=" + common_idx,
            success: function (data) {
                // 로드한 HTML을 동적으로 추가
                $('.loadApprDoc').html(data);  
                console.log(apprTypeIdx);
                setValues(apprTypeIdx);     
                generateApproverRow();
                generateSignatureRow();
            },
            error: function (error) {
                console.error('페이지 로드 중 오류가 발생했습니다.');
            }
        });
        
        
        function setValues(apprTypeIdx) {
        	
        	var apprSubject = "${content.apprSubject}";
        	$("#apprSubject").val(apprSubject);
        	
        	// 결재자 정보 불러오기
        	var beforeConvertData = ${apprline};
        	function convertData(secondData){
        		return{
        			empIdx: secondData.emp_idx,
        	        apprType: secondData.appr_type,
        	        name: secondData.approver,
        	        positionType: secondData.positionType,
        	        department: secondData.dept_name,
        	        apprOrder: secondData.appr_order,
        	        apprConfirm: secondData.appr_confirm
        		};
        	}
        	
        	approvalLines = beforeConvertData.map(convertData);
        	console.log(approvalLines);
        	        	
       	    // 가공된 데이터를 테이블에 동적으로 추가
		    var tbody = document.getElementById('apprlineTable').getElementsByTagName('tbody')[0];
		    tbody.innerHTML = ""; // 테이블 내용 비우기
	
		    // 새로운 테이블 내용 추가
		    for (var i = approvalLines.length - 1; i >= 0; i--) {
		        var newRow = tbody.insertRow(-1);
		        var cell1 = newRow.insertCell(0);
		        var cell2 = newRow.insertCell(1);
		        var cell3 = newRow.insertCell(2);
		        var cell4 = newRow.insertCell(3);
		        var cell5 = newRow.insertCell(4);
	
		        cell1.innerHTML = approvalLines[i].apprType;
		        cell2.innerHTML = approvalLines[i].name;
		        cell3.innerHTML = approvalLines[i].positionType;
		        cell4.innerHTML = approvalLines[i].department;
	
		        if (approvalLines[i].apprType !== "기안") {
			        var deleteIcon = document.createElement('i');
			        deleteIcon.className = 'fa fa-trash';	
			        deleteIcon.onclick = createApprDeleteIconClickHandler(newRow, approvalLines[i]);
			        cell5.appendChild(deleteIcon);
			        cell5.style.width = '30px';		        	
		        }
	
		        newRow.dataset.node = JSON.stringify(approvalLines[i]);
		    }       	    	   		    
		    		
			$("#apprListTable #approverRow").html(generateApproverRow());
			$("#apprListTable tr:last").html(generateSignatureRow());
		    
			
			// tbody 요소를 가져옴
			var commentbody = document.querySelector("#commentlist tbody");

			// approvalLines 배열 순회
			approvalLines.forEach(function(data, index) {
			    // comment가 있는 경우에만 처리
			    if (data.comment !== null) {
			        // tr 요소 생성
			        var row = document.createElement("tr");

			        // 각 컬럼에 데이터 추가
			        var columns = ["name", "apprConfirm", "apprDate", "comment"];
			        columns.forEach(function(column) {
			            var cell = document.createElement("td");
			            // 날짜 데이터의 경우 포맷 변경
			            if (column === "apprDate") {
			                var date = data[column] ? new Date(data[column]) : null;
			                if(date){
				                cell.textContent = date.toLocaleDateString("ko-KR", { year: 'numeric', month: '2-digit', day: '2-digit' });
			                }else{
			                	cell.textContent = '';
			                }              	
			                
			            } else if(column === "apprConfirm") {
			            	var confirmType = data[column]
			            	if(confirmType==0){
			            		cell.textContent = ''; 
			            	}else if(confirmType==1 && index ===0){
			            		cell.textContent = '기안';
			            	}else if(confirmType==1){
			            		cell.textContent = '결재';
			            	}else{
			            		cell.textContent = '반려';
			            	}
			            } else {
			                cell.textContent = data[column];
			            }
			            row.appendChild(cell);
			        });

			        // tbody에 행 추가
			        commentbody.appendChild(row);
			    }
			});
			
			
			// 수신자 정보 불러오기
		    
		    var beforeConvertRecvData = ${receiver};
        	function convertRecvData(secondData){
        		return{
        			empIdx: secondData.emp_idx,
        	        name: secondData.receiver,
        	        positionType: secondData.positionType,
        	        department: secondData.dept_name
        		};
        	}
        	
        	receivers = beforeConvertRecvData.map(convertRecvData);
        	console.log(receivers);
       	 	
        	// 가공된 데이터를 테이블에 동적으로 추가
		    var tbody = document.getElementById('receiverTable').getElementsByTagName('tbody')[0];
		    tbody.innerHTML = ""; // 테이블 내용 비우기
	
		    // 새로운 테이블 내용 추가
		    for (var i = receivers.length - 1; i >= 0; i--) {
		        var newRow = tbody.insertRow(-1);		        
		        var cell1 = newRow.insertCell(0);
		        var cell2 = newRow.insertCell(1);
		        var cell3 = newRow.insertCell(2);
		        var cell4 = newRow.insertCell(3);
	
		        cell1.innerHTML = receivers[i].name;
		        cell2.innerHTML = receivers[i].positionType;
		        cell3.innerHTML = receivers[i].department;
	
		        var deleteIcon = document.createElement('i');
		        deleteIcon.className = 'fa fa-trash';
		        deleteIcon.onclick = createRecvDeleteIconClickHandler(newRow, receivers[i]);
		        cell4.appendChild(deleteIcon);
		        cell4.style.width = '30px';		
		        newRow.dataset.node = JSON.stringify(receivers[i]);
		    }
       	 	
		    if (receivers.length > 0) {
           	 // 수신자 이름들을 담을 배열
               var receiverNames = [];

               // 각 수신자의 이름을 배열에 추가
               receivers.forEach(function(recv) {
               	var receiver = recv.name +'('+ recv.department +' '+ recv.positionType +')'; 
               
                   receiverNames.push(receiver);
               });

               // 수신자 이름들을 쉼표로 구분하여 문자열로 변환
               var receiversString = receiverNames.join(', ');

               // 결재양식의 수신자 input 태그에 수신자 이름 넣기
               document.getElementById('inputReceiver').value = receiversString;
           } else {
               document.getElementById('inputReceiver').value = '내부결재';
           }
		    
        	
        	       	
        	switch (apprTypeIdx) {
            case '30':            	
            	apprContent = "${content.apprContent}";              
                break;
                
            case '31':            	
            	var orderNum = "${content.orderNum}";
        	    var totalAmount = "${content.totalAmount}";            	
            	$("#orderNum").val(orderNum);
            	$("#totalAmount").val(totalAmount);
                break;
                
            case '32':            	
                var leaveType = "${content.leaveType}";
                var leaveStartDate = "${content.leaveStartDate}";
                var leaveEndDate = "${content.leaveEndDate}";
                var leaveDays = "${content.leaveDays}";
                var leaveReason = "${content.leaveReason}";
                
                $("#leaveType").val(leaveType);
                $("#kt_daterangepicker_1").val(leaveStartDate + ' - ' + leaveEndDate);
                $("#leaveStartDate").val(leaveStartDate);
                $("#leaveEndDate").val(leaveEndDate);
                $("#leaveDays").text(leaveDays);
                $("#leaveReason").val(leaveReason);
                break;
        	}            
        }
        
        function generateApproverRow() {
		    var rowHtml = "";
		    for (var i = 0; i < approvalLines.length; i++) {
		      rowHtml += "<td>" + approvalLines[i].name + "</td>";
		    }
		    return rowHtml;
		}
		// 결재자 사인구역 위치할 행				  
		function generateSignatureRow() {
		    var rowHtml = "";
		    for (var i = 0; i < approvalLines.length; i++) {
		      rowHtml += "<td></td>";
		    }
		    return rowHtml;
		}
    }
    
        
    $(document).ready(function () {
    	
    	headerOnReady();
    	
    	var common_idx=${common_idx};
    	console.log("common_idx : "+common_idx);
    	// 초기에 선택된 양식에 대한 HTML 파일 로드
        var formPage = '<%= request.getAttribute("formPage") %>';
        if (formPage) {
            loadFormPage(formPage, common_idx, apprTypeIdx);
        }
        
        // 결재정보 버튼 클릭 시의 동작
        $('#btnApprovalInfo').on('click', function () {
            console.log('결재정보 버튼 클릭');            
            $('#kt_modal_1').modal('show');
        });
        
        
     	// 뒤로가기 버튼 클릭 시의 동작
        $('#btnGoBack').on('click', function () {
        	if (confirm('저장하지 않고 뒤로 가시겠습니까?')) {
                window.location.href = '/approval/reqpapproval';
            } else {
                console.log('뒤로가기 버튼 클릭 - 취소');
            }            
        });
        
        $('#kt_modal_1').on('shown.bs.modal', function(){
			getTreeData();
		});
        
		$('#checkapprinfo').on('click', function(){
			$('.btn[data-bs-dismiss="modal"]').click();
		});
		
    });
	
	
	
    function getTreeData(){
		$.ajax({
			url:'/organizationChart.ajax',
			method:'GET',
			dataType:'JSON',
			success:function(data){
				console.log(data);
				jsTree(data.treeData);
			},error: function(error){
				console.log(error);
			}
		})
	}
	
    function jsTree(treeData){
		$('#kt_docs_jstree_basic').jstree({
			"core" : {
				"data" : treeData,
				"themes" : {
					"responsive": true
				}
			},
			"types" : {
				  "department": {
					    "icon": "fa fa-building" // 부서 아이콘
				  },
				  "employee": {
				    "icon": "fa fa-user", // 직원 아이콘
				    "selectable": true // 선택 가능하도록 설정
				  }
			},
			"plugins": ["types","search"]
			,
			"search":{
				"show_only_matches_children" : true
			}
		});
	}

	function empSearch() {
		console.log("검색");
		$('#kt_docs_jstree_basic').jstree(true).search($('#empName').val());
	}

	//이벤트
	$('#kt_docs_jstree_basic').on("changed.jstree", function (e, data) {
		console.log("changed 했을 때", data.selected);
	});

	// Node 열렸을 때
	let isAdded = false;
	$('#kt_docs_jstree_basic').on("open_node.jstree", function (e, data) {
		console.log("open되었을때", data.node);
	});

	// Node 선택했을 때
	$('#kt_docs_jstree_basic').on("select_node.jstree", function (e, data) {
		console.log("select했을때", data.node);
		var emp_idx = data.node.id.replace("_anchor", "");
	});
	
	
	
	// 조직도에서 결재선에 추가하는 버튼 함수
	function addApprovalLine() {
	    var selectedNode = $('#kt_docs_jstree_basic').jstree(true).get_selected(true)[0];
	    var emp_idx = selectedNode.id.replace("_anchor", "");

	    // 서버에서 사원 정보 조회
	    $.ajax({
	        type: 'GET',
	        url: '/info/' + emp_idx,
	        success: function (employeeInfo) {
	            console.log(employeeInfo);
				
	            var nextApprOrder = getNextApprOrder();
	            
	            var approvalData = {
	            	empIdx : employeeInfo.empIdx,
	                apprType: '결재',
	                name: employeeInfo.empName,
	                positionType: employeeInfo.positionType,
	                department: employeeInfo.deptName,
	                apprOrder: nextApprOrder,  // 결재순서 추가
	                apprConfirm: false  // 결재여부 추가
	            };

	            // 테이블에 데이터 추가
	            if(selectedNode.type!='department'){
		            addRowToApprLineTable(approvalData);              	
	            }else{
	            	alert('부서는 추가할 수 없습니다.');
	            }

	            if(!isApprDuplicate(approvalData)){
		            // approvalLines 배열에 데이터 추가
		            approvalLines.push(approvalData);
		            console.log("approval array:", approvalLines);
	            }else{
	         		console.log("중복된 데이터가 들어갔습니다.")
	         	}
	        },
	        error: function (error) {
	            console.error('Error fetching employee info:', error);
	        }
	    });
	}

	// 다음 결재순서를 반환하는 함수
	function getNextApprOrder() {
	    return approvalLines.length;
	}
	
	// 결재정보 모달창 결재선 추가 테이블에 행을 추가하는 함수
	function addRowToApprLineTable(approvalData) {
	    var tbody = document.getElementById('apprlineTable').getElementsByTagName('tbody')[0];
	    
	    var isAlreadySelected = checkIfNodeExists(tbody, approvalData);
	    
	    if(!isAlreadySelected){
		    var newRow = tbody.insertRow(0);
	
		    var cell1 = newRow.insertCell(0);
		    var cell2 = newRow.insertCell(1);
		    var cell3 = newRow.insertCell(2);
		    var cell4 = newRow.insertCell(3);
		    var cell5 = newRow.insertCell(4);
	
		 		        
	        cell1.innerHTML = approvalData.apprType;
		    cell2.innerHTML = approvalData.name;
		    cell3.innerHTML = approvalData.positionType;
		    cell4.innerHTML = approvalData.department;
	
		    var deleteIcon = document.createElement('i');
		    deleteIcon.className = 'fa fa-trash';
		    deleteIcon.onclick = createApprDeleteIconClickHandler(newRow, approvalData);
		    cell5.appendChild(deleteIcon);	
		    cell5.style.width='30px';		    
		 		    
		 	// 선택한 노드 정보를 행에 저장 (data-node 필요)
		    newRow.dataset.node = JSON.stringify(approvalData);
	    }else{
	    	alert("이미 선택된 직원입니다.");
	    }
	}

	function createApprDeleteIconClickHandler(row, data) {
	    return function () {
	        row.remove();
	        removeEmpFromApprLines(data);
	    };
	}
	
	function removeEmpFromApprLines(empToRemove) {
		var index = approvalLines.findIndex(function (emp) {
	        return JSON.stringify(emp) === JSON.stringify(empToRemove);
	    });

	    if (index !== -1) {
	        // 결재 순서 변경
	        for (var i = index + 1; i < approvalLines.length; i++) {
	            var currentOrder = parseInt(approvalLines[i].apprOrder, 10);
	            approvalLines[i].apprOrder = (currentOrder - 1).toString();
	        }

	        approvalLines.splice(index, 1);
	        console.log("삭제 후 결재선:", approvalLines);

	        // 테이블 UI 업데이트
	        updateApprLineTable(approvalLines);
	    }
	}
	
	// 결재선 테이블의 UI를 업데이트하는 함수
	function updateApprLineTable(approvalLines) {
	    var tbody = document.getElementById('apprlineTable').getElementsByTagName('tbody')[0];
	    tbody.innerHTML = ""; // 테이블 내용 비우기

	    // 새로운 테이블 내용 추가
	    for (var i = approvalLines.length - 1; i >= 0; i--) {
	        var newRow = tbody.insertRow(-1);
	        var cell1 = newRow.insertCell(0);
	        var cell2 = newRow.insertCell(1);
	        var cell3 = newRow.insertCell(2);
	        var cell4 = newRow.insertCell(3);
	        var cell5 = newRow.insertCell(4);

	        cell1.innerHTML = approvalLines[i].apprType;
	        cell2.innerHTML = approvalLines[i].name;
	        cell3.innerHTML = approvalLines[i].positionType;
	        cell4.innerHTML = approvalLines[i].department;

	        if (approvalLines[i].apprType !== "기안") {
		        var deleteIcon = document.createElement('i');
		        deleteIcon.className = 'fa fa-trash';
		        deleteIcon.onclick = createApprDeleteIconClickHandler(newRow, approvalLines[i]);
		        cell5.appendChild(deleteIcon);
		        cell5.style.width = '30px';	        	
	        }

	        newRow.dataset.node = JSON.stringify(approvalLines[i]);
	    }
	}
	
	
	// 조직도에서 수신자 추가하는 버튼 함수
	function addReceiver(){
		var selectedNode = $('#kt_docs_jstree_basic').jstree(true).get_selected(true)[0];
		var emp_idx = selectedNode.id.replace("_anchor", "");				
	    
	    // 서버에서 사원 정보 조회
	    $.ajax({
	        type: 'GET',
	        url: '/info/' + emp_idx,
	        success: function (employeeInfo) {
	            console.log(employeeInfo);

	            // 생성할 receiverData 객체를 만들어서 데이터 채우기
	            var receiverData = {
	            	empIdx: employeeInfo.empIdx,
	                name: employeeInfo.empName,
	                position: employeeInfo.position,
	                positionType: employeeInfo.positionType,
	                department: employeeInfo.deptName
	            };
	            
	         	// 테이블에 데이터 추가
	            if(selectedNode.type!='department'){
	            	addRowToReceiverTable(receiverData);           	
	            }else{
	            	alert('부서는 추가할 수 없습니다.');
	            }	              

	         	if(!isRecvDuplicate(receiverData)){
		            // receivers 배열에 데이터 추가
		            receivers.push(receiverData);   
		            console.log("Receivers array:", receivers);	         		
	         	}else{
	         		console.log("중복된 데이터가 들어갔습니다.")
	         	}
	        },
	        error : function(e){
	        	console.log(e);	
	        }
		});		
	}
	
	// 결재정보 모달창 수신자 추가 테이블에 행을 추가하는 함수
	function addRowToReceiverTable(receiverData) {
		var tbody = document.getElementById('receiverTable').getElementsByTagName('tbody')[0];
		var isAlreadySelected = checkIfNodeExists(tbody, receiverData);
		
		if (!isAlreadySelected) {		
			var newRow = tbody.insertRow(0); // 첫 번째 위치에 새로운 행 추가
			// 각 셀에 데이터 추가
			var cell1 = newRow.insertCell(0);
			var cell2 = newRow.insertCell(1);
			var cell3 = newRow.insertCell(2);
			var cell4 = newRow.insertCell(3);
			
			cell1.innerHTML = receiverData.name;
			cell2.innerHTML = receiverData.positionType;
			cell3.innerHTML = receiverData.department;
			
			var deleteIcon = document.createElement('i');
			deleteIcon.className = 'fa fa-trash';
			deleteIcon.onclick = createRecvDeleteIconClickHandler(newRow, receiverData);
			cell4.appendChild(deleteIcon);
			cell4.style.width='30px';
			
			// 선택한 노드 정보를 행에 저장 (data-node 필요)
			newRow.dataset.node = JSON.stringify(receiverData);
		}else{
			alert("이미 선택된 직원입니다.");
		}			
	}    
	
	function createRecvDeleteIconClickHandler(row, data) {
	    return function () {
	        row.remove();
	        removeEmpFromReceiver(data);
	    };
	}
	
	function removeEmpFromReceiver(empToRemove){
		var index = receivers.findIndex(function (emp) {
	        return JSON.stringify(emp) === JSON.stringify(empToRemove);
	    });

	    if (index != -1) {
	    	receivers.splice(index, 1);
	        console.log("receivers array after removal:", receivers);
	    }	
	}
	
	// 선택된 노드가 존재하는지 확인하는 함수
	function checkIfNodeExists(tbody, rowData) {
    var existingRows = tbody.getElementsByTagName('tr');

	    for (var i = 0; i < existingRows.length; i++) {
	        var row = existingRows[i];
	        var rowNodeString = row.dataset.node;
	
	        if (rowNodeString) {
	        	try{
		            var rowNode = JSON.parse(rowNodeString);
		
		            if (rowNode.name === rowData.name &&
	                    rowNode.positionType === rowData.positionType &&
	                    rowNode.department === rowData.department) {
		                return true;
		            }	        		
	        	}catch(e){
	        		console.error(e);
	        	}
	        }
	    }	
	    return false;
	}
	
	// approvalLines 배열에 중복 데이터가 있는지 확인하는 함수
	function isApprDuplicate(newData) {
	    for (var i = 0; i < approvalLines.length; i++) {
	        if (compareData(approvalLines[i], newData)) {
	            return true; // 중복된 데이터가 있음
	        }
	    }
	    return false; // 중복된 데이터가 없음
	}
	
	
	// receivers 배열에 중복 데이터가 있는지 확인하는 함수
	function isRecvDuplicate(newData) {
	    for (var i = 0; i < receivers.length; i++) {
	        if (compareData(receivers[i], newData)) {
	            return true; // 중복된 데이터가 있음
	        }
	    }
	    return false; // 중복된 데이터가 없음
	}

	// 두 데이터 객체를 비교하는 함수
	function compareData(data1, data2) {
	    return (
	        data1.name === data2.name &&
	        data1.positionType === data2.positionType &&
	        data1.department === data2.department
	    );
	}
	    
	    
	// 결재선, 수신자 저장 함수 
	$('#saveApprLine').on('click', function () {
		var approvalSuccess = false;
	    var receiverSuccess = false;
	    
        $.ajax({
        	type: 'POST',
            url: '/saveapprlinedata',
            data: JSON.stringify({
                approvalLines: approvalLines
            }),
            contentType:'application/json; charset=utf-8',
            success: function (data) {
                console.log(data.approvalLines);
                console.log('결재선 정보가 성공적으로 저장되었습니다.'); 
                
                // 결재선 구역을 다시 그리기
                drawApprLineArea(data.approvalLines);
                
                // 결재선 정보 저장 성공
	            approvalSuccess = true;
	
	            // 모든 처리가 완료되었을 때 모달 닫기
	            if (approvalSuccess && receiverSuccess) {
	            	$('.btn[data-bs-dismiss="modal"]').click();
	            }
            },
            error: function (error) {
                console.error('결재선 정보 저장 중 오류가 발생했습니다.');
                $('.btn[data-bs-dismiss="modal"]').click();
            }
        });
        
        
     	// 서버로 수신자 정보 전송 (AJAX 사용)
        $.ajax({
            type: 'POST',
            url: '/savereceiverdata',
            data: JSON.stringify({
                receivers: receivers
            }),
            contentType: 'application/json; charset=utf-8',
            success: function (data) {
                console.log(data.receivers);
                console.log('수신자 정보가 성공적으로 저장되었습니다.');
                
            	// 결재폼의 수신자 칸 다시 입력
                drawReceiverArea(data.receivers);
                
             	// 수신자 정보 저장 성공
                receiverSuccess = true;

                // 모든 처리가 완료되었을 때 모달 닫기
                if (approvalSuccess && receiverSuccess) {
                	$('.btn[data-bs-dismiss="modal"]').click();
                }
            },
            error: function (error) {
                // 수신자 정보 저장 중 오류가 발생했을 때의 동작
                console.error('수신자 정보 저장 중 오류가 발생했습니다.');
                $('.btn[data-bs-dismiss="modal"]').click();
            }
        });
        
    });
	
	function drawApprLineArea(approvalLines) {
	    // 기존의 결재받는 구역을 지우는 작업
	    $("#apprListTable #approverRow").html(""); 
    	$("#apprListTable tr:last").html(""); 

	    // 수정한 결재선 데이터로 결재받는 구역을 그리는 작업
    	function generateApproverRow() {
		    var rowHtml = "";
		    for (var i = 0; i < approvalLines.length; i++) {
		      rowHtml += "<td>" + approvalLines[i].name + "</td>";
		    }
		    return rowHtml;
		}
		// 결재자 사인구역 위치할 행				  
		function generateSignatureRow() {
		    var rowHtml = "";
		    for (var i = 0; i < approvalLines.length; i++) {
		      rowHtml += "<td></td>";
		    }
		    return rowHtml;
		}
		
		$("#apprListTable #approverRow").html(generateApproverRow());
		$("#apprListTable tr:last").html(generateSignatureRow());
	}

	// 결재폼의 수신자 칸 다시 입력
	function drawReceiverArea(receivers) {
	    // 기존의 양식 폼 내 수신자를 지우는 작업
		 $("#inputReceiver").val("");
	    // 새로운 수신자를 입력하는 작업
	    if (receivers.length > 0) {
           	 // 수신자 이름들을 담을 배열
               var receiverNames = [];

               // 각 수신자의 이름을 배열에 추가
               receivers.forEach(function(recv) {
               	var receiver = recv.name +'('+ recv.department +' '+ recv.positionType +')'; 
               
                   receiverNames.push(receiver);
               });

               // 수신자 이름들을 쉼표로 구분하여 문자열로 변환
               var receiversString = receiverNames.join(', ');

               // 결재양식의 수신자 input 태그에 수신자 이름 넣기
               $("#inputReceiver").val(receiversString);
		    } else {
		        $("#inputReceiver").val('내부결재');
           };
	}
	
	// 임시저장
    $('#btnSaveTemp').on('click', function () {
    	
    	console.log('임시저장 버튼 클릭'); 
    	var ApprovalDto;
    	var common_idx = $('#common_idx').val();
    	console.log(common_idx);
    	var apprIdx = new URLSearchParams(window.location.search).get('apprIdx');
    	var apprSubject = $('#apprSubject').val();
    	
        if(common_idx=='30') {          		
        	var apprContent = myEditor.getData();
            ApprovalDto = {
            			apprIdx : apprIdx,
                	    commonIdx: common_idx,
                	    apprSubject: apprSubject,
                	    apprContent: apprContent,
                	    approvalLines: approvalLines,
                	    receivers: receivers
                	};
        }else if(common_idx=='31'){
        	var orderNum = $('#orderNum').val();
    	    var totalAmount = $('#totalAmount').val();
        	ApprovalDto = {
        			apprIdx : apprIdx,
        		    commonIdx: common_idx,
        		    apprSubject: apprSubject,
        		    approvalLines: approvalLines,
        	        receivers: receivers,
        		    orderNum: orderNum,
        		    totalAmount : totalAmount
        		};
        }else{
        	var leaveType = $('#leaveType option:selected').val();
            var leaveDays = $('#leaveDays').html();
            var leaveReason = $('#leaveReason').val();
            var leaveStartDate =$('#leaveStartDate').val();
            var leaveEndDate = $('#leaveEndDate').val();
            
            console.log(leaveStartDate);
            console.log(leaveEndDate);
            
        	ApprovalDto = {
        			apprIdx : apprIdx,
            	    commonIdx: common_idx,
            	    apprSubject: apprSubject,
            	    approvalLines: approvalLines,
                    receivers: receivers,
            	    leaveType: leaveType,
            	    leaveStartDate: leaveStartDate,
            	    leaveEndDate: leaveEndDate,
            	    leaveDays: leaveDays,
            	    leaveReason: leaveReason
            	};
        }
    	console.log(ApprovalDto);
	    
        $.ajax({
            url: '/tempsaveappr', 
            type: 'POST',
            contentType: 'application/json',
            data: JSON.stringify(ApprovalDto),
            success: function(response) {
                console.log('임시저장이 완료되었습니다.');
                alert('임시저장이 완료되었습니다.');
                location.href='/approval/tempapproval';
            },            
            error: function(error) {
                console.error('임시저장 중 오류가 발생했습니다.', error);
            }
        });
        
    });
	
	
	// 결재상신
	$('#btnSendApproval').on('click', function () {
		
		console.log('결재상신 버튼 클릭');
		var ApprovalDto;
		var common_idx = $('#common_idx').val();
    	console.log(common_idx);
    	var apprSubject = $('#apprSubject').val();
    	
    	if(common_idx=='30') {  
    		var apprContent = myEditor.getData();	
            ApprovalDto = {
            	    commonIdx: common_idx,
            	    apprSubject: apprSubject,
            	    apprContent: apprContent,
            	    approvalLines: approvalLines,
            	    receivers: receivers
            	};
	    }else if(common_idx=='31'){
	    	var orderNum = $('#orderNum').val();
    	    var totalAmount = $('#totalAmount').val();
	    	ApprovalDto = {
	    		    commonIdx: common_idx,
	    		    apprSubject: apprSubject,
	    		    approvalLines: approvalLines,
	    	        receivers: receivers,
	    		    orderNum: orderNum,
	    		    totalAmount : totalAmount
	    		};
	    }else{
	    	var leaveType = $('#leaveType').val();
            var leaveDays = $('#leaveDays').val();
            var leaveReason = $('#leaveReason').val();
            var leaveStartDate =$('#leaveStartDate').val();
            var leaveEndDate = $('#leaveEndDate').val();
            console.log(leaveStartDate);
            console.log(leaveEndDate);
	    	ApprovalDto = {
	        	    commonIdx: common_idx,
	        	    apprSubject: apprSubject,
	        	    approvalLines: approvalLines,
	                receivers: receivers,
	        	    leaveType: leaveType,
	        	    leaveStartDate: leaveStartDate,
	        	    leaveEndDate: leaveEndDate,
	        	    leaveDays: leaveDays,
	        	    leaveReason: leaveReason
	        	};
	    }
		console.log(ApprovalDto);
	    
	    $.ajax({
	        url: '/sendappr',
	        method: 'POST',
	        contentType: 'application/json',
	        data: JSON.stringify(ApprovalDto),
	        success: function (response) {
	            console.log('문서가 결재상신 되었습니다.');
	            alert('문서가 결재상신 되었습니다.');	 
	            location.href='/approval/tempapproval';
	        },	        
	        error: function (error) {
	            console.error('결재상신 중 오류가 발생했습니다.');
	            alert('결재상신 중 오류가 발생했습니다.');
	        }
	    });
	});
    
	
	</script>
</html>