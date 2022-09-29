<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@include file="../common/common.jsp" %>
<%@include file="../member/commonTop.jsp" %>
<div class="container contact-pstyle2">    
<div class="collection-header">
	<div class="collection-hero">
		<div class="collection-hero__image"></div>
		<div class="collection-hero__title-wrapper container">
			<h2 style="font-family: 'Poppins', Arial, Tahoma !important; font-weight: 700 !important; font-size: 25px; color: black; margin-bottom: 0px">
			문의게시판
			</h2>
		</div>
	</div>
</div>

<input type="hidden" id="contect_id" value="${contect.id }">
<input type="hidden" id="contect_no" value="${contect.no }">
<table class="table">
	<tr>
		<td colspan="1">제목</td>
		<td colspan="2">[${contect.category[contect.category_num]}]${contect.title }</td>
		<td colspan="1">${contect.reg_date }</td>
	</tr>
	<tr>
		<td>아이디</td>
		<td>${fn:substring(contect.id,0,3) }
	    <c:forEach begin="4" end="${fn:length(contect.id) }" varStatus="i">
	    <c:if test="${i.count < 5 }">
	    *
	    </c:if>
	    </c:forEach>
	    </td>
	    <td>조회수</td>
	    <td>${contect.readcount }</td>
	</tr>
	<tr >
		<td colspan="4" height="200px">${contect.content }</td>
	</tr>
	<tr>
	<td>
	<input type="button" onclick="location.href='board.ctc?pageNumber=${pageNumber}'" value="돌아가기" >
	</td>
	<td></td>
		<td>
			<input type="button" onclick="gotoUpdate()" value="수정하기" >
		</td>
		<td>
			<input type="button" onclick="gotoDelete()" value="삭제하기" >
		</td>
	</tr>
</table>
<c:if test="${reply_contect != null}">
<table class="table table-active">
	<tr>
		<td colspan="1">제목</td>
		<td colspan="2">(답변)[${contect.category[contect.category_num]}]${contect.title }</td>
		<td>아이디 &nbsp; &nbsp; ${reply_contect.id }
	    </td>
	</tr>
	<tr>
		<td colspan="4" height="250px">${reply_contect.content }</td>
	</tr>
	
</table>

</c:if>

</div>


<script>
function gotoUpdate(){
	if($('#id').val()=="null"){
		if(confirm("로그인이 필요한 페이지입니다. \n 로그인 하시겠습니까?")){
			location.href="login.mb";	
		}
		return false;
	}
	else{
		if($('#id').val()==$('#contect_id').val()){
			location.href = "update.ctc?no="+$('#contect_no').val();		
		} else {
			alert("본인만 수정 가능합니다.");
		}

	}
}
function gotoDelete(){
	if($('#id').val()=="null"){
		if(confirm("로그인이 필요한 페이지입니다. \n 로그인 하시겠습니까?")){
			location.href="login.mb";	
		}
		return false;
	}
	else{
		if($('#id').val()==$('#contect_id').val()){
			location.href = "delete.ctc?no="+$('#contect_no').val();		
		} else {
			alert("본인만 삭제 가능합니다.");
		}

	}
}
</script>


<%@include file="../member/commonBottom.jsp" %>
