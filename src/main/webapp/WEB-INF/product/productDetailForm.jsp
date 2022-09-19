<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@include file = "../member/categoryTop.jsp" %>

<style>
	.bigtext{
		font-weight: bold;
		font-size: 15px;
	}
</style>

<!-- 오른쪽 상단 아이콘 관련 -->
<script src="https://kit.fontawesome.com/75769dc150.js" crossorigin="anonymous"></script>
<script type="text/javascript">
	function like(){
		if($('#id').val()==""){
			if(confirm("로그인이 필요한 페이지입니다. \n 로그인 하시겠습니까?")){
				location.href="login.mb";	
			}
			return false;
		}
		else{
			if(confirm("상품을 관심목록에 추가하시겠습니까?")){ // 관심목록에 추가하는 작업
				$.ajax({
					type : 'post',
					url : "addlike.mb",
					data : {
						id : $('#id').val(),
						no : $('#no').val(),
					},
					success : function(data) {
						if($.trim(data)=='yes'){
							alert("관심목록에 추가하였습니다")
						}
						else if($.trim(data)== 'no'){
							alert("이미 목록에 존재하는 상품입니다")
						}
					}//success

				});//ajax
			}
			else{
				return false;
			}
		}
	}
	
	function buy(){
		if($('#id').val()==""){
			if(confirm("로그인이 필요한 페이지입니다. \n 로그인 하시겠습니까?")){
				location.href="login.mb";	
			}
			return false;
		}
		else{
			if(confirm("상품을 구매하시겠습니까?")){
				buyForm.submit();
			}
			else{
				return false;
			}
		}
	}

	/* $(function(){
		  $('.slick-slide slick-current slick-active').css("style","width:100px")
		  $('.slick-list draggable').css("style","width:100px")
		
	}) */
	
