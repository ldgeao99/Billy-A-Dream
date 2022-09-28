<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@include file="../common/common.jsp" %>
<%@include file="../member/commonTop.jsp" %>
<%@page import="event.model.EventBean"%>

			 <!--Body Container-->
            <div id="page-content" align="center">   
                <!--Collection Banner-->
                
                <div class="collection-header">
                    <div class="collection-hero">
                        <div class="collection-hero__image"></div>
                        <div class="collection-hero__title-wrapper container">
                            <h2 style="font-family: 'Poppins',Arial,Tahoma !important; font-weight: 700!important; font-size:25px;color: black; margin-bottom:0px">이벤트</h2>
                        </div>
                    </div>
                </div>
                <!--Container-->
                <div class="container" align="center">
                    <div  align="center">
                        <!--Sidebar-->
                        <!--End Sidebar-->

                        <!--Main Content-->
                        <div class="col-12 col-sm-12 col-md-12 col-lg-9 main-col" align="center">
                            <div class="article" align="center"> 
                              <img src="assets/images/elements/header/header-6.png" alt="header" title="">
                                </ul>
 <style>
  .td{
       color="#0054FF";
  }
 
 </style>     
      
                          

<b><strong>이벤트 목록(이벤트 진행 수 : ${totalCount })</strong></b> <c:if test="${id!='admin' }"> <a href="insert.evt">글쓰기</a></c:if>
 
<c:if test="${fn:length(lists) > 0}">
<form action="list.evt" method="get">
		<select name="whatColumn">
			<option value="subject">제목</option>
			<option value="writer">작성자</option>
		</select>
		<input type="text" name="keyword" >
		<input type="submit" value="검색"><br><br>
</form>
<tr>

	
<table border="1" width="700">
	
<c:forEach items="${lists }" var="event" varStatus="i">

          	<tr>
     		 <td align="center" width="375" colspan="3"><img src="${pageContext.request.contextPath}/resources/assets/images/${event.eventImage}"
         		OnClick=" location.href ='usereventContent.evt?pageNumber=${pageInfo.pageNumber}&num=${event.num }'"></td>
  		 	</tr>
			<tr>	
				<td align="center" >
				<h3><a href="usereventContent.evt?num=${event.num }&pageNumber=${pageInfo.pageNumber}" >${event.title }</a></h3>
			</td>
			<tr>
			<td align="center">
				<a href="usereventContent.evt?num=${event.num }&pageNumber=${pageInfo.pageNumber}" >${event.writer }</td>
			</tr>
					
</c:forEach>
</table>
${pageInfo.pagingHtml }	
</c:if>
                                <hr>
                                <!-- Article Social -->
                                <div class="social-sharing d-flex-center">
                         <span id="site-scroll" style="display: none;">
<i class="icon an an-chevron-up"></i></span>

                                   
                                   
                                </div>
                                <!-- Article Nav -->
                                <div class="blog-nav d-flex-center mt-4 clearfix">
                                    <div class="nav-prev me-auto"><a href="#"><i class="align-middle me-2 icon an an-long-arrow-alt-left"></i><span>페이지 위로</span></a></div>
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