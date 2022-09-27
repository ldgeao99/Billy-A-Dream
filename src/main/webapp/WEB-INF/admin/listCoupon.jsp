<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/common.jsp"%>     
<%@ include file="top.jsp"%>     


      <!-- Main body -->
      <div id="main-body">

        <div id="inner-wrapper">
          <div id="inner-main">
            <div class="card">
              <div class="card-header d-flex align-items-center gap-3"><button class="btn link-secondary px-0 d-none d-lg-flex shadow-none" type="button" data-toggle="inner-sidebar-collapse">
                  <svg width="16" height="20" viewBox="0 0 16 16" stroke="currentColor" stroke-width="2">
                    <line x1="0" x2="16" y1="3" y2="3"></line>
                    <line x1="0" x2="8" y1="8" y2="8"></line>
                    <line x1="0" x2="16" y1="13" y2="13"></line>
                  </svg>
                </button>
                <button class="btn link-secondary px-0 d-flex d-lg-none shadow-none" type="button" data-toggle="inner-sidebar-expand">
                  <svg width="16" height="20" viewBox="0 0 16 16" stroke="currentColor" stroke-width="2">
                    <line x1="0" x2="16" y1="3" y2="3"></line>
                    <line x1="0" x2="16" y1="8" y2="8"></line>
                    <line x1="0" x2="16" y1="13" y2="13"></line>
                  </svg>
                </button>
                <form action="coupon.admin" method="get">
					
				  <div class="input-group">
	                <select class="form-select mt-0" name="whatColumn">
						<option value="">전체 검색</option>
						<option value="name">쿠폰명</option>
						<option value="code">코드</option>
					</select>
	                <input type="text" name="keyword" class="form-control" placeholder="검색할 쿠폰 입력">
	                <button type="submit" class="btn btn-light">검색</button>
	              </div>
				</form>
               
              </div>
              <div class="card-body p-0" data-simplebar>
              <div class="table-responsive">
              <table class="table">
                  <tr>
                    <th scope="col" width="3%"> </th>
                    <th scope="col"width="12%">쿠폰명</th>
                    <th scope="col"width="15%">쿠폰코드</th>
                    <th scope="col" width="25%">기간</th>
                    <th scope="col" width="10%">할인 혜택</th>
                    <th scope="col"width="15%">상태</th>
                    <th scope="col" width="10%">&nbsp 수정</th>
                    <th scope="col" width="10%">&nbsp 삭제</th>
                  </tr>
                  <c:forEach items="${lists }" var="coupon" varStatus="i">
                  
                  <tr <c:if test="${coupon.use eq '0' || coupon.use eq '2'}"> class="table-active"</c:if>>
                    <td> </td>
                    <td>${coupon.name }</td>
                    <td>${coupon.code }</td>
                    <td>${coupon.startdate }~${coupon.enddate }</td>
                    <td>
                    <fmt:formatNumber pattern="###,###" value="${coupon.amount }" var="price"/>
                    ${price }
                    <c:if test="${coupon.unit eq 'won'}">원 </c:if>
                    <c:if test="${coupon.unit eq 'per'}">% </c:if>                    
                    </td>
                    <td>
                    <c:if test="${coupon.use eq '0'}"> 만료 </c:if>
                    <c:if test="${coupon.use eq '1'}"> 진행중 </c:if>
                    <c:if test="${coupon.use eq '2'}"> 시작전 </c:if>
                    </td>
                    <td> 
                      <button type="button" class="btn btn-outline-secondary btn-sm" onclick="location.href='updateCoupon.admin?no=${coupon.no}'">수정</button>
                   </td>
                    <td> 
                      <button type="button" class="btn btn-outline-secondary btn-sm" onclick="location.href='deleteCoupon.admin?no=${coupon.no}'">삭제</button>
                   </td>
                  </tr>
                  </c:forEach>
              </table>
            </div>
                
              </div>
            </div>
          </div>
        </div>

       
      <!-- /Main body -->

      <!-- Main footer -->
      <div id="main-footer">
        <nav class="navbar navbar-expand navbar-light bg-white small shadow-sm">
          <span class="navbar-text">
            2022 &copy; Billy A Dream 빌리어드림 
          </span>
          <ul class="navbar-nav ms-auto">
            <li class="nav-item">
              <a href="javascript:void(0)" class="nav-link">About</a>
            </li>
            <li class="nav-item">
              <a href="javascript:void(0)" class="nav-link">Help</a>
            </li>
          </ul>
        </nav>
      </div>
      <!-- /Main footer -->

    </div>
    <!-- /Main -->

  </div>
  <!-- /Wrapper -->

  <!-- Required JS -->
  <script src="resources/admin_asset/vendor/bootstrap/bootstrap.bundle.js"></script>
  <script src="resources/admin_asset/vendor/simplebar/simplebar.js"></script>
  <script src="resources/admin_asset/js/script.js"></script>

  <script src="resources/admin_asset/js/settings.js"></script>

  <script src="resources/admin_asset/vendor/autosize/autosize.js"></script>
</body>

</html>


