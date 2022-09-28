<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../common/common.jsp"%>     
<%@ include file="../admin/top.jsp"%>

<style>
.err {
	font-size: 10px;
	font-weight: bold;
	color: red;
}
</style>


<br>
	<div id="inner-main">
				<div class="card">
					<div class="card-header d-flex align-items-center gap-3">

					</div>
					<div class="card-body p-0" data-simplebar>
						<div class="vstack gap-2">
		<form:form commandName="event" method="post" name="eventInsertForm" action="insert.evt" enctype="multipart/form-data">
					<center><h2>이벤트 추가</h2></center>			
			
			<div class="mb-3">
					<label  class="form-label fw-bold"for="title"><br>제 목</label>
			</div>
			<div class="input-group ">			
						<input class="form-control" type="text" size="50" maxlength="50" name="title" value="${event.title }">
						<form:errors cssClass="err" path="title"/>
						<br>
					</div>
					
					
				<div class="mb-3">
					<label  class="form-label fw-bold"for="title"><br>작성자</label>
				</div>	
				<div class="input-group ">	
						<input class="form-control" type="text" size="30"maxlength="10" name="writer" value="관리자" readonly>
						<form:errors cssClass="err" path="writer"/>
						<br>
					</div>
					
					<div class="mb-3">
					<label  class="form-label fw-bold"for="title"><br>이벤트종료일</label>
					</div>
					<div class="input-group ">
						<input class="form-control" type="text" size="50" maxlength="30" name="eventdate" value="${event.eventdate}" placeholder="YYYY-MM-DD">
						<form:errors cssClass="err" path="eventdate"/>
					</div>
					
					<div class="mb-3">
					<label  class="form-label fw-bold"for="title"><br>이벤트 이미지</label>
					</div>
					<div class="input-group ">	
						<img align="center" height=100 width=100 src="${pageContext.request.contextPath}/resources/images${event.eventImage}">
						<input class="form-control" type="file"   name="upload" id="eventImage"  value="${event.eventImage }"><br>
	       				<form:errors cssClass="err" path="eventImage" />
					</div>
					
					<div class="mb-3">
					<label  class="form-label fw-bold"for="title"><br>내 용</label>
					</div>
					<div class="input-group ">
						<textarea class="form-control" name="write" id="abc" rows="13" cols="50">${event.write}</textarea><br>
						<form:errors cssClass="err" path="write"/>
					</div>
					
					<div class="mb-3">
						<input type="submit"  class="btn btn-info px-5" value="글쓰기"> 
					
					<input type="button" value="목록보기" class="btn btn-light" OnClick="window.location='list.evt?pageNumber=${pageNumber }'">
					</div>
			
		 </form:form>
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
                              
                                
                           