<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../common/common.jsp" %>

<!-- Favicon -->
        <link rel="shortcut icon" href="resources/assets/images/favicon.png" />
        
        <!-- Plugins CSS -->
        <link rel="stylesheet" href="resources/assets/css/plugins.css" />
        
        <!-- Main Style CSS -->
        <link rel="stylesheet" href="resources/assets/css/style.css" />
        <link rel="stylesheet" href="resources/assets/css/responsive.css" />
        
        <!-- Main Style CSS From CategortyTop-->
        <link rel="stylesheet" href="resources/assets/css/style.css" />
        <link rel="stylesheet" href="resources/assets/css/responsive.css" />
        <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">
    	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
   		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css" />

    
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
										<a href="productdetail.prd?no=${p.no }" class="product-img" target="_blank"> <!-- image -->
											<img class="primary" style="height:186px"
											data-src="<%=request.getContextPath()%>/resources/${p.images}"
											src="<%=request.getContextPath()%>/resources/${p.images}"
											alt="product" title="product" /> <!-- End image --> <!-- Hover image -->
											<img class="hover" style="height:186px" 
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
											<a href="productdetail.prd?no=${p.no }" target="_blank">${p.name}</a>
										</div>
										<!-- End Product Name -->
										<!-- Product Price -->
										<div class="product-price">
											<span class="old-price"><fmt:formatNumber value="${p.original_day_price}" pattern="#,###" />원/일</span> 
											<span class="price"><fmt:formatNumber value="${p.discounted_day_price}" pattern="#,###" />원/일</span> 
											<%-- <span class="price"><fmt:formatNumber pattern="###,###" value="${p.discounted_day_price}" var="price"/>${ price} 원 / 일</span> --%>
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
						
<center>
${pageInfo.pagingHtml} <!-- 코드가 삽입되게 함 -->
</center>
<center>