<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../common/common.jsp"%>     
<%@ include file="../admin/top.jsp"%>
      
 
 
    
      
                          
 <!-- Main body -->
      <div id="main-body">

        <div id="inner-wrapper">
          <div id="inner-main">
            <div class="card">
            <h2 style="align-self: center;">이벤트 목록(전체 글 : ${totalCount })</h2>
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
                
               <form action="list.evt" method="get">
		        <div class="input-group">
					<select class="form-select mt-0" name="whatColumn">
						<option value="wow">전체 검색</option>
						<option value="subject">제목</option>
						<option value="writer">작성자</option>
					</select>
					<input type="text" name="keyword"  class="form-control" placeholder="검색할 정보 입력">
					<input type="submit" class="btn btn-light" value="검색"><br><br>
				</div>
			   </form>
			   <a href="insert.evt" style="float: right;"><button type="button" style="align-items: flex-end;" class="btn btn-danger text-transform-none rounded-3">글쓰기</button></a>
              </div>

 


		
	
	
<div class="card-body p-0" data-simplebar>
             
<!-- 화면 작성하면 되는 부분 -->
<%	
	String apath = application.getContextPath() + "/resources/images";
%>
<div class="row row-cols-2 row-cols-lg-3 row-cols-xl-4 g-2 g-sm-4">
	
	<c:forEach var="event" items="${lists }" >
		<div class="col">
           

		
			 <div class="card">
				
					<a href="content.evt?pageNumber=${pageInfo.pageNumber}&num=${event.num }" class="product-img"> <!--Image--> 
						<img class="card-img-top" loading="lazy"  src="<%=apath%>/${event.eventImage}" alt="..." title="" style="height:250px !important" /> <!--End Image--> <!--Hover Image-->
					</a>
					<!-- End Product Image -->
	

				<div class="card-body">
					<!--Product Name-->
					<h6 class="card-title">
						<a class="text-uppercase fw-normal" href="usereventContent.evt?num=${event.num }&pageNumber=${pageInfo.pageNumber}">${event.title}</a>
					</h6>
					<!--End Product Name-->
					<!--Product Price-->
					<div class="card-subtitle text-muted small">
						마감일 : 
						
						<fmt:parseDate var="formattedDay" value="${event.eventdate}" pattern="yyyy-MM-dd" />
						<fmt:formatDate var="newformattedDay_endday" value="${formattedDay }" pattern="yyyy-MM-dd" />${newformattedDay_endday}
						
					</div>
				</div>
				<!--End Product Details-->
			</div>
		
		</div>
		
		
	</c:forEach>
</div>
<center>
${pageInfo.pagingHtml }	
</center>
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
                         