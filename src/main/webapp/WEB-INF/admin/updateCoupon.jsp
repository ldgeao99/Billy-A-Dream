<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../common/common.jsp"%>
<%@ include file="top.jsp"%>


	<!-- Main body -->
	<div id="main-body">

		<div id="inner-wrapper">

			<div id="inner-main">
				<div class="card">
					<div class="card-header d-flex align-items-center gap-3">

					</div>
					<div class="card-body p-0" data-simplebar>
						<div class="vstack gap-2">
							<form action="updateCoupon.admin"
								onsubmit="return couponInsertCheck()" method="post">
								<center><h3>쿠폰 수정하기</h3></center>
								<input type="hidden" name="no" value="${coupon.no }">
								<div class="mb-3">
									<label  class="form-label fw-bold"for="couponCd"><br>쿠폰코드</label>
								</div>
								<div class="input-group ">
									<input type="text" class="form-control" id="code" name="code" value="${coupon.code }"
										aria-label="Recipient's username"
										aria-describedby="button-addon2" required="required" readonly="readonly"
										 >
									<button class="btn btn-light" type="button" id="button-addon2"
										onclick="show_uuid()">자동생성</button>
								</div>
								<div class="mb-3">
									<label class="form-label fw-bold" for="couponNm"><br>쿠폰명</label>
								</div>
								<div class="input-group">
									<input class="form-control" type="text" id="name" name="name"
										placeholder="쿠폰명" required="required" value="${coupon.name }">
								</div>

								<div class="mb-3">
									<label class="form-label fw-bold" for="amount"><br>할인값</label>
								</div>
								<div class="input-group">
									<input class="form-control" type="text"
										style="text-align: right" id="amount" name="amount"
										placeholder="할인값(숫자만 입력)"
										onKeyup="this.value=this.value.replace(/[^0-9]/g,'');"
										required="required"  value="${coupon.amount }"> <select class="form-control"
										id="unit" name="unit">
										<option value="">단위 선택</option>
										<option value="won" <c:if test="${coupon.unit eq 'won'}"> selected </c:if>>&#8361;</option>
										<option value="per" selected>%</option>
									</select>
								</div>

								<div class="mb-3">
									<label  class="form-label fw-bold" for="startdate"><br>쿠폰 시작일</label>
								</div>
								<div class="input-group">
									<input class="form-control" type="text" id="startdate"
										name="startdate" autocomplete="off"
										placeholder="쿠폰 종료일(년도, 월, 일 8자리로 입력) ex)20220131"
										onKeyup="this.value=this.value.replace(/[^0-9]/g,'');"
										aria-describedby="button-addon3" required="required"
										maxlength="8" value="${coupon.startdate }">
									<button class="btn btn-light" type="button" id="button-addon3">당일
										시작</button>
								</div>
								<div class="mb-3">
									<label class="form-label fw-bold" for="enddate"><br>쿠폰 종료일</label>
								</div>
								<div class="input-group">
									<input class="form-control" type="text" id="enddate"
										name="enddate"
										placeholder="쿠폰 종료일(년도, 월, 일 8자리로 입력) ex)20220131"
										onKeyup="this.value=this.value.replace(/[^0-9]/g,'');"
										required="required" maxlength="8" value="${coupon.enddate }">
								</div>
								<div class="mb-3">


									<button type="button" class="btn btn-light" onClick="history.back()">취소하기</button>
									<button type="submit" id="btn" class="btn btn-info px-5">수정하기</button>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>


		<!-- /Main body -->

		<!-- Main footer -->
		<div id="main-footer">
			<nav
				class="navbar navbar-expand navbar-light bg-white small shadow-sm">
				<span class="navbar-text">
            2022 &copy; Billy A Dream 빌리어드림 
          </span>
				<ul class="navbar-nav ms-auto">
					<li class="nav-item"><a href="javascript:void(0)"
						class="nav-link">About</a></li>
					<li class="nav-item"><a href="javascript:void(0)"
						class="nav-link">Help</a></li>
				</ul>
			</nav>
		</div>
		<!-- /Main footer -->

	</div>
	<!-- /Main -->

</div>
<!-- /Wrapper -->

<!-- Required JS -->
<script src="resources/admin_asset/vendor/bootstrap/bootstrap.bundle.js"></script>
<script src="resources/admin_asset/vendor/simplebar/simplebar.js"></script>
<script src="resources/admin_asset/js/script.js"></script>

<script src="resources/admin_asset/js/settings.js"></script>

<script src="resources/admin_asset/vendor/autosize/autosize.js"></script>
<script>
    autosize(document.querySelectorAll('textarea.autosize'))

    // Example starter JavaScript for disabling form submissions if there are invalid fields
    void(function() {
      document.querySelectorAll('.needs-validation').forEach(form => {
        form.addEventListener('submit', event => {
          if (!form.checkValidity()) {
            event.preventDefault()
            event.stopPropagation()
          }
			
          form.classList.add('was-validated')
        })
      })
    })()
  </script>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script type="text/javascript">
$(document).on("click", "#button-addon3", function () {
		
	var today = new Date();
	
	 $("#startdate").val(dateFormat(today));
		    
})
$(document).on("click", "#btn", function () {
		
	return couponInsertCheck();
})
function dateFormat(date) {
		var month = date.getMonth() + 1;
		var day = date.getDate();
       

        month = month >= 10 ? month : '0' + month;
        day = day >= 10 ? day : '0' + day;

        return date.getFullYear()  + month +  day ;
}
			

			function show_uuid() {
				alert("쿠폰 코드는 수정할 수 없습니다.");
			}
			
			function couponInsertCheck(){
				var unit=document.getElementById("unit").value; 
				var amount=document.getElementById("amount").value;
				if(unit== "per"){
					if(amount <= 100){
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
</body>

</html>


