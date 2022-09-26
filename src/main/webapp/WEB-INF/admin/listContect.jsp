<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/common.jsp"%>     
<%@ include file="top.jsp"%>     
<!-- Main -->
    <div id="main">

      <!-- Main header -->
      <div id="main-header">
        <nav class="navbar navbar-expand navbar-light bg-white gap-4">
          <button type="button" class="btn btn-light d-none d-xl-flex" data-toggle="mini-sidebar">
            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20" fill="currentColor" aria-hidden="true">
              <path fill-rule="evenodd" d="M3 5a1 1 0 011-1h12a1 1 0 110 2H4a1 1 0 01-1-1zM3 10a1 1 0 011-1h6a1 1 0 110 2H4a1 1 0 01-1-1zM3 15a1 1 0 011-1h12a1 1 0 110 2H4a1 1 0 01-1-1z" clip-rule="evenodd" />
            </svg>
          </button>
          <button type="button" class="btn btn-light d-flex d-xl-none me-3" data-bs-toggle="offcanvas" data-bs-target="#sidebar" aria-controls="sidebar">
            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20" fill="currentColor" aria-hidden="true">
              <path fill-rule="evenodd" d="M3 5a1 1 0 011-1h12a1 1 0 110 2H4a1 1 0 01-1-1zM3 10a1 1 0 011-1h12a1 1 0 110 2H4a1 1 0 01-1-1zM3 15a1 1 0 011-1h12a1 1 0 110 2H4a1 1 0 01-1-1z" clip-rule="evenodd" />
            </svg>
          </button>
          <ul class="navbar-nav align-items-center ms-auto">
            <li class="nav-item dropdown">
              <a href="#" class="nav-link dropdown-toggle no-caret" role="button" data-bs-toggle="dropdown" aria-expanded="false" data-bs-auto-close="outside">
                <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20" fill="currentColor" aria-hidden="true">
                  <path fill-rule="evenodd" d="M8 4a4 4 0 100 8 4 4 0 000-8zM2 8a6 6 0 1110.89 3.476l4.817 4.817a1 1 0 01-1.414 1.414l-4.816-4.816A6 6 0 012 8z" clip-rule="evenodd" />
                </svg>
              </a>
              <div class="dropdown-menu dropdown-menu-end p-3">
                <form><input type="text" class="form-control border-0 shadow-none px-3" placeholder="Search..." autofocus></form>
                <div class="dropdown-divider"></div>
                <h6 class="dropdown-header d-flex justify-content-between">
                  Recently searched:
                  <a href="javascript:void(0)" class="text-muted ms-5">Clear</a>
                </h6>
                <div class="max-h-[300px] overflow-auto">
                  <a class="dropdown-item" href="javascript:void(0)">Calendar</a>
                  <a class="dropdown-item" href="javascript:void(0)">Chat</a>
                  <a class="dropdown-item" href="javascript:void(0)">Email</a>
                  <a class="dropdown-item" href="javascript:void(0)">File manager</a>
                  <a class="dropdown-item" href="javascript:void(0)">Forum</a>
                  <a class="dropdown-item" href="javascript:void(0)">Invoice</a>
                  <a class="dropdown-item" href="javascript:void(0)">Photos</a>
                  <a class="dropdown-item" href="javascript:void(0)">Pricing</a>
                  <a class="dropdown-item" href="javascript:void(0)">Todo</a>
                  <a class="dropdown-item" href="javascript:void(0)">Blog</a>
                  <a class="dropdown-item" href="javascript:void(0)">Settings</a>
                  <a class="dropdown-item" href="javascript:void(0)">Profile</a>
                </div>
              </div>
            </li>
            <li class="nav-item dropdown">
              <a href="#" class="nav-link dropdown-toggle no-caret" role="button" data-bs-toggle="dropdown" aria-expanded="false" data-bs-auto-close="outside">
                <div class="position-relative">
                  <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20" fill="currentColor" aria-hidden="true">
                    <path d="M10 2a6 6 0 00-6 6v3.586l-.707.707A1 1 0 004 14h12a1 1 0 00.707-1.707L16 11.586V8a6 6 0 00-6-6zM10 18a3 3 0 01-3-3h6a3 3 0 01-3 3z" />
                  </svg>
                  <span class="badge bg-danger position-absolute top-0 start-100 translate-middle p-1">
                    <span class="visually-hidden">unread notifications</span>
                  </span>
                </div>
              </a>
              <div class="dropdown-menu dropdown-menu-end">
                <h6 class="dropdown-header d-flex justify-content-between">
                  5 New notifications
                  <a href="javascript:void(0)" class="text-muted ms-5">Clear</a>
                </h6>
                <div class="dropdown-divider"></div>
                <div class="max-h-[300px] overflow-auto">
                  <a class="dropdown-item d-flex align-items-center gap-3 py-2" href="javascript:void(0)">
                    <svg class="text-muted" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke="currentColor" aria-hidden="true">
                      <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M16 7a4 4 0 11-8 0 4 4 0 018 0zM12 14a7 7 0 00-7 7h14a7 7 0 00-7-7z" />
                    </svg>
                    <div class="vstack">
                      <p class="mb-0">New customer registered</p>
                      <small class="text-muted">5 min ago</small>
                    </div>
                  </a>
                  <a class="dropdown-item d-flex align-items-center gap-3 py-2" href="javascript:void(0)">
                    <svg class="text-muted" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke="currentColor" aria-hidden="true">
                      <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M16 11V7a4 4 0 00-8 0v4M5 9h14l1 12H4L5 9z" />
                    </svg>
                    <div class="vstack">
                      <p class="mb-0">New order received</p>
                      <small class="text-muted">11 min ago</small>
                    </div>
                  </a>
                  <a class="dropdown-item d-flex align-items-center gap-3 py-2" href="javascript:void(0)">
                    <svg class="text-muted" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke="currentColor" aria-hidden="true">
                      <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M11 4a2 2 0 114 0v1a1 1 0 001 1h3a1 1 0 011 1v3a1 1 0 01-1 1h-1a2 2 0 100 4h1a1 1 0 011 1v3a1 1 0 01-1 1h-3a1 1 0 01-1-1v-1a2 2 0 10-4 0v1a1 1 0 01-1 1H7a1 1 0 01-1-1v-3a1 1 0 00-1-1H4a2 2 0 110-4h1a1 1 0 001-1V7a1 1 0 011-1h3a1 1 0 001-1V4z" />
                    </svg>
                    <div class="vstack">
                      <p class="mb-0">Plugin updates available <span class="badge rounded-pill ms-1 bg-secondary align-bottom">3</span></p>
                      <small class="text-muted">30 min ago</small>
                    </div>
                  </a>
                  <a class="dropdown-item d-flex align-items-center gap-3 py-2" href="javascript:void(0)">
                    <svg class="text-muted" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke="currentColor" aria-hidden="true">
                      <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M4 16v1a3 3 0 003 3h10a3 3 0 003-3v-1m-4-4l-4 4m0 0l-4-4m4 4V4" />
                    </svg>
                    <div class="vstack">
                      <p class="mb-0">Download completed</p>
                      <small class="text-muted">35 min ago</small>
                    </div>
                  </a>
                  <a class="dropdown-item d-flex align-items-center gap-3 py-2" href="javascript:void(0)">
                    <svg class="text-muted" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke="currentColor" aria-hidden="true">
                      <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 5H7a2 2 0 00-2 2v12a2 2 0 002 2h10a2 2 0 002-2V7a2 2 0 00-2-2h-2M9 5a2 2 0 002 2h2a2 2 0 002-2M9 5a2 2 0 012-2h2a2 2 0 012 2m-3 7h3m-3 4h3m-6-4h.01M9 16h.01" />
                    </svg>
                    <div class="vstack">
                      <p class="mb-0">Weekly usage report</p>
                      <small class="text-muted">40 min ago</small>
                    </div>
                  </a>
                </div>
              </div>
            </li>
            <li class="nav-item vr mx-3"></li>
            <li class="nav-item dropdown">
              <a href="#" class="nav-link dropdown-toggle no-caret py-0 pe-0" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                <img src="resources/admin_asset/img/user/user1.svg" width="32" alt="User" class="rounded-circle" loading="lazy">
              </a>
              <ul class="dropdown-menu dropdown-menu-end">
                <li><a class="dropdown-item" href="javascript:void(0)">Profile</a></li>
                <li><a class="dropdown-item" href="user-settings.html">Settings</a></li>
                <li>
                  <div class="dropdown-divider"></div>
                </li>
                <li><a class="dropdown-item" href="signin.html">Sign out</a></li>
              </ul>
            </li>
          </ul>
        </nav>
      </div>
      <!-- /Main header -->

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
					
				  <div class="input-group">
	                <span>
					<input type="button" class="btn btn-outline-primary btn-sm" value="전체보기" onclick="location.href='contect.admin'">
					<c:forEach items="${contectButton.category }" var="category" varStatus="i">
					
					<input type="button" class="btn btn-outline-primary btn-sm" value="${category }" onclick="location.href='contect.admin?whatColumn=category_num&keyword=${i.index}'">
					                                            			
					</c:forEach>
					</span>
	              </div>
               
              </div>
              <div class="card-body p-0" data-simplebar>
              <div class="table-responsive">
              <table class="table">
                  <tr align="center">
				    <th width="3%"></th>
				    <th width="15%" >구분</th>
				    <th width="25%">제목</th>
				    <th width="15%">아이디</th>
				    <th width="15%">조회수</th>
				    <th width="17%">답변 및 수정</th>
				    <th width="10%">삭제</th>
				  </tr>
                  <c:forEach items="${contect_lists }" var="contect" varStatus="i">
				  <tr align="center" <c:if test="${contect.is_reply eq '1' ||contect.is_replied eq '1'}"> class="table-active" </c:if>>
				    <td></td>
				    <td>${contect.category[contect.category_num] } </td>
				    <td align="left">
				    <a href="detail.ctc?no=${contect.no }">
				    <c:if test="${contect.is_reply eq '1' }">
				    &nbsp;&#8627;	
				    </c:if>
				    <c:if test="${contect.is_replied eq '1' }">
				    [답변 완료]	
				    </c:if>
				    <c:if test="${contect.is_replied eq '0' }">
				    [답변 대기중]	
				    </c:if>
				    ${contect.title }</a>
				    </td>
				    <td>${contect.id }
				    </td>
				    <td>${contect.readcount }</td>
				    <td>
				    <c:if test="${contect.is_replied eq '0' }">
				    <div class="dropdown">
	                      <button id="getTaskModal2"  class="btn btn-outline-primary d-inline-flex align-items-center" type="button" data-bs-toggle="modal" data-bs-target="#taskModal2" 
	                      data-no="${contect.no }" data-content="${contect.content }" data-title="${contect.title }" data-category="${contect.category[contect.category_num] }" data-catenum="${contect.category_num }">
	                  답변 작성하기 
	                </button>
	                </div>
	                </c:if>
				    <c:if test="${contect.is_replied eq '1' && contect.is_reply eq '0' }">
				    <div class="dropdown">
	                      <button id="getTaskModal2" disabled="disabled" class="btn btn-outline-primary d-inline-flex align-items-center" type="button" data-bs-toggle="modal" data-bs-target="#taskModal2" 
	                      data-no="${contect.no }" data-content="${contect.content }" data-title="${contect.title }" data-category="${contect.category[contect.category_num] }" data-catenum="${contect.category_num }">
	                  답변 작성완료
	                </button>
	                </div>
	                </c:if>
				    <c:if test="${contect.is_reply eq '1' }">
				    <div class="dropdown">
	                      <button id="getTaskModal3"  class="btn btn-outline-primary d-inline-flex align-items-center" type="button" data-bs-toggle="modal" data-bs-target="#taskModal3" 
	                      data-no2="${contect.no }" data-content2="${contect.content }" data-title2="${contect.title }" data-category2="${contect.category[contect.category_num] }" data-catenum2="${contect.category_num }">
	                  답변 수정하기 
	                </button>
	                </div>
	                </c:if>
				    </td>
				    <td>
				    	
				    	<input type="button" class="btn btn-outline-primary d-inline-flex align-items-center" value="삭제하기" onclick="location.href='deleteContect.admin?no=${contect.no}&is_reply=${contect.is_reply }'">
				    	
				    </td>
				  </tr>
				  </c:forEach>
              </table>
             


