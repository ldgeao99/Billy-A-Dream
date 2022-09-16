<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../common/common.jsp"%>
<%@ include file="top.jsp"%>
<!-- Main -->
<div id="main">

	<!-- Main header -->
	<div id="main-header">
		<nav class="navbar navbar-expand navbar-light bg-white gap-4">
			<button type="button" class="btn btn-light d-none d-xl-flex"
				data-toggle="mini-sidebar">
				<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20"
					fill="currentColor" aria-hidden="true">
              <path fill-rule="evenodd"
						d="M3 5a1 1 0 011-1h12a1 1 0 110 2H4a1 1 0 01-1-1zM3 10a1 1 0 011-1h6a1 1 0 110 2H4a1 1 0 01-1-1zM3 15a1 1 0 011-1h12a1 1 0 110 2H4a1 1 0 01-1-1z"
						clip-rule="evenodd" />
            </svg>
			</button>
			<button type="button" class="btn btn-light d-flex d-xl-none me-3"
				data-bs-toggle="offcanvas" data-bs-target="#sidebar"
				aria-controls="sidebar">
				<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20"
					fill="currentColor" aria-hidden="true">
              <path fill-rule="evenodd"
						d="M3 5a1 1 0 011-1h12a1 1 0 110 2H4a1 1 0 01-1-1zM3 10a1 1 0 011-1h12a1 1 0 110 2H4a1 1 0 01-1-1zM3 15a1 1 0 011-1h12a1 1 0 110 2H4a1 1 0 01-1-1z"
						clip-rule="evenodd" />
            </svg>
			</button>
			<ul class="navbar-nav align-items-center ms-auto">
				<li class="nav-item dropdown"><a href="#"
					class="nav-link dropdown-toggle no-caret" role="button"
					data-bs-toggle="dropdown" aria-expanded="false"
					data-bs-auto-close="outside"> <svg
							xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20"
							fill="currentColor" aria-hidden="true">
                  <path fill-rule="evenodd"
								d="M8 4a4 4 0 100 8 4 4 0 000-8zM2 8a6 6 0 1110.89 3.476l4.817 4.817a1 1 0 01-1.414 1.414l-4.816-4.816A6 6 0 012 8z"
								clip-rule="evenodd" />
                </svg>
				</a>
					<div class="dropdown-menu dropdown-menu-end p-3">
						<form>
							<input type="text" class="form-control border-0 shadow-none px-3"
								placeholder="Search..." autofocus>
						</form>
						<div class="dropdown-divider"></div>
						<h6 class="dropdown-header d-flex justify-content-between">
							Recently searched: <a href="javascript:void(0)"
								class="text-muted ms-5">Clear</a>
						</h6>
						<div class="max-h-[300px] overflow-auto">
							<a class="dropdown-item" href="javascript:void(0)">Calendar</a> <a
								class="dropdown-item" href="javascript:void(0)">Chat</a> <a
								class="dropdown-item" href="javascript:void(0)">Email</a> <a
								class="dropdown-item" href="javascript:void(0)">File manager</a>
							<a class="dropdown-item" href="javascript:void(0)">Forum</a> <a
								class="dropdown-item" href="javascript:void(0)">Invoice</a> <a
								class="dropdown-item" href="javascript:void(0)">Photos</a> <a
								class="dropdown-item" href="javascript:void(0)">Pricing</a> <a
								class="dropdown-item" href="javascript:void(0)">Todo</a> <a
								class="dropdown-item" href="javascript:void(0)">Blog</a> <a
								class="dropdown-item" href="javascript:void(0)">Settings</a> <a
								class="dropdown-item" href="javascript:void(0)">Profile</a>
						</div>
					</div></li>
				<li class="nav-item dropdown"><a href="#"
					class="nav-link dropdown-toggle no-caret" role="button"
					data-bs-toggle="dropdown" aria-expanded="false"
					data-bs-auto-close="outside">
						<div class="position-relative">
							<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20"
								fill="currentColor" aria-hidden="true">
                    <path
									d="M10 2a6 6 0 00-6 6v3.586l-.707.707A1 1 0 004 14h12a1 1 0 00.707-1.707L16 11.586V8a6 6 0 00-6-6zM10 18a3 3 0 01-3-3h6a3 3 0 01-3 3z" />
                  </svg>
							<span
								class="badge bg-danger position-absolute top-0 start-100 translate-middle p-1">
								<span class="visually-hidden">unread notifications</span>
							</span>
						</div>
				</a>
					<div class="dropdown-menu dropdown-menu-end">
						<h6 class="dropdown-header d-flex justify-content-between">
							5 New notifications <a href="javascript:void(0)"
								class="text-muted ms-5">Clear</a>
						</h6>
						<div class="dropdown-divider"></div>
						<div class="max-h-[300px] overflow-auto">
							<a class="dropdown-item d-flex align-items-center gap-3 py-2"
								href="javascript:void(0)"> <svg class="text-muted"
									xmlns="http://www.w3.org/2000/svg" fill="none"
									viewBox="0 0 24 24" stroke="currentColor" aria-hidden="true">
                      <path stroke-linecap="round"
										stroke-linejoin="round" stroke-width="2"
										d="M16 7a4 4 0 11-8 0 4 4 0 018 0zM12 14a7 7 0 00-7 7h14a7 7 0 00-7-7z" />
                    </svg>
								<div class="vstack">
									<p class="mb-0">New customer registered</p>
									<small class="text-muted">5 min ago</small>
								</div>
							</a> <a class="dropdown-item d-flex align-items-center gap-3 py-2"
								href="javascript:void(0)"> <svg class="text-muted"
									xmlns="http://www.w3.org/2000/svg" fill="none"
									viewBox="0 0 24 24" stroke="currentColor" aria-hidden="true">
                      <path stroke-linecap="round"
										stroke-linejoin="round" stroke-width="2"
										d="M16 11V7a4 4 0 00-8 0v4M5 9h14l1 12H4L5 9z" />
                    </svg>
								<div class="vstack">
									<p class="mb-0">New order received</p>
									<small class="text-muted">11 min ago</small>
								</div>
							</a> <a class="dropdown-item d-flex align-items-center gap-3 py-2"
								href="javascript:void(0)"> <svg class="text-muted"
									xmlns="http://www.w3.org/2000/svg" fill="none"
									viewBox="0 0 24 24" stroke="currentColor" aria-hidden="true">
                      <path stroke-linecap="round"
										stroke-linejoin="round" stroke-width="2"
										d="M11 4a2 2 0 114 0v1a1 1 0 001 1h3a1 1 0 011 1v3a1 1 0 01-1 1h-1a2 2 0 100 4h1a1 1 0 011 1v3a1 1 0 01-1 1h-3a1 1 0 01-1-1v-1a2 2 0 10-4 0v1a1 1 0 01-1 1H7a1 1 0 01-1-1v-3a1 1 0 00-1-1H4a2 2 0 110-4h1a1 1 0 001-1V7a1 1 0 011-1h3a1 1 0 001-1V4z" />
                    </svg>
								<div class="vstack">
									<p class="mb-0">
										Plugin updates available <span
											class="badge rounded-pill ms-1 bg-secondary align-bottom">3</span>
									</p>
									<small class="text-muted">30 min ago</small>
								</div>
							</a> <a class="dropdown-item d-flex align-items-center gap-3 py-2"
								href="javascript:void(0)"> <svg class="text-muted"
									xmlns="http://www.w3.org/2000/svg" fill="none"
									viewBox="0 0 24 24" stroke="currentColor" aria-hidden="true">
                      <path stroke-linecap="round"
										stroke-linejoin="round" stroke-width="2"
										d="M4 16v1a3 3 0 003 3h10a3 3 0 003-3v-1m-4-4l-4 4m0 0l-4-4m4 4V4" />
                    </svg>
								<div class="vstack">
									<p class="mb-0">Download completed</p>
									<small class="text-muted">35 min ago</small>
								</div>
							</a> <a class="dropdown-item d-flex align-items-center gap-3 py-2"
								href="javascript:void(0)"> <svg class="text-muted"
									xmlns="http://www.w3.org/2000/svg" fill="none"
									viewBox="0 0 24 24" stroke="currentColor" aria-hidden="true">
                      <path stroke-linecap="round"
										stroke-linejoin="round" stroke-width="2"
										d="M9 5H7a2 2 0 00-2 2v12a2 2 0 002 2h10a2 2 0 002-2V7a2 2 0 00-2-2h-2M9 5a2 2 0 002 2h2a2 2 0 002-2M9 5a2 2 0 012-2h2a2 2 0 012 2m-3 7h3m-3 4h3m-6-4h.01M9 16h.01" />
                    </svg>
								<div class="vstack">
									<p class="mb-0">Weekly usage report</p>
									<small class="text-muted">40 min ago</small>
								</div>
							</a>
						</div>
					</div></li>
				<li class="nav-item vr mx-3"></li>
				<li class="nav-item dropdown"><a href="#"
					class="nav-link dropdown-toggle no-caret py-0 pe-0" role="button"
					data-bs-toggle="dropdown" aria-expanded="false"> <img
						src="resources/admin_asset/img/user/user1.svg" width="32"
						alt="User" class="rounded-circle" loading="lazy">
				</a>
					<ul class="dropdown-menu dropdown-menu-end">
						<li><a class="dropdown-item" href="javascript:void(0)">Profile</a></li>
						<li><a class="dropdown-item" href="user-settings.html">Settings</a></li>
						<li>
							<div class="dropdown-divider"></div>
						</li>
						<li><a class="dropdown-item" href="signin.html">Sign out</a></li>
					</ul></li>
			</ul>
		</nav>
	</div>
	<!-- /Main header -->

	<!-- Main body -->
	<div id="main-body">

		<div id="inner-wrapper">

			<div id="inner-main">
				<div class="card">
					<div class="card-header d-flex align-items-center gap-3">

					</div>
					<div class="card-body p-0" data-simplebar>
						<div class="vstack gap-2">
							<form action="insertCoupon.admin"
								onsubmit="return couponInsertCheck()" method="post">
								<div class="mb-3">
									<label  class="form-label fw-bold"for="couponCd"><br>쿠폰코드</label>
								</div>
								<div class="input-group ">
									<input type="text" class="form-control" id="code" name="code"
										placeholder="쿠폰 코드(임의의 문자열 또는 랜덤 생성 문자열)를 입력하세요"
										aria-label="Recipient's username"
										aria-describedby="button-addon2" required="required">
									<button class="btn btn-light" type="button" id="button-addon2"
										onclick="show_uuid()">자동생성</button>
								</div>
								<div class="mb-3">
									<label class="form-label fw-bold" for="couponNm"><br>쿠폰명</label>
								</div>
								<div class="input-group">
									<input class="form-control" type="text" id="name" name="name"
										placeholder="쿠폰명" required="required">
								</div>

								<div class="mb-3">
									<label class="form-label fw-bold" for="amount"><br>할인값</label>
								</div>
								<div class="input-group">
									<input class="form-control" type="text"
										style="text-align: right" id="amount" name="amount"
										placeholder="할인값(숫자만 입력)"
										onKeyup="this.value=this.value.replace(/[^0-9]/g,'');"
										required="required"> <select class="form-control"
										id="unit" name="unit">
										<option value="">단위 선택</option>
										<option value="won">&#8361;</option>
										<option value="per">%</option>
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
										maxlength="8">
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
										required="required" maxlength="8">
								</div>
								<div class="mb-3">


									<button type="reset" class="btn btn-light">취소하기</button>
									<button type="submit" id="btn" class="btn btn-info px-5">추가하기</button>
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
				<span class="navbar-text"> 2021 &copy; Mimity admin </span>
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
			function guid() {
				function s4() {
					
					return ((1 + Math.random()) * 0x10000 | 0).toString(16).substring(1);
				}
				return s4() + s4() + s4() + s4();
			}

			function show_uuid() {
				document.getElementById("code").value = guid();
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


