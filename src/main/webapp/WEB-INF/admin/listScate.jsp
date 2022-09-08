<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/common.jsp"%>     
    
listScate.jsp<br>
<table border="1">
<c:forEach items="${lists }" var="firstList">
	<c:forEach items="${firstList }" var="scate" varStatus="i">
	<c:if test="${i.count eq 1}">
	<tr>
		<th colspan="3">대분류 : ${scate.lcate_name}</th>
	</tr>
	</c:if>
	<tr>
		<td>${scate.lcate_no }</td>
		<td>${scate.name }</td>
		<td>${scate.order_num }</td>
	</tr>
	</c:forEach>

</c:forEach>
</table>
