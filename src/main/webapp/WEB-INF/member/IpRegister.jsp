<%@page import="java.net.Inet4Address"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>

<style>
	tr{
		height: 30px;
	}
	#hp ,#AuthNum{
		width: 300px;
	}
</style>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">
var patternPhone = /(01[016789])([1-9]{1}[0-9]{2,3})([0-9]{4})$/;
	
	var hpcheck = false;
	var AuthClick = false;
	var confirm = false;
	var exist = false; // 존재하는 아이디인가?
	
			
			
$(function(){
	$('#hp').keydown(function(){
		$('#hpmsg').hide();
		hpcheck = false;
		AuthClick = false;
		confirm = false;
		exist = false; // 존재하는 아이디인가?
		
	});
})



function hpCheck(){
		
		if($('#hp').val()==""){
			$('#hpmsg').html("<font color=red size=2px>  전화번호를 입력하세요</font>");
			$('#hpmsg').show();
			return;
		}
		
		else if(!patternPhone.test($('#hp').val())){       
			$('#hpmsg').html("<font color=red size=2px>올바르지 않은 형식의 전화번호입니다</font>");
			$('#hpmsg').show();
			return;      
		}
		else if(!exist){
			$.ajax({
				type : 'post',
				url : "findid.mb",
				data : {
					name : $('#name').val(),
					hp : $('#hp').val()
				},
					success : function(data){ 
						if($.trim(data)!="null"){
							$('#hpmsg').hide();
							exist=true;
							existsms(); // exist 함수호출
						}
						else{
							exist=false;
							AuthClick = false;
							$('#hpmsg').html("<font color=red size=2px>가입된 아이디와 번호가 일치하지 않습니다</font>");
							$('#hpmsg').show();
							$('#AuthNum').hide();
							$('#ahthNumCheck').hide();
						}//else
					}//success

			});//ajax
		}
		else{
			existsms();
		}
		
	}
function existsms(){ // 해당 아이디의 번호와 입력한 번호가 일치하면 실행되게해라
	hpcheck = true;
	$('#AuthNum').show();
	$('#ahthNumCheck').show();
	
	$.ajax({
		type:'get',
		url : "sendSMS.mb", 
		data : {  // 보낼 데이터
			PhoneNumber : $('#hp').val() 
				},
			success : function(data){ 
				if($.trim(data)=="yes"){
					AuthClick = true;
					$('#hpmsg').hide();
				}
				else{
					AuthClick = false;
					alert("인증번호를 보내지 못하였습니다.");
				}//else
			}//success

	});//ajax
}
	
function Check(){ // 등록하기.
	
	if($('#hp').val()==""){
		$('#hpmsg').html("<font color=red size=2px>  전화번호를 입력하세요</font>");
		$('#hpmsg').show();
		return;
	}
	
	else if(!patternPhone.test($('#hp').val())){       
		$('#hpmsg').html("<font color=red size=2px>올바르지 않은 형식의 전화번호입니다</font>");
		$('#hpmsg').show();
		return;      
	}
	else if(!hpcheck){
		$('#hpmsg').html("<font color=red size=2px>휴대전화 인증을 해주십시오</font>");
		$('#hpmsg').show();
		return;
	}
	else if(!AuthClick){
		$('#AuthNummsg').html("<font color=red size=2px>인증을 해주십시오</font>");
		$('#AuthNummsg').show();
		return;
	}
	else if(!confirm){
		$('#AuthNummsg').html("<font color=red size=2px>인증을 해주십시오</font>");
		$('#AuthNummsg').show();
		return;
	}
	else if(!exist){
		$('#AuthNummsg').html("<font color=red size=2px>존재하지 않는 번호입니다.</font>");
		$('#AuthNummsg').show();
		return;
	}
	else{
		f.submit();
	}
}
function authNumCheck (){
	
	if($('#AuthNum').val()==""){
		$('#AuthNummsg').html("<font color=red size=2px>인증번호를 입력해주세요</font>");
		$('#AuthNummsg').show();
		return;
	}
	else{
		$.ajax({
			type:'post',
			url : "sendSMS.mb", 
			data : {  
				authNum : $('#AuthNum').val() 
					},
				success : function(data){ 
					if($.trim(data)=="yes"){
						confirm =true;
						$('#AuthNummsg').html("<font color=green size=2px>인증되었습니다</font>");
						$('#AuthNummsg').show();
					}
					else{
						confirm = false;
						$('#AuthNum').focus();
						$('#AuthNummsg').html("<font color=red size=2px>인증번호가 틀립니다</font>");
						$('#AuthNummsg').show();
					}//else
				}//success

		});//ajax
	}
	
}
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
                            <h1 class="collection-hero__title">로그인 등록</h1>
                            <div class="breadcrumbs text-uppercase mt-1 mt-lg-2"><a href="home" title="Back to the home page">홈</a><span>|</span><span class="fw-bold">로그인 정보</span></div>
                        </div>
                    </div>
                </div>
			<!--End Collection Banner-->
			
			<c:set var="now" value="<%=new java.util.Date()%>"></c:set>

			<!--Container-->
			<div class="container">
                    <!--Main Content-->
                    <div class="row">
                        <div class="box col-12 col-sm-12 col-md-8 col-lg-6 offset-md-2 offset-lg-3">
                             <form method="post" action="Insertip.mb" accept-charset="UTF-8" class="customer-form mt-2 mt-lg-5" name="f">	
                                <h3 class="h4 text-uppercase mb-2">로그인 정보</h3>
                                <hr>
                                <table>
                                	<tr>
                                		<td>시간</td>
                                		<td> 
                                			<fmt:formatDate value="${now }" type="both" dateStyle="medium" timeStyle="medium" />
                                		</td>
                                	</tr>
                                	<tr>
                                		<td>위치</td>
                                		<td><%=Inet4Address.getLocalHost().getHostAddress() %></td>
                                	</tr>
                                </table>
                                <hr>
                                <p>${name }님, 회원님이 로그인 하셨나요? <br>로그인 하지 않았다면 
                                지금 바로 " <a href="login.mb">뒤로가기</a>" 를 눌러주세요
                                
                                <br><br><br><br>등록되지 않은 기기입니다<br>로그인을 원하시면 휴대전화 인증을 해주십시오</p>
                                <div class="row">
                                    <div class="col-12 col-sm-12 col-md-12 col-lg-12">
                                        <div class="form-group">
                                            <input type="hidden" name="id"id="id" value="${param.id }" />
                                            <input type="hidden" name="name"id="name" value="${name }" />
                                            <input type="text" name="hp" placeholder="전화번호" id="hp" />
                                            <input type="button" class="btn rounded me-auto" value="인증번호 받기" id = "getAuthNum" onclick="hpCheck()" style=" width:140px ;">
                                          	<br>
                                            <span style="display: none" id="hpmsg"></span><br>
                                            <input type="text" name="AuthNum" id="AuthNum" placeholder="인증번호" style="display: none;">
                                            <input type="button" class="btn rounded me-auto" value="인증하기" onclick="authNumCheck()" id = "ahthNumCheck" style="display: none; width:140px ;"><br>
                                            <span style="display: none" id="AuthNummsg"></span><br>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="text-left col-12 col-sm-12 col-md-12 col-lg-12">
                                        <p class="d-flex-center">
                                            <input type="button" class="btn rounded me-auto" value="  등록하기  " onclick="Check()" >
                                            <a href="login.mb"><i class="align-middle icon an an-an-double-left me-2"></i>뒤로가기</a>
                                        </p>
                                    </div>
                                </div>
                            </form>
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
        <!--End Page Wrapper-->
    </body>
</html>