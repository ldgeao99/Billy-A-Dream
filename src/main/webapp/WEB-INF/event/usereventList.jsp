<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@include file="../common/common.jsp" %>
<%@include file="../member/commonTop.jsp" %>
    
<div class="collection-header">
	<div class="collection-hero">
		<div class="collection-hero__image"></div>
		<div class="collection-hero__title-wrapper container">
			<h2 style="font-family: 'Poppins', Arial, Tahoma !important; font-weight: 700 !important; font-size: 25px; color: black; margin-bottom: 0px">
			이벤트
			</h2>
		</div>
	</div>
</div>



<!-- 화면 작성하면 되는 부분 -->
<%	
	String apath = application.getContextPath() + "/resources/images";
%>

<!-- 검색하는 바 -->
<form action="view.evt" method="get">
	<div class="container" style="width:30%">
		<div class="row">
			<div class="col">
		      	<div class="searchField d-flex" style="margin-top: 8px">
					<div class="search-category" style="width:200px;">
						<select id="rgsearch-category1" name="whatColumn" data-default="전체검색" class="rounded-pill-start" style="padding-left: 15px;">
							<option value="title" selected>제목</option>
						</select>
					</div>
					<div class="input-box d-flex w-100">
						<input type="text" name="keyword" value="" placeholder="" class="input-text rounded-0 border-start-0 border-end-0">
						<button type="submit" title="Search" class="action search rounded-pill-end"><i class="icon an an-search-l"></i></button>
					</div>
				</div>
			</div>
		</div>
	</div>
</form>


<c:if test="${fn:length(lists) eq 0}">
	<center><br>작성된 이벤트 게시글이 없습니다.</center>
</c:if>

<!-- ----------------------------------------- -->

<div class="container" style="width:80%">
	<c:set var="notCeiledQuotient" value="${fn:length(lists)/3}" />
	 
	<c:set var="ceiledQuotient" value="${(notCeiledQuotient + (1 - (notCeiledQuotient % 1)) % 1)}" />
	 
	<c:forEach var="i" begin="1" end="${ceiledQuotient * 3}" step="1">
		<c:if test="${i % 3 eq 1}">
			<div class="grid-products row">
		</c:if>

		<!-- 비어있는 이미지 출력 -->
		<c:if test="${i > fn:length(lists)}">
			<div class="item col"></div>
		</c:if>

		<!-- 정상적인 이미지 출력 -->
		<c:if test="${i <= fn:length(lists)}">
			<div class="item col">
				<!--Start Product Image-->
				<div class="product-image">
					<!--Start Product Image-->
					<a href="usereventContent.evt?num=${lists[i-1].num }&pageNumber=${pageInfo.pageNumber}" class="product-img"> <!--Image--> 
						<img class="primary blur-up lazyload" data-src="<%=apath%>/${lists[i-1].eventImage}" src="<%=apath%>/${lists[i-1].eventImage}" alt="image" title="" style="height: 200px; width:350px;" /> <!--End Image--> <!--Hover Image-->
						<img class="hover blur-up lazyload" data-src="<%=apath%>/${lists[i-1].eventImage}" src="<%=apath%>/${lists[i-1].eventImage}" alt="image" title="" style="height: 200px; width:350px;" /> <!--End Hover Image-->
					</a>
					<!-- End Product Image -->
				</div>
				<!-- End Product Image -->

				<!--Start Product Details-->
				<div class="product-details text-center">
					<!--Product Name-->
					<div class="product-name">
						<a class="text-uppercase fw-normal" href="usereventContent.evt?num=${lists[i-1].num }&pageNumber=${pageInfo.pageNumber}">${lists[i-1].title}</a>
					</div>
					<!--End Product Name-->
					<!--Product Price-->
					<div class="product-price">
						<span class="price">마감일 : 
						
						<fmt:parseDate var="formattedDay" value="${lists[i-1].eventdate}" pattern="yyyy-MM-dd" />
						<fmt:formatDate var="newformattedDay_endday" value="${formattedDay }" pattern="yyyy-MM-dd" />${newformattedDay_endday}
						</span>
					</div>
				</div>
				<!--End Product Details-->
			</div>
		</c:if>

		<c:if test="${i % 3 eq 0}">
		</div>
		</c:if>
		
	</c:forEach>
</div>

<center>
${pageInfo.pagingHtml }
</center>
<br>







<!-- ----------------------------------------- -->
		<div>
            <!--Footer-->
            <%@include file="../member/commonBottom.jsp" %>
            <!--End Footer-->

            <!--Scoll Top-->
            <span id="site-scroll"><i class="icon an an-chevron-up"></i></span>
            <!--End Scoll Top-->

            <!-- Including Jquery -->
            <script src="resources/js/vendor/jquery-min.js"></script>
            <script src="resources/js/vendor/js.cookie.js"></script>
            <!--Including Javascript-->
            <script src="resources/js/plugins.js"></script>
            <script src="resources/js/main.js"></script>

        </div>
        <!--End Page Wrapper-->
    </body>