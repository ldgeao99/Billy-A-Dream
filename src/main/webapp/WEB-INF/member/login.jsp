<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>

<%@include file="../common/common.jsp" %>
<%@include file="../member/commonTop.jsp" %>

<style>
button {
	height: 2.5em;
	cursor: pointer;
}

#popupID,#popupPW {
	display: flex;
	justify-content: center;
	align-items: center;
	position: fixed;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	background: rgba(0, 0, 0, .7);
	z-index: 1;
}

#popupID.hide,#popupPW.hide {
	display: none;
}

#popupID.has-filter,#popupPW.has-filter {
	backdrop-filter: blur(4px);
	-webkit-backdrop-filter: blur(4px);
}

#popupID .content,#popupPW .content {
	padding: 40px;
	background: #fff;
	border-radius: 5px;
	box-shadow: 1px 1px 3px rgba(0, 0, 0, .3);
}


.small {
	width: 250px;
}
td{
	height: 20px;
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
/* 카카오톡 로그인 */
#kakaobg{
	 width: 400px;
	 border-radius: 5px; 
	 background-color:#FFEB00;    
}
</style>



<!--카카오톡 로그인 스크립트  -->
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">

/*카카오톡 로그인   */
//초기화 시키기. 
$(document).ready(function(){	
	window.Kakao.init("712a5c51e06bca8448c4c65b4205bb54");
	Kakao.isInitialized();
});