<center>
${pageInfo.pagingHtml} 
</center>
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
                <h5 class="modal-title">답변 작성하기</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
              </div>
              <div class="modal-body">
              	<div class="mb-3">
                    <label for="taskContent" class="form-label">제목</label>
                    
                    <input type="text" readonly="readonly" id="re_title" name="re_title" class="form-control">
                                     			
                  </div>
              	<div class="mb-3">
                    <label for="taskContent" class="form-label">내용</label>
                    
                    <textarea id="re_content" name="re_content" class="form-control" rows="3" readonly="readonly"></textarea>
                                     			
                  </div>
                  <div class="mb-3">
                    <label for="taskCategory" class="form-label">원 카테고리</label>
                    <input type="text" id="category" name="category" readonly="readonly">
				</div>	                    
                <form class="needs-validation" novalidate id="taskForm2" action="replyContect.admin" method="post">
                 <input type="hidden" name="category_num" id="category_num">  
                  <div class="mb-3">
                    <label for="taskCategory" class="form-label">카테고리 변경</label>
                    <select class="form-select form-select-sm" name="re_cate" id="re_cate">
            			<option value="">카테고리 변경하기</option>
                    	<c:forEach items="${contectButton.category }" var="category" varStatus="i">
                    	<option value="${i.index}">
                    	${category }</option>
                                            			
                        </c:forEach>
                    </select>
                    <input type="hidden" name="no" id="no">
                    <div class="invalid-feedback">카테고리를 선택하세요.</div>
                  </div>
                  <div class="mb-3">
                    <label for="taskTitle" class="form-label">제목</label>
                    
                    <input type="text" id="title" name="title" class="form-control" required autofocus>
                    <div class="invalid-feedback">제목을 입력하세요.</div>
                  </div>
                  <div class="mb-3">
                    <label for="taskContent" class="form-label">답변</label>
                    
                    <textarea id="content" name="content" class="form-control" required autofocus rows="4" placeholder="내용을 입력하세요."></textarea>
                                     			
                    <div class="invalid-feedback">답변을 입력하세요.</div>
                  </div>
                 
                 
                </form>
              </div>
              <div class="modal-footer border-0">
                <button type="button" class="btn btn-light" data-bs-dismiss="modal">취소하기</button>
                <button type="submit" form="taskForm2" class="btn btn-primary px-5">저장하기</button>
              </div>
             </div> 
            </div>
           </div>  
 <!-- Task modal -->
        <div class="modal fade" id="taskModal3" tabindex="-1">
          <div class="modal-dialog modal-dialog-scrollable">
            <div class="modal-content">
              <div class="modal-header border-0">
                <h5 class="modal-title">답변 수정하기</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
              </div>
              <div class="modal-body">
              	
                  <div class="mb-3">
                    <label for="taskCategory" class="form-label">원 카테고리</label>
                    <input type="text" id="category2" name="category" readonly="readonly">
				</div>	                    
                <form class="needs-validation" novalidate id="taskForm3" action="replyContect.admin" method="post">
                   
                  <div class="mb-3">
                    <label for="taskCategory" class="form-label">카테고리 변경</label>
                    <select class="form-select form-select-sm" name="re_cate" id="re_cate2">
            			<option value="">카테고리 변경하기</option>
                    	<c:forEach items="${contectButton.category }" var="category" varStatus="i">
                    	<option value="${i.index}">
                    	${category }</option>
                                            			
                        </c:forEach>
                    </select>
                    <input type="hidden" name="category_num" id="category_num2">
                    <input type="hidden" name="no" id="no2">
                    <div class="invalid-feedback">카테고리를 선택하세요.</div>
                  </div>
                  <div class="mb-3">
                    <label for="taskTitle" class="form-label">제목</label>
                    
                    <input type="text" id="title2" name="title" class="form-control" required autofocus>
                    <div class="invalid-feedback">제목을 입력하세요.</div>
                  </div>
                  <div class="mb-3">
                    <label for="taskContent" class="form-label">답변</label>
                    
                    <textarea id="content2" name="content" class="form-control" required autofocus rows="4" placeholder="내용을 입력하세요."></textarea>
                                     			
                    <div class="invalid-feedback">답변을 입력하세요.</div>
                  </div>
                 
                 
                </form>
              </div>
              <div class="modal-footer border-0">
                <button type="button" class="btn btn-light" data-bs-dismiss="modal">취소하기</button>
                <button type="submit" form="taskForm3" class="btn btn-primary px-5">수정하기</button>
              </div>
             </div> 
            </div> 
       	</div>
      <!-- /Main body -->

      <!-- Main footer -->
      <div id="main-footer">
        <nav class="navbar navbar-expand navbar-light bg-white small shadow-sm">
          <span class="navbar-text">
            2021 &copy; Mimity admin
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

$(document).on("click", "#getTaskModal2", function () {
		  var data = $(this).data('no');
		    $("#no").val(data);
		  var data1 = $(this).data('title');
		    $("#re_title").val(data1);
		    $("#title").val("re:"+data1);
		  var data2 = $(this).data('content');
		    $("#re_content").val(data2);
		    
		  var data3 = $(this).data('category');
		    $("#category").val(data3);
		  var data4 = $(this).data('catenum');
		    $("#category_num").val(data4);
		 
})
$(document).on("click", "#getTaskModal3", function () {
	var data5 = $(this).data('no2');
		    $("#no2").val(data5);
	var data6 = $(this).data('title2');
		    $("#title2").val(data6);
	var data7 = $(this).data('content2');
		    $("#content2").val(data7);
		    
	var data8 = $(this).data('category2');
		    $("#category2").val(data8);
	var data9 = $(this).data('catenum2');
		    $("#category_num2").val(data9);
		 
})

</script>
</body>

</html>


