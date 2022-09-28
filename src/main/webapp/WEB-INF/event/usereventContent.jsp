<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@include file="../common/common.jsp" %>
<%@include file="../member/commonTop.jsp" %>
                        


				<div class="collection-header">
                    <div class="collection-hero">
                        <div class="collection-hero__image"></div>
                        <div class="collection-hero__title-wrapper container">
                            <h2 style="font-family: 'Poppins',Arial,Tahoma !important; font-weight: 700!important; font-size:25px;color: black; margin-bottom:0px">이벤트 상세페이지</h2>
                        </div>
                    </div>
                </div>



			<div class="container" style="width:50%">
				<div class="row">
					<div class="col" style="margin-bottom: 15px;">
						<strong>식별번호</strong> : ${bean.num}
					</div>
					
					<div class="col" style="margin-bottom: 15px;">
						<strong>이벤트 종료일</strong> : 
						<fmt:parseDate var="formattedDay" value="${bean.eventdate }" pattern="yyyy-MM-dd"/>
						<fmt:formatDate var="newformattedDay" value="${formattedDay }" pattern="yyyy-MM-dd"/>
						${newformattedDay}
					</div>
					
					<div class="col" style="margin-bottom: 15px;">
						<strong>조회수</strong> : ${bean.readcount}
					</div>
				
					<div class="row" style="margin-bottom: 15px;">
						<strong>제목 : ${bean.title}</strong> 
					</div>
					
					<div class="row" style="margin-bottom: 15px;">
						<strong>글내용 : ${bean.write}</strong> 
					</div>
					
					<div class="row" style="margin-bottom: 15px;">
						<img src="${pageContext.request.contextPath}/resources/images/${bean.eventImage}">
					</div>
					
					<div class="col" style="margin-bottom: 15px;">
						 <input type="button" value="이벤트 글 목록" onclick="location.href='view.evt?pageNum=${pageNumber}'">
					</div>
					
				</div>
			</div>

   <%@include file="../member/commonBottom.jsp" %>