</script>
			
            <!--Body Container-->
            <div id="page-content">   
                <!--Breadcrumbs-->
                <div class="breadcrumbs-wrapper text-uppercase">
                    <div class="container">
                        <div class="breadcrumbs"><a href="index.html" title="Back to the home page">홈</a><span>|</span><span class="fw-bold">상세페이지</span></div>
                    </div>
                </div>
                <!--End Breadcrumbs-->


                <!--Main Content-->
                <div class="container">
                    <!--Product Content-->
                    <div class="product-single">
                        <div class="row">
                            <div class="col-lg-6 col-md-6 col-sm-12 col-12">
                                <div class="product-details-img thumb-left clearfix d-flex-wrap mb-3 mb-md-0">
                                    <div class="product-thumb">
                                        <div id="gallery" class="product-dec-slider-2 product-tab-left">
                                            
                                            <!-- 이미지 들어감 -->
                                            <c:forEach var="productimages" items="${images }">
                                            <a data-image="<%=request.getContextPath()%>/resources/${productimages}" data-zoom-image="<%=request.getContextPath()%>/resources/${productimages}" class="slick-slide slick-cloned active">
                                                <img class="blur-up lazyload" width="100px" height="120px" data-src="<%=request.getContextPath()%>/resources/${productimages}" src="<%=request.getContextPath()%>/resources/${productimages}" alt="product" />
                                            </a>
                                            </c:forEach>
                                        </div>
                                    </div>
                                    <div class="zoompro-wrap product-zoom-right">
                                        <div class="zoompro-span"><img id="zoompro" class="zoompro" width = "1000" height="1280" src="<%=request.getContextPath()%>/resources/${images[0]}" data-zoom-image="<%=request.getContextPath()%>/resources/${images[0]}" alt="product" /></div>
                                        <div class="product-buttons">
                                            <a href="#" class="btn rounded prlightbox"><i class="icon an an-expand-l-arrows"></i><span class="tooltip-label">Zoom Image</span></a>
                                        </div>
                                    </div>
                                    <div class="lightboximages">
                                    	 <c:forEach var="images" items="${images }">
		                                        <a href="<%=request.getContextPath()%>/resources/${images}" data-size="1000x1280"></a>
                                            </c:forEach>
                                    </div>
                                </div>                               
                            </div>

                            <div class="col-lg-6 col-md-6 col-sm-12 col-12">
                                <!-- Product Info -->
                                <div class="product-single__meta">
                                    <h1 class="product-single__title">${pb.name }</h1>
                                    
                                    <!-- Product Reviews -->
                                    <!-- Product Info -->
                                    <br>
						<div class="product-info">
							<p class="product-sku">${pb.lcategory_no}<span class="variant-sku">${pb.scategory_no }</span></p>
							<p>
							<i class="fa-regular fa-clock"></i>&nbsp;
							<fmt:parseDate var="formattedDay" value="${pb.create_day }" pattern="yyyy-MM-dd" />
							<fmt:formatDate var="newformattedDay" value="${formattedDay }" pattern="yyyy-MM-dd" />${newformattedDay }
							</p>
						</div>
						<hr>
						<!-- End Product Info -->
							<div>
								<div class="bigtext"><i class="fa-solid fa-boxes-stacked"></i>&nbsp;&nbsp;구성품</div>
								<div>${pb.components }</div>
							</div>
							<br>
							<div>
								<div class="bigtext"><i class="fa-solid fa-location-dot"></i>&nbsp;&nbsp;거래지역</div><div>${pb.add1_sido } ${pb.add2_sigungu } ${pb.add3_eubmyeon } ${pb.add4_donglee }</div>
							</div>

                                    <!-- Product Price -->
                                    <div  align="right">
                                            <span style="font-weight: bold; font-size: 20px;"><fmt:formatNumber pattern="###,###" value="${pb.discounted_day_price }" var="price"/>${ price} 원 / 일</span>   
                                    </div>
                                    <!-- End Product Price -->  
                                </div>
                                <!-- End Product Info -->
                                <!-- Product Form -->
                                <form method="get" action="buy.prd" class="product-form hidedropdown" name="buyForm">
                                    <!-- Swatches Color/Size -->
                                    <!-- Product Action -->
                                    <div class="product-action w-100 clearfix">
                                    <i class="fa-solid fa-heart"></i> 관심  ${pb.like_count } &nbsp;&nbsp; <i class="fa-regular fa-eye"></i> 조회 ${pb.view_count }<br><br>
                                        <div class="row g-2">
                                            <div class="col-12 col-sm-6 col-md-6 col-lg-6">
                                                <div class="product-form__item--submit">
                                                    <input type="hidden" name="id" id="id" value="${id }">
                                                    <input type="hidden" name="no" id="no" value="${pb.no }">
                                                    <button type="button" name="add" class="btn rounded product-form__cart-submit mb-0" onclick="like()"><span>찜하기</span></button>
                                                </div>
                                            </div>
                                            <div class="col-12 col-sm-6 col-md-6 col-lg-6">
                                                <div class="product-form__item--buyit clearfix">
                                                    <button type="submit" class="btn rounded btn-outline-primary proceed-to-checkout" onclick="buy()">구매하기</button>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="agree-check customCheckbox clearfix d-none">
                                            <input id="prTearm" name="tearm" type="checkbox" value="tearm" required />
                                            <label for="prTearm">I agree with the terms and conditions</label>
                                        </div>
                                    </div>
                                    <!-- End Product Action -->
                                    <!-- Product Info link -->
                                    <p class="infolinks d-flex-center mt-2 mb-3">
                                        <a class="btn add-to-wishlist d-none" href="my-wishlist.html"><i class="icon an an-heart-l me-1" aria-hidden="true"></i> <span>Add to Wishlist</span></a>
                                    </p>
                                    <!-- End Product Info link -->
                                </form>
                                <!-- End Product Form -->
                            </div>
                        </div>

                        <!--Product Tab vertical-->
                        <div class="row tab-vertical-style mt-3 mt-md-5">
                            <div class="col-12 col-sm-3 mb-2 sm-md-0">
                                <div class="nav flex-column nav-pills" id="vertical-tab" role="tablist" aria-orientation="vertical">
                                    <a class="nav-link active" id="description-tab" data-bs-toggle="pill" href="#description" role="tab" aria-controls="description" aria-selected="true">상세설명</a>
                                    <a class="nav-link" id="reviewt-tab" data-bs-toggle="pill" href="#reviewt" role="tab" aria-controls="reviewt" aria-selected="false">상품 후기</a>
                                    <a class="nav-link" id="reviewt-tab" data-bs-toggle="pill" href="#sellerProduct" role="tab" aria-controls="reviewt" aria-selected="false">판매자 상품</a>
                                </div>
                            </div>
                            <div class="col-12 col-sm-9">
                                <div class="tab-content" id="vertical-tabContent">
                                    <div class="tab-pane fade show active" id="description" role="tabpanel" aria-labelledby="description-tab">
                                        <div class="product-description">
                                             <h4 class="spr-form-title text-uppercase mb-3">제품 상세설명</h4>
                                                    <div class="spr-header clearfix d-flex-center justify-content-between">
                                                    </div>
                                                    ${pb.description }
                                        </div>
                                    </div>
                                    <div class="tab-pane fade" id="reviewt" role="tabpanel" aria-labelledby="reviewt-tab">
                                        <div class="" id="reviews">
                                            <div class="row">
                                                <div class="col-12 col-sm-12 col-md-12 col-lg-12">
                                                    <div class="spr-header clearfix d-flex-center justify-content-between">
                                                        <div class="product-review d-flex-center me-auto">
                                                            <a class="reviewLink" href="#"><i class="icon an an-star"></i><i class="icon an an-star mx-1"></i><i class="icon an an-star"></i><i class="icon an an-star mx-1"></i><i class="icon an an-star-o"></i></a>
                                                            <span class="spr-summary-actions-togglereviews ms-2">Based on 6 reviews 234</span>
                                                        </div>
                                                        <div class="spr-summary-actions mt-3 mt-lg-0">
                                                            <a href="#" class="spr-summary-actions-newreview write-review-btn btn rounded"><i class="icon an-1x an an-pencil-alt me-2"></i>리뷰 작성하기</a>
                                                        </div>
                                                    </div>

                                                    <form method="post" action="#" class="product-review-form new-review-form mb-4">
                                                        <h4 class="spr-form-title text-uppercase">Write A Review</h4>
                                                        <fieldset class="spr-form-contact">
                                                            <div class="spr-form-contact-name form-group">
                                                                <label class="spr-form-label" for="nickname">Name <span class="required">*</span></label>
                                                                <input class="spr-form-input spr-form-input-text" id="nickname" type="text" name="name" placeholder="John smith" required />
                                                            </div>
                                                            <div class="spr-form-contact-email form-group">
                                                                <label class="spr-form-label" for="email">Email <span class="required">*</span></label>
                                                                <input class="spr-form-input spr-form-input-email " id="email" type="email" name="email" placeholder="info@example.com" required />
                                                            </div>
                                                            <div class="spr-form-review-rating form-group">
                                                                <label class="spr-form-label">Rating</label>
                                                                <div class="product-review pt-1">
                                                                    <div class="review-rating">
                                                                        <input type="radio" name="rating" id="rating-5"><label for="rating-5"></label>
                                                                        <input type="radio" name="rating" id="rating-4"><label for="rating-4"></label>
                                                                        <input type="radio" name="rating" id="rating-3"><label for="rating-3"></label>
                                                                        <input type="radio" name="rating" id="rating-2"><label for="rating-2"></label>
                                                                        <input type="radio" name="rating" id="rating-1"><label for="rating-1"></label>
                                                                    </div>
                                                                    <a class="reviewLink d-none" href="#"><i class="icon an an-star-o"></i><i class="icon an an-star-o mx-1"></i><i class="icon an an-star-o"></i><i class="icon an an-star-o mx-1"></i><i class="icon an an-star-o"></i></a>
                                                                </div>
                                                            </div>
                                                            <div class="spr-form-review-title form-group">
                                                                <label class="spr-form-label" for="review">Review Title </label>
                                                                <input class="spr-form-input spr-form-input-text " id="review" type="text" name="review" placeholder="Give your review a title" />
                                                            </div>
                                                            <div class="spr-form-review-body form-group">
                                                                <label class="spr-form-label" for="message">Body of Review <span class="spr-form-review-body-charactersremaining">(1500) characters remaining</span></label>
                                                                <div class="spr-form-input">
                                                                    <textarea class="spr-form-input spr-form-input-textarea " id="message" name="message" rows="5" placeholder="후기 작성"></textarea>
                                                                </div>
                                                            </div>
                                                        </fieldset>
                                                        <div class="spr-form-actions clearfix">
                                                            <input type="submit" class="btn btn-primary rounded spr-button spr-button-primary" value="Submit Review">
                                                        </div>
                                                    </form>
                                                </div>
                                                <div class="col-12 col-sm-12 col-md-12 col-lg-12">
                                                    <div class="spr-reviews">
                                                        <h4 class="spr-form-title text-uppercase mb-3">상품 후기</h4>
                                                        <div class="review-inner">
                                                            <div class="spr-review">
                                                                <div class="spr-review-header">
                                                                    <span class="product-review spr-starratings"><span class="reviewLink"><i class="icon an an-star"></i><i class="icon an an-star mx-1"></i><i class="icon an an-star"></i><i class="icon an an-star mx-1"></i><i class="icon an an-star-o"></i></span></span>
                                                                    <h5 class="spr-review-header-title mt-1">제목</h5>
                                                                    <span class="spr-review-header-byline">날짜</span>
                                                                </div>
                                                                <div class="spr-review-content">
                                                                    <p class="spr-review-content-body">내용</p>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="tab-pane fade" id="sellerProduct" role="tabpanel" aria-labelledby="reviewt-tab">
                                        <div class="" id="reviews">
                                            <div class="row">
                                                <div class="col-12 col-sm-12 col-md-12 col-lg-12">
                                                	 <h4 class="spr-form-title text-uppercase mb-3">${mb.name } 님의 판매상품</h4>
                                                    <div class="spr-header clearfix d-flex-center justify-content-between">
                                                    </div>
                                                </div>
                                                <!-- ======================================================================================================= -->
