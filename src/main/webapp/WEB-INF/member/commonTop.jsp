<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	String id = (String)session.getAttribute("id"); // 아이디
	System.out.println("id : "+id); 
%>
<c:set var="id" value="<%=id %>"></c:set>
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<script src="resources/assets/js/vendor/jquery-min.js"></script>

<style>
.logo img{
	max-width: 200px !important; /* 250 */
	max-height: 60px !important; /* 250 */
}
</style>

<script>
	$(function(){
		
		// getting category
		$.ajax({
			url : "getLargeCategory.lcate",
			success : function(originText) { // mobile,1|pc/notebook,2|camera/dslr,3
				var lcateTextArr = []; // 모바일,PC/노트북,카메라/DSLR
				var lcateNoArr = [];   // 1,2,3
				
				var originArr = originText.split('|'); //['mobile,1','pc/notebook,2', 'camera/dslr,3'] 
				 
				for(var i = 0; i<originArr.length; i++){
					lcateTextArr.push(originArr[i].split(',')[0]); //[mobile, pc/notebook, camera/dslr]
					lcateNoArr.push(originArr[i].split(',')[1]);
					$('#cate_dropdown').append("<li id="+ originArr[i].split(',')[1] +">" 
					+ "<a href= " + "javascript:gotoSearchByCate('" + originArr[i].split(',')[0] + "')" +  " class='site-nav'>"+ originArr[i].split(',')[0] +"<i class='an an-angle-right-l'></i></a>"
					+ "</li>");
				}
				// --- makeing lcate completed 
				
				// solved async problem by promise(if we dont use promise, then loop will operate 2 times, even if loop size is 3)
				for(var i = 0; i<lcateNoArr.length ;i++){
					getScate(lcateNoArr[i])
					.then( (index) => {
						//console.log(index + "종료");
					});	
				}
				// -- inserting scate completed
				
			} // outside sucess end
		});// outside ajax end
		
		$('#rgsearch-category1').change(function(){
			if($('#id').val() == "null" && $('#rgsearch-category1').val() == "mylocation"){
				if(confirm("로그인이 필요한 기능입니다. \n 로그인 하시겠습니까?")){
					location.href="login.mb";	
				}
				return false;
			}
			
			if($('#rgsearch-category1').val() == "mylocation"){
				$('input[name="keyword"]').attr('placeholder', '상품명을 입력하세요');	
			}else if($('#rgsearch-category1').val() == "name"){
				$('input[name="keyword"]').attr('placeholder', '상품명을 입력하세요');
			}else if($('#rgsearch-category1').val() == "seller_name"){
				$('input[name="keyword"]').attr('placeholder', '판매자 아이디를 입력하세요');
			}else if($('#rgsearch-category1').val() == "all"){
				$('input[name="keyword"]').attr('placeholder', 'Search Products');
			}
				
				
		});
		
		
	}); // function end		
	
	function getScate(lno){
		return new Promise((resolve, reject) => {
			$.ajax({
				url : "getSmallCategory.scate",
				data : {
					lcategoryNo : lno
				},
				success : function(originText2) { // 스마트워치,2|스마트폰,1       모니터,3|노트북,4      필름카메라,5
					console.log(originText2);
					
					var scate = [];
					var originArr2 = originText2.split('|');
					
					for(var i = 0; i<originArr2.length; i++){
						scate.push(originArr2[i].split(',')[0]);
					}
					
					$("li[id='"+ lno + "']").append("<ul class='dropdown'> </ul>");
					
					for(var i = 0; i<scate.length; i++){
						$("li[id='"+ lno + "']" + ">" + ".dropdown").append("<li>" 
								+ "<a href= " + "javascript:gotoSearchByCate('" + scate[i] + "')" +  " class='site-nav last'>" + scate[i] +"</a></li>"
								+ "</li>");	
					}
				}
			});// inside ajax end
		});// promise end
	}
	
	function logout() {
	   location.href="https://kauth.kakao.com/oauth/logout?client_id=712a5c51e06bca8448c4c65b4205bb54&logout_redirect_uri=http://43.201.24.151:8080/realnew/out.mb";
	  }
</script>

