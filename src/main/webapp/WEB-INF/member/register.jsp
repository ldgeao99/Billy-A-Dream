<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<style>
.small {
	width: 300px;
}
.lefttd{
	width: 120px;
	font-size: 13px;
	font-weight: bold;
}
tr{
	height: 30px;
}
.bt{
	width : 120px;
	border-radius : 5px;
	background-color: #F7F7F7;
	color: black;
}
.bts{
	width : 140px;
	border-radius : 5px;
	background-color: #F0F0F0;
	color: black;
}

  
</style>

<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js?autoload=false"></script>
<script src="https://code.jquery.com/jquery-latest.min.js"></script>
<script>
   		
   		var phClick=false; // 폰 인증받기 클릭
   		var mailClick=false; // 이메일 인증받기 클릭
   		var phCheck = false; // 폰확인
   		var mailCheck = false; // 이메일 확인
   		var isCheck = false;
   		var repw = false;
   		
   		$(function(){
   			$('#id').keydown(function(){
   				$('#idmsg').hide();
   				isCheck=false;
   			})
   			$('#hp').keydown(function(){
   				phClick=false;
   			})
   			$('#email').keydown(function(){
   				mailClick=false;
   			})
   			
   			$('#repw').keyup(function(){
				
   				if($('#repw').val()==""){
   				$('#repwmsg').html("<font color=red size=2px>비밀번호를 입력해주세요</font>");
   				}
   				else if($('#pw').val()!=$('#repw').val()){
   				$('#repwmsg').html("<font color=red size=2px>비밀번호가 같지 않습니다</font>");
				$('#repwmsg').show();
   				}
   				else if($('#pw').val()==$('#repw').val()){
   				repw= true;
   				$('#repwmsg').html("<font color=green size=2px>비밀번호가 일치합니다</font>");
   				}
   			})
   			
   			$('#id').keydown(function(){
   				$('#idm').hide();
   			})
   			$('#pw').keydown(function(){
   				$('#pwm').hide();
   			})
   			$('#name').keydown(function(){
   				$('#namem').hide();
   			})
   			$('#hp').keydown(function(){
   				$('#hpm').hide();
   			})
   			$('#authNum').keydown(function(){
   				$('#phCheck').hide()
   			})
   			
   			$('#email').keydown(function(){
   				$('#mailm').hide();
   			})
   			$('#email').keydown(function(){
   				$('#mailmsg').hide();
   			})
   		})
   		
   		function idCheck(){
   			
   				isCheck = true;
   				
   				if($('input[name="id"]').val()==""){
   					alert("아이디를 입력해주세요")
   				}
   				
   				else{
   				 $.ajax({ 
   					url : "idcheck.mb",
   					data:{
   						id : $('#id').val()
   					},
   					success : function(data){
   						
   						if($.trim(data)=="no"){
   							$('#idmsg').html("<font color=red size=2px>이미 사용중인 아이디입니다.</font>");
   							$('#idmsg').show();
   							use = "impossible";
   						}
   						else{
   							$('#idmsg').html("<font color=green size=2px>사용 가능합니다.</font>");
   							$('#idmsg').show();
   							use = "possible";
   						}
   					}
   				}) 
   				}//else
   			}//idcheck click 
   	
   		//문자보내기
   	 	function sendSMS(){
   			
   			if($('#hp').val().length==0){
   				$('#hp').focus();
   				alert("전화번호를 입력하세요");
   				return;
   			}
   			 
   		 var patternPhone = /(01[016789])([1-9]{1}[0-9]{2,3})([0-9]{4})$/;
   		  if(!patternPhone.test($('#hp').val())){       
   			alert('올바르지 않은 형식의 번호입니다'); 
   			return;      
   			}  

   			
   			else{
   				$.ajax({// 다른 jsp 가서 중복체크할것
   					type:'get',//get방식으로 명시
   					url : "sendSMS.mb", // 일로가서 중복체크
   					data : {  // 보낼 데이터
   						PhoneNumber : $('#hp').val() // 값을 담을 변수 내맘 userid= choi 가지고 jsp로 넘어감.
   							},
   						success : function(data){ // 사용가능 불가능 한 걸 data로 받는다. data:응답정보 url 갔다온 답
   							phClick=true;
   							if($.trim(data)=="yes"){
   								phCheck = true;
   								$('#hpnmsg').html("<font color=red size=2px>인증번호를 입력해주세요</font>");
   								$('#hpnmsg').show();
   								$('#hpmsg').hide();
   								$('#authNum').focus();
   							}
   							else{
   								phCheck = false;
   								alert("인증번호를 보내지 못하였습니다.");
   							}//else
   						}//success

   				});//ajax
   			}
   		}
   		
   		 //문자인증번호 체크
   		function CheckauthNum(){
   			
   			if($('#authNum').val().length==0){
   				alert("인증번호를 입력하세요");
   				return;
   			}
   			else{
   				$.ajax({
   					type:'post',//get방식으로 명시
   					url : "sendSMS.mb", 
   					data : {  
   						authNum : $('#authNum').val() // 값을 담을 변수 내맘 userid= choi 가지고 jsp로 넘어감.
   							},
   						success : function(data){ // 사용가능 불가능 한 걸 data로 받는다. data:응답정보 url 갔다온 답
   							if($.trim(data)=="yes"){
   			 					phnCheck =true;
   								$('#hpnmsg').html("<font color=green size=2px>인증되었습니다</font>");
   								$('#hpnmsg').show();
   							}
   							else{
   								phnCheck = false;
   								$('#authNum').focus();
   								$('#hpnmsg').html("<font color=red size=2px>인증번호가 틀립니다</font>");
   								$('#hpnmsg').show();
   							}//else
   						}//success

   				});//ajax
   			}
   			
   		}
   		//=========================================== 
   		
   	//이메일 보내기
   		function sendEmail(){
   			
   			if($('#email').val().length==0){
   				$('#email').focus();
   				alert("이메일을 입력하세요");
   				return;
   			}
   			var emailPattern = /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/;
   	   		  if(!emailPattern.test($('#email').val())){       
   	   			alert('올바르지 않은 형식의 이메일입니다');    
   	   			return;   
   	   			}  
   			else{
   				 $.ajax({
   					type:'get',
   					url : "sendEMAIL.mb", 
   					data : {
   						email : $('#email').val() 
   							},
   						success : function(data){
   							if($.trim(data)=="yes"){
   								mailCheck=true;
   								$('#mailnmsg').html("<font color=red size=2px>인증번호를 입력해주세요</font>");
   								$('#mailnmsg').show();
   								$('#EmailauthNum').focus();
   								$('#mailmsg').hide();
   							}
   							else{
   								alert("인증번호를 보내지 못하였습니다.");
   							}//else
   						}//success

   				});//ajax 
   			}
   		}
   		 //이메일 인증확인
   		function CheckEmail(){
   			if($('#EmailauthNum').val().length==0){
   				$('#EmailauthNum').focus();
   				alert("인증번호를 입력하세요")
   				return;
   			}
   			else{
   				$.ajax({
   					type:'post',
   					url : "sendEMAIL.mb", 
   					data : { 
   						EmailauthNum : $('#EmailauthNum').val() 
   							},
   						success : function(data){
   							if($.trim(data)=="yes"){
   								mailnCheck = true;
   								$('#mailnmsg').html("<font color=green size=2px>인증되었습니다</font>");
   								$('#mailnmsg').show();
   							}
   							else{
   								$('#EmailauthNum').focus();
   								$('#authNum').focus();
   								$('#mailnmsg').html("<font color=red size=2px>인증번호가 틀립니다</font>");
   								$('#mailnmsg').show();
   							}//else
   						}//success

   				});//ajax
   			}
   		}  
   		 
		function sub(){
			var reg = /^(?=.*\d)(?=.*[a-zA-Z])[0-9a-zA-Z]{8,16}$/;
			
   			
			if($('#id').val()==""){
				$('#idm').html("<font color=red size=2px>아이디를 입력해주세요</font>");
				$('#idm').show();
				$('#id').focus();
				return false;
			}
			
			else if(!isCheck){
				$('#idmsg').html("<font color=red size=2px>중복체크를 해주세요</font>");
					$('#idmsg').show();
					return false;
			}
			
			else if(!reg.test($('#pw').val())){
				$('#pwm').html("<font color=red size=2px>8 ~ 16자 영문, 숫자 조합 비밀번호를 입력해주세요</font>");
				$('#pwm').show();
				$('#pw').focus();
				return false;
			}
			else if($('#repw').val()==""){
				$('#repwmsg').html("<font color=red size=2px>비밀번호를 입력해주세요</font>");
				$('#repwmsg').show();
				$('#repw').focus();
				return false;
			}
			else if($('#name').val()==""){
				$('#namem').html("<font color=red size=2px>이름을 입력해주세요</font>");
				$('#namem').show();
				$('#name').focus();
				return false;
			}
			else if($('#full_address').val()==""){
				$('#full_addressm').html("<font color=red size=2px>주소를 입력해주세요</font>");
				$('#full_addressm').show();
				return false;
			}
   			else if(!phClick){
   				$('#hpmsg').html("<font color=red size=2px>인증번호 받기를 눌러주세요</font>");
					$('#hpmsg').show();
					return false;
   			}
   			else if(!phnCheck){
   				$('#hpnmsg').html("<font color=red size=2px>인증번호 확인을 눌러주세요</font>");
					$('#hpnmsg').show();
					return false;
   			}
   			else if(!mailCheck){
   				$('#mailmsg').html("<font color=red size=2px>인증번호 받기를 눌러주세요</font>");
					$('#mailmsg').show();
					return false;
   			}
   			else if(!mailnCheck){
   				$('#mailnmsg').html("<font color=red size=2px>인증번호 확인을 눌러주세요</font>");
					$('#mailnmsg').show();
					return false;
   			}
   		}
		
		/** 우편번호 찾기 */
		function execDaumPostcode() {
		    daum.postcode.load(function(){
		        new daum.Postcode({
		            oncomplete: function(data) {
		            	var temp = "";
						
						temp += data.sido;
						temp += " " + data.sigungu;
						if(data.bname1 != ""){
							temp += " " + data.bname1;
						}
						temp += " " + data.bname;
						
						$('[name=full_address]').val(temp);
						
						$('[name=add1_sido]').val(data.sido);
						$('[name=add2_sigungu]').val(data.sigungu);
						$('[name=add3_eubmyeon]').val(data.bname1);
						$('[name=add4_donglee]').val(data.bname);
		            }
		        }).open();
		    });
		}
   
   </script>