function kakaoLogin() {
	
	window.Kakao.Auth.login({
		scope:'profile_nickname,account_email',
		success: function(authObj){
			//console.log(authObj);
			window.Kakao.API.request({
				url: '/v2/user/me',
				success: res => {
					const email = res.kakao_account.email;
					const name = res.properties.nickname;
					var e = email;
					$.ajax({
						type : 'post',
						url : "idcheck.mb",
						data : {
							id : email
						},
						success : function(data) {
							if($.trim(data)=="yes"){
								if(confirm("등록된 정보가 없습니다\n 회원가입을 진행하시겠습니까?")){
									location.href="kakaologin.mb?name="+name+"&email="+email;
								}
							}
							else{
								$.ajax({
									type : 'post',
									url : "kakaoSucessLogin.mb",
									data : {
										email : email
									},
									success : function(data) {
										if ($.trim(data) == "yes") {
											location.href = "/ex/";
										} 
										else if($.trim(data) == "Insertip"){
											location.href = "Insertip.mb?id="+email;
										}
										else if($.trim(data)=="black"){
											$('#logincheck').html(
											"<br><br><font color=red>이용 정지중인 회원입니다.<br> 안녕히가세요.</font>");
											return false;
										}
										else {
											$('#logincheck').html(
											"<br><br><font color=red>아이디 또는 비밀번호를 잘못 입력했습니다.<br> 입력하신 내용을 다시 확인해주세요.</font>");
											return false;
										}//else
									}//success

								});//ajax
							}//else
						}//success

					});//ajax
					
				}
			});
			
		}
	});
}
function kakaoExist(){
	
}

	
	
	//========================================================
	$(function(){
		$('#authNum').keydown(function(){
			$('#hpmsg').hide();
		})
		$('#authNum2').keydown(function(){
			$('#hpmsg2').hide();
		})
		$('#popname').keydown(function(){
			$('#namemsg').hide();
		})
		$('#popid').keydown(function(){
			$('#idmsg2').hide();
		})
	})
	
	/* 아이디 팝업창  */

	function showPopupID(hasFilter) {
		const popup = document.querySelector('#popupID');

		if (hasFilter) {
			popup.classList.add('has-filter');
		} else {
			popup.classList.remove('has-filter');
		}

		popup.classList.remove('hide');
	}

	function closePopupID() {
		const popup = document.querySelector('#popupID');
		popup.classList.add('hide');
	}
	/* 비밀번호 팝업창  */

	function showPopupPW(hasFilter) {
		const popup = document.querySelector('#popupPW');

		if (hasFilter) {
			popup.classList.add('has-filter');
		} else {
			popup.classList.remove('has-filter');
		}

		popup.classList.remove('hide');
	}

	function closePopupPW() {
		const popup = document.querySelector('#popupPW');
		popup.classList.add('hide');
	}
	
	//=================================
	var hpClick = false;
	
	var AuthClick = false;
	var confirmAuth = false; 
	
	function findId(){
		if ($('#popname').val() == "") {
			$('#namemsg').html("<br><font color=red>성함을 입력해주세요</font>");
			$('#namemsg').show();
			return;
		} 
		else if(!AuthClick){
			$('#hpmsg').html("<br><font color=red>인증번호 받기를 눌러주세요</font>");
			$('#hpmsg').show();
			return;
		}
		else if(!confirmAuth){
			$('#hpnmsg').html("<br><font color=red>인증번호 확인해주세요</font>");
			$('#hpnmsg').show();
			return;
		}
		else {
			$.ajax({
						type : 'post',
						url : "findid.mb",
						data : {
							name : $('#popname').val(),
							hp : $('input[name="hp"]').val(),
						},
						success : function(data) {
							if($.trim(data)!='null'){
							$('#FINDID').html("<br><font color=black size=3px>"+$.trim(data)+"</font>");
							$('#FINDID').show();
							}
							else if($.trim(data)== 'null'){
							$('#FINDID').html("<br><font color=red size=3px>가입되지 않은 회원입니다</font>");
							$('#FINDID').show();
							}
						}//success

					});//ajax
		}//else
	}
	
		//아이디 찾기 문자보내기
 	function IDsendSMS(){
		
		if($('#hp').val()==""){
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
							$('#authNum').focus();
						}
						else{
							AuthClick = false;
							alert("인증번호를 보내지 못하였습니다.");
						}//else
					}//success

			});//ajax
		}
	}
	
	 //아이디 찾기문자인증번호 체크
	function CheckauthNum(){
		
		if($('#authNum').val()==""){
			alert("인증번호를 입력하세요");
			return;
		}
		else{
			$.ajax({
				type:'post',
				url : "sendSMS.mb", 
				data : {  
					authNum : $('#authNum').val() 
						},
					success : function(data){ 
						if($.trim(data)=="yes"){
							confirmAuth =true;
							$('#hpnmsg').html("<font color=green size=2px>인증되었습니다</font>");
							$('#hpnmsg').show();
						}
						else{
							confirmAuth = false;
							$('#authNum').focus();
							$('#hpnmsg').html("<font color=red size=2px>인증번호가 틀립니다</font>");
							$('#hpnmsg').show();
						}//else
					}//success

			});//ajax
		}
		
	}
	 
	 //=======================================================================================================================
	
		
	var PWAuthClick = false;
	var PWconfirm = false; 
	
	function findPW(){
		$('#idmsg2').hide();
		
		if ($('#popid').val() == "") {
			$('#idmsg2').html("<br><font color=red>아이디를 입력해주세요</font>");
			$('#idmsg2').show();
			return;
		} 
		else if(!PWAuthClick){
			$('#hpmsg2').html("<br><font color=red>인증번호 받기를 눌러주세요</font>");
			$('#hpmsg2').show();
			return;
		}
		else if($('#authNum2').val()==""){
			$('#hpnmsg2').html("<br><font color=red>인증번호 입력해주세요</font>");
			$('#hpnmsg2').show();
			return;
		}
		else if(!PWconfirm){
			$('#hpnmsg2').html("<br><font color=red>인증번호 확인해주세요</font>");
			$('#hpnmsg2').show();
			return;
		}
		else {
			$.ajax({
						type : 'post',
						url : "findpw.mb",
						data : {
							id : $('#popid').val(),
							hp : $('#hp2').val(),
						},
						success : function(data) {
							if($.trim(data)!='null'){
							$('#FINDPW').html("<br><font color=black size=3px>이메일로 임시비밀번호를 발송하였습니다</font>");
							$('#FINDPW').show();
							}
							else if($.trim(data)=='null'){
							$('#FINDPW').html("<br><font color=red size=3px>가입되지 않은 회원입니다</font>");
							$('#FINDPW').show();
							}
						}//success

					});//ajax
		}//else
	}
		
	//============================================================================================
	
		 
	//=========================================== 
	
	//비밀번호 찾기 문자보내기
 	function PWsendSMS(){
		
		if($('#hp2').val().length==0){
			$('#hp2').focus();
			alert("전화번호를 입력하세요");
			return;
		}
		 
	 var patternPhone = /(01[016789])([1-9]{1}[0-9]{2,3})([0-9]{4})$/;
	  if(!patternPhone.test($('#hp2').val())){       
		alert('올바르지 않은 형식의 번호입니다'); 
		return;      
		}  

		
		else{
			$.ajax({
				type:'get',
				url : "sendSMS.mb", 
				data : {  // 보낼 데이터
					PhoneNumber : $('#hp2').val() 
						},
					success : function(data){ 
						if($.trim(data)=="yes"){
							PWAuthClick = true;
							$('#hpmsg2').hide();
							$('#authNum2').focus();
						}
						else{
							PWAuthClick = false;
							alert("인증번호를 보내지 못하였습니다.");
						}//else
					}//success

			});//ajax
		}
	}
	
	 //비밀번호문자인증번호 체크
	function CheckauthNumPW(){
		$('#hpmsg2').hide();
		
		if($('#authNum2').val()==""){
			alert("인증번호를 입력하세요");
			return;
		}
		else{
			$.ajax({
				type:'post',//get방식으로 명시
				url : "sendSMS.mb", 
				data : {  
					authNum : $('#authNum2').val() // 값을 담을 변수 내맘 userid= choi 가지고 jsp로 넘어감.
						},
					success : function(data){ // 사용가능 불가능 한 걸 data로 받는다. data:응답정보 url 갔다온 답
						if($.trim(data)=="yes"){
							PWconfirm =true;
							$('#hpnmsg2').html("<font color=green size=2px>인증되었습니다</font>");
							$('#hpnmsg2').show();
						}
						else{
							PWconfirm = false;
							$('#authNum2').focus();
							$('#hpnmsg2').html("<font color=red size=2px>인증번호가 틀립니다</font>");
							$('#hpnmsg2').show();
						}//else
					}//success

			});//ajax
		}
		
	}
	//=========================================== 	
		
	
	/*  로그인  */
	function loginCheck() {

		if ($('input[name="id"]').val() == "") {
			$('#logincheck').html("<br><br><font color=red>아이디를 입력해주세요</font>");
			return false;
		} else if ($('input[name="pw"]').val() == "") {
			$('#logincheck')
					.html("<br><br><font color=red>비밀번호를 입력해주세요</font>");
			return false;
		} else {

			$.ajax({
						type : 'post',
						url : "login.mb",
						data : {
							id : $('input[name="id"]').val(),
							pw : $('input[name="pw"]').val()
						},
						success : function(data) {
							if ($.trim(data) == "yes") {
								location.href = "/ex/";
							} else if ($.trim(data) == "admin") {
								location.href = "main.admin";
							} 
							else if($.trim(data) == "Insertip"){
								location.href = "Insertip.mb?id="+$('input[name="id"]').val();
							}
							else if($.trim(data)=="black"){
								$('#logincheck').html(
								"<br><br><font color=red>이용 정지중인 회원입니다.<br> 안녕히가세요.</font>");
								return false;
							}
							else {
								$('#logincheck').html(
								"<br><br><font color=red>아이디 또는 비밀번호를 잘못 입력했습니다.<br> 입력하신 내용을 다시 확인해주세요.</font>");
								return false;
							}//else
						}//success

					});//ajax
		}//else

	}//function
	
