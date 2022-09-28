<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/common.jsp"%>     
    
  
<%@ include file="top.jsp"%>     


      <!-- Main body -->
      <div id="main-body">

        <div id="inner-wrapper">
          <div id="inner-sidebar" style="width: 13.75rem">
            <div class="card">
              <div class="card-header d-flex align-items-center">
                <button class="btn btn-info w-100 d-flex align-items-center justify-content-center gap-1" type="button" data-bs-toggle="modal" data-bs-target="#taskModal">
                  <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20" fill="currentColor" aria-hidden="true">
                    <path fill-rule="evenodd" d="M10 3a1 1 0 011 1v5h5a1 1 0 110 2h-5v5a1 1 0 11-2 0v-5H4a1 1 0 110-2h5V4a1 1 0 011-1z" clip-rule="evenodd" />
                  </svg>
                  카테고리 추가하기
                </button>
                <button type="button" aria-label="Close" class="btn-close ms-3 d-lg-none shadow-none" data-toggle="inner-sidebar-expand"></button>
              </div>
              <div class="card-body px-0" data-simplebar>
                
              </div>
              <div class="card-footer d-none d-lg-block">
                <img src="resources/admin_asset/img/todo.svg" alt="" class="w-100" loading="lazy">
              </div>
            </div>
          </div>
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
                <form><input type="text" class="form-control border-0 px-0 shadow-none" placeholder="Search todo"></form>
              </div>
              <div class="card-body p-0" data-simplebar>
                <ul class="list-group list-group-flush">
                  	<c:forEach items="${lists }" var="firstList">
						<c:forEach items="${firstList }" var="scate" varStatus="i">
             <c:if test="${i.count eq 1}">
                  <li class="list-group-item todo-item lcategory">
	
                    <div class="gap-1 gap-sm-3">
                      <div class="vstack ms-2 ms-sm-3">
                        <h5 class="mb-3">
                         
					<b>대분류 : ${scate.lcate_name}</b>
                        </h5>
                      </div>
                   </div>
                  </li>    
			</c:if>
                  <li class="list-group-item todo-item">
                    
                    <div class="gap-1 gap-sm-3">
                      <div class="vstack ms-2 ms-sm-3">
                        <h5 class="mb-3">
                          ${scate.name }
                        </h5>
                      </div>
                      <div class="dropdown">
                        <button class="btn dropdown-toggle no-caret px-0 d-flex link-secondary shadow-none" type="button" data-bs-toggle="dropdown" aria-expanded="false">
                          <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20" fill="currentColor" aria-hidden="true">
                            <path d="M10 6a2 2 0 110-4 2 2 0 010 4zM10 12a2 2 0 110-4 2 2 0 010 4zM10 18a2 2 0 110-4 2 2 0 010 4z" />
                          </svg>
                        </button>
                        <ul class="dropdown-menu dropdown-menu-end">
                          <li><a class="dropdown-item" href="delete.scate?no=${scate.no }">삭제하기</a></li>
                        </ul>
                      </div>
                    </div>
                  </li>
					</c:forEach>
				</c:forEach>
                  
                </ul>
              </div>
            </div>
          </div>
        </div>

        <!-- Task modal -->
        <div class="modal fade" id="taskModal" tabindex="-1">
          <div class="modal-dialog modal-dialog-scrollable">
            <div class="modal-content">
              <div class="modal-header border-0">
                <h5 class="modal-title">소분류 카테고리 추가하기</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
              </div>
              <div class="modal-body">
                <form class="needs-validation" novalidate id="taskForm" action="insert.scate" method="post">
                  <div class="mb-3">
                    <label for="taskTitle" class="form-label">대분류 카테고리</label>
                    <select class="form-select form-select-lg" name="lcate_no" required autofocus>
            			<option value="">대분류 카테고리 선택하기</option>
                    	<c:forEach items="${list }" var="lcate">
						
            			<option value="${lcate.no }">${lcate.name }</option>
            			
            			</c:forEach> 
                    </select>
                    <div class="invalid-feedback">카테고리를 선택해주세요.</div>
                    </div>
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



