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
	<div style="margin: 50px 300px;">
		<form:form commandName="event" method="post" action="update.evt" enctype="multipart/form-data">
			<div class="container">
				<div class="row">
					<center><h2>이벤트 수정</h2></center>			
				</div>
			</div>
			
			<input type="hidden" name="num" value="${event.num}">
			<input type="hidden" name="pageNumber" value="${pageNumber}">
			<input type="hidden" name="originalImg" value="${event.eventImage}">
			
			<div class="container" style="width:600px;">
				<div class="row">
				
					<div class="row" style="margin-bottom: 15px;">
						<strong>제 목</strong>	
						<input type="text" size="50" maxlength="50" name="title" value="${event.title}">
						<form:errors cssClass="err" path="title"/>
					</div>
				
					<div class="row" style="margin-bottom: 15px;">
						<strong>작성자</strong><br>	
						<input type="text" size="30" maxlength="10" name="writer" value="관리자" readonly>
					</div>
				
					<div class="row" style="margin-bottom: 15px;">
						<strong>이벤트종료일</strong>
						<fmt:parseDate var="formattedDay" value="${event.eventdate }" pattern="yyyy-MM-dd"/>
	             		<fmt:formatDate var="newformattedDay" value="${formattedDay }" pattern="yyyy-MM-dd"/><br>
						<input type="text" size="50" maxlength="50" name="eventdate" value="${newformattedDay}" placeholder="YYYY-MM-DD">
						<form:errors cssClass="err" path="eventdate"/>
					</div>
					
					<div class="row" style="margin-bottom: 15px;">
						<strong>이벤트 이미지</strong><br>
						<img align="center" height="250" width="150" src="${pageContext.request.contextPath}/resources/images/${event.eventImage}">
						<input type="file"   name="upload" id="upload"  value="${event.upload }"><br>
	       				<form:errors cssClass="err" path="eventImage" />
					</div>
					
					<div class="row" style="margin-bottom: 15px;">
						<strong>내 용</strong>
						<textarea name="write" id="abc" rows="13" cols="50">${event.write}</textarea><br>
						<form:errors cssClass="err" path="write" /></td>
					</div>
					
					
				</div>
				
				
				<div class="row">
					<div class="col" style="margin-bottom: 15px;">
						<input type="submit" value="수정하기"> 
					</div>
					
					<div class="col" style="margin-bottom: 15px;">
						<input type="button" value="목록보기"  OnClick="window.location='list.evt?pageNumber=${pageNumber}'"> 
					</div>
				</div>
			</div>
		</form:form>
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
                              
                        