<html lang="ko">
    <head>
        <!--Required Meta Tags-->
        <meta charset="utf-8">
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="description" content="description">
        
        <!-- Title Of Site -->
        <title>Billy A Dream</title>
        
        <!-- Favicon -->
        <link rel="shortcut icon" href="resources/assets/images/favicon.png" />
        
        <!-- Plugins CSS -->
        <link rel="stylesheet" href="resources/assets/css/plugins.css" />
        
        <!-- Main Style CSS -->
        <link rel="stylesheet" href="resources/assets/css/style.css" />
        <link rel="stylesheet" href="resources/assets/css/responsive.css" />
        
        <!-- Main Style CSS From CategortyTop-->
        <link rel="stylesheet" href="resources/assets/css/style.css" />
        <link rel="stylesheet" href="resources/assets/css/responsive.css" />
        <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">
    	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
   		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css" />
        
        
        <!-- 오른쪽 상단 아이콘 관련 -->
        <script src="https://kit.fontawesome.com/75769dc150.js" crossorigin="anonymous"></script>
        <script>
        
        function gotoSellPage(){
    		if($('#id').val()=="null"){
    			if(confirm("로그인이 필요한 페이지입니다. \n 로그인 하시겠습니까?")){
    				location.href="login.mb";	
    			}
    			return false;
    		}
    		else{
    			
    			location.href = "insert.prd";
    		}
    	}
    	
    	function chat(){
    		if($('#id').val()=="null"){
    			if(confirm("로그인이 필요한 페이지입니다. \n 로그인 하시겠습니까?")){
    				location.href="login.mb";	
    			}
    			return false;
    		}
    		else{
    			
    			location.href = "allchatting.mb";
    		}
    	}
    	
    	function kakaoTalk(){
    		var idx = "${eduVO.idx}";
		    var windowW = 550;
		    var windowH = 650;
		    var winHeight = document.body.clientHeight;
		    var winWidth = document.body.clientWidth;
		    var winX = window.screenX || window.screenLeft || 0;
		    var winY = window.screenY || window.screenTop || 0;
		    var popX = winX + (winWidth - windowW)/2;
		    var popY = winY + (winHeight - windowH)/2;
    		
    		window.open("http://pf.kakao.com/_pxcHuxj/chat","카카오톡 상담하기","width=" + windowW + ", height=" + windowH + ", scrollbars=no, menubar=no, top=" + popY + ", left=" + popX);
    	}
    	
    	function mypage(){
    		if($('#id').val()=="null"){
    			if(confirm("로그인이 필요한 페이지입니다. \n 로그인 하시겠습니까?")){
    				location.href="login.mb";	
    			}
    			return false;
    		}
    		else{
    			
    			location.href = "mypage.mb";
    		}
    	}
    	
    	function gotoSearchByCate(cateName){
        	location.href = "clickedCateName.prd?whatColumn="+ "category" + "&keyword=" + cateName; 	
        }
        
    	
    	function gotoDealHistory(){
    		if($('#id').val()=="null"){
    			if(confirm("로그인이 필요한 페이지입니다. \n 로그인 하시겠습니까?")){
    				location.href="login.mb";	
    			}
    			return false;
    		}
    		else{
    			
    			location.href = "mypage.mb?select=2";
    		}
    	}
    	
    	function gotoWishList(){
    		if($('#id').val()=="null"){
    			if(confirm("로그인이 필요한 페이지입니다. \n 로그인 하시겠습니까?")){
    				location.href="login.mb";	
    			}
    			return false;
    		}
    		else{
    			
    			location.href = "mypage.mb?select=3";
    		}
    	}    	
    	
        </script>
        <style>
	        i {
	    		font-size: 1rem;
			}
		</style>
		
    </head>

