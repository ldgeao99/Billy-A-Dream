<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- Container Fluid -->
					<div class="container-fluid" id="container-wrapper">
						<div class="d-sm-flex align-items-center justify-content-between mb-4">
							<h1 class="h3 mb-0 text-gray-800">쿠폰관리</h1>
						</div>
	
						<!-- row -->
						<div class="row">
							<div class="col-lg-6">
								<div class="card mb-4">
									<div class="card-header py-3">
										<h6 class="m-0 font-weight-bold text-primary">상세정보</h6>
									</div>
									<div class="card-body">
										<form id="couponForm" method="post">
											<div class="form-group">
												<label for="couponCd">쿠폰코드</label>
												<input class="form-control mb-3" type="text" size="20" id="code" name="code" placeholder="쿠폰 코드(임의의 문자열 또는 랜덤 생성 문자열)를 입력하세요" required="required">
												<button type="button" onclick="show_uuid()" class="btn btn-primary mb-1">쿠폰번호발급</button>
											</div>
											
											<div class="form-group">
												<label for="couponNm">쿠폰명</label>
												<input class="form-control mb-3" type="text" id="description" name="description" placeholder="쿠폰명" required="required">
											</div>
	
											<div class="form-group">
												<label for="amount">할인값</label>
												<input class="form-control mb-3" type="text" id="amount" name="amount" placeholder="할인값(숫자만 입력)" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');" required="required">
											</div>
	
											<div class="form-group">
												<label for="unitCd">단위</label>
												<select class="form-control mb-3" id="unitCd" name="unitCd"></select>
											</div>
	
											<div class="form-group">
												<label for="startDate">쿠폰 유효시작일</label>
												<input class="form-control mb-3" type="text" id="startDate" name="startDate"  placeholder="쿠폰 시작일(년도, 월, 일 8자리로 입력) ex)20200131" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');" required="required" maxlength="8">
											</div>
	
											<div class="form-group">
												<label for="endDate">쿠폰 유효종료일</label>
												<input class="form-control mb-3" type="text" id="endDate" name="endDate"  placeholder="쿠폰 종료일(년도, 월, 일 8자리로 입력) ex)20200131" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');" required="required" maxlength="8">
											</div>
											
											<input type="hidden" id="couponId" name="id" value="0">
										</form>
										<div class="text-right">
											<button type="button" id="clearBtn" class="btn btn-primary mb-1">초기화</button>
											<button type="button" id="insertBtn" class="btn btn-success mb-1"  onclick="couponSubmit();">입력</button>
											<button type="button" id="modifyBtn" class="btn btn-warning mb-1"  onclick="couponSubmit();" style="opacity: 0.3;" disabled="disabled">수정</button>
										</div>
									</div>
								</div>
							</div>
	
							<div class="col-lg-6">
								<div class="card mb-4">
									<div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
										<h6 class="m-0 font-weight-bold text-primary">목록</h6>
									</div>
									<div class="table-responsive p-3">
									
										<table class="ui celled table" style="width:100%" id="couponTable">
											<thead class="thead-light">
												<tr>
													<th>쿠폰명</th>
													<th>할인내용</th>
													<th>시작일</th>
													<th>종료일</th>
												</tr>
											</thead>
										</table>
									</div>
								</div>
							</div>
						</div>
					</div>
					<!-- Container Fluid -->
					<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
		
		<!-- Page level custom scripts -->
		<script>
			$(document).ready(function() {
				formClear();
				$("#unitCd").html(codeRequest("UNIT"));
				couponList();
			});
			
			$("#clearBtn").click(function() {
				formClear();
			});
			
			$("#couponTable").on("click", "tr", function(){
				rowValue = $("#couponTable").DataTable().row(this).data();
				if(rowValue !== null){
					couponView();
				}
			});
			function formClear(){
				$(".card-body form input").val("");
				$(".card-body form select").val("01");

				$("#couponId").val("0");

				$("#insertBtn").val("입력");
				$("#insertBtn").removeAttr("disabled");
				$("#insertBtn").removeAttr("style", "opacity:0.3");
				
				$("#modifyBtn").val("수정");
				$("#modifyBtn").attr("disabled", "true");
				$("#modifyBtn").attr("style", "opacity:0.3");
			}

			function couponList(){
				$("#couponTable").DataTable({
					processing : true,
					serverSide : false,
					paging : true,
					pagingType : "simple_numbers",
					order: false,
					ordering: false,
					info : true,
					filter : true,
					language : {
						"zeroRecords" : "데이터가 없습니다.",
						"lengthMenu" : "_MENU_ 개씩 보기",
						"search" : "검색:",
						"info" : "_PAGE_ / _PAGES_",
						"infoFiltered" : "(전체 _MAX_개의 데이터 중 검색결과)",
						"paginate" : {
							"previous" : "이전",
							"next" : "다음"
						}
					},
					ajax : {
						url : '/admin/coupon/list'
					},
					columns : [
						{data : "description"},
						{data : "amount",
							render: function(data, type, row){return data + "" + row.unitNm;}
						},
						{data: "startDate",
							render: function(data, type, row){
								var year = data.substr(0,4);
							    var month = data.substr(4,2);
							    var day = data.substr(6,2);                        
							    
								return year + "-" + month + "-" + day;
							}
						},
						{data: "endDate",
							render: function(data, type, row){
								var year = data.substr(0,4);
							    var month = data.substr(4,2);
							    var day = data.substr(6,2);                        
							    
								return year + "-" + month + "-" + day;
							}
						}
					],
					columnDefs: [
						{"targets":[0], "width": "49%"},
						{"targets":[1], "width": "15%"},
						{"targets":[2], "width": "18%"},
						{"targets":[2], "width": "18%"}
				    ]
				});
			}

			function reloadList() {
				$("#couponTable").DataTable().ajax.reload();
			}

			function couponView(){
				$("#couponId").val(rowValue.id);
				$("#code").val(rowValue.code);
				$("#description").val(rowValue.description);
				
				$("#amount").val(rowValue.amount);
				$("#unitCd").val(rowValue.unitCd);
				$("#startDate").val(rowValue.startDate);
				$("#endDate").val(rowValue.endDate);
				
				$("#insertBtn").attr("disabled", "true");
				$("#insertBtn").attr("style", "opacity:0.3");
				
				$("#modifyBtn").removeAttr("disabled");
				$("#modifyBtn").removeAttr("style", "opacity:0.3");

				var endDate = $("#endDate").val();
				var today = new Date();
				today = getDateFormat(today).replace(/-/g, "").substr(0, 8);

				if (endDate - today < 0) {
					$("#modifyBtn").attr("disabled", "true");
					$("#modifyBtn").attr("style", "opacity:0.3");
				}
			}

			function guid() {
				function s4() {
					
					return ((1 + Math.random()) * 0x10000 | 0).toString(16).substring(1);
				}
				return s4() + s4() + s4() + s4();
			}

			function show_uuid() {
				document.getElementById("code").value = guid();
			}

			function couponSubmit() {
				if(confirm("진행하시겠습니까?")) {
					var id = $("#couponId").val();
					var formData = $("#couponForm").serialize();
					
					if(couponInsertCheck() == true){
						if (id > 0) {
							$.ajax({
								cache : false,
								url : "/admin/coupon/update",
								type : "POST",
								data : formData,
								success : function(data) {
									var myTable = $("#couponTable").DataTable();
									myTable.ajax.reload();
									alert("수정이 완료되었습니다.");
								},
								error : function(error) {
									alert("error : " + error);
								}
							});
						} else {
							$.ajax({
								cache : false,
								url : "/admin/coupon/insert",
								type : "POST",
								data : formData,
								success : function(data) {
									var myTable = $("#couponTable").DataTable();
									myTable.ajax.reload();
									formClear();
									alert("신규 쿠폰을 발급하였습니다.");
								},
								error : function(error) {
									console.log("error : " + error);
									alert("상세정보를 모두 기입하십시오.");
								}
							});
						}
					}
				}
			}
			function couponInsertCheck(){
				if($("#unitCd").val() == "02"){
					if($("#amount").val() <= 100){
						return true;
					} else {
						alert("할인율은 0~100 까지만 입력 가능합니다.");
						return false;
					}
				} else {
					return true;
				}
			}
		</script>