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
                <form action="member.admin" method="get">
					
				  <div class="input-group">
	                <select class="form-select mt-0" name="whatColumn">
						<option value="">전체 검색</option>
						<option value="name">이름</option>
						<option value="id">아이디</option>
					</select>
	                <input type="text" name="keyword" class="form-control" placeholder="검색할 회원 입력">
	                <button type="submit" class="btn btn-light">검색</button>
	              </div>
				</form>
               
              </div>
              <div class="card-body p-0" data-simplebar>
              <div class="table-responsive">
              <table class="table">
                  <tr>
                    <th scope="col" width="3%"> </th>
                    <th scope="col"width="12%">이름</th>
                    <th scope="col"width="15%">아이디</th>
                    <th scope="col" width="25%">이메일</th>
                    <th scope="col"width="15%">상태</th>
                    <th scope="col" width="15%">&nbsp 이용정지</th>
                    <th scope="col" width="15%">&nbsp 이용정지 해제</th>
                  </tr>
                  <c:forEach items="${lists }" var="member" varStatus="i">
                  
                  <tr<c:if test="${member.isblacklist eq '1'}"> class="table-active"</c:if>>
                    <td> </td>
                    <td>${member.name }</td>
                    <td>${member.id }</td>
                    <td>${member.email }</td>
                    <td>
                    <c:if test="${member.isblacklist eq '1'}"> 정지중 </c:if>
                    <c:if test="${member.isblacklist eq '0'}"> 정상 </c:if>
                    </td>
                    <td> 
                      <button type="button" class="btn btn-outline-secondary btn-sm" onclick="location.href='blacklist.admin?mno=${member.mno}&check=1'">이용정지</button>
                   </td>
                    <td> 
                      <button type="button" class="btn btn-outline-secondary btn-sm" onclick="location.href='blacklist.admin?mno=${member.mno}&check=0'">이용정지 해제</button>
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
                <h5 class="modal-title">대분류 카테고리 추가하기</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
              </div>
              <div class="modal-body">
                <form class="needs-validation" novalidate id="taskForm" action="insert.lcate" method="post">
                  <div class="mb-3">
                    <label for="taskTitle" class="form-label">이름</label>
                    <input type="text" name="name" class="form-control" id="name" required autofocus>
                    <div class="invalid-feedback">이름을 입력해주세요.</div>
                  </div>
                 
                 
                </form>
              </div>
              <div class="modal-footer border-0">
                <button type="button" class="btn btn-light" data-bs-dismiss="modal">취소하기</button>
                <button type="submit" form="taskForm" class="btn btn-info px-5">추가하기</button>
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
<script type="text/javascript">
	function updateOrder_num(order_num){
		location.href="update.lcate?order_num="+order_num;
	}
</script>
</body>

</html>
listLcate.jsp<br>

