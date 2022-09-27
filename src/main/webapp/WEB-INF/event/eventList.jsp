<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../common/common.jsp"%>     
<%@ include file="../admin/top.jsp"%>
      
 <style>
  .td{
       color="#0054FF";
  }
  
   .img{
       height: 250;
       width: 250;
   
   }
 
 </style>  
 
    
      
                          

<b>이벤트 목록(전체 글 : ${totalCount })</b>
 
<c:if test="${fn:length(lists) > 0}">
<form action="list.evt" method="get">
		<select name="whatColumn">
			<option value="wow">전체 검색</option>
			<option value="subject">제목</option>
			<option value="writer">작성자</option>
		</select>
		<input type="text" name="keyword" >
		<input type="submit" value="검색"><br><br>
</form>
<tr>
		<a href="insert.evt"><button type="button" class="btn btn-danger text-transform-none rounded-3">글쓰기</button>
	       </a>
	</tr>
	
	
	
	
<table border="1" width="700">
	
<c:forEach items="${lists }" var="event" varStatus="i">

          <tr>
      <td align="center" width="200"  height="200" colspan="3"><img src="${pageContext.request.contextPath}/resources/images/${event.eventImage }"
         OnClick=" location.href ='content.evt?pageNumber=${pageInfo.pageNumber}&num=${event.num }'"></td>
      

     
   </tr>
			
					 <tr>	
			
			<td align="center" >
				
		
			<a href="content.evt?num=${event.num }&pageNumber=${pageInfo.pageNumber}" >${event.title }</a>
			
			</td>
			
			<tr>
	
			<td align="center">${event.writer }</td>
			</tr>
					
			
			<tr>
		
			<fmt:parseDate var="formattedDay" value="${evnt.eventdate }" pattern="yyyy-MM-dd"/>
				<fmt:formatDate var="newformattedDay" value="${formattedDay }" pattern="yyyy-MM-dd"/>
				${newformattedDay }</td>
				
			</tr>
					
		
	
</c:forEach>
</table>
${pageInfo.pagingHtml }	
</c:if>



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
                         