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
                <form action="memberReservationList.admin" method="get">
					
				  <div class="input-group">
	                <select class="form-select mt-0" name="whatColumn">
						<option value="">전체 검색</option>
						<option value="product_name">제품명</option>
						<option value="buyer_id">구매자 아이디</option>
						<option value="seller_id">판매자 아이디</option>
					</select>
	                <input type="text" name="keyword" class="form-control" placeholder="검색할 정보 입력">
	                <button type="submit" class="btn btn-light">검색</button>
	              </div>
				</form>
               
              </div>
              <div class="card-body p-0" data-simplebar>
              <div class="table-responsive">
              <table class="table">
                  <tr>
                    <th scope="col" width="3%"> </th>
                    <th scope="col"width="10%">제품명</th>
                    <th scope="col"width="13%">상태</th>
                    <th scope="col" width="20%">기간</th>
                    <th scope="col" width="10%">거래금액</th>
                    <th scope="col"width="10%">판매자 정보</th>
                    <th scope="col"width="10%">구매자 정보</th>
                    <th scope="col" width="14%">체결일자</th>
                    <th scope="col" width="10%">&nbsp 철회 </th>
                  </tr>
                  <c:forEach items="${lists }" var="reservation" varStatus="i">
                  
                  <tr <c:if test="${reservation.use eq '0' || reservation.is_accepted eq '2'}"> class="table-active"</c:if>>
                    <td> </td>
                    <td>${reservation.product_name }</td>
                    <td>
					<c:if test="${reservation.is_accepted eq '0'}"> 체결 대기중 </c:if>
                    <c:if test="${reservation.is_accepted eq '1'}"> 체결 됨 </c:if>
                    <c:if test="${reservation.is_accepted eq '4'}"> 거래 취소 </c:if>
                    
					<c:if test="${reservation.use eq '0'}">/ 만료 </c:if>
                    <c:if test="${reservation.use eq '1'}">/ 반납예정일 </c:if>
                    <c:if test="${reservation.use eq '2'}">/ 진행중 </c:if>
                    <c:if test="${reservation.use eq '3'}">/ 시작전 </c:if>
                    </td>
                    <td>${reservation.start_date }~${reservation.end_date }</td>
                    <td>
                    <fmt:formatNumber pattern="###,###" value="${reservation.amount }" var="price"/>
                    ${price }원
                    </td>
                    <td>
                    	${reservation.seller_id }(${reservation.seller_name })
                    </td>
                    <td>
                    	${reservation.buyer_id }(${reservation.buyer_name })
                    </td>
                    <td> 
                    	${reservation.accepted_date }
                   </td>
                    <td> 
                    <c:if test="${reservation.is_accepted eq '0' || reservation.is_accepted eq '1'}">
                      <button id="getTaskModal" class="btn btn-outline-secondary btn-sm" type="button" data-bs-toggle="modal" data-bs-target="#taskModal" data-no="${reservation.no }">
		                철회
		              </button>
		            </c:if>  
		             <c:if test="${reservation.is_accepted eq '4'}"> 
			             <button id="rollback" class="btn btn-outline-secondary btn-sm" type="button" onclick="location.href='withdrawReservation.admin?no=${reservation.no }'">
			                철회 취소
			             </button> 
		             </c:if>
                   </td>
                  </tr>
                  </c:forEach>
              </table>
            </div>
                
              </div>
            </div>
          </div>
        </div>
		<!-- Task modal -->
        <div class="modal fade" id="taskModal" tabindex="-1">
          <div class="modal-dialog modal-dialog-scrollable">
            <div class="modal-content">
              <div class="modal-header border-0">
                <h5 class="modal-title">철회 사유 작성</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
              </div>
              <div class="modal-body">
                <form class="needs-validation" novalidate id="taskForm" action="withdrawReservation.admin" method="post">
                   
                  <div class="mb-3">
                    <label for="taskTitle" class="form-label">철회 사유</label>
                    <input type="text" name="notice" class="form-control" id="notice" required autofocus >
                    <input type="hidden" name="no" id="no">
                    <div class="invalid-feedback">철회 사유를 작성하세요.</div>
                  </div>
                 
                 
                </form>
              </div>
              <div class="modal-footer border-0">
                <button type="button" class="btn btn-light" data-bs-dismiss="modal">취소하기</button>
                <button type="submit" form="taskForm" class="btn btn-secondary px-5">철회하기</button>
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
  <script>
    autosize(document.querySelectorAll('textarea.autosize'))

    // Example starter JavaScript for disabling form submissions if there are invalid fields
    void(function() {
      document.querySelectorAll('.needs-validation').forEach(form => {
        form.addEventListener('submit', event => {
          if (!form.checkValidity()) {
            event.preventDefault()
            event.stopPropagation()
          }

          form.classList.add('was-validated')
        })
      })
    })()
   
  </script>
  <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script type="text/javascript">
$(document).on("click", "#getTaskModal", function () {
		
		  var data = $(this).data('no');
		    $("#no").val(data);
		  
})

</script>
</body>

</html>


