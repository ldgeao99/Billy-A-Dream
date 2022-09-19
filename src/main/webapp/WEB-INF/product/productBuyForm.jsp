<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@include file="../member/categoryTop.jsp" %>


<script src="https://kit.fontawesome.com/75769dc150.js" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
	$(function() {
		$('#buyDate').html("<font color=red>선택 안함</font>");
		$('#TotalPrice').html("<font color=red>0원</font>");
		
		
	})
	
<!-- 결제창에서 달력사용 -->

</script>


<!--Body Container-->
            <div id="page-content">
                <!--Collection Banner-->
                <div class="collection-header">
                    <div class="collection-hero">
                        <div class="collection-hero__image"></div>
                        <div class="collection-hero__title-wrapper container">
                            <h1 class="collection-hero__title">결제하기</h1>
                            <div class="breadcrumbs text-uppercase mt-1 mt-lg-2"><a href="home" title="Back to the home page">홈</a><span>|</span><span class="fw-bold">결제하기</span></div>
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
                                <table class="align-middle">
                                    <thead class="cart__row cart__header small--hide">
                                        <tr>
                                            <th class="action">&nbsp;</th>
                                            <th colspan="2" class="text-start">상품명</th>
                                            <th class="text-center">가격</th>
                                            <th class="text-center">구매기간</th>
                                            <th class="text-center">총합</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr class="cart__row border-bottom line1 cart-flex border-top">
                                            <td></td>
                                            <td class="cart__image-wrapper cart-flex-item">
                                                <a href="productdetail.prd?no=${pb.no }"><img class="cart__image blur-up lazyload" data-src="<%=request.getContextPath()%>/resources/${pb.images}" src="<%=request.getContextPath()%>/resources/${pb.images} alt="${pb.name }" width="80" /></a>
                                            </td>
                                            <td class="cart__meta small--text-left cart-flex-item">
                                                <div class="list-view-item__title">
                                                    <a href="product-layout1.html">${pb.name }</a>
                                                </div>
                                                <div class="cart__meta-text">
                                                   수량: 1
                                                </div>
                                            </td>
                                            <td class="cart__price-wrapper cart-flex-item text-center small--hide">
                                                <span class="money"><fmt:formatNumber pattern="###,###" value="${pb.discounted_day_price}" var="price"/>${ price} 원 / 일</span>
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
                                    <h5>주문 상세</h5>
                                    <form class="estimate-form pt-1" action="#" method="post">
                                    </form>
                                </div>
                                <div class="cart-note mb-4 cart-col">
                                    <h5>구매기간 설정</h5>
                                    <!-- 구매기간 달력 집어넣기 -->
                                </div>
                                <div class="cart-order_detail cart-col">
                                    <div class="row">
                                        <span class="col-6 col-sm-6 cart__subtotal-title"><strong>결제금액</strong></span>
                                        <span class="col-6 col-sm-6 cart__subtotal-title cart__subtotal text-end"><span class="money">$735.00</span></span>
                                    </div>
                                    <p class="cart__shipping pt-0 m-0 fst-normal freeShipclaim"><i class="me-1 align-middle icon an an-truck-l"></i><b>무료배송</b></p>
                                    <div class="customCheckbox cart_tearm">
                                        <input type="checkbox" value="allen-vela" id="cart_tearm">
                                        <label for="cart_tearm">모든 결제사항을 확인했습니다</label>
                                    </div>
                                    <a href="checkout-style1.html" id="cartCheckout" class="btn btn--small-wide rounded my-4 checkout">결제하기</a>
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