<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file = "categoryTop.jsp" %>

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

  /* 하트   */

.heart {
  width: 100px;
  height: 100px;
  position: absolute;
  left: 50%;
  top: 1250px;
  transform: translate(-50%, -50%);
  background: url(https://cssanimation.rocks/images/posts/steps/heart.png) no-repeat;
  background-position: 0 0;
  cursor: pointer;
  animation: fave-heart 1s steps(28);
}
.heart:hover {
  background-position: -2800px 0;
  transition: background 1s steps(28);
}
@keyframes fave-heart {
  0% {
    background-position: 0 0;
  }
  100% {
    background-position: -2800px 0;
  }
}
</st
</style>

<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js?autoload=false"></script>
<script src="https://code.jquery.com/jquery-latest.min.js"></script>
<script>
   		
   		var phClick=false; // 폰 인증받기 클릭
   		var phCheck = false; // 폰확인
   		var mailClick=false; // 이메일 인증받기 클릭
   		var mailnCheck = false; // 이메일 확인
   		var isCheck = false;
   		var joongbok = false;
   		
   		
   		/* 중복체크  */
   		function idCheck(){
   			
   				isCheck = true;
   				
   				if($('input[name="id"]').val()==""){
   					$('#id').attr("class","form-control is-invalid");
   					alert("아이디를 입력해주세요");
   				}
   				
   				else{
   				 $.ajax({ 
   					url : "idcheck.mb",
   					data:{
   						id : $('#id').val()
   					},
   					success : function(data){
   						
   						if($.trim(data)=="no"){
   							$('#id').attr("class","form-control is-invalid");
   							joongbok = false;
   						}
   						else{
   							joongbok = true;
   							$('#id').attr("class","form-control is-valid");
   						}
   					}
   				}) 
   				}//else
   			}//idcheck click 
   	
   		//==============================================================================================================================================
   				
   			function sendSMS(){
   		   			
   		   			 
   		   		 var patternPhone = /(01[016789])([1-9]{1}[0-9]{2,3})([0-9]{4})$/;
   		   		  if(!patternPhone.test($('#hp').val())){      
   		   			$('#hp').attr("class","form-control is-invalid");
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
   		   							if($.trim(data)=="yes"){
   		   								phClick = true;
   		   								$('#authNumShow').show();
   		   								$('#hp').removeAttr("class");
   		   							}
   		   							else{
   		   								phClick = false;
   		   								alert("인증번호를 보내지 못하였습니다.");
   		   							}//else
   		   						}//success

   		   				});//ajax
   		   			}
   		   		}
   		   		
   			
   		   		 //문자인증번호 체크
   		   		function CheckauthNum(){
   		   			
   		   			if($('#authNum').val().length==0){
   		   				$('#authNum').attr("class","form-control is-invalid");
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
   		   			 					phCheck =true;
   		   			 					$('#authNum').focus();
   		   			 					$('#authNum').attr("class","form-control is-valid");
   		   								
   		   							}
   		   							else{
   		   								phCheck = false;
   		   								$('#authNum').focus();
   		   								$('#authNum').attr("class","form-control is-invalid");
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
   		   				$('#email').attr("class","form-control is-invalid");
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
   		   								mailClick=true;
   		   								$('#EmailAuthNumShow').show();
   		   							}
   		   							else{
   		   								mailClick=false;
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
   						$('#EmailauthNum').attr("class","form-control is-invalid");
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
   		   								$('#EmailauthNum').focus();
   		   								$('#EmailauthNum').attr("class","form-control is-valid");
   		   							}
   		   							else{
   		   								mailnCheck = false;
   		   								$('#EmailauthNum').focus();
   		   								$('#EmailauthNum').attr("class","form-control is-invalid");
   		   							}//else
   		   						}//success

   		   				});//ajax
   		   			}
   		   		}  
   				
   		   		 
   		   		 $(function(){
   		   			 var reg = /^(?=.*\d)(?=.*[a-zA-Z])[0-9a-zA-Z]{8,16}$/;//비밀번호 체크
   		   			
   		   			 $('#id').keyup(function(){
   		   			joongbok = false;
   						$('#id').removeAttr("class");
   		   			 })
   		   			 
   		   			 $('#updatepw').keyup(function(){
   		   				
   		   			if(!reg.test($('#updatepw').val())){
   						$('#updatepw').attr("class","form-control is-invalid");
   						$('#updatepw').focus();
   					}
   		   			if(reg.test($('#updatepw').val())){
   						$('#updatepw').attr("class","form-control is-valid");
   					}
   		   			})
   		   			
   		   			$('#repw').keyup(function(){
   		   				$('#repw').removeAttr("class");
   		   				
   		   				if($('#updatepw').val()==$('#repw').val()){
   		   					$('#repw').attr("class","form-control is-valid");
   		   				}
   		   				if($('#updatepw').val()!=$('#repw').val()){
   		   					$('#repw').attr("class","form-control is-invalid");
   		   				}
   		   			})
   		   			$('#name').keydown(function(){
   		   				$('#name').removeAttr("class");
   		   			})
   		   			$('#full_address').keydown(function(){
   		   				$('#full_address').removeAttr("class");
   		   			})
   		   			
   		   			$('#hp').keydown(function(){
   		   				phClick=false;
   		   				phCheck= false;
   		   				$('#authNumShow').hide();
   		   				$('#hp').removeAttr("class");
   		   			})
   		   			$('#authNum').keydown(function(){
   		   				$('#hp').removeAttr("class");
   		   			})
   		   			$('#email').keydown(function(){
   		   				mailClick=false;
   		   				mailnCheck= false;
   		   				$('#EmailAuthNumShow').hide();
   		   				$('#email').removeAttr("class");
   		   				return;
   		   			})
   		   			$('#EmailauthNum').keydown(function(){
   		   				$('#email').removeAttr("class");
   		   				return;
   		   			})
   		   		 })//ready
   		   		 
   				function sub(){
   		   			 var reg = /^(?=.*\d)(?=.*[a-zA-Z])[0-9a-zA-Z]{8,16}$/;//비밀번호 체크
   		   			 var regExp = /^\d{3}-\d{3,4}-\d{4}$/;
   		   			 // class="form-control is-valid"
						
   		   			 if(!joongbok){
   						$('#id').attr("class","form-control is-invalid");
   						$('#id').focus();
   						return false;
   		   			 }
   		   			 
   		   			 else if($('#updatepw').val()==""){
   						$('#updatepw').attr("class","form-control is-invalid");
   						$('#updatepw').focus();
   							return false;
   					}
   					else if(!reg.test($('#updatepw').val())){
   						$('#updatepw').attr("class","form-control is-invalid");
   						$('#updatepw').focus();
   						return false;
   					}
   					else if($('#repw').val()==""){
   						$('#repw').attr("class","form-control is-invalid");
   						$('#repw').focus();
   							return false;
   					}
   					else if($('#updatepw').val()!=$('#repw').val()){
   						$('#repw').focus();
   							return false;
   					}
   					
   					else if($('#name').val()==""){
   						$('#name').attr("class","form-control is-invalid");
   						$('#name').focus();
   						return false;
   					}
   					else if($('#full_address').val()==""){
   						$('#full_address').attr("class","form-control is-invalid");
   						$('#full_address').focus();
   						return false;
   					}
   					else if($('#hp').val()==""){
   						$('#hp').attr("class","form-control is-invalid");
   						$('#hp').focus();
   						return false;
   					}
   		   			else if(!phClick){
   		   				$('#hp').attr("class","form-control is-invalid");
   							return false;
   		   			}
   		   			else if(!phCheck){
   		   				$('#authNum').attr("class","form-control is-invalid");
   							return false;
   		   			}
   					else if($('#email').val()==""){
   						$('#email').attr("class","form-control is-invalid");
   						$('#email').focus();
   						return false;
   					}
   		   			else if(!mailClick){
   		   				$('#email').attr("class","form-control is-invalid");
   							return false;
   		   			}
   		   			else if(!mailnCheck){
   		   				$('#EmailauthNum').attr("class","form-control is-invalid");
   							return false;
   		   			}
   		   			else
   		   				f.submit();
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
   								
   					   			$('#full_address').removeAttr("class");
   				            }
   				        }).open();
   				    });
   				}	
   
   </script>


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

						<div style="width: 50%; margin-left: 300px;" >
							<h2 class="h2 text-uppercase mb-3" align="center">회원가입</h2><br>
							<hr>
							<form method="post" action="register.mb" name="f">
											<div class="form-group">
												<label for="id" class="form-label mt-4">아이디</label>
												<input type="text" class="form-control" id="id" name="id" aria-describedby="emailHelp">
												<input type="button" value="중복체크" onclick="idCheck()">
											</div>
											<div class="form-group has-success">
												<label class="form-label mt-4" for="updatepw">비밀번호</label>
												<input type="password" id="updatepw" name= "pw" placeholder="비밀번호를 입력해주세요">
												<div class="valid-feedback"></div>
											</div>
											<div class="form-group has-danger">
												<label class="form-label mt-4" for="repw">비밀번호 재확인</label> 
												<input type="password" id="repw">
											</div>
											<div class="form-group">
												<label for="name" class="form-label mt-4">이름</label>
												<input type="text" class="form-control" id="name" name="name" aria-describedby="emailHelp">
											</div>
											<div class="form-group">
												<label for="full_address" class="form-label mt-4">주소</label>
												<input type="text" class="form-control" id="full_address" name="full_address" aria-describedby="emailHelp" >
												<input type="button" onclick="execDaumPostcode()" value="주소 검색" readonly>
												<input type="hidden" name="add1_sido" >
												<input type="hidden" name="add2_sigungu" >
												<input type="hidden" name="add3_eubmyeon" >
												<input type="hidden" name="add4_donglee" >
											</div>
											
											
											<div class="form-group">
												<label for="hp" class="form-label mt-4">전화번호</label> 
												<input type="text" class="form-control" id="hp" name="hp" aria-describedby="emailHelp" placeholder="전화번호 입력" >
												<input type="button" value="인증번호 받기" onclick="sendSMS()">
												<br><br>
												<div style="display: none;" id="authNumShow">
												<label for="authNum" class="form-label mt-4"></label> 
												<input type="text"  id="authNum" aria-describedby="emailHelp" placeholder="인증번호 입력" style="width: 200px; display: inline;">
												<input type="button" value="인증번호 확인" onclick="CheckauthNum()" style="width: 200px;">
												</div>
											</div>
											<div class="form-group">
												<label for="email" class="form-label mt-4">이메일</label> 
												<input type="email" class="form-control" name="email" id="email"aria-describedby="emailHelp" placeholder="이메일" >
												<input type="button" value="인증번호 받기" onclick="sendEmail()" class="bt">
											
											<div style="display: none;" id="EmailAuthNumShow">
												<label for="EmailauthNum" class="form-label mt-4"></label> 
												<input type="text" id="EmailauthNum" name="EmailauthNum"  style="width: 200px; display: inline;"class="small" placeholder="인증번호 입력하세요" ">
												<input type="button" value="인증번호 확인" onclick="CheckEmail()" style="width: 200px; ">
											</div>
												</div>
												<br><br>
											<div class="d-grid gap-2">
												<button class="btn btn-primary btn-lg" type="submit" onclick="return sub()">가입하기</button>
												<div class="heart" onclick="return sub()"></div>
											</div>
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