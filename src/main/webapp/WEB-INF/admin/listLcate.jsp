<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/common.jsp"%>     
listLcate.jsp<br>
<script type="text/javascript">
	function updateOrder_num(order_num){
		location.href="update.lcate?order_num="+order_num;
	}
</script>
<c:forEach items="${lists }" var="lcate" varStatus="i">
<c:if test="${lcate.order_num eq maxOrder_num}">
<input type="button" value="+" id="updateOrder_num">
${lcate.name }<br>
</c:if>
<c:if test="${lcate.order_num != maxOrder_num}">
<input type="button" value="+" id="updateOrder_num" onclick="updateOrder_num(${lcate.order_num})">
${lcate.name }<br>
</c:if>
</c:forEach>
