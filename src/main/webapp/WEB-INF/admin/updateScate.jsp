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
                    <!-- 아래로 내리는 버튼 -->
                <c:if test="${scate.order_num eq scate.maxOrder_num}">    
                    <button type="button" class="btn btn-outline-primary d-inline-flex align-items-center gap-2" disabled onclick="updateOrder_num(${scate.no},1,${scate.order_num },${scate.lcate_no })">
                <svg width="20" height="20" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20" fill="currentColor">
                  <path fill-rule="evenodd" d="M10 18a8 8 0 100-16 8 8 0 000 16zm1-11a1 1 0 10-2 0v3.586L7.707 9.293a1 1 0 00-1.414 1.414l3 3a1 1 0 001.414 0l3-3a1 1 0 00-1.414-1.414L11 10.586V7z" clip-rule="evenodd" />
                </svg>
                
              </button>
              </c:if>
                <c:if test="${scate.order_num ne scate.maxOrder_num}">    
                    <button type="button" class="btn btn-outline-primary d-inline-flex align-items-center gap-2" onclick="updateOrder_num(${scate.no},1,${scate.order_num },${scate.lcate_no })">
                <svg width="20" height="20" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20" fill="currentColor">
                  <path fill-rule="evenodd" d="M10 18a8 8 0 100-16 8 8 0 000 16zm1-11a1 1 0 10-2 0v3.586L7.707 9.293a1 1 0 00-1.414 1.414l3 3a1 1 0 001.414 0l3-3a1 1 0 00-1.414-1.414L11 10.586V7z" clip-rule="evenodd" />
                </svg>
                
              </button>
              </c:if>
                    <!-- 위로 올리는 버튼 -->
              <c:if test="${i.count eq 1}">
              <button type="button" class="btn btn-outline-primary d-inline-flex align-items-center gap-2" disabled onclick="updateOrder_num(${scate.no},-1,${scate.order_num },${scate.lcate_no })">
                <svg width="20" height="20" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20" fill="currentColor">
                  <path fill-rule="evenodd" d="M10 18a8 8 0 100-16 8 8 0 000 16zm3.707-8.707l-3-3a1 1 0 00-1.414 0l-3 3a1 1 0 001.414 1.414L9 9.414V13a1 1 0 102 0V9.414l1.293 1.293a1 1 0 001.414-1.414z" clip-rule="evenodd" />
                </svg>
                
              </button>
              </c:if>
              <c:if test="${i.count ne 1}">
              <button type="button" class="btn btn-outline-primary d-inline-flex align-items-center gap-2" onclick="updateOrder_num(${scate.no},-1,${scate.order_num },${scate.lcate_no })">
                <svg width="20" height="20" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20" fill="currentColor">
                  <path fill-rule="evenodd" d="M10 18a8 8 0 100-16 8 8 0 000 16zm3.707-8.707l-3-3a1 1 0 00-1.414 0l-3 3a1 1 0 001.414 1.414L9 9.414V13a1 1 0 102 0V9.414l1.293 1.293a1 1 0 001.414-1.414z" clip-rule="evenodd" />
                </svg>
                
              </button>
              </c:if>
                      <div class="vstack ms-2 ms-sm-3">
                        <h5 class="mb-3">
                          ${scate.name }
                        </h5>
                      </div>
                      <div class="dropdown">
                      <button id="getTaskModal" class="btn btn-outline-primary d-inline-flex align-items-center gap-2" type="button" data-bs-toggle="modal" data-bs-target="#taskModal" data-name="${scate.name }"data-no="${scate.no }" data-lcate="${scate.lcate_no }">
                  <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20" fill="currentColor" aria-hidden="true">
                    <path fill-rule="evenodd" d="M10 3a1 1 0 011 1v5h5a1 1 0 110 2h-5v5a1 1 0 11-2 0v-5H4a1 1 0 110-2h5V4a1 1 0 011-1z" clip-rule="evenodd" />
                  </svg>
                  이름 수정하기
                </button>  
                        
                      </div>
                      <div class="dropdown">
                      <button id="getTaskModal2"  class="btn btn-outline-primary d-inline-flex align-items-center gap-2" type="button" data-bs-toggle="modal" data-bs-target="#taskModal2" data-no="${scate.no }">
                  <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20" fill="currentColor" aria-hidden="true">
                    <path fill-rule="evenodd" d="M10 3a1 1 0 011 1v5h5a1 1 0 110 2h-5v5a1 1 0 11-2 0v-5H4a1 1 0 110-2h5V4a1 1 0 011-1z" clip-rule="evenodd" />
                  </svg>
                  대분류간 위치 옮기기 
                </button>  
                        
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
                <h5 class="modal-title">소분류 카테고리명 수정하기</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
              </div>
              <div class="modal-body">
                <form class="needs-validation" novalidate id="taskForm" action="update.scate" method="post">
                   
                  <div class="mb-3">
                    <label for="taskTitle" class="form-label">이름</label>
                    <input type="text" name="name" class="form-control" id="name" required autofocus >
                    <input type="hidden" name="no" id="no">
                    <div class="invalid-feedback">Task title is required.</div>
                  </div>
                 
                 
                </form>
              </div>
              <div class="modal-footer border-0">
                <button type="button" class="btn btn-light" data-bs-dismiss="modal">취소하기</button>
                <button type="submit" form="taskForm" class="btn btn-info px-5">수정하기</button>
              </div>
            </div>
          </div>
        </div>
      </div>
        <!-- Task modal -->
        <div class="modal fade" id="taskModal2" tabindex="-1">
          <div class="modal-dialog modal-dialog-scrollable">
            <div class="modal-content">
              <div class="modal-header border-0">
                <h5 class="modal-title">대분류간 카테고리 이동하기</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
              </div>
              <div class="modal-body">
                <form class="needs-validation" novalidate id="taskForm2" action="updateLcate_no.scate" method="post">
                   
                  <div class="mb-3">
                    <label for="taskTitle" class="form-label">대분류 카테고리</label>
                    
                    <select class="form-select form-select-lg" name="lcate_no" id="lcate_no">
            			<option value="">대분류 카테고리 선택하기</option>
                    	<c:forEach items="${lists }" var="firstList">
						<c:forEach items="${firstList }" var="scate" varStatus="i">
            			<c:if test="${i.count eq 1}">
            			<option value="${scate.lcate_no }">${scate.lcate_name }</option>
            			</c:if>
            			</c:forEach>
            			</c:forEach> 
                    </select>
                    <input type="hidden" name="no" id="no2">
                    <div class="invalid-feedback">Task title is required.</div>
                  </div>
                 
                 
                </form>
              </div>
              <div class="modal-footer border-0">
                <button type="button" class="btn btn-light" data-bs-dismiss="modal">취소하기</button>
                <button type="submit" form="taskForm2" class="btn btn-info px-5">수정하기</button>
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
  <script src="resources/admin_asset/js/script.js">
  </script>
	
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
	function updateOrder_num(no,val,order_num,lcate_no){
		location.href="updateOrder_num.scate?no="+no+"&val="+val+"&order_num="+order_num+"&lcate_no="+lcate_no;
	}

</script>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script type="text/javascript">
$(document).on("click", "#getTaskModal", function () {
		
		  var data = $(this).data('no');
		    $("#no").val(data);
		  
		  var data2 = $(this).data('name');
		    $("#name").val(data2);
		    
})
$(document).on("click", "#getTaskModal2", function () {
		  var data3 = $(this).data('no');
		    $("#no2").val(data3);
		 
})

</script>
</body>

</html>