<body class="template-index index-demo20">
        <!-- Page Loader -->
        <div id="pre-loader"><img src="resources/assets/images/loader.gif" alt="Loading..." /></div>
        <!-- End Page Loader -->

        <!--Page Wrapper-->
        <div class="page-wrapper">

            <!--Header wrap-->
            <div class="header-main header-18" style="margin-top:15px !important;">
                <!--Header-->
                <header id="header" class="header header-wrap d-flex align-items-center" style="background-color: #FFF">
                    <div class="container">        
                        <div class="row">
                            <!--Logo / Menu Toggle-->
                            <div class="col-6 col-sm-6 col-md-6 col-lg-2 align-self-center justify-content-start d-flex">
                                <!--Mobile Toggle-->
                                <button type="button" class="btn--link site-header__menu js-mobile-nav-toggle mobile-nav--open me-3 d-lg-none"><i class="icon an an-times-l"></i><i class="icon an an-bars-l"></i></button>
                                <!--End Mobile Toggle-->
                                <!--Logo-->
                                <div class="logo"><a href="/realnew/"><img class="logo-img mh-100" src="resources/assets/images/cloud30.png" alt="Optimal Multipurpose eCommerce Bootstrap 5 Html Template" title="Optimal Multipurpose eCommerce Bootstrap 5 Html Template" /><span class="logo-txt d-none">Optimal</span></a></div>
                                <!--End Logo-->
                            </div>
                            <!--End Logo / Menu Toggle-->
                            <!--Search Inline-->
                            <div class="col-1 col-sm-1 col-md-1 col-lg-8 d-none d-lg-block">
                                <form class="form minisearch search-inline px-5" id="header-search1" action="search.prd" method="get">
                                	<input type="hidden" id="id" id="id" value="<%=id %>">
                                    <label class="label d-none"><span>Search</span></label>
                                    <div class="control">
                                        <div class="searchField d-flex" style="margin-top:8px">
                                            <div class="search-category">
                                                <select id="rgsearch-category1" name="whatColumn" data-default="전체검색" class="rounded-pill-start" style="padding-left: 15px;">
                                                	<option value="all" <c:if test="${param.whatColumn eq 'all'}">selected</c:if>> 전체검색</option>
                                                	<option value="mylocation"  <c:if test="${param.whatColumn eq 'mylocation'}">selected</c:if> > 내위치 기반</option> 
                                                	<option value="name" <c:if test="${param.whatColumn eq 'name'}">selected</c:if>> 상품명</option>
                                                	<option value="seller_name" <c:if test="${param.whatColumn eq 'seller_name'}">selected</c:if>> 판매자 ID</option>
                                                    
                                                
                                                    <!-- 
                                                    <option value="all" label="전체검색" selected="selected">전체검색</option>
                                                    <optgroup id="rgsearch-shop1" label="텍스트기반">
                                                        <option value="0">상품명</option>
                                                        <option value="1">카테고리</option>
                                                    </optgroup> 
                                                    -->
                                                </select>
                                            </div>
                                            <div class="input-box d-flex w-100">
                                                <input type="text" name="keyword" value="" placeholder="Search products" class="input-text rounded-0 border-start-0 border-end-0">
                                                <button type="submit" title="Search" class="action search rounded-pill-end"><i class="icon an an-search-l"></i></button>
                                            </div>
                                        </div>
                                    </div>
                                </form>
                            </div>
                            <!--End Search Inline-->
                            <!--Right Action-->
                            <div class="col-6 col-sm-6 col-md-6 col-lg-2 align-self-center icons-col text-right d-flex justify-content-end">
                                <!--Search-->
                                <div class="site-search iconset d-block d-lg-none"><i class="icon an an-search-l"></i><span class="tooltip-label">Search</span></div>
                                <!--End Search-->
                                <!--Wishlist-->
                                <div class="wishlist-link iconset d-none"><i class="icon an an-heart-l"></i><span class="wishlist-count counter d-flex-center justify-content-center position-absolute translate-middle rounded-circle">0</span><span class="tooltip-label">Wishlist</span></div>
                                <!--End Wishlist-->
                                <!--Setting Dropdown-->
                                
                               <!-- 상단 오른편 판매하기 버튼 -->
                                <div class="iconset flex-lg-column">
	                                	<i class="fa-solid fa-won-sign" onClick="gotoSellPage()"></i>
	                                	<span class="text d-none d-lg-flex" onClick="gotoSellPage()">판매하기</span>
                                </div>
                               
                                <!-- 상단 오른편 판매하기 버튼 -->
                                <div class="iconset flex-lg-column">
	                                	<i class="fa-regular fa-comment"></i>
	                                	<span class="text d-none d-lg-flex" onClick="chat()">채팅</span>
                                </div>
                                
                                <!-- 상단 오른편 마이페이지 버튼 -->
                                <div class="user-link iconset flex-lg-column">
                                	<i class="fa-regular fa-user">
                                		</i><span class="text d-none d-lg-flex" onclick="mypage()">마이페이지</span>
                                </div>
                                <%-- <div id="userLinks" class="mt-lg-3">
                                    <ul class="user-links">
                                    	<c:if test="${id == null}">
                                        	<li><a href="register.mb">회원가입</a></li>
                                    	</c:if>
                                    	<c:if test="${not empty id }">
                                        	<li><a href="mypage.mb?id=<%=id%>">마이페이지</a></li>
                                        	<li><a href="my-wishlist.mb">관심목록</a></li>
                                    	</c:if>
                                    </ul>
                                </div> 
                                --%>
                                
                                <!-- 상단 오른편 로그인,로그아웃 버튼 -->
                                <c:if test="${id == null}">
                                <div class="iconset flex-lg-column">
	                                	<i class="fa-solid fa-lock-open"></i>
	                                	<span class="text d-none d-lg-flex" onClick="location.href='login.mb'">로그인</span>
                                </div>
                                </c:if>
                                 <c:if test="${id != null}">
                                <div class="iconset flex-lg-column">
	                                	<i class="fa-solid fa-lock"></i>
	                                	<span class="text d-none d-lg-flex" onClick="logout()">로그아웃</span>
                                </div>
                                </c:if>
                                <!--End Setting Dropdown-->
                                
                                <!--Setting Dropdown-->

                                
                                <div id="settingsBox" class="mt-lg-3">
                                    <div class="currency-picker">
                                        <span class="ttl">Select Currency</span>
                                        <ul id="currencies" class="cnrLangList">
                                            <li class="selected"><a href="#;" class="active">INR</a></li><li><a href="#;">GBP</a></li><li><a href="#;">CAD</a></li><li><a href="#;">USD</a></li><li><a href="#;">AUD</a></li><li><a href="#;">EUR</a></li><li><a href="#;">JPY</a></li>
                                        </ul>
                                    </div>
                                    <div class="language-picker">
                                        <span class="ttl">SELECT LANGUAGE</span>
                                        <ul id="language" class="cnrLangList">
                                            <li><a href="#" class="active">English</a></li><li><a href="#">French</a></li><li><a href="#">German</a></li>
                                        </ul>
                                    </div>
                                </div>
                                <!--End Setting Dropdown-->
                            </div>
                            <!--End Right Action-->
                        </div>
                    </div>
                    <!--Search Popup-->
                    <div id="search-popup" class="search-drawer">
                        <div class="container">
                            <span class="closeSearch an an-times-l"></span>
                            <form class="form minisearch" id="header-search" action="#" method="get">
                                <label class="label"><span>Search</span></label>
                                <div class="control">
                                    <div class="searchField">
                                        <div class="search-category">
                                            <select id="rgsearch-category" name="rgsearch[category]" data-default="All Categories">
                                                <option value="00" label="All Categories" selected="selected">All Categories</option>
                                                <optgroup id="rgsearch-shop" label="Shop">
                                                    <option value="0">- All</option>
                                                    <option value="1">- Men</option>
                                                    <option value="2">- Women</option>
                                                    <option value="3">- Shoes</option>
                                                    <option value="4">- Blouses</option>
                                                    <option value="5">- Pullovers</option>
                                                    <option value="6">- Bags</option>
                                                    <option value="7">- Accessories</option>
                                                </optgroup>
                                            </select>
                                        </div>
                                        <div class="input-box">
                                            <button type="submit" title="Search" class="action search rounded-0"><i class="icon an an-search-l"></i></button>
                                            <input type="text" name="q" value="" placeholder="Search by keyword or #" class="input-text rounded-0">
                                        </div>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                    <!--End Search Popup-->
                </header>
                <!--End Header-->
                <!--Main Navigation Desktop-->
                <div class="menu-outer d-none d-lg-block">
                    <div class="container">
                        <div class="row">
                            <div class="col-1 col-sm-1 col-md-1 col-lg-12 align-self-center d-menu-col">                            
                                <nav class="grid__item" id="AccessibleNav">
                                    <ul id="siteNav" class="site-nav medium center hidearrow">
                                        <!-- <li class="lvl1 parent megamenu"><a href="#;">Home <i class="an an-angle-down-l"></i></a>
                                            <div class="megamenu style1">
                                                <div class="row">
                                                    <div class="col-md-8 col-lg-8">
                                                        <div class="row">
                                                            <div class="lvl-1 col-md-5 col-lg-4">
                                                                <a href="#" class="site-nav lvl-1 menu-title">Home Styles</a>
                                                                <ul class="subLinks">
                                                                    <li class="lvl-2"><a href="index.html" class="site-nav lvl-2">Home 01 - Default</a></li>
                                                                    <li class="lvl-2"><a href="index-demo2.html" class="site-nav lvl-2">Home 02 - Minimal</a></li>
                                                                    <li class="lvl-2"><a href="index-demo3.html" class="site-nav lvl-2">Home 03 - Colorful</a></li>
                                                                    <li class="lvl-2"><a href="index-demo4.html" class="site-nav lvl-2">Home 04 - Modern</a></li>
                                                                    <li class="lvl-2"><a href="index-demo5.html" class="site-nav lvl-2">Home 05 - Kids Clothing</a></li>
                                                                    <li class="lvl-2"><a href="index-demo6.html" class="site-nav lvl-2">Home 06 - Single Product</a></li>
                                                                    <li class="lvl-2"><a href="index-demo7.html" class="site-nav lvl-2">Home 07 - Glamour</a></li>
                                                                    <li class="lvl-2"><a href="index-demo8.html" class="site-nav lvl-2">Home 08 - Simple</a></li>
                                                                    <li class="lvl-2"><a href="index-demo9.html" class="site-nav lvl-2">Home 09 - Cool <span class="lbl nm_label1">Hot</span></a></li>
                                                                    <li class="lvl-2"><a href="index-demo10.html" class="site-nav lvl-2">Home 10 - Cosmetic</a></li>
                                                                </ul>
                                                            </div>
                                                            <div class="lvl-1 col-md-5 col-lg-4">
                                                                <a href="#" class="site-nav lvl-1 menu-title">Home Styles</a>
                                                                <ul class="subLinks">
                                                                    <li class="lvl-2"><a href="index-demo11.html" class="site-nav lvl-2">Home 11 - Pets <span class="lbl nm_label3">Popular</span></a></li>
                                                                    <li class="lvl-2"><a href="index-demo12.html" class="site-nav lvl-2">Home 12 - Tools & Parts</a></li>
                                                                    <li class="lvl-2"><a href="index-demo13.html" class="site-nav lvl-2">Home 13 - Watches <span class="lbl nm_label1">Hot</span></a></li>
                                                                    <li class="lvl-2"><a href="index-demo14.html" class="site-nav lvl-2">Home 14 - Food</a></li>
                                                                    <li class="lvl-2"><a href="index-demo15.html" class="site-nav lvl-2">Home 15 - Christmas</a></li>
                                                                    <li class="lvl-2"><a href="index-demo16.html" class="site-nav lvl-2">Home 16 - Phone Case</a></li>
                                                                    <li class="lvl-2"><a href="index-demo17.html" class="site-nav lvl-2">Home 17 - Jewelry</a></li>
                                                                    <li class="lvl-2"><a href="index-demo18.html" class="site-nav lvl-2">Home 18 - Bag <span class="lbl nm_label3">Popular</span></a></li>
                                                                    <li class="lvl-2"><a href="index-demo19.html" class="site-nav lvl-2">Home 19 - Swimwear</a></li>
                                                                    <li class="lvl-2"><a href="index-demo20.html" class="site-nav lvl-2">Home 20 - Furniture <span class="lbl nm_label2">New</span></a></li>
                                                                </ul>
                                                            </div>
                                                            <div class="lvl-1 col-md-5 col-lg-4">
                                                                <a href="#" class="site-nav lvl-1 menu-title">Home Styles</a>
                                                                <ul class="subLinks">
                                                                    <li class="lvl-2"><a href="index-demo21.html" class="site-nav lvl-2">Home 21 - Party Supplies <span class="lbl nm_label2">New</span></a></li>
                                                                    <li class="lvl-2"><a href="index-demo22.html" class="site-nav lvl-2">Home 22 - Digital <span class="lbl nm_label2">New</span></a></li>
                                                                    <li class="lvl-2"><a href="index-demo23.html" class="site-nav lvl-2">Home 23 - Vogue <span class="lbl nm_label2">New</span></a></li>
                                                                    <li class="lvl-2"><a href="index-demo24.html" class="site-nav lvl-2">Home 24 - Glamour <span class="lbl nm_label2">New</span></a></li>
                                                                </ul>

                                                                <div class="row mm-Banners mt-3">
                                                                    <div class="col-md-12 col-lg-12 imageCol text-center">
                                                                        <div class="menubox position-relative">
                                                                            <a href="index-demo5.html" class="mb-0"><img class="blur-up lazyload" src="resources/assets/images/megamenu/megamenu-banner7.png" data-src="resources/assets/images/megamenu/megamenu-banner7.png" alt="image"/></a>
                                                                            <p class="position-absolute bottom-0 start-50 translate-middle-x"><a href="index-demo5.html" class="title text-uppercase mb-3">Kids Store</a></p>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="col-md-4 col-lg-4">
                                                        <div class="row mm-Banners">
                                                            <div class="col-md-12 col-lg-12 imageCol text-center">
                                                                <div class="menubox position-relative">
                                                                    <a href="index-demo6.html" class="mb-0"><img class="blur-up lazyload" src="resources/assets/images/megamenu/megamenu-banner8.png" data-src="resources/assets/images/megamenu/megamenu-banner8.png" alt="image"/></a>
                                                                    <p class="position-absolute bottom-0 start-50 translate-middle-x"><a href="index-demo6.html" class="title text-uppercase">Single Product Layout</a></p>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </li> -->
                                        <li class="lvl1 parent dropdown"><a href="#;"><i class="fa-solid fa-bars"></i></i> <i class="an an-angle-down-l"></i></a>
                                            <!-- foreach -->
                                            <ul class="dropdown" id="cate_dropdown">
                                            
                                          	<!-- category가 ajax로 들어오는 자리 -->
											
                                            </ul>
                                        </li>
                                        
                                        
                                      
                                        
                                        <li class="lvl1 parent megamenu"><a href="newOrPopularClicked.prd?pageNumber=1&pageSize=8&whatColumn=new">최신상품<i class="an an-angle-down-l"></i><span class="navLbl new">New</span></a>
                                            
                                        </li>
                                        
                                        <li class="lvl1 parent megamenu"><a href="newOrPopularClicked.prd?pageNumber=1&pageSize=8&whatColumn=hot">인기상품<i class="an an-angle-down-l"></i></a><!-- class="shop-offers" -->
                                         
                                        </li>
                                        
                                        
                                        
                                        <li class="lvl1 parent dropdown"><a href="view.evt">이벤트<i class="an an-angle-down-l"></i></a>
                                           <!--  <ul class="dropdown">
                                                <li><a href="blog-left-sidebar.html" class="site-nav">Left Sidebar</a></li>
                                                <li><a href="blog-right-sidebar.html" class="site-nav">Right Sidebar</a></li>
                                                <li><a href="blog-fullwidth.html" class="site-nav">Fullwidth</a></li>
                                                <li><a href="blog-masonry.html" class="site-nav">Masonry Blog Style</a></li>
                                                <li><a href="blog-2columns.html" class="site-nav">2 Columns</a></li>
                                                <li><a href="blog-3columns.html" class="site-nav">3 Columns</a></li>
                                                <li><a href="blog-4columns.html" class="site-nav">4 Columns</a></li>
                                                <li><a href="blog-single-post.html" class="site-nav last">Article Page</a></li>
                                            </ul> -->
                                        </li>
                                        
                                        <li class="lvl1 parent megamenu"><a href="board.ctc">문의게시판<i class="an an-angle-down-l"></i></a>
                                           
                                        </li>
                                        
                                        <li class="lvl1 parent megamenu"><a href="javascript:gotoDealHistory()">거래내역<i class="an an-angle-down-l"></i></a>
                                            
                                        </li>
                                        
                                        <li class="lvl1 parent megamenu"><a href="javascript:gotoWishList()">관심목록<i class="an an-angle-down-l"></i></a>
                                            
                                        </li>
                                        
                                        <c:if test="${id eq 'admin'}">
                                        	<li class="lvl1 parent dropdown"><a href="main.admin" style="color: red">관리자페이지<i class="an an-angle-down-l"></i></a>
                                        	</li>
                                        </c:if>
                                    </ul>
                                </nav>                                   
                            </div>
                        </div>
                    </div>
                </div>
                <!--End Main Navigation Desktop-->
            </div>
            <!--End Header wrap-->
            
            