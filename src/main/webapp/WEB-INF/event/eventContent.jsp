<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<%@ include file="../common/common.jsp"%>     
<%@ include file="../admin/top.jsp"%>

    


                              
	 <div style="margin: 50px 250px; width:60%">
			<div class="container">
				<div class="row">
					<center><h2>이벤트 보기</h2></center>			
				</div>
			</div>
			
			<div class="container">
				<div class="row">
					<div class="col" style="margin-bottom: 15px;">
						<strong>식별번호</strong> : ${bean.num}
					</div>
					
					<div class="col" style="margin-bottom: 15px;">
						<strong>조회수</strong> : ${bean.readcount}
					</div>
				</div>
				<div class="row">
					<div class="col" style="margin-bottom: 15px;">
						<strong>이벤트 종료일</strong> : 
						<fmt:parseDate var="formattedDay" value="${bean.eventdate }" pattern="yyyy-MM-dd"/>
						<fmt:formatDate var="newformattedDay" value="${formattedDay }" pattern="yyyy-MM-dd"/>
						${newformattedDay}
					</div>
				</div>
					
				<div class="row">
					
					<div class="row" style="margin-bottom: 15px;">
						<strong>제목 : ${bean.title}</strong> 
					</div>
					
					<div class="row" style="margin-bottom: 15px;">
						<strong>글내용 : ${bean.write}</strong> 
					</div>
					
					<div class="row" style="margin-bottom: 15px;">
						<img src="${pageContext.request.contextPath}/resources/images/${bean.eventImage}" style="width:100%">
					</div>
					
				</div>
				
				<div class="row">
					<div class="col" style="margin-bottom: 15px;">
						<input type="button" value="이벤트 글 수정" onclick="location.href='update.evt?num=${bean.num}&pageNumber=${pageNumber}'">
					</div>
					
					<div class="col" style="margin-bottom: 15px;">
						 <input type="button" value="이벤트 글 삭제" onclick="location.href='delete.evt?num=${bean.num}&pageNumber=${pageNumber}'">
					</div>
					
					<div class="col" style="margin-bottom: 15px;">
						 <input type="button" value="이벤트 글 목록" onclick="location.href='list.evt?pageNum=${pageNumber}'">
					</div>
				</div>
			</div>
	</div>                        
                         
                          


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


   
                              
                              
                              
      