<!doctype html>

<%@include file="/categoryTop.jsp" %>

		<!--Body Container-->
		<div id="page-content">
			<!--Collection Banner-->
			<div class="collection-header">
				<div class="collection-hero">
					<div class="collection-hero__image"></div>
					<div class="collection-hero__title-wrapper container">
						<h1 class="collection-hero__title">회원가입</h1>
						<div class="breadcrumbs text-uppercase mt-1 mt-lg-2">
							<a href="home" title="Back to the home page">홈</a><span>|</span><span
								class="fw-bold">회원가입</span>
						</div>
					</div>
				</div>
			</div>
			<!--End Collection Banner-->

			<!--Container-->
			<div class="container">
				<!--Main Content-->
				<div class="row">
					<div class="col-12 col-sm-12 col-md-12 col-lg-12 box mt-2 mt-lg-5">

						<div align="center">
							<h2 class="h3 text-uppercase mb-3">회원가입</h2><br>
							<div class="essencial"><font style="color: orange; size: 2px;">*</font>필수입력사항</div>
							<hr>
							<form  method="post" action="register.mb" accept-charset="UTF-8" class="customer-form">
								<table style="width: 60%">
									<tr>
										<td class="lefttd">아이디 </td>
										<td>
										 <i class="material-icons prefix"></i>
											<input id="id" type="text" name="id" placeholder="아이디" class="small" value="${mb.id }" ><br>
										</td>
										<td align="center">
											<input type="button" value="중복체크" onclick="idCheck()" class="bt">
											<span style="display: none;" id="idmsg"></span>
										</td>
									</tr>
									<tr>
										<td>
											<span style="display: none;" id="idm"></span>
										</td>
									</tr>
									<tr>
										<td class="lefttd">비밀번호</td>
										<td>
											<input type="password" name="pw" id="pw" placeholder="비밀번호" class="small" value="${mb.pw }">
										</td>
										<td>
											<input type="password" name="repw" id="repw" placeholder="비밀번호 재확인" class="small" value="${mb.repw }"><br>
											<span style="display: none;" id="repwmsg"></span>
										</td>
									</tr>
									<tr>
										<td>
											<span style="display: none;" id="pwm"></span>
										</td>
									</tr>
									<tr>
										<td class="lefttd">이름</td>
										<td>
											<input type="text" name="name" id="name" placeholder="이름" class="small" value="${mb.name }">
										</td>
										<td></td>
									</tr>
									<tr>
										<td>
											<span style="display: none;" id="namem"></span>
										</td>
									</tr>
									<tr>
										<td class="lefttd">주소</td>
										<!-- 주소칸 -->
										<td><input type="text" name="full_address" class="small" placeholder="주소 검색 해주세요" id="full_address" readonly>
										<br> <!-- 사용자에게 보여주는 용도--> <!-- DB삽입을 위한 용도(hidden으로 변경해야함) -->
											<input type="hidden" name="add1_sido" value="">		<!-- 도/시 이름 --> 
											<input type="hidden" name="add2_sigungu" value=""> 	<!-- 시/군/구 이름 --> 
											<input type="hidden" name="add3_eubmyeon" value=""> 	<!-- 법정리의 읍/면 이름 -->
											<input type="hidden" name="add4_donglee" value=""><br>	<!-- 법정동/법정리 이름 --></td>
										<td align="center" valign="top">
											<input type="button" onclick="execDaumPostcode()" value="주소 검색" class="bt">
											<span style="display: none;" id="full_addressm"></span>
									</tr>
									<tr>
									</tr>
									<tr>
										<td class="lefttd">전화번호</td>
										<td>
											<input type="text" name="hp" id="hp" placeholder="전화번호 입력" class="small" value="${mb.hp}">
										</td>
										<td align="center">
											<input type="button" value="인증번호 받기" onclick="sendSMS()" class="bt">
											<span style="display: none;" id="hpmsg"></span>
										</td>
									</tr>
									<tr>
										<td>
											<span style="display: none;" id="hpm"></span>
										</td>
									</tr>
									<tr>
										<td></td>
										<td>
											<input type="text" id="authNum" name="authNum" style="width: 160px;" placeholder="인증번호 입력하세요">
											<input type="button" value="인증번호 확인" onclick="CheckauthNum()" class="bts"><br>
										</td>
										<td>
											<span style="display: none;" id="hpnmsg"></span>
										</td>
									</tr>
									<tr>
										<td class="lefttd">이메일</td>
										<td>
											<input type="email" name="email" id="email" class="small" placeholder="이메일 입력" value="${mb.email }">
										</td>
										<td align="center">
											<input type="button" value="인증번호 받기" onclick="sendEmail()" class="bt">
											<span style="display: none;" id="mailmsg"></span>
										</td>
									</tr>
									<tr>
										<td>
											<span style="display: none;" id="mailm"></span>
										</td>
									</tr>
									<tr>
										<td></td>
										<td>
											<input type="text" id="EmailauthNum" name="EmailauthNum"  style="width: 160px;"class="small" placeholder="인증번호 입력하세요" ">
											<input type="button" value="인증번호 확인" onclick="CheckEmail()" class="bts">
										</td>
										<td>
											<span style="display: none;" id="mailnmsg"></span>
										</td>
									</tr>
								</table>
								<br><br>
								<input type="submit" value="가입하기" onclick="return sub()" class="btn rounded me-auto">
							</form>
						</div>
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
						<div
							class="col-12 col-sm-12 col-md-12 col-lg-12 text-center about-col mb-4">
							<img src="resources/assets/images/footer-logo.png" alt="Optimal"
								class="mb-3" />
							<p>55 Gallaxy Enque, 2568 steet, 23568 NY</p>
							<p class="mb-0 mb-md-3">
								Phone: <a href="tel:+011234567890">(+01) 123 456 7890</a> <span
									class="mx-1">|</span> Email: <a href="mailto:info@example.com">info@example.com</a>
							</p>
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
										<p>Enter Your Email To Receive Daily News And Get 20% Off
											Coupon For All Items.</p>
										<div class="input-group">
											<input type="email"
												class="brounded-start input-group__field newsletter-input mb-0"
												name="EMAIL" value="" placeholder="Email address" required>
											<span class="input-group__btn">
												<button type="submit"
													class="btn newsletter__submit rounded-end" name="commit"
													id="Subscribe">
													<i class="an an-envelope-l"></i>
												</button>
											</span>
										</div>
									</form>
								</div>
							</div>
							<ul class="list-inline social-icons mt-3 pt-1">
								<li class="list-inline-item"><a href="#"
									data-bs-toggle="tooltip" data-bs-placement="top"
									title="Facebook"><i class="an an-facebook"
										aria-hidden="true"></i></a></li>
								<li class="list-inline-item"><a href="#"
									data-bs-toggle="tooltip" data-bs-placement="top"
									title="Twitter"><i class="an an-twitter" aria-hidden="true"></i></a></li>
								<li class="list-inline-item"><a href="#"
									data-bs-toggle="tooltip" data-bs-placement="top"
									title="Pinterest"><i class="an an-pinterest-p"
										aria-hidden="true"></i></a></li>
								<li class="list-inline-item"><a href="#"
									data-bs-toggle="tooltip" data-bs-placement="top"
									title="Instagram"><i class="an an-instagram"
										aria-hidden="true"></i></a></li>
								<li class="list-inline-item"><a href="#"
									data-bs-toggle="tooltip" data-bs-placement="top" title="TikTok"><i
										class="an an-tiktok" aria-hidden="true"></i></a></li>
								<li class="list-inline-item"><a href="#"
									data-bs-toggle="tooltip" data-bs-placement="top"
									title="Whatsapp"><i class="an an-whatsapp"
										aria-hidden="true"></i></a></li>
							</ul>
						</div>
					</div>
				</div>
			</div>
			<div class="footer-bottom clearfix">
				<div class="container">
					<div
						class="d-flex-center flex-column justify-content-md-between flex-md-row-reverse">
						<img src="resources/assets/images/payment.png"
							alt="Paypal Visa Payments" />
						<div class="copytext text-uppercase">&copy; 2022 Optimal.
							All Rights Reserved.</div>
					</div>
				</div>
			</div>
		</div>
		<!--End Footer-->

		<!--Scoll Top-->
		<span id="site-scroll"><i class="icon an an-chevron-up"></i></span>
		<!--End Scoll Top-->

		<!--MiniCart Drawer-->
		<div class="minicart-right-drawer modal right fade"
			id="minicart-drawer">
			<div class="modal-dialog">
				<div class="modal-content">
					<div id="cart-drawer" class="block block-cart">
						<div class="minicart-header">
							<a href="javascript:void(0);" class="close-cart"
								data-bs-dismiss="modal" aria-label="Close"><i
								class="an an-times-r" aria-hidden="true"
								data-bs-toggle="tooltip" data-bs-placement="left" title="Close"></i></a>
							<h4 class="fs-6">Your cart (2 Items)</h4>
						</div>
						<div class="minicart-content">
							<ul class="clearfix">
								<li
									class="item d-flex justify-content-center align-items-center">
									<a class="product-image" href="product-layout1.html"> <img
										class="blur-up lazyload"
										src="resources/assets/images/products/cart-product-img1.jpg"
										data-src="resources/assets/images/products/cart-product-img1.jpg"
										alt="image" title="">
								</a>
									<div class="product-details">
										<a class="product-title" href="product-layout1.html">Floral
											Crop Top</a>
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
												<a class="qtyBtn minus" href="javascript:void(0);"><i
													class="icon an an-minus-r" aria-hidden="true"></i></a> <input
													type="text" name="quantity" value="1" class="qty">
												<a class="qtyBtn plus" href="javascript:void(0);"><i
													class="icon an an-plus-l" aria-hidden="true"></i></a>
											</div>
										</div>
										<a href="#" class="edit-i remove"><i
											class="icon an an-edit-l" data-bs-toggle="tooltip"
											data-bs-placement="top" title="Edit"></i></a> <a href="#"
											class="remove"><i class="an an-times-r"
											data-bs-toggle="tooltip" data-bs-placement="top"
											title="Remove"></i></a>
									</div>
								</li>
								<li
									class="item d-flex justify-content-center align-items-center">
									<a class="product-image" href="product-layout1.html"> <img
										class="blur-up lazyload"
										src="resources/assets/images/products/cart-product-img1.jpg"
										data-src="resources/assets/images/products/cart-product-img1.jpg"
										alt="image" title="">
								</a>
									<div class="product-details">
										<a class="product-title" href="product-layout1.html">V
											Neck T-shirts</a>
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
												<a class="qtyBtn minus" href="javascript:void(0);"><i
													class="icon an an-minus-r" aria-hidden="true"></i></a> <input
													type="text" name="quantity" value="1" class="qty">
												<a class="qtyBtn plus" href="javascript:void(0);"><i
													class="icon an an-plus-l" aria-hidden="true"></i></a>
											</div>
										</div>
										<a href="#" class="edit-i remove"><i
											class="icon an an-edit-l" data-bs-toggle="tooltip"
											data-bs-placement="top" title="Edit"></i></a> <a href="#"
											class="remove"><i class="an an-times-r"
											data-bs-toggle="tooltip" data-bs-placement="top"
											title="Remove"></i></a>
									</div>
								</li>
							</ul>
						</div>
						<div class="minicart-bottom">
							<div class="shipinfo text-center mb-3 text-uppercase">
								<p class="freeShipMsg">
									<i class="an an-truck fs-5 me-2 align-middle"></i>SPENT <b>$199.00</b>
									MORE FOR FREE SHIPPING
								</p>
							</div>
							<div class="subtotal">
								<span>Total:</span> <span class="product-price">$93.13</span>
							</div>
							<a href="checkout-style1.html"
								class="w-100 p-2 my-2 btn btn-outline-primary proceed-to-checkout rounded">Proceed
								to Checkout</a> <a href="cart-style1.html"
								class="w-100 btn-primary cart-btn rounded">View Cart</a>
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