</script>


            <!--Body Container-->
            <div id="page-content">   
                <!--Collection Banner-->
                
                <div class="collection-header">
                    <div class="collection-hero">
                        <div class="collection-hero__image"></div>
                        <div class="collection-hero__title-wrapper container">
                            <h2 style="font-family: 'Poppins',Arial,Tahoma !important; font-weight: 700!important; font-size:25px;color: black; margin-bottom:0px">예약 및 결제</h2>
                        </div>
                    </div>
                </div>
                
                <!--End Collection Banner-->

                <!--Container-->
                <div class="container">
                    <!--Main Content-->
                    <div class="login-register pt-2 pt-lg-5">
                        <div class="row">
                            <div class="col-12 col-sm-12 col-md-6 col-lg-6 mb-4 mb-md-0">
                                <div class="inner">
<!--  ======================================================================================================================================================================== -->
                                    <form name="loginForm" method="post" class="customer-form">	
                                        <h3 class="h4 text-uppercase" style="color: #222222 !important; margin: 0 0 10px !important; font-family: 'Poppins',Arial,Tahoma !important; font-weight: 600; line-height: 1.2; letter-spacing: .02em; overflow-wrap: break-word;word-wrap: break-word;">로그인</h3>
                                        <div class="row">
                                            <div class="col-12 col-sm-12 col-md-12 col-lg-12">
                                                <div class="form-group">
                                                    <label for="CustomerEmail" class="d-none">id <span class="required">*</span></label>
                                                    <input type="text" name="id" placeholder="ID" id="CustomerEmail" value="" required />
                                                </div>
                                            </div>
                                            <div class="col-12 col-sm-12 col-md-12 col-lg-12">
                                                <div class="form-group">
                                                    <label for="CustomerPassword" class="d-none">Password <span class="required">*</span></label>
                                                    <input type="password" name="pw" placeholder="Password" id="CustomerPassword" value="" required />    
                                                    <span id="logincheck"></span>                     	
                                                </div>
                                            </div>
                                        </div>
									<div class="row">
										<div class="text-left col-12 col-sm-12 col-md-12 col-lg-12">
											<p class="d-flex-center">
											<a href='#' onClick='showPopupID(true); return false' style="font-size: 12px;">아이디 찾기</a> &nbsp;&nbsp;/&nbsp;&nbsp;
											<a href='#' onClick='showPopupPW(true); return false' style="font-size: 12px;">비밀번호 찾기</a>
											</p>
											<p>
											<input type="button" onclick="return loginCheck()" class="btn rounded me-auto" value="로그인" style="width: 400px; height: 45px;">
											<div id="kakaobg" style="text-align: center;"><img onclick="kakaoLogin()" src="//k.kakaocdn.net/14/dn/btqCn0WEmI3/nijroPfbpCa4at5EIsjyf0/o.jpg" style="width: 200px; height: 45px; "></div>
											</p>

											<!-- 아이디 찾기 팝업창  -->
											<div id="popupID" class="hide">
												<div class="content">
													<p>
													<div class="row">
														<div >
															<h3 align="center">아이디 찾기</h3>
															<br>
															<br>

															<p><b>회원 아이디를 찾기 위해서는 회원명과 휴대전화 인증이 필요합니다</b></p><br><hr>
															<div class="row">
																<div class="text-left col-12 col-sm-12 col-md-12 col-lg-12">
																	<p class="d-flex-center">
																	<table>
																		<tr>
																			<td>
																				<input type="text" name="name" id="popname" placeholder="성함" class="small"> 
																				<span style="display: none;" id="namemsg"></span><br><br>
																			</td>
																		</tr>
																		<tr>
																			<td>
																				<input type="text" name="hp" id="hp" placeholder="전화번호 입력" class="small">
																			</td>
																			<td>
																				<input type="button" value="인증번호 받기" onclick="IDsendSMS()" class="bt"> 
																				<span style="display: none;" id="hpmsg"></span>
																			</td>
																		</tr>
																		<tr>
																			<td>
																				<span style="display: none;" id="hpm"></span>
																			</td>
																		</tr>
																		<tr>
																			<td>
																				<input type="text" id="authNum" name="authNum" style="width: 160px;" placeholder="인증번호 입력하세요">
																			</td>
																			<td>
																				<input type="button" value="인증번호 확인" onclick="CheckauthNum()" class="bt"><br>
																				<span style="display: none;" id="hpnmsg"></span>
																			</td>
																		</tr>
																	</table>
																		<br><br>
																		<div align="center"><input type="button"  value="아이디 찾기" class="btn rounded me-auto" onclick="findId()"></div><br>
																	<br>
																	<br> 
																	<span id="FINDID" style="display: none;"></span>
																	<center><a href='#' onClick='closePopupID(); return false'></center><br><br>
																	<i class="align-middle icon an an-an-double-left me-2"></i>뒤로가기</a>
																	</p>
																</div>
															</div>
														</div>
													</div>
												</div>
											</div>
											
											
											<!-- 비번 찾기 팝업창  -->
											<div id="popupPW" class="hide">
												<div class="content">
													<p>
													<div class="row">
														<div>
															<h3 align="center">비밀번호 찾기</h3>
															<br>
															<br>

															<p><b>회원 비밀번호를 초기화하기 위해서는 아이디와 휴대전화 인증이 필요합니다</b></p><br><hr>
															<div class="row">
																<div>
																	<p class="d-flex-center">
																	<table>
																		<tr>
																			<td>
																				<input type="text" name="id" id="popid" placeholder="아이디" class="small"> 
																				<span style="display: none;" id="idmsg2"></span><br><br>
																			</td>
																		</tr>
																		<tr>
																			<td>
																			<input type="text" name="hp" id="hp2"
																				placeholder="전화번호 입력" class="small"></td>
																			<td>
																				<input type="button" value="인증번호 받기" onclick="PWsendSMS()" class="bt"> 
																				<span style="display: none;" id="hpmsg2"></span>
																			</td>
																		</tr>
																		<tr>
																			<td>
																				<span style="display: none;" id="hpm2"></span>
																			</td>
																		</tr>
																		<tr>
																			<td>
																				<input type="text" id="authNum2" name="authNum" style="width: 160px;" placeholder="인증번호 입력하세요"></td>
																			<td>
																				<input type="button" value="인증번호 확인" onclick="CheckauthNumPW()" class="bt"><br>
																				<span style="display: none;" id="hpnmsg2"></span>
																			</td>
																		</tr>
																	</table>
																	<br><br>
																	<div align="center"><input type="button" value="비밀번호 초기화" class="btn rounded me-auto" onclick="findPW()"></div><br>
																	<br>
																	<br> <span id="FINDPW" style="display: none;"></span><br><br>
																	<a href='#' onClick='closePopupPW(); return false'>
																	<i class="align-middle icon an an-an-double-left me-2"></i>뒤로가기</a>
																	</p>
																</div>
															</div>
														</div>
													</div>
												</div>
											</div>
										</div>
									</div>
								</form>
                                </div>
                            </div>
                            <div class="col-12 col-sm-12 col-md-6 col-lg-6">
                                <div class="inner">
                                	<center><br><br><br>
                                    <p> <b>[Billy A Dream] 에 계정이 없으신가요?</b> </p><br><br><br>
                                    <a href="register.mb" class="btn rounded">회원가입</a>
                                    </center>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!--End Main Content-->
                </div>
                <!--End Container-->
            </div>
            <!--End Body Container-->

            <!--Footer-->
            <%@include file="../member/commonBottom.jsp" %>   
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