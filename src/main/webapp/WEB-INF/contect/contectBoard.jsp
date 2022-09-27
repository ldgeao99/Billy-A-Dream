<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@include file="../common/common.jsp" %>
<%@include file="../member/commonTop.jsp" %>


<div class="collection-header">
	<div class="collection-hero">
		<div class="collection-hero__image"></div>
		<div class="collection-hero__title-wrapper container">
			<h2
				style="font-family: 'Poppins', Arial, Tahoma !important; font-weight: 700 !important; font-size: 25px; color: black; margin-bottom: 0px">
				<input type="hidden" id="what" value="${param.whatColumn}">
				문의게시판

			</h2>
		</div>
	</div>
</div>

<div class="container contact-pstyle2">    

<span>
<input type="button" class="btn btn-outline-primary btn-sm" value="전체보기" onclick="location.href='board.ctc'">
<c:forEach items="${contectButton.category }" var="category" varStatus="i">

<input type="button" class="btn btn-outline-primary btn-sm" value="${category }" onclick="location.href='board.ctc?whatColumn=category_num&keyword=${i.index}'">
                                            			
</c:forEach>
<input type="button" class="btn btn-primary btn-sm" style="float: right;" value="직접 문의하기" onclick="gotoContect()">

</span>

<table class="table">
  <tr align="center">
    <th width="10%"></th>
    <th width="15%" >구분</th>
    <th width="35%">제목</th>
    <th width="15%">아이디</th>
    <th width="15%">조회수</th>
    <th width="10%"></th>
  </tr>
  <c:forEach items="${contect_lists }" var="contect"  varStatus="i">
  <tr align="center" <c:if test="${contect.is_reply eq '1' }"> class="table-active" </c:if>>
    <td></td>
    <td>${contect.category[contect.category_num] } </td>
    <td align="left">
    <a href="detail.ctc?no=${contect.no }">
    <c:if test="${contect.is_reply eq '1' }">
    &#8627;	
    </c:if>
    <c:if test="${contect.is_replied eq '1' }">
    [답변 완료]	
    </c:if>
    <c:if test="${contect.is_replied eq '0' }">
    [답변 대기중]	
    </c:if>
    ${contect.title }</a>
    </td>
    <td>${fn:substring(contect.id,0,3) }
    <c:forEach begin="4" end="${fn:length(contect.id) }" varStatus="i">
    <c:if test="${i.count < 5 }">
    *
    </c:if>
    </c:forEach></td>
    <td>
    <c:if test="${contect.is_reply eq '0' }">
    ${contect.readcount }	
    </c:if>
    </td>
    <td></td>
  </tr>
  </c:forEach>
</table>
<center>
${pageInfo.pagingHtml} <!-- 코드가 삽입되게 함 -->
</center>
</div>
<script>
function gotoContect(){
	if($('#id').val()=="null"){
		if(confirm("로그인이 필요한 페이지입니다. \n 로그인 하시겠습니까?")){
			location.href="login.mb";	
		}
		return false;
	}
	else{
		
		location.href = "insert.ctc";

	}
}
</script>




<%@include file="../member/commonBottom.jsp" %>