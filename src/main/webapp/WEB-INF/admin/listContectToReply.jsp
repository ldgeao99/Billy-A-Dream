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
					
				  <div class="input-group">
	                <span>
					<input type="button" class="btn btn-outline-primary btn-sm" value="전체보기" onclick="location.href='contect.admin'">
					<c:forEach items="${contectButton.category }" var="category" varStatus="i">
					
					<input type="button" class="btn btn-outline-primary btn-sm" value="${category }" onclick="location.href='contect.admin?whatColumn=category_num&keyword=${i.index}'">
					                                            			
					</c:forEach>
					</span>
	              </div>
               	<form action="contectToReply.admin" method="get">
					
				  <div class="input-group">
	                <select class="form-select mt-0" name="whatColumn">
						<option value="">전체 검색</option>
						<option value="title">제목</option>
						<option value="id">아이디</option>
					</select>
	                <input type="text" name="keyword" class="form-control" placeholder="검색할 정보 입력">
	                <button type="submit" class="btn btn-light">검색</button>
	              </div>
				</form>
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
				  <tr align="center" >
				    <td></td>
				    <td>${contect.category[contect.category_num] } </td>
				    <td align="left">
				    <a href="detail.ctc?no=${contect.no }">
				    
				    ${contect.title }</a>
				    </td>
				    <td>${contect.id }
				    </td>
				    <td>${contect.readcount }</td>
				    <td>
				    
				    <div class="dropdown">
	                      <button id="getTaskModal2"  class="btn btn-outline-primary d-inline-flex align-items-center" type="button" data-bs-toggle="modal" data-bs-target="#taskModal2" 
	                      data-no="${contect.no }" data-content="${contect.content }" data-title="${contect.title }" data-category="${contect.category[contect.category_num] }" data-catenum="${contect.category_num }">
	                  답변 작성하기 
	                </button>
	                </div>
	                
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


</script>
</body>

</html>