<!-- ======================================================================================================= -->
<!-- ======================================================================================================= -->
							 <!-- Products-->
                <!-- Grid Product -->
						<div class="grid-products grid--view-items wishlist-grid mt-4">
							<div class="row">
								<c:if test="${fn:length(lists)==0 }">
									<div align="center">
									<i class="fa-solid fa-store-slash fa-5x"></i></i><br><br>
									 판매자가 판매하는 다른상품이 없습니다</div>
								</c:if>
								
								<!-- 반복문 시작 -->
								<c:if test="${fn:length(lists)!=0 }">
								<c:forEach var="p" items="${ lists}">
								<div class="col-6 col-sm-6 col-md-3 col-lg-3 item position-relative">
									<input type="hidden" name="no" id="no"value="${p.no }">
									<!-- Product Image -->
									<div class="product-image">
										<!-- Product Image -->
										<a href="productdetail.prd?no=${p.no }" class="product-img"> <!-- image -->
											<img class="primary blur-up lazyload"
											data-src="<%=request.getContextPath()%>/resources/${p.images}"
											src="<%=request.getContextPath()%>/resources/${p.images}"
											alt="product" title="product" /> <!-- End image --> <!-- Hover image -->
											<img class="hover blur-up lazyload"
											data-src="<%=request.getContextPath()%>/resources/${p.images}"
											src="<%=request.getContextPath()%>/resources/${p.images}"
											alt="product" title="product" /> <!-- End hover image --> <!-- product label -->
										</a>
										<!-- End Product Image -->
									</div>
									<!-- End Product Image -->

									<!-- Product Details -->
									<div class="product-details text-center">
										<!-- Product Name -->
										<div class="product-name">
											<a href="product-layout1.html">${p.name}</a>
										</div>
										<!-- End Product Name -->
										<!-- Product Price -->
										<div class="product-price">
											<span class="price"><fmt:formatNumber pattern="###,###" value="${p.discounted_day_price}" var="price"/>${ price} 원 / 일</span>
										</div>
										<!-- End Product Price -->
										<!-- Product Button -->
									</div>
									<!-- End Product Details -->
								
								</div>
								</c:forEach>
								</c:if>
								<!--프로덕트 끝  -->
							</div>
						</div>
						<!-- End Grid Product-->

									<!-- ======================================================================================================= -->
