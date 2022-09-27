<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@include file="../common/common.jsp" %>
<%@include file="../member/commonTop.jsp" %>


<!-- 달력 -->
<script type="text/javascript" src="https://cdn.jsdelivr.net/jquery/latest/jquery.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"></script>
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css" />

<script src="https://kit.fontawesome.com/75769dc150.js" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
	
	$(function() {
		$('#buyDate').html("<font color=red>선택 안함</font>");
		$('#TotalPrice').html("<font color=red>0원</font>");

	})<!-- 결제창에서 달력사용 -->
	
	
	function sub(){
		
			var method = $('input[name=method]:checked').val();
			var idx = "${eduVO.idx}";
		    var windowW = 550;
		    var windowH = 650;
		    var winHeight = document.body.clientHeight;
		    var winWidth = document.body.clientWidth;
		    var winX = window.screenX || window.screenLeft || 0;
		    var winY = window.screenY || window.screenTop || 0;
		    var popX = winX + (winWidth - windowW)/2;
		    var popY = winY + (winHeight - windowH)/2;


		    if(!$('#cart_tearm').is(":checked")){
		    	alert("결제사항을 확인해주세요");
		    	return false;
		    }
		    
			if(method=="kakao"){
				
				$.ajax({
					url:"kakaobuy.prd",
					data : {
						id : $('#id').val(),
						pname : $('#pname').val(),
						price : $('#price').val(),
						no : $('#no').val(),
						start_date : $('#start_date').val(),
						end_date : $('#end_date').val()
					},
					datatype : 'json',
					success:function(data){
						const jsonData = JSON.parse(data);
						
						window.open(jsonData.next_redirect_pc_url,"카카오톡 결제하기","width=" + windowW + ", height=" + windowH + ", scrollbars=no, menubar=no, top=" + popY + ", left=" + popX);
						window.close();
					},
					error:function(error){
						alert("안됨");	
					}
				})
			}
	}
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

                <!--Main Content-->
                <div class="container">
                    <!--Cart Page-->
                    <div class="row">
                        <div class="col-12 col-sm-12 col-md-12 col-lg-8 main-col">

                            <form action="#" method="post" class="cart style2">
                            <input type="hidden" id="id" value="<%=id%>">
                            
                                <table class="align-middle">
                                    <thead class="cart__row cart__header small--hide">
                                        <tr>
                                            <th class="action">&nbsp;</th>
                                            <th colspan="2" class="text-start" style="font-size: 15px">상품명</th>
                                            <th class="text-center" style="font-size: 15px">가격</th>
                                            <th class="text-center" style="font-size: 15px">구매기간</th>
                                            <th class="text-center" style="font-size: 15px">총합</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr class="cart__row border-bottom line1 cart-flex border-top">
                                            <td></td>
                                            <td class="cart__image-wrapper cart-flex-item">
                                                <a href="productdetail.prd?no=${pb.no }"><img class="cart__image blur-up lazyload" data-src="<%=request.getContextPath()%>/resources/${pb.images}" src="<%=request.getContextPath()%>/resources/${pb.images}" alt="${pb.name }" width="80" /></a>
                                           		<input type="hidden" value="${pb.no } " id="no">
                                            </td>
                                            <td class="cart__meta small--text-left cart-flex-item">
                                                <div class="list-view-item__title">
                                                    <a href="product-layout1.html">${pb.name }</a>
                                                    <input type="hidden" value=${pb.name } id="pname">
                                                </div>
                                                <div class="cart__meta-text">
                                                   수량: 1
                                                </div>
                                            </td>
                                            <td class="cart__price-wrapper cart-flex-item text-center small--hide">
                                                <span class="money"><fmt:formatNumber pattern="###,###" value="${pb.discounted_day_price}" var="price"/>${ price} 원 / 일</span>
                                                <input type="hidden" id="price" value="${pb. discounted_day_price}">
                                            </td>
                                            <td>
                                            	&emsp;<span class="money" id="buyDate"></span>
                                            </td>
                                            <td class="cart-price cart-flex-item text-center small--hide">
                                                <span class="money fw-500" id="TotalPrice"></span>
                                            </td>
                                        </tr>
                                        </tbody>
                                </table> 
                            </form>    

                            <div class="currencymsg">· 구매 가능 수량이 1개로 제한된 상품은 주문 취소 시, 24시간 내 가상계좌 재주문이 불가합니다.</div>
                        </div>

                        <div class="col-12 col-sm-12 col-md-12 col-lg-4 cart__footer">
                            <div class="cart_info">
                                <div id="shipping-calculator" class="mb-4 cart-col">
                                    <strong style="font-size:14px;">주문 상세</strong>
                                    <form class="estimate-form pt-1" action="#" method="post">
                                    </form>
                                </div>
                                <div class="cart-note mb-4 cart-col">
                                    <strong style="font-size:14px;">예약기간 설정</strong>
                                    <!--기간설정  -->
									<input type="text" id="select_date" placeholder="날짜를 선택해주세요" value="예약일자 선택" readonly>
									<input type="hidden" id="start_date" value=""><!-- 2022-09-22 -->
                            		<input type="hidden" id="end_date" value="">
                            		
									<script>
										$.noConflict();
									
										//make today as string
										var today = new Date();
										var dd = String(today.getDate()).padStart(2, '0');
										var mm = String(today.getMonth() + 1).padStart(2, '0');
										var yyyy = today.getFullYear();
										var today_string = mm + '/' + dd + '/' + yyyy;
										
										//will be disabled dates by 'isInvalidDate' property
										
										function getDatesStartToLast(arr) {
										
											var result = [];
										
											for(var i=0; i<arr.length; i++){
												var startDate = arr[i][0];
												var lastDate = arr[i][1];
												
												var regex = RegExp(/^\d{4}-(0[1-9]|1[012])-(0[1-9]|[12][0-9]|3[01])$/);
												if(!(regex.test(startDate) && regex.test(lastDate))) return "Not Date Format";
												
												var curDate = new Date(startDate);
												while(curDate <= new Date(lastDate)) {
													result.push(curDate.toISOString().split("T")[0]);
													curDate.setDate(curDate.getDate() + 1);
												}
											}
											
											return result; 
										}
										
										//var disabledDates = ["2022-09-27", "2022-09-29"];
										
										var datesList = [];
										//datesList.push(["2022-09-27","2022-09-29"]);
										//datesList.push(["2022-10-05","2022-10-07"]);

										<c:forEach var="r" items="${rlist}">
											datesList.push(["${r.start_date}", "${r.end_date}"]);
										</c:forEach>
										
										var reservedDates = getDatesStartToLast(datesList);// 2022-09-27,2022-09-28,2022-09-29

										var max_date = "${pb.end_day}";
										max_date = max_date.split(' ')[0].split('-')[1] + "/" + max_date.split(' ')[0].split('-')[2] + "/" + "/" + max_date.split(' ')[0].split('-')[0]
										

										$('#select_date').daterangepicker({
											locale: {
												separator: " ~ ",
												applyLabel: "확인",
										        cancelLabel: "취소",
												daysOfWeek: ["일", "월", "화", "수", "목", "금", "토"],
												monthNames: ["1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월"],
											},
										    "linkedCalendars": false,
										    "showCustomRangeLabel": false,
										    autoUpdateInput : false,
										    "startDate": "09/14/2022",
										    "endDate": "09/20/2022",
										    "minDate": today_string,
										    "maxDate": max_date,
										    "opens": "center",
										    isInvalidDate: function(ele) {
										        var currDate = moment(ele._d).format('YYYY-MM-DD');
										        return reservedDates.indexOf(currDate) != -1;
										    }
										}, function(start, end, label) {
										  		console.log('New date range selected: ' + start.format('YYYY-MM-DD') + ' to ' + end.format('YYYY-MM-DD') + ' (predefined range: ' + label + ')');
										});
										
										//When i click apply button
										$('#select_date').on('apply.daterangepicker', function(ev, picker) {
											var tryReservationDatesList = getDatesStartToLast([[picker.startDate.format('YYYY-MM-DD'), picker.endDate.format('YYYY-MM-DD')]]);
											
											var rentday_minimum = "${pb.rentday_minimum}";
											
											var start = picker.startDate.format('YYYY-MM-DD'); 
											var end = picker.endDate.format('YYYY-MM-DD');
											var tempArr1 = start.split('-');
											var tempArr2 = end.split('-');
											var d1 = new Date(tempArr1[1] + "/" + tempArr1[2] + "/" + tempArr1[0]);   
											var d2 = new Date(tempArr2[1] + "/" + tempArr2[2] + "/" + tempArr2[0]);
											
											var diff = d2.getTime() - d1.getTime();
											var daydiff = diff / (1000 * 60 * 60 * 24);   
											
											if(daydiff < rentday_minimum){
												alert("해당 상품의 최소 예약가능한 단위는 " + rentday_minimum + "일 입니다.\n" + "예약일을 다시 선택하세요");
												return;
											}
											

											var isExist = false;
											
											for(var i = 0; i<reservedDates.length; i++){
												if(tryReservationDatesList.indexOf(reservedDates[i]) != -1){
													isExist = true;
													break;
												}	
											}
										
											if(isExist == true){
												alert("다른사람과 겹치는 예약일자는 선택할 수 없습니다.");
												$(this).val('');
											}else{
												$(this).val(picker.startDate.format('YYYY-MM-DD') + ' ~ '+ picker.endDate.format('YYYY-MM-DD'));
												$('#start_date').val(picker.startDate.format('YYYY-MM-DD'));
												$('#end_date').val(picker.endDate.format('YYYY-MM-DD'));
											}	
										});
										
										// When i click cancel button
										$('#select_date').on('cancel.daterangepicker', function(ev, picker) {
											$(this).val('');
											$('#start_date').val("");
											$('#end_date').val("");
										});
									</script>
                                    
								</div>
								
								
                                <div class="cart-order_detail cart-col">
                                    <div class="row">
                                        <span class="col-6 col-sm-6 cart__subtotal-title" style="height: 30px;"><strong>결제수단</strong></span>
                                        <span>
                                        	<input type="radio" value="card" name="method">
                                        	&nbsp;&nbsp;
                                        	<i class="fa-regular fa-credit-card fa-lg" ></i>&nbsp;신용카드  
                                        	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                        	
                                        	<input type="radio" value="kakao" name="method">&nbsp;
                                        	<img src="resources/assets/images/kakaopay.png" alt="카카오페이" width="52px"/>&nbsp;카카오페이
                                        </span>
                                    </div>
                                    <br>
                                    <div class="row">
                                        <span class="col-6 col-sm-6 cart__subtotal-title"><strong>결제금액</strong></span>
                                        <span class="col-6 col-sm-6 cart__subtotal-title cart__subtotal text-end"><span class="money">$735.00</span></span>
                                    </div>
                                    <br>
                                    <p class="cart__shipping pt-0 m-0 fst-normal freeShipclaim"><i class="me-1 align-middle icon an an-truck-l"></i><b>무료배송</b></p>
                                    <div class="customCheckbox cart_tearm">
                                        <input type="checkbox" value="allen-vela" id="cart_tearm">
                                        <label for="cart_tearm">모든 결제사항을 확인했습니다</label>
                                    </div>
                                    <input type="button" class="btn rounded product-form__cart-submit mb-0"  value="결제하기" onclick="sub()">
                                    <div class="paymnet-img text-center"><img src="resources/assets/images/safepayment.png" alt="Payment" /></div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!--End Cart Page-->
                </div>
                <!--End Main Content-->
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


