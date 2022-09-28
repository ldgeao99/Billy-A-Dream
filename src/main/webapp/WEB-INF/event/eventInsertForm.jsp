<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../common/common.jsp" %>
<%@include file="../member/commonTop.jsp" %>
<%@page import="event.model.EventBean"%>
                <!--Container-->
                 <div id="page-content">   
                <!--Collection Banner-->
                
                <div class="collection-header">
                    <div class="collection-hero">
                        <div class="collection-hero__image"></div>
                        <div class="collection-hero__title-wrapper container">
                            <h2 style="font-family: 'Poppins',Arial,Tahoma !important; font-weight: 700!important; font-size:25px;color: black; margin-bottom:0px">이벤트 게시판 등록</h2>
                        </div>
                    </div>
                </div>

                <!--Container-->
                <div class="container" align="center">
                    <div >
                        <!--Sidebar-->
                        <!--End Sidebar-->

                        <!--Main Content-->
                        <div class="col-12 col-sm-12 col-md-12 col-lg-9 main-col">
                            <div class="article"> 
                                <ul class="publish-detail d-flex-wrap mb-4 pt-1">                      
                                    <li><i class="icon an an-clock-r"></i><time datetime="2022-09-18">2022-09-18</time></li>
                                    <li><i class="icon an an-user-al"></i><span class="clr-555 me-1">Posted by:</span>관리자</li>
                                    <li><i class="icon an an-comments-l"></i>방금전</li>
                                </ul>
                              
                          



 
<style>
     .err{
          font-size: 10px;
          font-weight: bold;
          color: red;
     }


</style>


   
   

<b>이벤트 글쓰기</b>
	<br>
	<form:form commandName="event" method="post" action="insert.evt" enctype="multipart/form-data">
		<table width="430" border="1" cellspacing="0" cellpadding="0" align="center">
			
			<tr>
				<td width="100"  align="center">제 목</td>
				<td width="330" align="left"><input type="text" size="50"
					maxlength="50" name="title" value="이벤트 진행중입니다">
					<form:errors cssClass="err" path="title"/></td>
			</tr>
			<tr>
				<td width="100"  align="center">작성자</td>
				<td width="330" align="left">
				<input type="text" size="30"maxlength="10" name="writer" value="관리자" readonly>
					<form:errors cssClass="err" path="writer"/></td>
			</tr>

			<tr>
				<td width="100"  align="center">이벤트날짜</td>
				<td width="330" align="left"><input type="text" size="50"
					maxlength="30" name="eventdate" value="2022-09-16">
					<form:errors cssClass="err" path="eventdate"/></td>
			</tr>
			
			<tr>
				<td width="100"  align="center">이벤트이미지</td>
				<td width="330" align="left">
				<input type="file" size="50" maxlength="30" name="upload" id="eventImage" value="${event.eventImage }">
				<form:errors cssClass="err" path="eventImage"/></td>
			</tr>
			<tr>
				<td width="100" align="center">내 용</td>
				<td width="330" align="left">
				<textarea name="write" id="abc" rows="13" cols="50">이벤트 시작합니다</textarea>
						<form:errors cssClass="err" path="write"/></td>
			</tr>
			<tr>
				<td colspan=2  align="center" height="30">
					<input type="submit" value="글쓰기"> 
					<input type="button" value="목록보기" OnClick="window.location='list.evt?pageNumber=${pageNumber }'">
				</td>
			</tr>
		</table>
	</form:form>
                                
                                <hr>
                                <!-- Article Social -->
                                <div class="social-sharing d-flex-center">
                                    <a href="#" class="d-flex-center btn btn-link btn--share share-facebook" data-bs-toggle="tooltip" data-bs-placement="top" title="Share on Facebook"><i class="icon an an-facebook"></i><span class="share-title">Facebook</span></a>
                                    <a href="#" class="d-flex-center btn btn-link btn--share share-twitter" data-bs-toggle="tooltip" data-bs-placement="top" title="Tweet on Twitter"><i class="icon an an-twitter"></i><span class="share-title">Tweet</span></a>
                                    <a href="#" class="d-flex-center btn btn-link btn--share share-pinterest" data-bs-toggle="tooltip" data-bs-placement="top" title="Pin on Pinterest"><i class="icon an an-pinterest-p"></i> <span class="share-title">Pin it</span></a>
                                    <a href="#" class="d-flex-center btn btn-link btn--share share-linkedin" data-bs-toggle="tooltip" data-bs-placement="top" title="Share on Linkedin"><i class="icon an an-linkedin"></i><span class="share-title">Linkedin</span></a>
                                    <a href="#" class="d-flex-center btn btn-link btn--share share-email" data-bs-toggle="tooltip" data-bs-placement="top" title="Share by Email"><i class="icon an an-envelope-l"></i><span class="share-title">Email</span></a>
                                </div>
                                <!-- Article Nav -->
                                <div class="blog-nav d-flex-center mt-4 clearfix">
                                    <div class="nav-prev me-auto"><a href="#"><i class="align-middle me-2 icon an an-long-arrow-alt-left"></i><span>Previous post</span></a></div>
                                    <div class="nav-next ms-auto"><a href="#"><span>Next post</span><i class="align-middle ms-2 icon an an-long-arrow-alt-right"></i></a></div>
                                </div>
                                <hr>
                                <!-- Article Comment -->
                                <div class="blog-comment">
                               
                                <!--End Return to Posts-->
                            </div>
                        </div>
                        <!--End Main Content-->
                    </div>
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