<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<style>
 #chk2{
 	float: left;
 }
.cb1,
.cb2 {
  height: 20px;
  width: 20px;
  background-color: transparent;
  border: 2px solid #000;
  border-radius: 5px;
  box-sizing: border-box;
  position: relative;
  display: inline-block;
  transition: border-color ease 0.2s;
  cursor: pointer;
}
.cb2 {
  border-radius: 50%;
}
.cb1::before, .cb1::after,
.cb2::before, .cb2::after {
  position: absolute;
  height: 0;
  width: 4px;
  background-color: #34b93d;
  box-sizing: border-box;
  display: inline-block;
  transform-origin: left top;
  border-radius: 5px;
  content: ' ';
  transition: opacity ease 0.5;
}
.cb2::before, .cb2::after {
  background-color: #4285f4;
}
.cb1::before,
.cb2::before {
  top: 14.4px;
  left: 8.2px;
  box-shadow: 0 0 0 1px transparent;
  transform: rotate(-135deg);
}
.cb1::after,
.cb2::after {
  top: 7.4px;
  left: 1px;
  transform: rotate(-45deg);
}
input[id="cbtest1"]:checked + .cb1 {
  border-color: #34b93d;
}
input[id="cbtest2"]:checked + .cb2 {
  border-color: #4285f4;
}
input[id="cbtest1"]:checked + .cb1::after,
input[id="cbtest2"]:checked + .cb2::after {
  height: 10px;
  animation: bottomcheck 0.2s ease 0s forwards;
}
input[id="cbtest1"]:checked + .cb1::before,
input[id="cbtest2"]:checked + .cb2::before {
  height: 24px;
  animation: topcheck 0.4s ease 0s forwards;
}
input[id="cbtest2"] {
	display: none;
}
@keyframes bottomcheck {
  0% {
    height: 0;
  }
  100% {
    height: 10px;
  }
}
@keyframes topcheck {
  0% {
    height: 0;
  }
  50% {
    height: 0;
  }
  100% {
    height: 24px;
  }
}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">
		
		
	
	$(function() {
		$('#cbtest2').click(function() {
			$('#quitbtn').attr("data-bs-target", "#exampleModal");
		})

		$('#quitbtn').click(function() {
			if (!$('#cbtest2').is(':checked')) {
				alert("체크박스를 체크해주세요.");
				return;
			}
		})

		$('#lastquitbtn').click(function() {
			if($('#pw').val()==""){
				$('#pwmsg').html("<font color=red size=2px>비밀번호를 입력해주세요</font>");
				$('#pwmsg').show();
			}
			else{
				$.ajax({
					type : 'post',
					url : "quitPw.mb",
					data : {
						id : $('#id').val(),
						pw : $('#pw').val()
					},
					success : function(data) {
						if($.trim(data)=='yes'){
						$('#pwmsg').html("<br><font color=green size=3px>감사합니다.</font>");
						$('#pwmsg').show();
						location.href="home";
						alert("회원탈퇴 되었습니다. \n지금까지 Billy A Dream을 이용해주셔서 감사합니다.")
						}
						else if($.trim(data)== 'null'){
						$('#pwmsg').html("<br><font color=red size=3px>비밀번호가 맞지 않습니다.</font>");
						$('#pwmsg').show();
						}
					}//success

				});//ajax
			}
		})
	})