<!-- ======================================================================================================= -->
<!-- ======================================================================================================= -->
                

               
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!--Product Tab vertical-->
                    </div>
                    <!--Product Content-->

                    <!--End Product Nav-->
                </div>
                <!--End Container-->

                <!-- Products-->
                <section class="section product-slider pb-0">
                    <div class="container">
                        <div class="row">
                            <div class="section-header col-12">
                                <h2 class="text-transform-none">유사한 상품</h2>
                            </div>
                        </div>
                        
                        <!-- 체크 -->
                        <div class="productSlider grid-products">
                            <div class="item">
                                <!--Start Product Image-->
                                <div class="product-image">
                                    <!--Start Product Image-->
                                    <a href="product-layout1.html" class="product-img">
                                        <!-- image -->
                                        <img class="primary blur-up lazyload" data-src="resources/assets/images/products/product-1.jpg" src="resources/assets/images/products/product-1.jpg" alt="" title="">
                                        <!-- End image -->
                                        <!-- Hover image -->
                                        <img class="hover blur-up lazyload" data-src="resources/assets/images/products/product-1-1.jpg" src="resources/assets/images/products/product-1-1.jpg" alt="" title="">
                                        <!-- End hover image -->
                                        <!-- product label -->
                                        <div class="product-labels"><span class="lbl on-sale">50% Off</span></div>
                                        <!-- End product label -->
                                    </a>
                                    <!--End Product Image-->

                                    <!--Product Button-->
                                    <div class="button-set style0 d-none d-md-block">
                                        <ul>
                                            <!--Cart Button-->
                                            <li><a class="btn-icon btn cartIcon pro-addtocart-popup" href="#pro-addtocart-popup"><i class="icon an an-cart-l"></i> <span class="tooltip-label top">Add to Cart</span></a></li>
                                            <!--End Cart Button-->
                                            <!--Quick View Button-->
                                            <li><a class="btn-icon quick-view-popup quick-view" href="javascript:void(0)" data-toggle="modal" data-target="#content_quickview"><i class="icon an an-search-l"></i> <span class="tooltip-label top">Quick View</span></a></li>
                                            <!--End Quick View Button-->
                                            <!--Wishlist Button-->
                                            <li><a class="btn-icon wishlist add-to-wishlist" href="my-wishlist.html"><i class="icon an an-heart-l"></i> <span class="tooltip-label top">Add To Wishlist</span></a></li>
                                            <!--End Wishlist Button-->
                                            <!--Compare Button-->
                                            <li><a class="btn-icon compare add-to-compare" href="compare-style2.html"><i class="icon an an-sync-ar"></i> <span class="tooltip-label top">Add to Compare</span></a></li>
                                            <!--End Compare Button-->
                                        </ul>
                                    </div>
                                    <!--End Product Button-->
                                </div>
                                <!--End Product Image-->
                                <!--Start Product Details-->
                                <div class="product-details text-center">
                                    <!--Product Name-->
                                    <div class="product-name text-uppercase">
                                        <a href="product-layout1.html">Martha Knit Top</a>
                                    </div>
                                    <!--End Product Name-->
                                    <!--Product Price-->
                                    <div class="product-price">
                                        <span class="old-price">$199.00</span>
                                        <span class="price">$219.00</span>
                                    </div>
                                    <!--End Product Price-->
                                    <!--Product Review-->
                                    <div class="product-review d-flex align-items-center justify-content-center"><i class="an an-star"></i> <i class="an an-star"></i> <i class="an an-star"></i> <i class="an an-star"></i> <i class="an an-star-o"></i></div>
                                    <!--End Product Review-->
                                    <!--Color Variant -->
                                    <ul class="image-swatches swatches">
                                        <li class="rounded blue medium"><span class="swacth-btn"></span><span class="tooltip-label">Blue</span></li>
                                        <li class="rounded pink medium"><span class="swacth-btn"></span><span class="tooltip-label">Pink</span></li>
                                        <li class="rounded red medium"><span class="swacth-btn"></span><span class="tooltip-label">Red</span></li>
                                    </ul>
                                    <!-- End Variant -->
                                </div>
                                <!--End Product Details-->
                            </div>
                            <div class="item">
                                <!--Start Product Image-->
                                <div class="product-image">
                                    <!--Start Product Image-->
                                    <a href="product-layout1.html" class="product-img">
                                        <!-- image -->
                                        <img class="primary blur-up lazyload" data-src="resources/assets/images/products/product-1.jpg" src="resources/assets/images/products/product-1.jpg" alt="" title="">
                                        <!-- End image -->
                                        <!-- Hover image -->
                                        <img class="hover blur-up lazyload" data-src="resources/assets/images/products/product-1-1.jpg" src="resources/assets/images/products/product-1-1.jpg" alt="" title="">
                                        <!-- End hover image -->
                                    </a>
                                    <!--End Product Image-->

                                    <!--Countdown Timer-->
                                    <div class="saleTime desktop" data-countdown="2024/10/01"></div>
                                    <!--End Countdown Timer-->

                                    <!--Product Button-->
                                    <div class="button-set style0 d-none d-md-block">
                                        <ul>
                                            <!--Cart Button-->
                                            <li><a class="btn-icon btn cartIcon pro-addtocart-popup" href="#pro-addtocart-popup"><i class="icon an an-cart-l"></i> <span class="tooltip-label top">Add to Cart</span></a></li>
                                            <!--End Cart Button-->
                                            <!--Quick View Button-->
                                            <li><a class="btn-icon quick-view-popup quick-view" href="javascript:void(0)" data-toggle="modal" data-target="#content_quickview"><i class="icon an an-search-l"></i> <span class="tooltip-label top">Quick View</span></a></li>
                                            <!--End Quick View Button-->
                                            <!--Wishlist Button-->
                                            <li><a class="btn-icon wishlist add-to-wishlist" href="my-wishlist.html"><i class="icon an an-heart-l"></i> <span class="tooltip-label top">Add To Wishlist</span></a></li>
                                            <!--End Wishlist Button-->
                                            <!--Compare Button-->
                                            <li><a class="btn-icon compare add-to-compare" href="compare-style2.html"><i class="icon an an-sync-ar"></i> <span class="tooltip-label top">Add to Compare</span></a></li>
                                            <!--End Compare Button-->
                                        </ul>
                                    </div>
                                    <!--End Product Button-->
                                </div>
                                <!--End Product Image-->
                                <!--Start Product Details-->
                                <div class="product-details text-center">
                                    <!--Product Name-->
                                    <div class="product-name text-uppercase">
                                        <a href="product-layout1.html">Long Sleeve T-shirts</a>
                                    </div>
                                    <!--End Product Name-->
                                    <!--Product Price-->
                                    <div class="product-price">
                                        <span class="price">$199.00</span>
                                    </div>
                                    <!--End Product Price-->
                                    <!--Product Review-->
                                    <div class="product-review d-flex align-items-center justify-content-center"><i class="an an-star"></i> <i class="an an-star"></i> <i class="an an-star"></i><i class="an an-star"></i> <i class="an an-star"></i></div>
                                    <!--End Product Review-->
                                    <!-- Color Variant -->
                                    <ul class="swatches">
                                        <li class="swatch medium rounded black"><span class="tooltip-label">Black</span></li>
                                        <li class="swatch medium rounded navy"><span class="tooltip-label">Navy</span></li>
                                        <li class="swatch medium rounded purple"><span class="tooltip-label">Purple</span></li>
                                    </ul>
                                    <!-- End Variant -->
                                </div>
                                <!--End Product Details-->
                            </div>
                            <div class="item">
                                <!--Start Product Image-->
                                <div class="product-image">
                                    <!--Start Product Image-->
                                    <a href="product-layout1.html" class="product-img">
                                        <!-- image -->
                                        <img class="primary blur-up lazyload" data-src="resources/assets/images/products/product-1.jpg" src="resources/assets/images/products/product-1.jpg" alt="" title="">
                                        <!-- End image -->
                                        <!-- Hover image -->
                                        <img class="hover blur-up lazyload" data-src="resources/assets/images/products/product-1-1.jpg" src="resources/assets/images/products/product-1-1.jpg" alt="" title="">
                                        <!-- End hover image -->
                                    </a>
                                    <!--End Product Image-->
                                    <!--Product label-->

                                    <!--Product Button-->
                                    <div class="button-set style0 d-none d-md-block">
                                        <ul>
                                            <!--Cart Button-->
                                            <li><a class="btn-icon btn cartIcon pro-addtocart-popup" href="#pro-addtocart-popup"><i class="icon an an-cart-l"></i> <span class="tooltip-label top">Add to Cart</span></a></li>
                                            <!--End Cart Button-->
                                            <!--Quick View Button-->
                                            <li><a class="btn-icon quick-view-popup quick-view" href="javascript:void(0)" data-toggle="modal" data-target="#content_quickview"><i class="icon an an-search-l"></i> <span class="tooltip-label top">Quick View</span></a></li>
                                            <!--End Quick View Button-->
                                            <!--Wishlist Button-->
                                            <li><a class="btn-icon wishlist add-to-wishlist" href="my-wishlist.html"><i class="icon an an-heart-l"></i> <span class="tooltip-label top">Add To Wishlist</span></a></li>
                                            <!--End Wishlist Button-->
                                            <!--Compare Button-->
                                            <li><a class="btn-icon compare add-to-compare" href="compare-style2.html"><i class="icon an an-sync-ar"></i> <span class="tooltip-label top">Add to Compare</span></a></li>
                                            <!--End Compare Button-->
                                        </ul>
                                    </div>
                                    <!--End Product Button-->
                                </div>
                                <!--End Product Image-->
                                <!--Start Product Details-->
                                <div class="product-details text-center">
                                    <!--Product Name-->
                                    <div class="product-name text-uppercase">
                                        <a href="product-layout1.html">Button Up Top Black</a>
                                    </div>
                                    <!--End Product Name-->
                                    <!--Product Price-->
                                    <div class="product-price">
                                        <span class="price">$99.00</span>
                                    </div>
                                    <!--End Product Price-->
                                    <!--Product Review-->
                                    <div class="product-review d-flex align-items-center justify-content-center"><i class="an an-star"></i> <i class="an an-star"></i> <i class="an an-star-o"></i> <i class="an an-star-o"></i> <i class="an an-star-o"></i></div>
                                    <!--End Product Review-->
                                    <!--Color Variant -->
                                    <ul class="swatches">
                                        <li class="swatch medium rounded red"><span class="tooltip-label">red</span></li>
                                        <li class="swatch medium rounded orange"><span class="tooltip-label">orange</span></li>
                                        <li class="swatch medium rounded yellow"><span class="tooltip-label">yellow</span></li>
                                    </ul>
                                    <!-- End Variant -->
                                </div>
                                <!--End Product Details-->
                            </div>
                            <div class="item">
                                <!--Start Product Image-->
                                <div class="product-image">
                                    <!--Start Product Image-->
                                    <a href="product-layout1.html" class="product-img">
                                        <!-- image -->
                                        <img class="primary blur-up lazyload" data-src="resources/assets/images/products/product-1.jpg" src="resources/assets/images/products/product-1.jpg" alt="" title="">
                                        <!-- End image -->
                                        <!-- Hover image -->
                                        <img class="hover blur-up lazyload" data-src="resources/assets/images/products/product-1-1.jpg" src="resources/assets/images/products/product-1-1.jpg" alt="" title="">
                                        <!-- End hover image -->
                                    </a>
                                    <!--End Product Image-->

                                    <!--Product Button-->
                                    <div class="button-set style0 d-none d-md-block">
                                        <ul>
                                            <!--Cart Button-->
                                            <li><a class="btn-icon btn cartIcon pro-addtocart-popup" href="#pro-addtocart-popup"><i class="icon an an-cart-l"></i> <span class="tooltip-label top">Add to Cart</span></a></li>
                                            <!--End Cart Button-->
                                            <!--Quick View Button-->
                                            <li><a class="btn-icon quick-view-popup quick-view" href="javascript:void(0)" data-toggle="modal" data-target="#content_quickview"><i class="icon an an-search-l"></i> <span class="tooltip-label top">Quick View</span></a></li>
                                            <!--End Quick View Button-->
                                            <!--Wishlist Button-->
                                            <li><a class="btn-icon wishlist add-to-wishlist" href="my-wishlist.html"><i class="icon an an-heart-l"></i> <span class="tooltip-label top">Add To Wishlist</span></a></li>
                                            <!--End Wishlist Button-->
                                            <!--Compare Button-->
                                            <li><a class="btn-icon compare add-to-compare" href="compare-style2.html"><i class="icon an an-sync-ar"></i> <span class="tooltip-label top">Add to Compare</span></a></li>
                                            <!--End Compare Button-->
                                        </ul>
                                    </div>
                                    <!--End Product Button-->
                                </div>
                                <!--End Product Image-->
                                <!--Start Product Details-->
                                <div class="product-details text-center">
                                    <!--Product Name-->
                                    <div class="product-name text-uppercase">
                                        <a href="product-layout1.html">Sunset Sleep Scarf Top</a>
                                    </div>
                                    <!--End Product Name-->
                                    <!--Product Price-->
                                    <div class="product-price">
                                        <span class="price">$88.00</span>
                                    </div>
                                    <!--End Product Price-->
                                    <!--Product Review-->
                                    <div class="product-review d-flex align-items-center justify-content-center"><i class="an an-star"></i> <i class="an an-star-o"></i> <i class="an an-star-o"></i> <i class="an an-star-o"></i> <i class="an an-star-o"></i></div>
                                    <!--End Product Review-->
                                    <!-- Color Variant -->
                                    <ul class="image-swatches swatches">
                                        <li class="rounded yellow medium"><span class="swacth-btn"></span><span class="tooltip-label">Yellow</span></li>
                                        <li class="rounded blue medium"><span class="swacth-btn"></span><span class="tooltip-label">Blue</span></li>
                                        <li class="rounded pink medium"><span class="swacth-btn"></span><span class="tooltip-label">Pink</span></li>
                                        <li class="rounded red medium"><span class="swacth-btn"></span><span class="tooltip-label">Red</span></li>
                                    </ul>
                                    <!-- End Variant -->
                                </div>
                                <!--End Product Details-->
                            </div>
                            <div class="item">
                                <!--Start Product Image-->
                                <div class="product-image">
                                    <!--Start Product Image-->
                                    <a href="product-layout1.html" class="product-img">
                                        <!-- image -->
                                        <img class="primary blur-up lazyload" data-src="resources/assets/images/products/product-1.jpg" src="resources/assets/images/products/product-1.jpg" alt="" title="">
                                        <!-- End image -->
                                        <!-- Hover image -->
                                        <img class="hover blur-up lazyload" data-src="resources/assets/images/products/product-1-1.jpg" src="resources/assets/images/products/product-1-1.jpg" alt="" title="">
                                        <!-- End hover image -->
                                    </a>
                                    <!--End Product Image-->

                                    <!--Product Button-->
                                    <div class="button-set style0 d-none d-md-block">
                                        <ul>
                                            <!--Cart Button-->
                                            <li><a class="btn-icon btn cartIcon pro-addtocart-popup" href="#pro-addtocart-popup"><i class="icon an an-cart-l"></i> <span class="tooltip-label top">Add to Cart</span></a></li>
                                            <!--End Cart Button-->
                                            <!--Quick View Button-->
                                            <li><a class="btn-icon quick-view-popup quick-view" href="javascript:void(0)" data-toggle="modal" data-target="#content_quickview"><i class="icon an an-search-l"></i> <span class="tooltip-label top">Quick View</span></a></li>
                                            <!--End Quick View Button-->
                                            <!--Wishlist Button-->
                                            <li><a class="btn-icon wishlist add-to-wishlist" href="my-wishlist.html"><i class="icon an an-heart-l"></i> <span class="tooltip-label top">Add To Wishlist</span></a></li>
                                            <!--End Wishlist Button-->
                                            <!--Compare Button-->
                                            <li><a class="btn-icon compare add-to-compare" href="compare-style2.html"><i class="icon an an-sync-ar"></i> <span class="tooltip-label top">Add to Compare</span></a></li>
                                            <!--End Compare Button-->
                                        </ul>
                                    </div>
                                    <!--End Product Button-->   
                                </div>
                                <!--End Product Image-->
                                <!--Start Product Details-->
                                <div class="product-details text-center">
                                    <!--Product Name-->
                                    <div class="product-name text-uppercase">
                                        <a href="product-layout1.html">Backpack With Contrast Bow</a>
                                    </div>
                                    <!--End Product Name-->
                                    <!--Product Price-->
                                    <div class="product-price">
                                        <span class="price">$39.20</span>
                                    </div>
                                    <!--End Product Price-->
                                    <!--Product Review-->
                                    <div class="product-review d-flex align-items-center justify-content-center"><i class="an an-star"></i> <i class="an an-star"></i> <i class="an an-star"></i> <i class="an an-star"></i> <i class="an an-star-o"></i></div>
                                    <!--End Product Review-->
                                    <!-- Color Variant -->
                                    <ul class="swatches">
                                        <li class="swatch medium rounded black"><span class="tooltip-label">black</span></li>
                                        <li class="swatch medium rounded navy"><span class="tooltip-label">navy</span></li>
                                        <li class="swatch medium rounded darkgreen"><span class="tooltip-label">darkgreen</span></li>
                                    </ul>
                                    <!-- End Variant -->
                                </div>
                                <!--End Product Details-->
                            </div>
                        </div>
                    </div>
                </section>
                <!--End You May Also Like Products-->
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

            <!-- Shipping Popup-->
            <div id="ShippingInfo" class="mfpbox mfp-with-anim mfp-hide">
                <h5>DELIVERY</h5>
                <ul>
                    <li>Dispatch: Within 24 Hours</li>
                    <li>Free shipping across all products on a minimum purchase of $50.</li>
                    <li>International delivery time - 7-10 business days</li>
                    <li>Cash on delivery might be available</li>
                    <li>Easy 30 days returns and exchanges</li>
                </ul>
                <h5>RETURNS</h5>
                <p>If you do not like the product you can return it within 15 days - no questions asked. This excludes bodysuits, swimwear and clearance sale items. We have an easy and hassle free return policy. Please look at our Delivery &amp; Returns section for further information.</p>
            </div>
            <!-- End Shipping Popup-->

            <!--Product Enuiry Popup-->
            <div id="productInquiry" class="mfpbox mfp-with-anim mfp-hide">
                <div class="contact-form form-vertical p-lg-1">
                    <div class="page-title"><h3>Product Inquiry Popup</h3></div>
                    <form method="post" action="#" id="contact_form" class="contact-form">
                        <div class="formFeilds">
                            <div class="row">
                                <div class="col-12 col-sm-12 col-md-12 col-lg-12">
                                    <div class="form-group">
                                        <input type="text" id="ContactFormName" name="contact[name]" placeholder="Name" value="" required />
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-12 col-sm-12 col-md-6 col-lg-6">
                                    <div class="form-group">
                                        <input type="email" id="ContactFormEmail" name="contact[email]" placeholder="Email" value="" required />
                                    </div>
                                </div>
                                <div class="col-12 col-sm-12 col-md-6 col-lg-6">
                                    <div class="form-group">
                                        <input type="tel" id="ContactFormPhone" name="contact[phone]" pattern="[0-9\-]*" placeholder="Phone Number" value="" required />
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-12 col-sm-12 col-md-12 col-lg-12">
                                    <div class="form-group">
                                        <input type="text" id="ContactFormSubject" name="contact[subject]" placeholder="Subject" value="" required />
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-12 col-sm-12 col-md-12 col-lg-12">
                                    <div class="form-group">
                                        <textarea rows="8" id="ContactFormMessage" name="contact[body]" placeholder="Message" required></textarea>
                                    </div>
                                </div>  
                            </div>
                            <div class="row">
                                <div class="col-12 col-sm-12 col-md-12 col-lg-12">
                                    <input type="submit" class="btn rounded w-100" value="Send Message" />
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
            <!--End Product Enuiry Popup-->

            <!--Size Chart-->
            <div id="sizechart" class="mfpbox mfp-with-anim mfp-hide">
                <h4 class="fw-bold">Size Guide</h4>
                <p class="text-center">This is a standardised guide to give you an idea of what size you will need, however some brands may vary from these conversions.</p>
                <p><strong>Ready to Wear Clothing</strong></p>
                <div class="table-responsive px-1">
                    <table class="table table-bordered align-middle">
                        <tbody>
                            <tr>
                                <th>Size</th>
                                <th>XXS - XS</th>
                                <th>XS - S</th>
                                <th>S - M</th>
                                <th>M - L</th>
                                <th>L - XL</th>
                                <th>XL - XXL</th>
                            </tr>
                            <tr>
                                <td>UK</td>
                                <td>6</td>
                                <td>8</td>
                                <td>10</td>
                                <td>12</td>
                                <td>14</td>
                                <td>16</td>
                            </tr>
                            <tr>
                                <td>US</td>
                                <td>2</td>
                                <td>4</td>
                                <td>6</td>
                                <td>8</td>
                                <td>10</td>
                                <td>12</td>
                            </tr>
                            <tr>
                                <td>Italy (IT)</td>
                                <td>38</td>
                                <td>40</td>
                                <td>42</td>
                                <td>44</td>
                                <td>46</td>
                                <td>48</td>
                            </tr>
                            <tr>
                                <td>France (FR/EU)</td>
                                <td>34</td>
                                <td>36</td>
                                <td>38</td>
                                <td>40</td>
                                <td>42</td>
                                <td>44</td>
                            </tr>
                            <tr>
                                <td>Denmark</td>
                                <td>32</td>
                                <td>34</td>
                                <td>36</td>
                                <td>38</td>
                                <td>40</td>
                                <td>42</td>
                            </tr>
                            <tr>
                                <td>Russia</td>
                                <td>40</td>
                                <td>42</td>
                                <td>44</td>
                                <td>46</td>
                                <td>48</td>
                                <td>50</td>
                            </tr>
                            <tr>
                                <td>Germany</td>
                                <td>32</td>
                                <td>34</td>
                                <td>36</td>
                                <td>38</td>
                                <td>40</td>
                                <td>42</td>
                            </tr>
                            <tr>
                                <td>Japan</td>
                                <td>5</td>
                                <td>7</td>
                                <td>9</td>
                                <td>11</td>
                                <td>13</td>
                                <td>15</td>
                            </tr>
                            <tr>
                                <td>Australia</td>
                                <td>6</td>
                                <td>8</td>
                                <td>10</td>
                                <td>12</td>
                                <td>14</td>
                                <td>16</td>
                            </tr>
                            <tr>
                                <td>Korea</td>
                                <td>33</td>
                                <td>44</td>
                                <td>55</td>
                                <td>66</td>
                                <td>77</td>
                                <td>88</td>
                            </tr>
                            <tr>
                                <td>China</td>
                                <td>160/84</td>
                                <td>165/86</td>
                                <td>170/88</td>
                                <td>175/90</td>
                                <td>180/92</td>
                                <td>185/94</td>
                            </tr>
                            <tr>
                                <td><strong>Jeans</strong></td>
                                <td>24-25</td>
                                <td>26-27</td>
                                <td>27-28</td>
                                <td>29-30</td>
                                <td>31-32</td>
                                <td>32-33</td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <button title="Close (Esc)" type="button" class="mfp-close">×</button>
            </div>
            <!--End Size Chart-->

            <!-- Sticky Cart -->
            <div class="stickyCart">
                <div class="container">
                    <form method="post" action="#" id="stickycart-form" class="d-flex-center justify-content-center">
                        <div class="img"><img src="resources/assets/images/products/100x120.jpg" class="product-featured-img" alt="product" /></div>
                        <div class="sticky-title ms-2 ps-1 pe-5">Floral Crop Top</div>
                        <div class="stickyOptions rounded position-relative">
                            <div class="selectedOpt rounded">Red / S - <span class="money">$130.00</span></div>
                            <ul>
                                <li class="vrOpt" data-val="31677941252156" data-no="0">Red / S - $130.00</li>
                                <li class="vrOpt" data-val="31677941383228" data-no="1">Red / M - $130.00</li>
                                <li class="vrOpt" data-val="31677941514300" data-no="2">Green / L - $130.00</li>
                                <li class="vrOpt" data-val="31677941678140" data-no="3">Green / XL - $130.00</li>
                                <li class="vrOpt" data-val="31677941284924" data-no="4">Pink / S - $104.00</li>
                                <li class="vrOpt" data-val="31677941415996" data-no="5">Pink / M - $130.00</li>
                                <li class="vrOpt" data-val="31677941579836" data-no="6">Peach / L - $130.00</li>
                                <li class="vrOpt" data-val="31677941710908" data-no="7">Peach / XL - $130.00</li>
                                <li class="soldout">White / S - Sold out</li>
                                <li class="vrOpt" data-val="31677941481532" data-no="9">White / M - $130.00</li>
                                <li class="vrOpt" data-val="31677941612604" data-no="10">Blue / L - $130.00</li>
                                <li class="vrOpt" data-val="31677941776444" data-no="11">Blue / XL - $130.00</li>
                            </ul>
                        </div>
                        <select name="id" id="variantOptions1" class="product-form__variants selectbox no-js d-none ms-3">
                            <option selected="selected" value="31677941252156">Red / S</option>
                            <option value="31677941383228">Red / S</option>
                            <option value="31677941514300">Red / M</option>
                            <option value="31677941678140">Green / XL</option>
                            <option value="31677941284924">Pink / S</option>
                            <option value="31677941415996">Pink / M</option>
                            <option value="31677941579836">Peach / L</option>
                            <option value="31677941710908">Peach / XL</option>
                            <option disabled="disabled">White / S - Sold out</option>
                            <option value="31677941481532">White / M</option>
                            <option value="31677941612604">Blue / L</option>
                            <option value="31677941776444">Blue / XL</option>
                        </select>
                        <div class="qtyField mx-2" title="Quantity">
                            <a class="qtyBtn minus" href="javascript:void(0);"><i class="icon an an-minus-r" aria-hidden="true"></i></a>
                            <input type="text" id="quantity1" name="quantity" value="1" class="product-form__input qty rounded-0">
                            <a class="qtyBtn plus" href="javascript:void(0);"><i class="icon an an-plus-r" aria-hidden="true"></i></a>
                        </div>
                        <button type="submit" name="add" class="btn rounded btn-secondary product-form__cart-submit"><span>Add to cart</span></button>                    
                    </form>
                </div>
            </div>
            <!-- End Sticky Cart -->

            <!--Quickview Popup-->
            <div class="loadingBox"><div class="an-spin"><i class="icon an an-spinner4"></i></div></div>
            <div id="quickView-modal" class="mfp-with-anim mfp-hide">
                <button title="Close (Esc)" type="button" class="mfp-close">×</button>
                <div class="row">
                    <div class="col-12 col-sm-6 col-md-6 col-lg-6 mb-3 mb-md-0">
                        <!--Model thumbnail -->
                        <div id="quickView" class="carousel slide">
                            <!-- Image Slide carousel items -->
                            <div class="carousel-inner">
                                <div class="item carousel-item active" data-bs-slide-number="0">
                                    <img class="blur-up lazyload" data-src="resources/assets/images/products/product-1.jpg" src="resources/assets/images/products/product-1.jpg" alt="image" title="" />
                                </div>
                                <div class="item carousel-item" data-bs-slide-number="1">
                                    <img class="blur-up lazyload" data-src="resources/assets/images/products/product-1-1.jpg" src="resources/assets/images/products/product-1-1.jpg" alt="image" title="" />
                                </div>
                                <div class="item carousel-item" data-bs-slide-number="2">
                                    <img class="blur-up lazyload" data-src="resources/assets/images/products/product-1-1.jpg" src="resources/assets/images/products/product-1-1.jpg" alt="image" title="" />
                                </div>
                                <div class="item carousel-item" data-bs-slide-number="3">
                                    <img class="blur-up lazyload" data-src="resources/assets/images/products/product-1-1.jpg" src="resources/assets/images/products/product-1-1.jpg" alt="image" title="" />
                                </div>
                                <div class="item carousel-item" data-bs-slide-number="4">
                                    <img class="blur-up lazyload" data-src="resources/assets/images/products/product-1-1.jpg" src="resources/assets/images/products/product-1-1.jpg" alt="image" title="" />
                                </div>
                            </div>
                            <!-- End Image Slide carousel items -->
                            <!-- Thumbnail image -->
                            <div class="model-thumbnail-img">
                                <!-- Thumbnail slide -->
                                <div class="carousel-indicators list-inline">
                                    <div class="list-inline-item active" id="carousel-selector-0" data-bs-slide-to="0" data-bs-target="#quickView">
                                        <img class="blur-up lazyload" data-src="resources/assets/images/products/product-1.jpg" src="resources/assets/images/products/product-1.jpg" alt="image" title="" />
                                    </div>
                                    <div class="list-inline-item" id="carousel-selector-1" data-bs-slide-to="1" data-bs-target="#quickView">
                                        <img class="blur-up lazyload" data-src="resources/assets/images/products/product-1-1.jpg" src="resources/assets/images/products/product-1-1.jpg" alt="image" title="" />
                                    </div>
                                    <div class="list-inline-item" id="carousel-selector-2" data-bs-slide-to="2" data-bs-target="#quickView">
                                        <img class="blur-up lazyload" data-src="resources/assets/images/products/product-1-1.jpg" src="resources/assets/images/products/product-1-1.jpg" alt="image" title="" />
                                    </div>
                                    <div class="list-inline-item" id="carousel-selector-3" data-bs-slide-to="3" data-bs-target="#quickView">
                                        <img class="blur-up lazyload" data-src="resources/assets/images/products/product-1-1.jpg" src="resources/assets/images/products/product-1-1.jpg" alt="image" title="" />
                                    </div>
                                    <div class="list-inline-item" id="carousel-selector-4" data-bs-slide-to="4" data-bs-target="#quickView">
                                        <img class="blur-up lazyload" data-src="resources/assets/images/products/product-1-1.jpg" src="resources/assets/images/products/product-1-1.jpg" alt="image" title="" />
                                    </div>
                                </div>
                                <!-- End Thumbnail slide -->
                                <!-- Carousel arrow button -->
                                <a class="carousel-control-prev carousel-arrow" href="#quickView" data-bs-target="#quickView" data-bs-slide="prev"><i class="icon an-3x an an-angle-left"></i><span class="visually-hidden">Previous</span></a>
                                <a class="carousel-control-next carousel-arrow" href="#quickView" data-bs-target="#quickView" data-bs-slide="next"><i class="icon an-3x an an-angle-right"></i><span class="visually-hidden">Next</span></a>
                                <!-- End Carousel arrow button -->
                            </div>
                            <!-- End Thumbnail image -->
                        </div>
                        <!--End Model thumbnail -->
                        <div class="text-center mt-3"><a href="product-layout1.html">VIEW MORE DETAILS</a></div>
                    </div>
                    <div class="col-12 col-sm-6 col-md-6 col-lg-6">
                        <h2 class="product-title">Product Quick View Popup</h2>
                        <div class="product-review d-flex-center mb-2">
                            <div class="rating"><i class="icon an an-star"></i><i class="icon an an-star"></i><i class="icon an an-star"></i><i class="icon an an-star"></i><i class="icon an an-star-o"></i></div>
                            <div class="reviews ms-2"><a href="#">5 Reviews</a></div>
                        </div>
                        <div class="product-info">
                            <p class="product-vendor">Vendor:  <span class="fw-normal"><a href="#" class="fw-normal">Optimal</a></span></p>  
                            <p class="product-type">Product Type: <span class="fw-normal">Tops</span></p> 
                            <p class="product-sku">SKU:  <span class="fw-normal">50-ABC</span></p>
                        </div>
                        <div class="pro-stockLbl my-2">
                            <span class="d-flex-center stockLbl instock"><i class="icon an an-check-cil"></i><span> In stock</span></span>
                            <span class="d-flex-center stockLbl preorder d-none"><i class="icon an an-clock-r"></i><span> Pre-order Now</span></span>
                            <span class="d-flex-center stockLbl outstock d-none"><i class="icon an an-times-cil"></i> <span>Sold out</span></span>
                            <span class="d-flex-center stockLbl lowstock d-none" data-qty="15"><i class="icon an an-exclamation-cir"></i><span> Order now, Only  <span class="items">10</span>  left!</span></span>
                        </div>
                        <div class="pricebox">
                            <span class="price old-price">$400.00</span><span class="price product-price__sale">$300.00</span>
                        </div>
                        <div class="sort-description">Optimal Multipurpose Bootstrap 5 Html Template that will give you and your customers a smooth shopping experience which can be used for various kinds of stores such as fashion.. </div>
                        <form method="post" action="#" id="product_form--option" class="product-form">
                            <div class="product-options d-flex-wrap">
                                <div class="swatch clearfix swatch-0 option1">
                                    <div class="product-form__item">
                                        <label class="label d-flex">Color:<span class="required d-none">*</span> <span class="slVariant ms-1 fw-bold">Black</span></label>
                                        <ul class="swatches-image swatches d-flex-wrap list-unstyled clearfix">
                                            <li data-value="Black" class="swatch-element color available active">
                                                <label class="rounded-0 swatchLbl small color black" title="Black"></label>
                                                <span class="tooltip-label top">Black</span>
                                            </li>
                                            <li data-value="Green" class="swatch-element color available">
                                                <label class="rounded-0 swatchLbl small color green" title="Green"></label>
                                                <span class="tooltip-label top">Green</span>
                                            </li>
                                            <li data-value="Orange" class="swatch-element color available">
                                                <label class="rounded-0 swatchLbl small color orange" title="Orange"></label>
                                                <span class="tooltip-label top">Orange</span>
                                            </li>
                                            <li data-value="Blue" class="swatch-element color available">
                                                <label class="rounded-0 swatchLbl small color blue" title="Blue"></label>
                                                <span class="tooltip-label top">Blue</span>
                                            </li>
                                            <li data-value="Red" class="swatch-element color available">
                                                <label class="rounded-0 swatchLbl small color red" title="Red"></label>
                                                <span class="tooltip-label top">Red</span>
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                                <div class="swatch clearfix swatch-1 option2">
                                    <div class="product-form__item">
                                        <label class="label">Size:<span class="required d-none">*</span> <span class="slVariant ms-1 fw-bold">XS</span></label>
                                        <ul class="swatches-size d-flex-center list-unstyled clearfix swatch-1 option2">
                                            <li data-value="XS" class="swatch-element xs available active">
                                                <label class="swatchLbl rounded-0 medium" title="XS">XS</label>
                                                <span class="tooltip-label">XS</span>
                                            </li>
                                            <li data-value="S" class="swatch-element s available">
                                                <label class="swatchLbl rounded-0 medium" title="S">S</label>
                                                <span class="tooltip-label">S</span>
                                            </li>
                                            <li data-value="M" class="swatch-element m available">
                                                <label class="swatchLbl rounded-0 medium" title="M">M</label>
                                                <span class="tooltip-label">M</span>
                                            </li>
                                            <li data-value="L" class="swatch-element l available">
                                                <label class="swatchLbl rounded-0 medium" title="L">L</label>
                                                <span class="tooltip-label">L</span>
                                            </li>
                                            <li data-value="XL" class="swatch-element xl available">
                                                <label class="swatchLbl rounded-0 medium" title="XL">XL</label>
                                                <span class="tooltip-label">XL</span>
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                                <div class="product-action d-flex-wrap w-100 mb-3 clearfix">
                                    <div class="quantity">
                                        <div class="qtyField rounded">
                                            <a class="qtyBtn minus" href="javascript:void(0);"><i class="icon an an-minus-r" aria-hidden="true"></i></a>
                                            <input type="text" name="quantity" value="1" class="product-form__input qty rounded-0">
                                            <a class="qtyBtn plus" href="javascript:void(0);"><i class="icon an an-plus-l" aria-hidden="true"></i></a>
                                        </div>
                                    </div>                                
                                    <div class="add-to-cart ms-3 fl-1">
                                        <button type="button" class="btn button-cart rounded-0"><span>Add to cart</span></button>
                                    </div>
                                </div>
                            </div>
                        </form>
                        <div class="wishlist-btn d-flex-center">
                            <a class="add-wishlist d-flex-center text-uppercase me-3" href="my-wishlist.html" title="Add to Wishlist"><i class="icon an an-heart-l me-1"></i> <span>Add to Wishlist</span></a>
                            <a class="add-compare d-flex-center text-uppercase" href="compare-style1.html" title="Add to Compare"><i class="icon an an-random-r me-2"></i> <span>Add to Compare</span></a>
                        </div>
                        <!-- Social Sharing -->
                        <div class="social-sharing share-icon d-flex-center mx-0 mt-3">
                            <span class="sharing-lbl me-2">Share :</span>
                            <a href="#" class="d-flex-center btn btn-link btn--share share-facebook" data-bs-toggle="tooltip" data-bs-placement="top" title="Share on Facebook"><i class="icon an an-facebook mx-1"></i><span class="share-title d-none">Facebook</span></a>
                            <a href="#" class="d-flex-center btn btn-link btn--share share-twitter" data-bs-toggle="tooltip" data-bs-placement="top" title="Tweet on Twitter"><i class="icon an an-twitter mx-1"></i><span class="share-title d-none">Tweet</span></a>
                            <a href="#" class="d-flex-center btn btn-link btn--share share-pinterest" data-bs-toggle="tooltip" data-bs-placement="top" title="Pin on Pinterest"><i class="icon an an-pinterest-p mx-1"></i> <span class="share-title d-none">Pin it</span></a>
                            <a href="#" class="d-flex-center btn btn-link btn--share share-linkedin" data-bs-toggle="tooltip" data-bs-placement="top" title="Share on Instagram"><i class="icon an an-instagram mx-1"></i><span class="share-title d-none">Instagram</span></a>
                            <a href="#" class="d-flex-center btn btn-link btn--share share-whatsapp" data-bs-toggle="tooltip" data-bs-placement="top" title="Share on WhatsApp"><i class="icon an an-whatsapp mx-1"></i><span class="share-title d-none">WhatsApp</span></a>
                            <a href="#" class="d-flex-center btn btn-link btn--share share-email" data-bs-toggle="tooltip" data-bs-placement="top" title="Share by Email"><i class="icon an an-envelope-l mx-1"></i><span class="share-title d-none">Email</span></a>
                        </div>
                        <!-- End Social Sharing -->
                    </div>
                </div>
            </div>
            <!--End Quickview Popup-->

            <!--Addtocart Added Popup-->
            <div id="pro-addtocart-popup" class="mfp-with-anim mfp-hide">
                <button title="Close (Esc)" type="button" class="mfp-close">×</button>
                <div class="addtocart-inner text-center clearfix">
                    <h4 class="title mb-3 text-success">Added to your shopping cart successfully.</h4>
                    <div class="pro-img mb-3">
                        <img class="img-fluid blur-up lazyload" src="resources/assets/images/products/add-to-cart-popup.jpg" data-src="resources/assets/images/products/add-to-cart-popup.jpg" alt="Added to your shopping cart successfully." title="Added to your shopping cart successfully." />
                    </div>
                    <div class="pro-details">   
                        <h5 class="pro-name mb-0">Ditsy Floral Dress</h5>
                        <p class="sku my-2">Color: Gray</p>
                        <p class="mb-0 qty-total">1 X $113.88</p>
                        <div class="addcart-total bg-light mt-3 mb-3 p-2">
                            Total: <b class="price">$113.88</b>
                        </div>
                        <div class="button-action">
                            <a href="checkout-style1.html" class="btn btn-primary view-cart mx-1 rounded">Go To Checkout</a>
                            <a href="index.html" class="btn btn-secondary rounded">Continue Shopping</a>
                        </div>
                    </div>
                </div>
            </div>
            <!-- End Addtocart Added Popup-->


            <!-- Including Jquery -->
            <script src="resources/assets/js/vendor/jquery-min.js"></script>
            <script src="resources/assets/js/vendor/js.cookie.js"></script>
            <!--Including Javascript-->
            <script src="resources/assets/js/plugins.js"></script>
            <script src="resources/assets/js/main.js"></script>
            <!-- Photoswipe Gallery -->
            <script src="resources/assets/js/vendor/photoswipe.min.js"></script>
            <script>
                $(function () {
                    var $pswp = $('.pswp')[0],
                            image = [],
                            getItems = function () {
                                var items = [];
                                $('.lightboximages a').each(function () {
                                    var $href = $(this).attr('href'),
                                            $size = $(this).data('size').split('x'),
                                            item = {
                                                src: $href,
                                                w: $size[0],
                                                h: $size[1]
                                            };
                                    items.push(item);
                                });
                                return items;
                            };
                    var items = getItems();

                    $.each(items, function (index, value) {
                        image[index] = new Image();
                        image[index].src = value['src'];
                    });
                    $('.prlightbox').on('click', function (event) {
                        event.preventDefault();

                        var $index = $(".active-thumb").parent().attr('data-slick-index');
                        $index++;
                        $index = $index - 1;

                        var options = {
                            index: $index,
                            bgOpacity: 0.7,
                            showHideOpacity: true
                        };
                        var lightBox = new PhotoSwipe($pswp, PhotoSwipeUI_Default, items, options);
                        lightBox.init();
                    });
                });
            </script>
            <div class="pswp" tabindex="-1" role="dialog" aria-hidden="true">
                <div class="pswp__bg"></div>
                <div class="pswp__scroll-wrap">
                    <div class="pswp__container">
                        <div class="pswp__item"></div>
                        <div class="pswp__item"></div>
                        <div class="pswp__item"></div>
                    </div>
                    <div class="pswp__ui pswp__ui--hidden">
                        <div class="pswp__top-bar">
                            <div class="pswp__counter"></div>
                            <button class="pswp__button pswp__button--close" title="Close (Esc)"></button>
                            <button class="pswp__button pswp__button--share" title="Share"></button>
                            <button class="pswp__button pswp__button--fs" title="Toggle fullscreen"></button>
                            <button class="pswp__button pswp__button--zoom" title="Zoom in/out"></button>
                            <div class="pswp__preloader">
                                <div class="pswp__preloader__icn">
                                    <div class="pswp__preloader__cut">
                                        <div class="pswp__preloader__donut"></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="pswp__share-modal pswp__share-modal--hidden pswp__single-tap">
                            <div class="pswp__share-tooltip"></div>
                        </div>
                        <button class="pswp__button pswp__button--arrow--left" title="Previous (arrow left)"></button>
                        <button class="pswp__button pswp__button--arrow--right" title="Next (arrow right)"></button>
                        <div class="pswp__caption"><div class="pswp__caption__center"></div></div>
                    </div>
                </div>
            </div>

        </div>
        <!--End Page Wrapper-->
    </body>
</html>