</script>
<!doctype html>
<%@include file = "/categoryTop.jsp" %>

            <!--Body Container-->
            <div id="page-content">
                <!--Collection Banner-->
                <div class="collection-header">
                    <div class="collection-hero">
                        <div class="collection-hero__image"></div>
                        <div class="collection-hero__title-wrapper container">
                            <h1 class="collection-hero__title">마이페이지</h1>
                            <div class="breadcrumbs text-uppercase mt-1 mt-lg-2"><a href="home" title="Back to the home page">&nbsp;&nbsp;홈</a><span>|</span><span class="fw-bold">마이페이지</span></div>
                        </div>
                    </div>
                </div>
                <!--End Collection Banner-->

                <!--Container-->
                <div class="container pt-2">
                    <!--Main Content-->
                    <div class="dashboard-upper-info">
                        <div class="row align-items-center g-0">
                            <div class="col-xl-3 col-lg-3 col-sm-6">
                                <div class="d-single-info">
                                    <p class="user-name">Hello <span class="fw-600">optimal</span></p>
                                    <p>(not optimal? <a class="link-underline fw-600" href="login.html">Log Out</a>)</p>
                                </div>
                            </div>
                            <div class="col-xl-4 col-lg-4 col-sm-6">
                                <div class="d-single-info">
                                    <p>Need Assistance? Customer service at.</p>
                                    <p><a href="mailto:admin@example.com">admin@example.com</a></p>
                                </div>
                            </div>
                            <div class="col-xl-3 col-lg-3 col-sm-6">
                                <div class="d-single-info">
                                    <p>E-mail them at </p>
                                    <p><a href="mailto:support@example.com">support@example.com</a></p>
                                </div>
                            </div>
                            <div class="col-xl-2 col-lg-2 col-sm-6">
                                <div class="d-single-info text-lg-center">
                                    <a class="link-underline fw-600 view-cart" href="cart-style1.html"><i class="icon an an-sq-bag me-2"></i>View Cart</a>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="row mb-4 mb-lg-5 pb-lg-5">
                        <div class="col-xl-3 col-lg-2 col-md-12 mb-4 mb-lg-0">
                            <!-- Nav tabs -->
                            <ul class="nav flex-column bg-light h-100 dashboard-list" role="tablist">
                                <li><a class="nav-link active" data-bs-toggle="tab" href="#dashboard">대쉬보드</a></li>
                                <li><a class="nav-link" data-bs-toggle="tab" href="#orders">거래내역</a></li>
                                <li><a class="nav-link" data-bs-toggle="tab" href="#orderstracking">Orders tracking</a></li>
                                <li><a class="nav-link" data-bs-toggle="tab" href="#downloads">Downloads</a></li>
                                <li><a class="nav-link" data-bs-toggle="tab" href="#wishlist">관심목록</a></li>
                                <li><a class="nav-link" data-bs-toggle="tab" href="#account-details">회원정보수정</a></li>
                                <li><a class="nav-link" data-bs-toggle="tab" href="#quit">회원탈퇴</a></li>
                            </ul>
                            <!-- End Nav tabs -->
                        </div>

                        <div class="col-xl-9 col-lg-10 col-md-12">
                            <!-- Tab panes -->
                            <div class="tab-content dashboard-content">
                                <!-- Dashboard -->
                                <div id="dashboard" class="tab-pane fade active show">
                                    <h3>대쉬보드 </h3>
                                    <p>From your account dashboard. you can easily check &amp; view your
                                        <a class="text-decoration-underline" href="#">recent orders</a>, manage your
                                        <a class="text-decoration-underline" href="#">shipping and billing addresses</a> and
                                        <a class="text-decoration-underline" href="#">edit your password and account details.</a>
                                    </p>
                                    <div class="row user-profile mt-4">
                                        <div class="col-12 col-lg-6">
                                            <div class="profile-img">
                                                <div class="img"><img src="resources/assets/images/avatar-img1.jpg" alt="profile" width="65" /></div>
                                                <div class="detail ms-3">
                                                    <h5 class="mb-1">Optimal</h5>
                                                    <p>Balance: <strong>$500</strong></p>
                                                </div>
                                                <div class="lbl">SILVER USER</div>
                                            </div>
                                        </div>
                                        <div class="col-12 col-lg-6">
                                            <ul class="profile-order mt-3 mt-lg-0">
                                                <li>
                                                    <h3 class="mb-1">16</h3>
                                                    All Orders
                                                </li>
                                                <li>
                                                    <h3 class="mb-1">02</h3>
                                                    Awaiting Payments
                                                </li>
                                                <li>
                                                    <h3 class="mb-1">00</h3>
                                                    Awaiting Shipment
                                                </li>
                                                <li>
                                                    <h3 class="mb-1">01</h3>
                                                    Awaiting Delivery
                                                </li>
                                            </ul>
                                        </div>
                                    </div>
                                    <div class="table-responsive order-table mt-4">
                                        <table class="table table-bordered table-hover align-middle text-center mb-0">
                                            <thead class="alt-font">
                                                <tr>
                                                    <th>Order</th>
                                                    <th>Product</th>
                                                    <th>Date</th>
                                                    <th>Status</th>
                                                    <th>Total</th>
                                                    <th>Actions</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <tr>
                                                    <td>1</td>
                                                    <td>Long Sleeve T-shirts</td>
                                                    <td>March 04, 2021</td>
                                                    <td class="text-success">Completed</td>
                                                    <td>$165.00 for 1 item </td>
                                                    <td><a class="link-underline view" href="cart-style1.html">View</a></td>
                                                </tr>
                                                <tr>
                                                    <td>2</td>
                                                    <td>Floral Crop Top</td>
                                                    <td>May 12, 2021</td>
                                                    <td class="text-danger">Processing</td>
                                                    <td>$113.00 for 3 item </td>
                                                    <td><a class="link-underline view" href="cart-style1.html">View</a></td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                                <!-- End Dashboard -->

                                <!-- Orders -->
                                <div id="orders" class="product-order tab-pane fade">
                                    <h3>Orders</h3>
                                    <div class="table-responsive order-table">
                                        <table class="table table-bordered table-hover align-middle text-center mb-0">
                                            <thead class="alt-font">
                                                <tr>
                                                    <th>Order</th>
                                                    <th>Product</th>
                                                    <th>Date</th>
                                                    <th>Status</th>
                                                    <th>Total</th>
                                                    <th>Actions</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <tr>
                                                    <td>1</td>
                                                    <td>Long Sleeve T-shirts</td>
                                                    <td>March 04, 2021</td>
                                                    <td class="text-success">Completed</td>
                                                    <td>$165.00 for 1 item </td>
                                                    <td><a class="link-underline view" href="cart-style1.html">View</a></td>
                                                </tr>
                                                <tr>
                                                    <td>2</td>
                                                    <td>Floral Crop Top</td>
                                                    <td>May 19, 2021</td>
                                                    <td class="text-success">Completed</td>
                                                    <td>$150.00 for 1 item </td>
                                                    <td><a class="link-underline view" href="cart-style1.html">View</a></td>
                                                </tr>
                                                <tr>
                                                    <td>3</td>
                                                    <td>Bodysuit Black</td>
                                                    <td>June 24, 2021</td>
                                                    <td class="text-danger">Processing</td>
                                                    <td>$190.00 for 2 item </td>
                                                    <td><a class="link-underline view" href="cart-style1.html">View</a></td>
                                                </tr>
                                                <tr>
                                                    <td>4</td>
                                                    <td>Hoodie Sweatshirt</td>
                                                    <td>July 28, 2021</td>
                                                    <td class="text-danger">Processing</td>
                                                    <td>$170.00 for 1 item </td>
                                                    <td><a class="link-underline view" href="cart-style1.html">View</a></td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                                <!-- End Orders -->

                                <!-- Orders tracking -->
                                <div id="orderstracking" class="order-tracking tab-pane fade">
                                    <h3>Orders tracking</h3>
                                    <form class="orderstracking-from mt-3" method="post" action="#">
                                        <p class="mb-3">To track your order please enter your OrderID in the box below and press "Track" button. This was given to you on your receipt and in the confirmation email you should have received.</p>
                                        <div class="row align-items-center">
                                            <div class="form-group col-md-5 col-lg-5">
                                                <label for="orderId" class="d-none">Order ID <span class="required-f">*</span></label>
                                                <input name="orderId" placeholder="Order ID" value="" id="orderId" type="text" required>
                                            </div>
                                            <div class="form-group col-md-5 col-lg-5">
                                                <label for="billingEmail" class="d-none">Billing email <span class="required-f">*</span></label>
                                                <input name="billingEmail" placeholder="Billing email" value="" id="billingEmail" type="text" required>
                                            </div>
                                            <div class="form-group col-md-2 col-lg-2">
                                                <button type="submit" class="btn rounded w-100 h-100"><span>Track</span></button>
                                            </div>
                                        </div>
                                    </form>
                                    <div class="row mt-2">
                                        <div class="col-sm-12">
                                            <h3>Status for order no: 000123</h3>
                                            <!-- Status Order -->
                                            <div class="row mt-3">
                                                <div class="col-lg-2 col-md-3 col-sm-4">
                                                    <div class="product-img mb-3 mb-sm-0">
                                                        <img class="blur-up lazyload" data-src="resources/assets/images/products/product-1.jpg" src="resources/assets/images/products/product-1.jpg" alt="product" title="">
                                                    </div>
                                                </div>
                                                <div class="col-lg-6 col-md-9 col-sm-8">
                                                    <div class="tracking-detail d-flex-center">
                                                        <ul>
                                                            <li>
                                                                <div class="left"><span>Order name</span></div>
                                                                <div class="right"><span>Sunset Sleep Scarf Top</span></div>
                                                            </li>
                                                            <li>
                                                                <div class="left"><span>customer number</span></div>
                                                                <div class="right"><span>000123</span></div>
                                                            </li>
                                                            <li>
                                                                <div class="left"><span>order date</span></div>
                                                                <div class="right"><span>14 Nov 2021</span></div>
                                                            </li>
                                                            <li>
                                                                <div class="left"><span>Ship Date</span></div>
                                                                <div class="right"><span>16 Nov 2021</span></div>
                                                            </li>
                                                            <li>
                                                                <div class="left"><span>shipping address</span></div>
                                                                <div class="right"><span>55 Gallaxy Enque, 2568 steet, 23568 NY</span></div>
                                                            </li>
                                                            <li>
                                                                <div class="left"><span>Carrier</span></div>
                                                                <div class="right"><span>Ipsum</span></div>
                                                            </li>
                                                            <li>
                                                                <div class="left"><span>carrier tracking number</span></div>
                                                                <div class="right"><span>000123</span></div>
                                                            </li>
                                                        </ul>
                                                    </div>
                                                </div>
                                                <div class="col-lg-4 col-md-12 col-sm-12 mt-4 mt-lg-0">
                                                    <div class="tracking-map map-section ratio ratio-16x9 h-100">
                                                        <iframe src="https://www.google.com/maps/embed?pb=" allowfullscreen="" height="650"></iframe>                             
                                                    </div>
                                                </div>
                                            </div>
                                            <!-- End Status Order -->
                                            <!-- Tracking Steps -->
                                            <div class="tracking-steps nav mt-5 mb-4 clearfix">
                                                <div class="step done"><span>order placed</span></div>
                                                <div class="step current"><span>preparing to ship</span></div>
                                                <div class="step"><span>shipped</span></div>
                                                <div class="step"><span>delivered</span></div>
                                            </div>
                                            <!-- End Tracking Steps -->
                                            <!-- Order Table -->
                                            <div class="table-responsive order-table">
                                                <table class="table table-bordered table-hover align-middle text-center mb-0">
                                                    <thead class="">
                                                        <tr>
                                                            <th scope="col">Date</th>
                                                            <th scope="col">Time</th>
                                                            <th scope="col">Description</th>
                                                            <th scope="col">Location</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <tr>
                                                            <td>14 Nov 2021</td>
                                                            <td>08.00 AM</td>
                                                            <td>Shipped</td>
                                                            <td>Canada</td>
                                                        </tr>
                                                        <tr>
                                                            <td>15 Nov 2021</td>
                                                            <td>12.00 AM</td>
                                                            <td>Shipping info received</td>
                                                            <td>California</td>
                                                        </tr>
                                                        <tr>
                                                            <td>16 Nov 2021</td>
                                                            <td>10.00 AM</td>
                                                            <td>Origin scan</td>
                                                            <td>Landon</td>
                                                        </tr>
                                                    </tbody>
                                                </table>
                                            </div>
                                            <!-- End Order Table -->
                                        </div>
                                    </div>
                                </div>
                                <!-- End Orders tracking -->

                                <!-- Downloads -->
                                <div id="downloads" class="product-order tab-pane fade">
                                    <h3>Downloads</h3>
                                    <div class="table-responsive order-table">
                                        <table class="table table-bordered table-hover align-middle text-center mb-0">
                                            <thead>
                                                <tr>
                                                    <th>Product</th>
                                                    <th>Downloads remaining</th>
                                                    <th>Expires</th>
                                                    <th>Download</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <tr>
                                                    <td>Long Sleeve T-shirts</td>
                                                    <td>July 22, 2021</td>
                                                    <td>Never</td>
                                                    <td><a class="link-underline view" href="#">Click Here To Download Your File</a></td>
                                                </tr>
                                                <tr>
                                                    <td>Floral Crop Top</td>
                                                    <td>Dec 17, 2021</td>
                                                    <td>Never</td>
                                                    <td><a class="link-underline view" href="#">Click Here To Download Your File</a></td>
                                                </tr>
                                                <tr>
                                                    <td>Bodysuit Black</td>
                                                    <td>June 24, 2021</td>
                                                    <td>Never</td>
                                                    <td><a class="link-underline view" href="#">Click Here To Download Your File</a></td>
                                                </tr>
                                                <tr>
                                                    <td>Hoodie Sweatshirt</td>
                                                    <td>July 28, 2021</td>
                                                    <td>Never</td>
                                                    <td><a class="link-underline view" href="#">Click Here To Download Your File</a></td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                                <!-- End Downloads -->

                                <!-- Address -->
					<div id="quit" class="address tab-pane">
						<h2>회원탈퇴</h2>
						<br>
						<p class="xs-fon-13 margin-10px-bottom">회원탈퇴 전에 반드시 유의사항을 확인하고
							진행해 주세요.</p>
						<br>
						<hr>
						<br> <br>
						<h3>개인정보 및 서비스 이용 기록 삭제</h3>
						<p class="xs-fon-13 margin-10px-bottom">개인정보 및 개인화 서비스 이용기록이
							모두 삭제되며, 삭제된 데이터는 복구되지 않습니다. 필요한 데이터는 미리 백업해 주시기 바랍니다.</p>

						<br> <br>
						<h3>소셜 계정 연결 정보 삭제</h3>
						<p class="xs-fon-13 margin-10px-bottom">탈퇴시 소셜계정 정보 또한 삭제됩니다.</p>

						<br> <br>
						<h3>커뮤니티 서비스 등록 게시물 삭제</h3>
						<p class="xs-fon-13 margin-10px-bottom">회원가입 이후 등록하신 게시물들은
							회원탈퇴 후에는 모든 게시물들이 삭제됩니다. 필요한 데이터는 미리 백업해 주시기 바랍니다.</p>

						<br> <br>
						<h3>개인정보 보관</h3>
						<p class="xs-fon-13 margin-10px-bottom">회원 탈퇴 시 일부 개인정보는
							개인정보처리방침에 따라 탈퇴일로부터 30일간 보관되며, 그 이후 관계법령에 필요한 경우에는 별로 보관합니다.</p>

						<br> <br>
						<h3>탈퇴 후 제한</h3>
						<p class="xs-fon-13 margin-10px-bottom">탈퇴 처리한 아이디는 30일동안 재가입이
							불가합니다.</p>
						<br> <br> <br> <br>
						<div align="center">
							<h3>
								<label for="cbtest2">모든 약관을 확인하셨으면 클릭해주세요.</label>
							</h3>
							<input type="checkbox" id="cbtest2"> <label for="cbtest2"
								class="cb2"></label>
							<br><br><br>

							<!-- 회원탈퇴 확인 -->
							<button type="button" class="btn btn-primary"
								data-bs-toggle="modal" 
								style="border-radius: 5px;" id ="quitbtn">회원탈퇴</button>

							<!-- Modal -->
							<div id="s">
							<div class="modal fade" id="exampleModal" tabindex="-1"
								aria-labelledby="exampleModalLabel" aria-hidden="true">
								<div class="modal-dialog modal-dialog-centered">
									<div class="modal-content">
										<div class="modal-header">
											<h5 class="modal-title" id="exampleModalLabel">회원탈퇴 확인</h5>
											<button type="button" class="btn-close"
												data-bs-dismiss="modal" aria-label="Close"></button>
										</div>
										<div class="modal-body">
											계정을 영구적으로 삭제하기 전에 먼저 비밀번호를 입력해주세요.<br><br>
											<input type="hidden" value="<%=id %>" name="id" id="id"><br>
											<input type="password" value="" name="pw" id="pw"><br>
											<span id="pwmsg"></span>
										</div>
										<div class="modal-footer">
											<button type="button" class="btn btn-primary" id="lastquitbtn">회원탈퇴</button>
										</div>
									</div>
								</div>
							</div>
							</div>
						</div>
					</div>



					<!-- End 회원탈퇴 -->

					<!-- 회원정보 수정 -->
                                <div id="account-details" class="tab-pane fade">
                                    <h3>회원정보 수정 </h3>
                                    <div class="account-login-form bg-light-gray padding-20px-all">
                                        <form>
                                            <fieldset>
                                                <p>Already have an account? <a href="login.html" class="link-underline"> Log in instead!</a></p>
                                                <div class="row">
                                                    <div class="form-group">
                                                        <div class="d-flex mt-3 col-md-12 col-lg-12 col-xl-12">
                                                            <label class="control-label me-3 mb-0"><strong>Title</strong></label>
                                                            <div class="customRadio clearfix me-3 mb-0">
                                                                <input name="mr" id="mr" value="1" checked="checked" type="radio" class="padding-10px-right">
                                                                <label for="mr" class="mb-0">Mr. &nbsp;</label>
                                                            </div>
                                                            <div class="customRadio clearfix me-3 mb-0">
                                                                <input name="mr" id="mrs" value="0" type="radio" class="padding-10px-right">
                                                                <label for="mrs" class="mb-0">Mrs.</label>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div class="form-group col-md-6 col-lg-6 col-xl-6">
                                                        <label for="input-firstname" class="d-none">First Name <span class="required-f">*</span></label>
                                                        <input name="firstname" placeholder="First Name" value="" id="input-firstname" class="form-control" type="text">
                                                    </div>
                                                    <div class="form-group col-md-6 col-lg-6 col-xl-6">
                                                        <label for="input-lastname" class="d-none">Last Name <span class="required-f">*</span></label>
                                                        <input name="lastname" placeholder="Last Name" value="" id="input-lastname" class="form-control" type="text">
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div class="form-group col-md-6 col-lg-6 col-xl-6">
                                                        <label for="input-email" class="d-none">Email <span class="required-f">*</span></label>
                                                        <input name="email" placeholder="Email" value="" id="input-email" class="form-control" type="email" required>
                                                    </div>
                                                    <div class="form-group col-md-6 col-lg-6 col-xl-6">
                                                        <label for="input-password" class="d-none">Password <span class="required-f">*</span></label>
                                                        <input name="password" placeholder="Password" value="" id="input-password" class="form-control" type="password">
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div class="form-group col-md-6 col-lg-6 col-xl-6">
                                                        <label for="input-telephone" class="d-none">Telephone <span class="required-f">*</span></label>
                                                        <input name="telephone" placeholder="Telephone" value="" id="input-telephone" class="form-control" type="tel">
                                                    </div>
                                                    <div class="form-group col-md-6 col-lg-6 col-xl-6">
                                                        <label class="d-none">Birthdate <span class="required-f">*</span></label>
                                                        <input name="birthdate" class="form-control" type="date">
                                                    </div>
                                                </div>
                                                <div class="row mb-4">
                                                    <div class="col-md-12 col-lg-12 col-xl-12">
                                                        <div class="customCheckbox clearfix mb-2">
                                                            <input id="offers" name="offers" type="checkbox" />
                                                            <label for="offers">Receive offers from our partners</label>
                                                        </div>
                                                        <div class="customCheckbox clearfix">
                                                            <input id="newsletter" name="newsletter" type="checkbox" />
                                                            <label for="newsletter">Sign up for our newsletter</label>
                                                        </div>
                                                    </div>
                                                </div>
                                            </fieldset>
                                            <button type="submit" class="btn btn-primary rounded">Save</button>
                                        </form>
                                    </div>
                                </div>
                                <!-- End Account Details -->

                                <!-- Wishlist -->
                                <div id="wishlist" class="product-wishlist tab-pane fade">
                                    <h3>My Wishlist</h3>
                                    <!-- Grid Product -->
                                    <div class="grid-products grid--view-items wishlist-grid mt-4">
                                        <div class="row">
                                            <div class="col-6 col-sm-6 col-md-3 col-lg-3 item position-relative">
                                                <button type="button" class="btn remove-icon close-btn" data-bs-toggle="tooltip" data-bs-placement="top" title="Remove"><i class="icon an an-times-r"></i></button>
                                                <!-- Product Image -->
                                                <div class="product-image">
                                                    <!-- Product Image -->
                                                    <a href="product-layout1.html" class="product-img">
                                                        <!-- image -->
                                                        <img class="primary blur-up lazyload" data-src="resources/assets/images/products/product-1.jpg" src="resources/assets/images/products/product-1.jpg" alt="product" title="product" />
                                                        <!-- End image -->
                                                        <!-- Hover image -->
                                                        <img class="hover blur-up lazyload" data-src="resources/assets/images/products/product-1-1.jpg" src="resources/assets/images/products/product-1-1.jpg" alt="product" title="product" />
                                                        <!-- End hover image -->
                                                        <!-- product label -->
                                                        <div class="product-labels rectangular"><span class="lbl pr-label3">Low in stock</span></div>
                                                        <!-- End product label -->
                                                    </a>
                                                    <!-- End Product Image -->
                                                </div>
                                                <!-- End Product Image -->

                                                <!-- Product Details -->
                                                <div class="product-details text-center">
                                                    <!-- Product Name -->
                                                    <div class="product-name">
                                                        <a href="product-layout1.html">Martha Knit Top</a>
                                                    </div>
                                                    <!-- End Product Name -->
                                                    <!-- Product Price -->
                                                    <div class="product-price">
                                                        <span class="old-price">$199.00</span>
                                                        <span class="price">$150.00</span>
                                                    </div>
                                                    <!-- End Product Price -->
                                                    <!-- Product Review -->
                                                    <div class="product-review d-flex align-items-center justify-content-center">
                                                        <i class="an an-star"></i><i class="an an-star"></i><i class="an an-star"></i><i class="an an-star"></i> <i class="an an-star-o"></i>
                                                        <span class="caption hidden ms-2">9 reviews</span>
                                                    </div>
                                                    <!-- End Product Review -->
                                                    <!-- Product Button -->
                                                    <form method="post" action="/cart/add" class="cart-form mt-3" enctype="multipart/form-data">
                                                        <a href="cart-style1.html" class="btn btn--small rounded product-form__cart-submit"><span>Add to cart</span></a>
                                                    </form>
                                                    <!-- End Product Button -->
                                                </div>
                                                <!-- End Product Details -->
                                            </div>
                                            <div class="col-6 col-sm-6 col-md-3 col-lg-3 item position-relative">
                                                <button type="button" class="btn remove-icon close-btn" data-bs-toggle="tooltip" data-bs-placement="top" title="Remove"><i class="icon an an-times-r"></i></button>
                                                <!-- Product Image -->
                                                <div class="product-image">
                                                    <!-- Product Image -->
                                                    <a href="product-layout1.html" class="product-img">
                                                        <!-- image -->
                                                        <img class="primary blur-up lazyload" data-src="resources/assets/images/products/product-1.jpg" src="resources/assets/images/products/product-1.jpg" alt="product" title="product" />
                                                        <!-- End image -->
                                                        <!-- Hover image -->
                                                        <img class="hover blur-up lazyload" data-src="resources/assets/images/products/product-1-1.jpg" src="resources/assets/images/products/product-1-1.jpg" alt="product" title="product" />
                                                        <!-- End hover image -->
                                                        <!-- Product Label -->
                                                        <div class="product-labels rectangular"><span class="lbl pr-label2">New</span></div>
                                                        <!-- End Product Label -->
                                                    </a>
                                                    <!-- End Product Image -->
                                                </div>
                                                <!-- End Product Image -->
                                                <!-- Product Details -->
                                                <div class="product-details text-center">
                                                    <!-- Product Name -->
                                                    <div class="product-name">
                                                        <a href="product-layout1.html">Long Sleeve T-shirts</a>
                                                    </div>
                                                    <!-- End Product Name -->
                                                    <!-- Product Price -->
                                                    <div class="product-price">
                                                        <span class="price">$199.00</span>
                                                    </div>
                                                    <!-- End Product Price -->
                                                    <!-- Product Review -->
                                                    <div class="product-review d-flex align-items-center justify-content-center">
                                                        <i class="an an-star"></i><i class="an an-star"></i><i class="an an-star"></i><i class="an an-star"></i><i class="an an-star"></i>
                                                        <span class="caption hidden ms-2">20 reviews</span>
                                                    </div>
                                                    <!-- End Product Review -->
                                                    <!-- Product Button -->
                                                    <form method="post" action="/cart/add" class="cart-form mt-3" enctype="multipart/form-data">
                                                        <a href="cart-style1.html" class="btn btn--small rounded product-form__cart-submit"><span>Add to cart</span></a>
                                                    </form>
                                                    <!-- End Product Button -->
                                                </div>
                                                <!-- End Product Details -->
                                            </div>
                                            <div class="col-6 col-sm-6 col-md-3 col-lg-3 item position-relative">
                                                <button type="button" class="btn remove-icon close-btn" data-bs-toggle="tooltip" data-bs-placement="top" title="Remove"><i class="icon an an-times-r"></i></button>
                                                <!-- Product Image -->
                                                <div class="product-image">
                                                    <!-- Product Image -->
                                                    <a href="product-layout1.html" class="product-img">
                                                        <!-- image -->
                                                        <img class="primary blur-up lazyload" data-src="resources/assets/images/products/product-1.jpg" src="resources/assets/images/products/product-1.jpg" alt="product" title="product" />
                                                        <!-- End image -->
                                                        <!-- Hover image -->
                                                        <img class="hover blur-up lazyload" data-src="resources/assets/images/products/product-1-1.jpg" src="resources/assets/images/products/product-1-1.jpg" alt="product" title="product" />
                                                        <!-- End hover image -->
                                                        <!-- Product Label -->
                                                        <div class="product-labels rectangular"><span class="lbl on-sale">Out of stock</span></div>
                                                        <!-- End Product Label -->
                                                    </a>
                                                    <!-- End Product Image -->
                                                </div>
                                                <!-- End Product Image -->
                                                <!-- Product Details -->
                                                <div class="product-details text-center">
                                                    <!-- Product Name -->
                                                    <div class="product-name">
                                                        <a href="product-layout1.html">Stand Collar Slim Shirt</a>
                                                    </div>
                                                    <!-- End Product Name -->
                                                    <!-- Product Price -->
                                                    <div class="product-price">
                                                        <span class="price">$399.00</span>
                                                    </div>
                                                    <!-- End Product Price -->
                                                    <!-- Product Review -->
                                                    <div class="product-review d-flex align-items-center justify-content-center">
                                                        <i class="an an-star"></i><i class="an an-star"></i><i class="an an-star-o"></i><i class="an an-star-o"></i><i class="an an-star-o"></i>
                                                        <span class="caption hidden ms-2">19 reviews</span>
                                                    </div>
                                                    <!-- End Product Review -->
                                                    <!-- Product Button -->
                                                    <form method="post" action="/cart/add" class="cart-form mt-3" enctype="multipart/form-data">
                                                        <a href="cart-style1.html" class="btn btn--small rounded product-form__cart-submit soldOutBtn disabled"><span>Out Of stock</span></a>
                                                    </form>
                                                    <!-- End Product Button -->
                                                </div>
                                                <!-- End Product Details -->
                                            </div>
                                            <div class="col-6 col-sm-6 col-md-3 col-lg-3 item position-relative">
                                                <button type="button" class="btn remove-icon close-btn" data-bs-toggle="tooltip" data-bs-placement="top" title="Remove"><i class="icon an an-times-r"></i></button>
                                                <!-- Product Image -->
                                                <div class="product-image">
                                                    <!-- Product Image -->
                                                    <a href="product-layout1.html" class="product-img">
                                                        <!-- image -->
                                                        <img class="primary blur-up lazyload" data-src="resources/assets/images/products/product-1.jpg" src="resources/assets/images/products/product-1.jpg" alt="product" title="product" />
                                                        <!-- End image -->
                                                        <!-- Hover image -->
                                                        <img class="hover blur-up lazyload" data-src="resources/assets/images/products/product-1-1.jpg" src="resources/assets/images/products/product-1-1.jpg" alt="product" title="product" />
                                                        <!-- End hover image -->
                                                        <!-- Product Label -->
                                                        <div class="product-labels"><span class="lbl pr-label1">Sale</span></div>
                                                        <!-- End Product Label -->
                                                    </a>
                                                    <!-- End Product Image -->
                                                </div>
                                                <!-- End Product Image -->

                                                <!-- Product Details -->
                                                <div class="product-details text-center">
                                                    <!-- Product Name -->
                                                    <div class="product-name">
                                                        <a href="product-layout1.html">Backpack With Contrast</a>
                                                    </div>
                                                    <!-- End Product Name -->
                                                    <!-- Product Price -->
                                                    <div class="product-price">
                                                        <span class="old-price">$99.00</span>
                                                        <span class="price">$88.00</span>
                                                    </div>
                                                    <!-- End Product Price -->
                                                    <!-- Product Review -->
                                                    <div class="product-review d-flex align-items-center justify-content-center">
                                                        <i class="an an-star"></i><i class="an an-star"></i><i class="an an-star"></i><i class="an an-star"></i><i class="an an-star-o"></i>
                                                        <span class="caption hidden ms-2">2 reviews</span>
                                                    </div>
                                                    <!-- End Product Review -->
                                                    <!-- Product Button -->
                                                    <form method="post" action="/cart/add" class="cart-form mt-3" enctype="multipart/form-data">
                                                        <a href="cart-style1.html" class="btn btn--small rounded product-form__cart-submit"><span>Add to cart</span></a>
                                                    </form>
                                                    <!-- End Product Button -->
                                                </div>
                                                <!-- End Product Details -->
                                            </div>
                                        </div>
                                    </div>
                                    <!-- End Grid Product-->
                                </div>
                                <!-- End Wishlist -->
                            </div>
                            <!-- End Tab panes -->
                        </div>
                    </div>
                    <!--End Main Content-->
                </div>
                <!--End Container-->
            </div>
            <!--End Body Container-->

            <!--Footer-->
            <div class="footer footer-1">
                <div class="footer-top clearfix">
                    <div class="container">
                        <div class="row">
                            <div class="col-12 col-sm-12 col-md-12 col-lg-12 text-center about-col mb-4">
                                <img src="resources/assets/images/footer-logo.png" alt="Optimal" class="mb-3"/>
                                <p>55 Gallaxy Enque, 2568 steet, 23568 NY</p>
                                <p class="mb-0 mb-md-3">Phone: <a href="tel:+011234567890">(+01) 123 456 7890</a> <span class="mx-1">|</span> Email: <a href="mailto:info@example.com">info@example.com</a></p>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-12 col-sm-12 col-md-4 col-lg-3 footer-links">
                                <h4 class="h4">Informations</h4>
                                <ul>
                                    <li><a href="my-account.html">My Account</a></li>
                                    <li><a href="aboutus-style1.html">About us</a></li>
                                    <li><a href="login.html">Login</a></li>
                                    <li><a href="privacy-policy.html">Privacy policy</a></li>
                                    <li><a href="#">Terms &amp; condition</a></li>
                                </ul>
                            </div>
                            <div class="col-12 col-sm-12 col-md-4 col-lg-2 footer-links">
                                <h4 class="h4">Quick Shop</h4>
                                <ul>
                                    <li><a href="#">Women</a></li>
                                    <li><a href="#">Men</a></li>
                                    <li><a href="#">Kids</a></li>
                                    <li><a href="#">Sportswear</a></li>
                                    <li><a href="#">Sale</a></li>
                                </ul>
                            </div>
                            <div class="col-12 col-sm-12 col-md-4 col-lg-3 footer-links">
                                <h4 class="h4">Customer Services</h4>
                                <ul>
                                    <li><a href="#">Request Personal Data</a></li>
                                    <li><a href="faqs-style1.html">FAQ's</a></li>
                                    <li><a href="contact-style1.html">Contact Us</a></li>
                                    <li><a href="#">Orders and Returns</a></li>
                                    <li><a href="#">Support Center</a></li>
                                </ul>
                            </div>
                            <div class="col-12 col-sm-12 col-md-12 col-lg-4 newsletter-col">
                                <div class="display-table pt-md-3 pt-lg-0">
                                    <div class="display-table-cell footer-newsletter">
                                        <form action="#" method="post">
                                            <label class="h4">NEWSLETTER SIGN UP</label>
                                            <p>Enter Your Email To Receive Daily News And Get 20% Off Coupon For All Items.</p>
                                            <div class="input-group">
                                                <input type="email" class="brounded-start input-group__field newsletter-input mb-0" name="EMAIL" value="" placeholder="Email address" required>
                                                <span class="input-group__btn">
                                                    <button type="submit" class="btn newsletter__submit rounded-end" name="commit" id="Subscribe"><i class="an an-envelope-l"></i></button>
                                                </span>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                                <ul class="list-inline social-icons mt-3 pt-1">
                                    <li class="list-inline-item"><a href="#" data-bs-toggle="tooltip" data-bs-placement="top" title="Facebook"><i class="an an-facebook" aria-hidden="true"></i></a></li>
                                    <li class="list-inline-item"><a href="#" data-bs-toggle="tooltip" data-bs-placement="top" title="Twitter"><i class="an an-twitter" aria-hidden="true"></i></a></li>
                                    <li class="list-inline-item"><a href="#" data-bs-toggle="tooltip" data-bs-placement="top" title="Pinterest"><i class="an an-pinterest-p" aria-hidden="true"></i></a></li>
                                    <li class="list-inline-item"><a href="#" data-bs-toggle="tooltip" data-bs-placement="top" title="Instagram"><i class="an an-instagram" aria-hidden="true"></i></a></li>
                                    <li class="list-inline-item"><a href="#" data-bs-toggle="tooltip" data-bs-placement="top" title="TikTok"><i class="an an-tiktok" aria-hidden="true"></i></a></li>
                                    <li class="list-inline-item"><a href="#" data-bs-toggle="tooltip" data-bs-placement="top" title="Whatsapp"><i class="an an-whatsapp" aria-hidden="true"></i></a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="footer-bottom clearfix">
                    <div class="container">
                        <div class="d-flex-center flex-column justify-content-md-between flex-md-row-reverse">
                            <img src="resources/assets/images/payment.png" alt="Paypal Visa Payments"/>
                            <div class="copytext text-uppercase">&copy; 2022 Optimal. All Rights Reserved.</div>
                        </div>
                    </div>
                </div>
            </div>
            <!--End Footer-->

            <!--Scoll Top-->
            <span id="site-scroll"><i class="icon an an-chevron-up"></i></span>
            <!--End Scoll Top-->

            <!--MiniCart Drawer-->
            <div class="minicart-right-drawer modal right fade" id="minicart-drawer">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div id="cart-drawer" class="block block-cart">
                            <div class="minicart-header">
                                <a href="javascript:void(0);" class="close-cart" data-bs-dismiss="modal" aria-label="Close"><i class="an an-times-r" aria-hidden="true" data-bs-toggle="tooltip" data-bs-placement="left" title="Close"></i></a>
                                <h4 class="fs-6">Your cart (2 Items)</h4>
                            </div>
                            <div class="minicart-content">
                                <ul class="clearfix">
                                    <li class="item d-flex justify-content-center align-items-center">
                                        <a class="product-image" href="product-layout1.html">
                                            <img class="blur-up lazyload" src="resources/assets/images/products/cart-product-img1.jpg" data-src="resources/assets/images/products/cart-product-img1.jpg" alt="image" title="">
                                        </a>
                                        <div class="product-details">
                                            <a class="product-title" href="product-layout1.html">Floral Crop Top</a>
                                            <div class="variant-cart">Black / XL</div>
                                            <div class="priceRow">
                                                <div class="product-price">
                                                    <span class="money">$59.00</span>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="qtyDetail text-center">
                                            <div class="wrapQtyBtn">
                                                <div class="qtyField">
                                                    <a class="qtyBtn minus" href="javascript:void(0);"><i class="icon an an-minus-r" aria-hidden="true"></i></a>
                                                    <input type="text" name="quantity" value="1" class="qty">
                                                    <a class="qtyBtn plus" href="javascript:void(0);"><i class="icon an an-plus-l" aria-hidden="true"></i></a>
                                                </div>
                                            </div>
                                            <a href="#" class="edit-i remove"><i class="icon an an-edit-l" data-bs-toggle="tooltip" data-bs-placement="top" title="Edit"></i></a>
                                            <a href="#" class="remove"><i class="an an-times-r" data-bs-toggle="tooltip" data-bs-placement="top" title="Remove"></i></a>
                                        </div>
                                    </li>
                                    <li class="item d-flex justify-content-center align-items-center">
                                        <a class="product-image" href="product-layout1.html">
                                            <img class="blur-up lazyload" src="resources/assets/images/products/cart-product-img1.jpg" data-src="resources/assets/images/products/cart-product-img1.jpg" alt="image" title="">
                                        </a>
                                        <div class="product-details">
                                            <a class="product-title" href="product-layout1.html">V Neck T-shirts</a>
                                            <div class="variant-cart">Blue / XL</div>
                                            <div class="priceRow">
                                                <div class="product-price">
                                                    <span class="money">$199.00</span>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="qtyDetail text-center">
                                            <div class="wrapQtyBtn">
                                                <div class="qtyField">
                                                    <a class="qtyBtn minus" href="javascript:void(0);"><i class="icon an an-minus-r" aria-hidden="true"></i></a>
                                                    <input type="text" name="quantity" value="1" class="qty">
                                                    <a class="qtyBtn plus" href="javascript:void(0);"><i class="icon an an-plus-l" aria-hidden="true"></i></a>
                                                </div>
                                            </div>
                                            <a href="#" class="edit-i remove"><i class="icon an an-edit-l" data-bs-toggle="tooltip" data-bs-placement="top" title="Edit"></i></a>
                                            <a href="#" class="remove"><i class="an an-times-r" data-bs-toggle="tooltip" data-bs-placement="top" title="Remove"></i></a>
                                        </div>
                                    </li>
                                </ul>
                            </div>
                            <div class="minicart-bottom">
                                <div class="shipinfo text-center mb-3 text-uppercase">
                                    <p class="freeShipMsg"><i class="an an-truck fs-5 me-2 align-middle"></i>SPENT <b>$199.00</b> MORE FOR FREE SHIPPING</p>
                                </div>
                                <div class="subtotal">
                                    <span>Total:</span>
                                    <span class="product-price">$93.13</span>
                                </div>
                                <a href="checkout-style1.html" class="w-100 p-2 my-2 btn btn-outline-primary proceed-to-checkout rounded">Proceed to Checkout</a>
                                <a href="cart-style1.html" class="w-100 btn-primary cart-btn rounded">View Cart</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!--End MiniCart Drawer-->
            <div class="modalOverly"></div>


            <!-- Including Jquery -->
            <script src="resources/assets/js/vendor/jquery-min.js"></script>
            <script src="resources/assets/js/vendor/js.cookie.js"></script>
            <!--Including Javascript-->
            <script src="resources/assets/js/plugins.js"></script>
            <script src="resources/assets/js/main.js"></script>

        </div>
        <div id ="d">
        <!--End Page Wrapper-->
        
        
        </div>
    </body>
</html>