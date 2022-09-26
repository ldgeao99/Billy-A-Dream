<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@include file="../common/common.jsp" %>
<%@include file="../member/commonTop.jsp" %>

<!-- style for kakao map  -->
<style>
.area {
	position: absolute;
	background: #fff;
	border: 1px solid #888;
	border-radius: 3px;
	font-size: 12px;
	top: -5px;
	left: 15px;
	padding: 2px;
}

.info {
	font-size: 12px;
	padding: 5px;
}

.info .title {
	font-weight: bold;
}
</style>

<!-- load kakao map -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=3917634bf6e1dd73235db05524ea3ae6"></script>
<script>
	
	// when ready body, upload kakao map
	$(function(){
		// 지도에 폴리곤으로 표시할 영역데이터가 담긴 배열(중구, 서대문구, 강서구, ...) 
		var areas = [];
		
		/* 1. JSON 파일을 읽어들여 모든 지역구의 폴리곤 좌표들이 담긴 areas 배열을 채워넣는 작업 */
		
		// 1) getJSON도 ajax 메소드와 같이 async(비동기) 방식으로 동작하는데, 순차실행을 위해 이걸 강제로 sync 방식으로 동작하도록 함.
		$.ajaxSetup({
			async : false 
		}); 
		
		var filename = "";
		var center_point; 
		
		if('${areaNum}' == 11){
			filename = "resources/only_seoul.json";
			center_point = new kakao.maps.LatLng(37.566826, 126.9786567);
		}else if('${areaNum}' == 28){
			filename = "resources/only_incheon.json";
			center_point = new kakao.maps.LatLng(37.454345, 126.6906171);
		}
	
		// 2) getJSON 메소드를 이용해 JSON 파일을 파싱함
		$.getJSON(filename, function(geojson) {
			var units = geojson.features; // 파일에서 key값이 "features"인 것의 value를 통으로 가져옴(이것은 여러지역에 대한 정보를 모두 담고있음)			
			$.each(units, function(index, unit) { // 1개 지역씩 꺼내서 사용함. val은 그 1개 지역에 대한 정보를 담음
				var coordinates = []; //좌표 저장할 배열
				var name = ''; // 지역 이름

				coordinates = unit.geometry.coordinates; // 1개 지역의 영역을 구성하는 도형의 모든 좌표 배열을 가져옴 
				name = unit.properties.SIG_KOR_NM; // 1개 지역의 이름을 가져옴

				var ob = new Object();
				ob.name = name;
				ob.path = [];

				$.each(coordinates[0], function(index, coordinate) { // []로 한번 더 감싸져 있어서 index 0번의 것을 꺼내야 배열을 접근가능.
					ob.path.push(new kakao.maps.LatLng(coordinate[1], coordinate[0]));
				});

				areas[index] = ob;
			});//each
		});//getJSON

		/* 2. 지도 띄우기 */
		
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	    mapOption = { 
	        center: center_point, // 지도의 중심좌표
	        level: 8 // 지도의 확대 레벨
	    };	

		var map = new kakao.maps.Map(mapContainer, mapOption),
	    customOverlay = new kakao.maps.CustomOverlay({}),
	    infowindow = new kakao.maps.InfoWindow({removable: true});
		
		/* 3. 폴리곤 도형을 지도위에 띄우고 마우스 이벤트 붙이기 */
		
		var polygons = []; // 이후에 클릭 이벤트 발생할시 지도 확대와 함께 모든 폴리곤 제거를 위해 폴리곤 객체를 담아둘 배열 생성 
		
		// 지도에 영역데이터를 폴리곤으로 표시합니다 
		for (var i = 0, len = areas.length; i < len; i++) {
			displayArea(areas[i]);
		}

		// 다각형을 생상하고 이벤트를 등록하는 함수입니다
		function displayArea(area) {
			
		    // 다각형을 생성합니다 
		    var polygon = new kakao.maps.Polygon({
		        map: map, // 다각형을 표시할 지도 객체
		        path: area.path,
		        strokeWeight: 2,
		        strokeColor: '#004c80',
		        strokeOpacity: 0.8,
		        fillColor: '#fff',
		        fillOpacity: 0.7 
		    });
		    
		 // 만들어진 폴리곤을 배열에 저장
		    polygons.push(polygon); 
		    

		    // 다각형에 mouseover 이벤트를 등록하고 이벤트가 발생하면 폴리곤의 채움색을 변경합니다 
		    // 지역명을 표시하는 커스텀오버레이를 지도위에 표시합니다
		    kakao.maps.event.addListener(polygon, 'mouseover', function(mouseEvent) {
		        polygon.setOptions({fillColor: '#09f'});

		        customOverlay.setContent('<div class="area">' + area.name + '</div>');
		        
		        customOverlay.setPosition(mouseEvent.latLng); 
		        customOverlay.setMap(map);
		    });

		    // 다각형에 mousemove 이벤트를 등록하고 이벤트가 발생하면 커스텀 오버레이의 위치를 변경합니다 
		    kakao.maps.event.addListener(polygon, 'mousemove', function(mouseEvent) {
		        
		        customOverlay.setPosition(mouseEvent.latLng); 
		    });

		    // 다각형에 mouseout 이벤트를 등록하고 이벤트가 발생하면 폴리곤의 채움색을 원래색으로 변경합니다
		    // 커스텀 오버레이를 지도에서 제거합니다 
		    kakao.maps.event.addListener(polygon, 'mouseout', function() {
		        polygon.setOptions({fillColor: '#fff'});
		        customOverlay.setMap(null);
		    }); 

		    // 다각형에 click 이벤트를 등록하고 이벤트가 발생하면 다각형의 이름과 면적을 인포윈도우에 표시합니다 
		    kakao.maps.event.addListener(polygon, 'click', function(mouseEvent) {
		    	
		    	location.href = "search_by_mylocation.prd?whatColumn=mylocation&keyword="+ "${pageInfo.keyword}" + "&add2Name=" + area.name;
		    	
		    	//search_by_mylocation.prd?whatColumn=mylocation&keyword=캐논&add2Name=null&pageNumber=null
			    	
		        /* var content = '<div class="info">' + 
		                    '   <div class="title">' + area.name + '</div>' +
		                    '   <div class="size">총 면적 : 약 ' + Math.floor(polygon.getArea()) + ' m<sup>2</sup></div>' +
		                    '</div>';

		        infowindow.setContent(content); 
		        infowindow.setPosition(mouseEvent.latLng); 
		        infowindow.setMap(map); */
		    });
		}
	});

	
</script>

<script>
	function like(pno){
		if($('#id').val()=="null"){
			if(confirm("로그인이 필요한 페이지입니다. \n 로그인 하시겠습니까?")){
				location.href="login.mb";	
			}
			return false;
		}
		else{
			$.ajax({
				type : 'post',
				url : "addOrDeletelike.wish",
				data : {
					id : $('#id').val(),
					no : pno,
				},
				success : function(rdata) {
					
					//alert(rdata);
					
					if(rdata == "added"){
						alert("위시리스트에 추가되었습니다.");
						showLikeCount();	
					}else if(rdata == "deleted"){
						alert("위시리스트에서 제거되었습니다.");
					}
				}//success
	
			});//ajax
		}
	}
</script>
<!--Mobile Menu-->
            <div class="mobile-nav-wrapper" role="navigation">
                <div class="closemobileMenu"><i class="icon an an-times-l pull-right"></i> Close Menu</div>
                <ul id="MobileNav" class="mobile-nav medium">
                    <li class="lvl1 parent megamenu"><a href="index.html">Home <i class="an an-plus-l"></i></a>
                        <ul>
                            <li><a href="#" class="site-nav">Home Styles <i class="an an-plus-l"></i></a>
                                <ul>
                                    <li class="lvl-2"><a href="index.html" class="site-nav">Home 01 - Default</a></li>
                                    <li class="lvl-2"><a href="index-demo2.html" class="site-nav">Home 02 - Minimal</a></li>
                                    <li class="lvl-2"><a href="index-demo3.html" class="site-nav">Home 03 - Colorful</a></li>
                                    <li class="lvl-2"><a href="index-demo4.html" class="site-nav">Home 04 - Modern</a></li>
                                    <li class="lvl-2"><a href="index-demo5.html" class="site-nav">Home 05 - Kids Clothing</a></li>
                                    <li class="lvl-2"><a href="index-demo6.html" class="site-nav">Home 06 - Single Product</a></li>
                                    <li class="lvl-2"><a href="index-demo7.html" class="site-nav">Home 07 - Glamour</a></li>
                                    <li class="lvl-2"><a href="index-demo8.html" class="site-nav">Home 08 - Simple</a></li>
                                    <li class="lvl-2"><a href="index-demo9.html" class="site-nav">Home 09 - Cool <span class="lbl nm_label1">Hot</span></a></li>
                                    <li class="lvl-2"><a href="index-demo10.html" class="site-nav last">Home 10 - Cosmetic</a></li>
                                </ul>
                            </li>
                            <li><a href="#" class="site-nav">Home Styles <i class="an an-plus-l"></i></a>
                                <ul>
                                    <li class="lvl-2"><a href="index-demo11.html" class="site-nav">Home 11 - Pets <span class="lbl nm_label3">Popular</span></a></li>
                                    <li class="lvl-2"><a href="index-demo12.html" class="site-nav">Home 12 - Tools & Parts</a></li>
                                    <li class="lvl-2"><a href="index-demo13.html" class="site-nav">Home 13 - Watches <span class="lbl nm_label1">Hot</span></a></li>
                                    <li class="lvl-2"><a href="index-demo14.html" class="site-nav">Home 14 - Food</a></li>
                                    <li class="lvl-2"><a href="index-demo15.html" class="site-nav">Home 15 - Christmas</a></li>
                                    <li class="lvl-2"><a href="index-demo16.html" class="site-nav">Home 16 - Phone Case</a></li>
                                    <li class="lvl-2"><a href="index-demo17.html" class="site-nav">Home 17 - Jewelry</a></li>
                                    <li class="lvl-2"><a href="index-demo18.html" class="site-nav">Home 18 - Bag <span class="lbl nm_label3">Popular</span></a></li>
                                    <li class="lvl-2"><a href="index-demo19.html" class="site-nav">Home 19 - Swimwear</a></li>
                                    <li class="lvl-2"><a href="index-demo20.html" class="site-nav last">Home 20 - Furniture <span class="lbl nm_label2">New</span></a></li>
                                </ul>
                            </li>
                            <li><a href="#" class="site-nav">Home Styles <i class="an an-plus-l"></i></a>
                                <ul>
                                    <li class="lvl-2"><a href="index-demo21.html" class="site-nav">Home 21 - Party Supplies <span class="lbl nm_label2">New</span></a></li>
                                    <li class="lvl-2"><a href="index-demo22.html" class="site-nav">Home 22 - Digital <span class="lbl nm_label2">New</span></a></li>
                                    <li class="lvl-2"><a href="index-demo23.html" class="site-nav">Home 23 - Vogue <span class="lbl nm_label2">New</span></a></li>
                                    <li class="lvl-2"><a href="index-demo24.html" class="site-nav last">Home 24 - Glamour <span class="lbl nm_label2">New</span></a></li>
                                </ul>
                            </li>
                        </ul>
                    </li>
                    <li class="lvl1 parent megamenu"><a href="#">Shop <i class="an an-plus-l"></i></a>
                        <ul>
                            <li><a href="#" class="site-nav">Category Page <i class="an an-plus-l"></i></a>
                                <ul>
                                    <li><a href="category-2columns.html" class="site-nav">2 Columns with style1</a></li>
                                    <li><a href="category-3columns.html" class="site-nav">3 Columns with style2</a></li>
                                    <li><a href="category-4columns.html" class="site-nav">4 Columns with style3</a></li>
                                    <li><a href="category-5columns.html" class="site-nav">5 Columns with style4</a></li>
                                    <li><a href="category-6columns.html" class="site-nav">6 Columns with Fullwidth</a></li>
                                    <li><a href="category-7columns.html" class="site-nav">7 Columns</a></li>
                                    <li><a href="empty-category.html" class="site-nav last">Category Empty</a></li>
                                </ul>
                            </li>
                            <li><a href="#" class="site-nav">Shop Page <i class="an an-plus-l"></i></a>
                                <ul>
                                    <li><a href="shop-left-sidebar.html" class="site-nav">Left Sidebar</a></li>
                                    <li><a href="shop-right-sidebar.html" class="site-nav">Right Sidebar</a></li>
                                    <li><a href="shop-top-filter.html" class="site-nav">Top Filter</a></li>
                                    <li><a href="shop-fullwidth.html" class="site-nav">Fullwidth</a></li>
                                    <li><a href="shop-no-sidebar.html" class="site-nav">Without Filter</a></li>
                                    <li><a href="shop-listview-sidebar.html" class="site-nav">List View</a></li>
                                    <li><a href="shop-listview-drawer.html" class="site-nav">List View Drawer</a></li>
                                    <li><a href="shop-category-slideshow.html" class="site-nav">Category Slideshow</a></li>
                                    <li><a href="shop-heading-with-banner.html" class="site-nav last">Headings With Banner</a></li>
                                </ul>
                            </li>
                            <li><a href="#" class="site-nav">Shop Page <i class="an an-plus-l"></i></a>
                                <ul>
                                    <li><a href="shop-sub-collections.html" class="site-nav">Sub Collection List <span class="lbl nm_label5">Hot</span></a></li>
                                    <li><a href="shop-masonry-grid.html" class="site-nav">Shop Masonry Grid</a></li>
                                    <li><a href="shop-left-sidebar.html" class="site-nav">Shop Countdown</a></li>
                                    <li><a href="shop-hover-info.html" class="site-nav">Shop Hover Info</a></li>
                                    <li><a href="shop-right-sidebar.html" class="site-nav">Infinite Scrolling</a></li>
                                    <li><a href="shop-fullwidth.html" class="site-nav">Classic Pagination</a></li>
                                    <li><a href="shop-swatches-style.html" class="site-nav">Swatches Style</a></li>
                                    <li><a href="shop-grid-style.html" class="site-nav">Grid Style</a></li>
                                    <li><a href="shop-search-results.html" class="site-nav last">Search Results</a></li>
                                </ul>
                            </li>
                            <li><a href="#" class="site-nav">Shop Other Page <i class="an an-plus-l"></i></a>
                                <ul>
                                    <li><a href="my-wishlist.html" class="site-nav">My Wishlist Style1</a></li>
                                    <li><a href="my-wishlist-style2.html" class="site-nav">My Wishlist Style2</a></li>
                                    <li><a href="compare-style1.html" class="site-nav">Compare Page Style1</a></li>
                                    <li><a href="compare-style2.html" class="site-nav">Compare Page Style2</a></li>
                                    <li><a href="cart-style1.html" class="site-nav">Cart Page Style1</a></li>
                                    <li><a href="cart-style2.html" class="site-nav">Cart Page Style2</a></li>
                                    <li><a href="checkout-style1.html" class="site-nav">Checkout Page Style1</a></li>
                                    <li><a href="checkout-style2.html" class="site-nav">Checkout Page Style2</a></li>
                                    <li><a href="checkout-success.html" class="site-nav last">Checkout Success</a></li>
                                </ul>
                            </li>
                        </ul>
                    </li>
                    <li class="lvl1 parent megamenu"><a href="#">Product <i class="an an-plus-l"></i></a>
                        <ul>
                            <li><a href="product-standard.html" class="site-nav">Product Types<i class="an an-plus-l"></i></a>
                                <ul>
                                    <li><a href="product-standard.html" class="site-nav">Simple Product</a></li>
                                    <li><a href="product-variable.html" class="site-nav">Variable Product</a></li>
                                    <li><a href="product-grouped.html" class="site-nav">Grouped Product</a></li>
                                    <li><a href="product-external-affiliate.html" class="site-nav">External / Affiliate Product</a></li>
                                    <li><a href="product-outofstock.html" class="site-nav">Out Of Stock Product</a></li>
                                    <li><a href="product-layout1.html" class="site-nav">New Product</a></li>
                                    <li><a href="product-layout2.html" class="site-nav">Sale Product</a></li>
                                    <li><a href="product-layout1.html" class="site-nav">Variable Image</a></li>
                                    <li><a href="product-accordian.html" class="site-nav">Variable Select</a></li>
                                    <li><a href="prodcut-360-degree-view.html" class="site-nav last">360 Degree view</a></li>
                                </ul>
                            </li>
                            <li><a href="product-layout1.html" class="site-nav">Product Page Types <i class="an an-plus-l"></i></a>
                                <ul>
                                    <li><a href="product-layout1.html" class="site-nav">Product Layout1</a></li>
                                    <li><a href="product-layout2.html" class="site-nav">Product Layout2</a></li>
                                    <li><a href="product-layout3.html" class="site-nav">Product Layout3</a></li>
                                    <li><a href="product-layout4.html" class="site-nav">Product Layout4</a></li>
                                    <li><a href="product-layout5.html" class="site-nav">Product Layout5</a></li>
                                    <li><a href="product-layout6.html" class="site-nav">Product Layout6</a></li>
                                    <li><a href="product-layout7.html" class="site-nav">Product Layout7</a></li>
                                    <li><a href="product-accordian.html" class="site-nav">Product Accordian</a></li>
                                    <li><a href="product-tabs-left.html" class="site-nav">Product Tabs Left</a></li>
                                    <li><a href="product-tabs-center.html" class="site-nav last">Product Tabs Center</a></li>
                                </ul>
                            </li>
                        </ul>
                    </li>
                    <li class="lvl1 parent megamenu"><a href="#">Collections <i class="an an-plus-l"></i></a>
                        <ul>
                            <li><a href="#" class="site-nav">Bedding <i class="an an-plus-l"></i></a>
                                <ul>
                                    <li><a href="#" class="site-nav">Bedsheets</a></li>
                                    <li><a href="#" class="site-nav">Tablewear</a></li>
                                    <li><a href="#" class="site-nav">Kitchenware</a></li>
                                    <li><a href="#" class="site-nav last">Flooring</a></li>
                                </ul>
                            </li>
                            <li><a href="#" class="site-nav">Kids Furniture <i class="an an-plus-l"></i></a>
                                <ul>
                                    <li><a href="#" class="site-nav">Table Decor</a></li>
                                    <li><a href="#" class="site-nav">Cushion Fillers</a></li>
                                    <li><a href="#" class="site-nav">Kitchen Linen</a></li>
                                    <li><a href="#" class="site-nav last">Bedsheets</a></li>
                                </ul>
                            </li>
                            <li><a href="#" class="site-nav">Shoes Rack <i class="an an-plus-l"></i></a>
                                <ul>
                                    <li><a href="#" class="site-nav">Bedsheets</a></li>
                                    <li><a href="#" class="site-nav">Tablewear</a></li>
                                    <li><a href="#" class="site-nav">Kitchenware</a></li>
                                    <li><a href="#" class="site-nav last">Flooring</a></li>
                                </ul>
                            </li>
                            <li><a href="#" class="site-nav">Bathlinen <i class="an an-plus-l"></i></a>
                                <ul>
                                    <li><a href="#" class="site-nav">Table Decor</a></li>
                                    <li><a href="#" class="site-nav">Cushion Fillers</a></li>
                                    <li><a href="#" class="site-nav">Kitchen Linen</a></li>
                                    <li><a href="#" class="site-nav last">Bedsheets</a></li>
                                </ul>
                            </li>
                        </ul>
                    </li>
                    <li class="lvl1 parent megamenu"><a href="#">Shop Offers <i class="an an-plus-l"></i></a>
                        <ul>
                            <li><a href="product-layout1.html" class="site-nav">Black Flower Vase</a></li>
                            <li><a href="product-layout1.html" class="site-nav">Wooden Baby Chair</a></li>
                            <li><a href="product-layout1.html" class="site-nav">Round Wall Clock</a></li>
                            <li><a href="product-layout1.html" class="site-nav">Cushioned Office Chair</a></li>
                        </ul>
                    </li>
                    <li class="lvl1 parent megamenu"><a href="#">Features <i class="an an-plus-l"></i><span class="lbl nm_label1">New</span></a>
                        <ul>
                            <li><a href="#" class="site-nav">Vendor Pages <i class="an an-plus-l"></i></a>
                                <ul>
                                    <li><a href="vendor-dashboard.html" class="site-nav">Vendor Dashboard</a></li>
                                    <li><a href="vendor-profile.html" class="site-nav">Vendor Profile</a></li>
                                    <li><a href="vendor-uploads.html" class="site-nav">Vendor Uploads</a></li>
                                    <li><a href="vendor-tracking.html" class="site-nav">Vendor Tracking</a></li>
                                    <li><a href="vendor-service.html" class="site-nav">Vendor Service</a></li>
                                    <li><a href="vendor-settings.html" class="site-nav last">Vendor Settings</a></li>
                                </ul>
                            </li>
                            <li><a href="#" class="site-nav">Email Template <i class="an an-plus-l"></i></a>
                                <ul>
                                    <li><a target="_blank" href="email-template/email-order-success1.html" class="site-nav">Order Success 1</a></li>
                                    <li><a target="_blank" href="email-template/email-order-success2.html" class="site-nav">Order Success 2</a></li>
                                    <li><a target="_blank" href="email-template/email-invoice-template1.html" class="site-nav">Invoice Template 1</a></li>
                                    <li><a target="_blank" href="email-template/email-invoice-template2.html" class="site-nav last">Invoice Template 2</a></li>
                                    <li><a target="_blank" href="email-template/email-forgot-password.html" class="site-nav">Mail Reset password</a></li>
                                    <li><a target="_blank" href="email-template/email-confirmation.html" class="site-nav">Mail Confirmation</a></li>
                                    <li><a target="_blank" href="email-template/email-promotional1.html" class="site-nav">Mail Promotional 1</a></li>
                                    <li><a target="_blank" href="email-template/email-promotional2.html" class="site-nav last">Mail Promotional 2</a></li>
                                </ul>
                            </li>
                            <li><a href="#" class="site-nav">Elements <i class="an an-plus-l"></i></a>
                                <ul>
                                    <li><a href="elements-typography.html" class="site-nav">Typography</a></li>
                                    <li><a href="elements-buttons.html" class="site-nav">Buttons</a></li>
                                    <li><a href="elements-titles.html" class="site-nav">Titles</a></li>
                                    <li><a href="elements-banner-styles.html" class="site-nav">Banner Styles</a></li>
                                    <li><a href="elements-testimonial.html" class="site-nav">Testimonial</a></li>
                                    <li><a href="elements-accordions.html" class="site-nav">Accordions</a></li>
                                    <li><a href="elements-icons.html" class="site-nav">Icons</a></li>
                                    <li><a href="elements-blog-posts.html" class="site-nav">Blog Posts</a></li>
                                    <li><a href="elements-product.html" class="site-nav">Product</a></li> 
                                    <li><a href="elements-product-tab.html" class="site-nav">Product Tab</a></li> 
                                    <li><a href="elements-top-info-bar.html" class="site-nav">Top Info Bar</a></li>
                                    <li><a href="elements-top-promo-bar.html" class="site-nav last">Top Promo Bar</a></li>
                                </ul>
                            </li>
                        </ul>
                    </li>
                    <li class="lvl1 parent megamenu"><a href="#">Pages <i class="an an-plus-l"></i></a>
                        <ul>
                            <li><a href="aboutus-style1.html" class="site-nav">About Us <i class="an an-plus-l"></i></a>
                                <ul class="dropdown">
                                    <li><a href="aboutus-style1.html" class="site-nav">About Us Style1</a></li>
                                    <li><a href="aboutus-style2.html" class="site-nav">About Us Style2</a></li>
                                    <li><a href="aboutus-style3.html" class="site-nav last">About Us Style3</a></li>
                                </ul>
                            </li>
                            <li><a href="contact-style1.html" class="site-nav">Contact Us <i class="an an-plus-l"></i></a>
                                <ul class="dropdown">
                                    <li><a href="contact-style1.html" class="site-nav">Contact Us Style1</a></li>
                                    <li><a href="contact-style2.html" class="site-nav last">Contact Us Style2</a></li>
                                </ul>
                            </li>
                            <li><a href="lookbook-2columns.html" class="site-nav">Lookbook <i class="an an-plus-l"></i></a>
                                <ul class="dropdown">
                                    <li><a href="lookbook-2columns.html" class="site-nav">2 Columns</a></li>
                                    <li><a href="lookbook-3columns.html" class="site-nav">3 Columns</a></li>
                                    <li><a href="lookbook-4columns.html" class="site-nav">4 Columns</a></li>
                                    <li><a href="lookbook-5columns.html" class="site-nav">5 Columns + Fullwidth</a></li>
                                    <li><a href="lookbook-shop.html" class="site-nav last">Lookbook Shop</a></li>
                                </ul>
                            </li>
                            <li><a href="faqs-style1.html" class="site-nav">FAQs <i class="an an-plus-l"></i></a>
                                <ul class="dropdown">
                                    <li><a href="faqs-style1.html" class="site-nav">FAQs Style1</a></li>
                                    <li><a href="faqs-style2.html" class="site-nav last">FAQs Style2</a></li>
                                </ul>
                            </li>
                            <li><a href="brands-style1.html" class="site-nav">Brands <i class="an an-plus-l"></i></a>
                                <ul class="dropdown">
                                    <li><a href="brands-style1.html" class="site-nav">Brands Style1</a></li>
                                    <li><a href="brands-style2.html" class="site-nav last">Brands Style2</a></li>
                                </ul>
                            </li>
                            <li><a href="my-account.html" class="site-nav">My Account <i class="an an-plus-l"></i></a>
                                <ul class="dropdown">
                                    <li><a href="my-account.html" class="site-nav">My Account</a></li>
                                    <li><a href="login-sliding-style.html" class="site-nav">Login Sliding Slideshow</a></li>
                                    <li><a href="login.html" class="site-nav">Login</a></li>
                                    <li><a href="register.html" class="site-nav">Register</a></li>
                                    <li><a href="forgot-password.html" class="site-nav">Forgot Password</a></li>
                                    <li><a href="change-password.html" class="site-nav last">Change Password</a></li>
                                </ul>
                            </li>
                            <li><a href="#" class="site-nav">Empty Pages <i class="an an-plus-l"></i></a>
                                <ul class="dropdown">
                                    <li><a href="empty-category.html" class="site-nav">Empty Category</a></li>
                                    <li><a href="empty-cart.html" class="site-nav">Empty Cart</a></li>
                                    <li><a href="empty-compare.html" class="site-nav">Empty Compare</a></li>
                                    <li><a href="empty-wishlist.html" class="site-nav">Empty Wishlist</a></li>
                                    <li><a href="empty-search.html" class="site-nav last">Empty Search</a></li>
                                </ul>
                            </li>
                            <li><a href="error-404.html" class="site-nav">Error 404 </a></li>
                            <li><a href="cms-page.html" class="site-nav">CMS Page</a></li>
                            <li><a href="elements-icons.html" class="site-nav">Icons</a></li>
                            <li><a href="coming-soon.html" class="site-nav last">Coming soon <span class="lbl nm_label2">New</span></a></li>
                        </ul>
                    </li>
                    <li class="lvl1 parent megamenu"><a href="blog-left-sidebar.html">Blog <i class="an an-plus-l"></i></a>
                        <ul>
                            <li><a href="blog-left-sidebar.html" class="site-nav">Left Sidebar</a></li>
                            <li><a href="blog-right-sidebar.html" class="site-nav">Right Sidebar</a></li>
                            <li><a href="blog-fullwidth.html" class="site-nav">Fullwidth</a></li>
                            <li><a href="blog-masonry.html" class="site-nav">Masonry Blog Style</a></li>
                            <li><a href="blog-2columns.html" class="site-nav">2 Columns</a></li>
                            <li><a href="blog-3columns.html" class="site-nav">3 Columns</a></li>
                            <li><a href="blog-4columns.html" class="site-nav">4 Columns</a></li>
                            <li><a href="blog-single-post.html" class="site-nav last">Article Page</a></li>
                        </ul>
                    </li>
                    <li class="acLink"></li>
                    <li class="lvl1 bottom-link"><a href="login.html">Login</a></li>
                    <li class="lvl1 bottom-link"><a href="register.html">Signup</a></li>
                    <li class="lvl1 bottom-link"><a href="my-wishlist.html">Wishlist</a></li>
                    <li class="lvl1 bottom-link"><a href="compare-style1.html">Compare</a></li>
                    <li class="help bottom-link"><b>NEED HELP?</b><br>Call: +41 525 523 5687</li>
                </ul>
            </div>
            <!--End Mobile Menu-->

            <!--Body Container-->
            <div id="page-content">
               
                <!--Store Feature-->
                <!-- <section class="section store-features">
                    <div class="container">
                        <div class="row store-info">
                            <div class="col-12 col-sm-6 col-md-6 col-lg-3 mb-3 my-lg-0">
                                <a class="d-flex clr-none" href="#">
                                    <div class="icon"><img class="w-100 blur-up lazyload" data-src="resources/assets/images/icon-img/70x70.png" src="resources/assets/images/icon-img/70x70.png" alt="image" width="60" /></div>
                                    <div class="detail">
                                        <h5 class="fs-6 fw-bold mb-1 body-font">Assured Quality</h5>
                                        <p class="sub-text">We provide quality products and sale after service</p>
                                    </div>
                                </a>
                            </div>
                            <div class="col-12 col-sm-6 col-md-6 col-lg-3 mb-3 my-lg-0">
                                <a class="d-flex clr-none" href="#">
                                    <div class="icon"><img class="w-100 blur-up lazyload" data-src="resources/assets/images/icon-img/70x70.png" src="resources/assets/images/icon-img/70x70.png" alt="image" width="60" /></div>
                                    <div class="detail">
                                        <h5 class="fs-6 fw-bold mb-1 body-font">Free Maintenance</h5>
                                        <p class="sub-text">We don't charge for normal wear and tear</p>
                                    </div>
                                </a>
                            </div>
                            <div class="col-12 col-sm-6 col-md-6 col-lg-3 mb-3 mb-md-0 my-lg-0">
                                <a class="d-flex clr-none" href="#">
                                    <div class="icon"><img class="w-100 blur-up lazyload" data-src="resources/assets/images/icon-img/70x70.png" src="resources/assets/images/icon-img/70x70.png" alt="image" width="60" /></div>
                                    <div class="detail">
                                        <h5 class="fs-6 fw-bold mb-1 body-font">1 Million Customers</h5>
                                        <p class="sub-text">We provide quality products and sale after service</p>
                                    </div>
                                </a>
                            </div>
                            <div class="col-12 col-sm-6 col-md-6 col-lg-3 mb-0 my-lg-0">
                                <a class="d-flex clr-none" href="#">
                                    <div class="icon"><img class="w-100 blur-up lazyload" data-src="resources/assets/images/icon-img/70x70.png" src="resources/assets/images/icon-img/70x70.png" alt="image" width="60" /></div>
                                    <div class="detail">
                                        <h5 class="fs-6 fw-bold mb-1 body-font">Multiple Award Winner</h5>
                                        <p class="sub-text">We provide quality products and sale after service</p>
                                    </div>
                                </a>
                            </div>
                        </div>
                    </div>
                </section> -->
                <!--End Store Feature-->
					
                <!--Banner Masonary-->
                <!-- 
                <section class="section collection-banners style8 mt-0">
                    <div class="container">
                        <div class="grid-masonary banner-grid grid-mr-20">
                            <div class="grid-sizer col-12 col-sm-12 col-md-6 col-lg-6 mw-100"></div>
                            <div class="row mx-0">
                                <div class="col-12 col-sm-12 col-md-6 col-lg-6 mw-100 cl-item banner-item">
                                    <div class="collection-grid-item banner1">
                                        <a href="shop-right-sidebar.html">
                                            <div class="img"><img class="rounded-2 blur-up lazyload" data-src="resources/assets/images/collection/demo20-dining-set.jpg" src="resources/assets/images/collection/demo20-dining-set.jpg" alt="collection" title="" /></div>
                                            <div class="details center-left bg-transparent">
                                                <div class="inner">
                                                    <p class="subtitle fs-5 lh-1 mb-3">To make bond over meals</p>
                                                    <h3 class="title lh-1 fw-bold">Dining Set</h3>
                                                    <span class="btn--link mt-4 small--hide">BUY NOW</span>
                                                </div>
                                            </div>
                                        </a>
                                    </div>
                                </div>
                                <div class="col-12 col-sm-12 col-md-6 col-lg-6 mw-100 cl-item banner-item">
                                    <div class="collection-grid-item banner2">
                                        <a href="shop-right-sidebar.html">
                                            <div class="img"><img class="rounded-2 blur-up lazyload" data-src="resources/assets/images/collection/demo20-modular-furniture.jpg" src="resources/assets/images/collection/demo20-modular-furniture.jpg" alt="collection" title="" /></div>
                                            <div class="details center-right bg-transparent">
                                                <div class="inner text-black">
                                                    <h3 class="title lh-1 fw-bold">Modular <br> Furniture</h3>
                                                    <p class="subtitle lh-1 mt-3 mb-0">FLAT 30% OFF</p>
                                                </div>
                                            </div>
                                        </a>
                                    </div>
                                </div>
                                <div class="col-12 col-sm-12 col-md-6 col-lg-6 mw-100 cl-item banner-item">
                                    <div class="collection-grid-item banner3">
                                        <a href="shop-right-sidebar.html">
                                            <div class="img"><img class="rounded-2 blur-up lazyload" data-src="resources/assets/images/collection/demo20-sofa-cumbed.jpg" src="resources/assets/images/collection/demo20-sofa-cumbed.jpg" alt="collection" title="" /></div>
                                            <div class="details top-left bg-transparent">
                                                <div class="inner">
                                                    <h3 class="title lh-1 fw-bold">Sofa cum Bed</h3>
                                                    <p class="subtitle lh-1 mb-0">Up to 40% Off</p>
                                                    <span class="btn--link mt-4 small--hide">SHOP NOW</span>
                                                </div>
                                            </div>
                                        </a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>
                 -->
                <!--End Banner Masonary-->
                
                
                <%	
				//파일이 업로드 된 곳에 접근해서 가져오고 싶을 땐 jsp에서는 application 객체를 사용항
				//컨트롤러 java 파일에서 업로드 하고자 하는 경로를 얻고싶을 땐 ServletContext 타입의 참조변수를 Autowired해서 사용
				String apath = application.getContextPath() + "/resources";
				// /ex/resources
				%>
				
              	 <%--  
               	<img src="<%=apath%>/0bbdc39f-dc1f-4dee-bc5b-2fa396f5a9b5_샤인머스켓.PNG" width="180px" height="180px"/>
				<img src="<%=apath%>/defb4815-5245-46fe-baa6-080795050e2a_사과.jpg" width="180px" height="180px"/> 
				--%>

				<%-- ${fn:length(recentProductList)}

				<c:forEach var="rProduct" items="${recentProductList}">
					${rProduct.images}

					<img src="<%=apath%>/${fn:split(rProduct.images,',')[0]}" width="180px" height="180px"/>					
					
										
					
				</c:forEach> --%>
				
				
				<!-- <div class="container">
				  <div class="row">
				    <div class="col">
				    col
				    </div>
				    
				    <div class="col">
				    col
				    </div>
				    
				    <div class="col">
				    col
				    </div>
				    
				    <div class="col">
				    col
				    </div>
				  </div>
				</div>	 -->
					
				<div class="collection-header">
                    <div class="collection-hero">
                        <div class="collection-hero__image"></div>
                        <div class="collection-hero__title-wrapper container">
                            <h2 style="font-family: 'Poppins',Arial,Tahoma !important; font-weight: 700!important; font-size:25px;color: black; margin-bottom:0px">위치기반검색 : ${param.add2Name}, ${param.keyword}</h2>
                        </div>
                    </div>
                </div>
				
				
				<!-- map -->
				<div class="container" id="map" style="width:90%;height:500px;">
				</div>
				
				<!-- product list -->
				<div class="container">
					<c:set var="notCeiledQuotient" value="${fn:length(resultProductList)/4}"/> 
					<%-- notCeiledQuotient : ${notCeiledQuotient} <br> --%>
					<c:set var="ceiledQuotient" value="${(notCeiledQuotient + (1 - (notCeiledQuotient % 1)) % 1)}"/> 
					<%-- ceiledQuotient : ${ceiledQuotient} <br> --%>
					
					<c:if test="${fn:length(resultProductList) eq 0}">
						<p style="text-align:center">검색결과가 없습니다.</p>
					</c:if>
					
					<c:forEach var="i" begin="1" end="${ceiledQuotient * 4}" step="1">
						<c:if test="${i % 4 eq 1}">
							<div class="grid-products row">
						</c:if>
							
						<!-- 비어있는 이미지 출력 -->
						<c:if test="${i > fn:length(resultProductList)}">
							<div class="item col">
	                        </div>
						</c:if>
						
						<!-- 정상적인 이미지 출력 -->
						<c:if test="${i <= fn:length(resultProductList)}">
							<div class="item col">
	                        	<!--Start Product Image-->
	                            <div class="product-image">
	                                    <!--Start Product Image-->
	                                    <a href="productdetail.prd?no=${resultProductList[i-1].no}" class="product-img">
	                                        <!--Image-->
	                                        <img class="primary blur-up lazyload" data-src="<%=apath%>/${fn:split(resultProductList[i-1].images,',')[0]}" src="<%=apath%>/${fn:split(resultProductList[i-1].images,',')[0]}" alt="image" title="" style="height:300px"/>
	                                        <!--End Image-->
	                                        <!--Hover Image-->
	                                        <img class="hover blur-up lazyload" data-src="<%=apath%>/${fn:split(resultProductList[i-1].images,',')[0]}" src="<%=apath%>/${fn:split(resultProductList[i-1].images,',')[0]}" alt="image" title="" style="height:300px"/>
	                                        <!--End Hover Image-->
	                                    </a>
	                                    <!-- End Product Image -->
	                                    
	                                    <!--Product Button-->
	                                    <div class="button-set style0 d-none d-md-block">
	                                        <ul>
	                                            <!--Wishlist Button-->
	                                            <li><a class="btn-icon wishlist add-to-wishlist" href="javascript:like(${resultProductList[i-1].no})"><i class="icon an an-heart-l" style="margin-top:7px"></i> <span class="tooltip-label top">Add To Wishlist</span></a></li>
	                                            <!--End Wishlist Button-->
	                                        </ul>
	                                    </div>
	                                    <!--End Product Button-->
	                                </div>
	                                <!-- End Product Image -->
	                                
	                                
	                                
	                                <!--Start Product Details-->
	                                <div class="product-details text-center">
	                                    <!--Product Name-->
	                                    <div class="product-name">
	                                        <a class="text-uppercase fw-normal" href="productdetail.prd?no=${resultProductList[i-1].no}">${resultProductList[i-1].name}</a>
	                                    </div>
	                                    <!--End Product Name-->
	                                    <!--Product Price-->
	                                    <div class="product-price">
	                                        <span class="old-price"><fmt:formatNumber value="${resultProductList[i-1].original_day_price}" pattern="#,###" />원/일</span> 
	                                        <%-- <span class="old-price" style="text-decoration : none">${resultProductList[i-1].add1_sido} ${resultProductList[i-1].add2_sigungu} ${resultProductList[i-1].add3_eubmyeon} ${resultProductList[i-1].add4_donglee}</span> --%>
	                                        <span class="price"><fmt:formatNumber value="${resultProductList[i-1].discounted_day_price}" pattern="#,###" />원/일</span> 
	                                    </div>
	                                    <!-- End Product Price-->
	                                    <!--Product Review-->
	                                    <div class="product-review m-0">
	                                    <!-- <i class="an an-star"></i><i class="an an-star"></i><i class="an an-star"></i><i class="an an-star-o"></i><i class="an an-star-o"></i> -->
	                                    <span class="old-price" style="text-decoration : none">
	                                    
	                                    <c:if test="${resultProductList[i-1].add1_sido ne ''}">
	                                    	${resultProductList[i-1].add1_sido}
	                                    </c:if>
	                                    
	                                    <c:if test="${resultProductList[i-1].add2_sigungu ne ''}">
	                                    	${resultProductList[i-1].add2_sigungu}
	                                    </c:if>
	                                    
	                                    <c:if test="${resultProductList[i-1].add3_eubmyeon ne ''}">
	                                    	${resultProductList[i-1].add3_eubmyeon}
	                                    </c:if>
	                                    
	                                    <c:if test="${resultProductList[i-1].add4_donglee ne ''}">
	                                    	${resultProductList[i-1].add4_donglee}
	                                    </c:if>
	                                    
	                                    <%-- ${recentProductList[i-1].add1_sido} ${recentProductList[i-1].add2_sigungu} ${recentProductList[i-1].add3_eubmyeon} ${recentProductList[i-1].add4_donglee} --%>
	                                    </span>
	                                    </div>
	                                    <!--End Product Review-->
	                                </div>
	                                <!--End Product Details-->
                           		 </div>
						</c:if>
						
						<c:if test="${i % 4 eq 0}">
							</div>
						</c:if>	
						
					</c:forEach>
				</div>
				
                <%-- <!--Product Slider-->
                <section class="section product-slider pt-0">
                    <div class="container">
                    
                        <div class="section-header">
                            <h2>최근 올라온 상품</h2>
                        </div>
                        
                        <div class="productSlider grid-products">
                        
                        	<c:forEach var="rProduct" items="${recentProductList}" varStatus="status">
								${rProduct.images}
		
								<img src="<%=apath%>/${fn:split(rProduct.images,',')[0]}" width="180px" height="180px"/>					
							
							
							 	<div class="item">
                                <!--Start Product Image-->
                                <div class="product-image">
                                    <!--Start Product Image-->
                                    <a href="product-layout1.html" class="product-img">
                                        <!--Image-->
                                        <img class="primary blur-up lazyload" data-src="<%=apath%>/${fn:split(rProduct.images,',')[0]}" src="<%=apath%>/${fn:split(rProduct.images,',')[0]}" alt="image" title="" />
                                        <!--End Image-->
                                        <!--Hover Image-->
                                        <img class="hover blur-up lazyload" data-src="<%=apath%>/${fn:split(rProduct.images,',')[0]}" src="<%=apath%>/${fn:split(rProduct.images,',')[0]}" alt="image" title="" />
                                        <!--End Hover Image-->
                                    </a>
                                    <!-- End Product Image -->
                                    
                                    <!--Product label-->
                                    <div class="product-labels"><span class="lbl on-sale rounded-2">New</span></div>
                                    <!--End Product label-->
                                    
                                    <!--Product Button-->
                                    <div class="button-set style0 d-none d-md-block">
                                        <ul>
                                            <!--Cart Button-->
                                            <li><a class="btn-icon btn cartIcon pro-addtocart-popup" href="#pro-addtocart-popup"><i class="icon an an-cart-l"></i> <span class="tooltip-label top">Add to Cart</span></a></li>
                                            <!--End Cart Button-->
                                            <!--Quick View Button-->
                                            <li><a class="btn-icon quick-view-popup quick-view" href="javascript:void(0)" data-toggle="modal" data-target="#content_quickview"><i class="icon an an-search-l"></i> <span class="tooltip-label top">Quick View</span></a></li>
                                            <!--End Quick View Button-->
                                            <!--Wishlist Button-->
                                            <li><a class="btn-icon wishlist add-to-wishlist" href="my-wishlist.html"><i class="icon an an-heart-l"></i> <span class="tooltip-label top">Add To Wishlist</span></a></li>
                                            <!--End Wishlist Button-->
                                            <!--Compare Button-->
                                            <li><a class="btn-icon compare add-to-compare" href="compare-style2.html"><i class="icon an an-sync-ar"></i> <span class="tooltip-label top">Add to Compare</span></a></li>
                                            <!--End Compare Button-->
                                        </ul>
                                    </div>
                                    <!--End Product Button-->
                                    
                                </div>
                                <!-- End Product Image -->
                                
                                <!--Start Product Details-->
                                <div class="product-details text-center">
                                    <!--Product Name-->
                                    <div class="product-name">
                                        <a class="text-uppercase fw-normal" href="product-layout1.html">Black Flower Vase</a>
                                    </div>
                                    <!--End Product Name-->
                                    <!--Product Price-->
                                    <div class="product-price">
                                        <span class="old-price">$100.00</span> <span class="price">$70.00</span>
                                    </div>
                                    <!-- End Product Price-->
                                    <!--Product Review-->
                                    <div class="product-review m-0"><i class="an an-star"></i><i class="an an-star"></i><i class="an an-star"></i><i class="an an-star-o"></i><i class="an an-star-o"></i></div>
                                    <!--End Product Review-->
                                </div>
                                <!--End Product Details-->
                           		 </div>
							</c:forEach>
                        </div>
                        
                        
                    </div>
                </section>
                <!--End Product Slider--> --%>

                <!--Collections Grid-->
                <!-- 
                <section class="section collection-grids pt-0">
                    <div class="container">
                        <div class="section-header">
                            <h2 class="text-transform-none">Shop Your Favorite</h2>
                            <p>Impressive Collection for Your Dream Home</p>
                        </div>
                        <div class="row grid-categorys">
                            <div class="col-12 col-sm-6 col-md-6 col-lg-6 category-grid-item mb-3">
                                <div class="category-item zoomscal-hov">
                                    <a href="shop-left-sidebar.html" class="category-link text-center clr-none">
                                        <div class="zoom-scal"><img class="blur-up lazyload" data-src="resources/assets/images/collection/demo20-carpet.jpg" src="resources/assets/images/collection/demo20-carpet.jpg" alt="collection" title="" /></div>
                                        <div class="details text-left px-0">
                                            <div class="inner">
                                                <h3 class="category-title">Carpets and Rugs</h3>
                                                <p class="mt-1">Matching carpets for every occasion.</p>
                                            </div>
                                        </div>
                                    </a>
                                </div>
                            </div>
                            <div class="col-12 col-sm-6 col-md-6 col-lg-6 category-grid-item mb-3">
                                <div class="category-item zoomscal-hov">
                                    <a href="shop-left-sidebar.html" class="category-link text-center clr-none">
                                        <div class="zoom-scal"><img class="blur-up lazyload" data-src="resources/assets/images/collection/demo20-carpet.jpg" src="resources/assets/images/collection/demo20-carpet.jpg" alt="collection" title="" /></div>
                                        <div class="details text-left px-0">
                                            <div class="inner">
                                                <h3 class="category-title">Prefect Mattress</h3>
                                                <p class="mt-1">Give your body the comfort it deserves</p>
                                            </div>
                                        </div>
                                    </a>
                                </div>
                            </div>
                            <div class="col-12 col-sm-6 col-md-4 col-lg-4 category-grid-item mb-3">
                                <div class="category-item zoomscal-hov">
                                    <a href="shop-left-sidebar.html" class="category-link text-center clr-none">
                                        <div class="zoom-scal"><img class="blur-up lazyload" data-src="resources/assets/images/collection/demo20-book.jpg" src="resources/assets/images/collection/demo20-book.jpg" alt="collection" title="" /></div>
                                        <div class="details text-left px-0">
                                            <div class="inner">
                                                <h3 class="category-title">Book Shelves</h3>
                                                <p class="mt-1">Perfectly clean cabinet that will reflect your style</p>
                                            </div>
                                        </div>
                                    </a>
                                </div>
                            </div>
                            <div class="col-12 col-sm-6 col-md-4 col-lg-4 category-grid-item mb-3">
                                <div class="category-item zoomscal-hov">
                                    <a href="shop-left-sidebar.html" class="category-link text-center clr-none">
                                        <div class="zoom-scal"><img class="blur-up lazyload" data-src="resources/assets/images/collection/demo20-book.jpg" src="resources/assets/images/collection/demo20-book.jpg" alt="collection" title="" /></div>
                                        <div class="details text-left px-0">
                                            <div class="inner">
                                                <h3 class="category-title">Study Tables</h3>
                                                <p class="mt-1">Provides the assurance of comfort</p>
                                            </div>
                                        </div>
                                    </a>
                                </div>
                            </div>
                            <div class="col-12 col-sm-6 col-md-4 col-lg-4 category-grid-item mb-3">
                                <div class="category-item zoomscal-hov">
                                    <a href="shop-left-sidebar.html" class="category-link text-center clr-none">
                                        <div class="zoom-scal"><img class="blur-up lazyload" data-src="resources/assets/images/collection/demo20-book.jpg" src="resources/assets/images/collection/demo20-book.jpg" alt="collection" title="" /></div>
                                        <div class="details text-left px-0">
                                            <div class="inner">
                                                <h3 class="category-title">Lamps &amp; Lightings</h3>
                                                <p class="mt-1">Ideal solutions for your dark evenings</p>
                                            </div>
                                        </div>
                                    </a>
                                </div>
                            </div>
                            <div class="col-12 col-sm-6 col-md-8 col-lg-8 category-grid-item mb-3 mb-sm-0">
                                <div class="category-item zoomscal-hov">
                                    <a href="shop-left-sidebar.html" class="category-link text-center clr-none">
                                        <div class="zoom-scal"><img class="blur-up lazyload" data-src="resources/assets/images/collection/demo20-traditional.jpg" src="resources/assets/images/collection/demo20-traditional.jpg" alt="collection" title="" /></div>
                                        <div class="details text-left px-0 pb-md-0">
                                            <div class="inner">
                                                <h3 class="category-title">Traditional Furniture</h3>
                                                <p class="mt-1">Old furniture is always gold</p>
                                            </div>
                                        </div>
                                    </a>
                                </div>
                            </div>
                            <div class="col-12 col-sm-6 col-md-4 col-lg-4 category-grid-item mb-0">
                                <div class="category-item zoomscal-hov">
                                    <a href="shop-left-sidebar.html" class="category-link text-center clr-none">
                                        <div class="zoom-scal"><img class="blur-up lazyload" data-src="resources/assets/images/collection/demo20-home-decor.jpg" src="resources/assets/images/collection/demo20-home-decor.jpg" alt="collection" title="" /></div>
                                        <div class="details text-left px-0 pb-md-0">
                                            <div class="inner">
                                                <h3 class="category-title">Home DÃ©cor</h3>
                                                <p class="mt-1">All you need to create your space</p>
                                            </div>
                                        </div>
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>
                 -->
                <!--End Collections Grid-->

                <!--Testimonial Slider-->
                <!-- 
                <section class="section testimonial-slider style1">
                    <div class="container">
                        <div class="row">
                            <div class="col-12 section-header style1">
                                <div class="section-header-left">
                                    <h2>Their Words, Our Pride</h2>
                                </div>
                            </div>
                        </div>
                        <div class="quote-wraper">
                            
                            <div class="quotes-slider arwOut3">
                                <div class="quotes-slide">
                                    <blockquote class="quotes-slider__text text-center">             
                                        <div class="testimonial-image"><img class="blur-up lazyload" data-src="resources/assets/images/testimonial-photo1.jpg" src="resources/assets/images/testimonial-photo1.jpg" alt="Shetty Jamie" title="Shetty Jamie" /></div>
                                        <div class="rte-setting"><p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s.</p></div>
                                        <div class="product-review">
                                            <i class="an an-star"></i>
                                            <i class="an an-star"></i>
                                            <i class="an an-star"></i>
                                            <i class="an an-star"></i>
                                            <i class="an an-star"></i>
                                        </div>
                                        <p class="authour">Shetty Jamie,</p>
                                        <p class="cmp-name">Kollision</p>
                                    </blockquote>
                                </div>
                                <div class="quotes-slide">
                                    <blockquote class="quotes-slider__text text-center">             
                                        <div class="testimonial-image"><img class="blur-up lazyload" data-src="resources/assets/images/testimonial-photo1.jpg" src="resources/assets/images/testimonial-photo1.jpg" alt="Sara Colinton" title="Sara Colinton" /></div>
                                        <div class="rte-setting"><p>Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software PageMaker including versions readable content page.</p></div>
                                        <div class="product-review">
                                            <i class="an an-star"></i>
                                            <i class="an an-star"></i>
                                            <i class="an an-star"></i>
                                            <i class="an an-star"></i>
                                            <i class="an an-star"></i>
                                        </div>
                                        <p class="authour">Sara Colinton,</p>
                                        <p class="cmp-name">Pel</p>
                                    </blockquote>
                                </div>
                                <div class="quotes-slide">
                                    <blockquote class="quotes-slider__text text-center">             
                                        <div class="testimonial-image"><img class="blur-up lazyload" data-src="resources/assets/images/testimonial-photo1.jpg" src="resources/assets/images/testimonial-photo1.jpg" alt="Hamlet Tuong" title="Hamlet Tuong" /></div>
                                        <div class="rte-setting"><p>Scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic of remaining essentially 1960s.</p></div>
                                        <div class="product-review">
                                            <i class="an an-star"></i>
                                            <i class="an an-star"></i>
                                            <i class="an an-star"></i>
                                            <i class="an an-star"></i>
                                            <i class="an an-star gray-star"></i>
                                        </div>
                                        <p class="authour">Hamlet Tuong,</p>
                                        <p class="cmp-name">OPL</p>  
                                    </blockquote>
                                </div>
                                <div class="quotes-slide">
                                    <blockquote class="quotes-slider__text text-center">             
                                        <div class="testimonial-image"><img class="blur-up lazyload" data-src="resources/assets/images/testimonial-photo1.jpg" src="resources/assets/images/testimonial-photo1.jpg" alt="Shetty Jamie" title="Shetty Jamie" /></div>
                                        <div class="rte-setting"><p>The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from "de Finibus Bonorum.</p></div>
                                        <div class="product-review">
                                            <i class="an an-star"></i>
                                            <i class="an an-star"></i>
                                            <i class="an an-star"></i>
                                            <i class="an an-star"></i>
                                            <i class="an an-star gray-star"></i>
                                        </div>
                                        <p class="authour">Happy Customer,</p>
                                        <p class="cmp-name">CPL</p>
                                    </blockquote>
                                </div>
                            </div>
                            
                        </div>
                    </div>
                </section>
                 -->
                <!--End Testimonial Slider-->

                <!--Brand Logo Slider-->
                <!-- 
                <section class="section logo-section">
                    <div class="container">
                        <div class="section-header">
                            <h2>Corporate Clientele</h2>
                        </div>
                        <div class="row">
                            <div class="col-12 col-sm-12 col-md-12 col-lg-12">
                                <div class="logo-bar">
                                    <div class="logo-bar__item">
                                        <a href="brands-style2.html"><img class="blur-up lazyload" data-src="resources/assets/images/logo/brandlogo1.png" src="resources/assets/images/logo/brandlogo1.png" alt="brand" title="" /></a>
                                    </div>
                                    <div class="logo-bar__item">
                                        <a href="brands-style2.html"><img class="blur-up lazyload" data-src="resources/assets/images/logo/brandlogo1.png" src="resources/assets/images/logo/brandlogo1.png" alt="brand" title="" /></a>
                                    </div>
                                    <div class="logo-bar__item">
                                        <a href="brands-style2.html"><img class="blur-up lazyload" data-src="resources/assets/images/logo/brandlogo1.png" src="resources/assets/images/logo/brandlogo1.png" alt="brand" title="" /></a>
                                    </div>
                                    <div class="logo-bar__item">
                                        <a href="brands-style2.html"><img class="blur-up lazyload" data-src="resources/assets/images/logo/brandlogo1.png" src="resources/assets/images/logo/brandlogo1.png" alt="brand" title="" /></a>
                                    </div>
                                    <div class="logo-bar__item">
                                        <a href="brands-style2.html"><img class="blur-up lazyload" data-src="resources/assets/images/logo/brandlogo1.png" src="resources/assets/images/logo/brandlogo1.png" alt="brand" title="" /></a>
                                    </div>
                                    <div class="logo-bar__item">
                                        <a href="brands-style2.html"><img class="blur-up lazyload" data-src="resources/assets/images/logo/brandlogo1.png" src="resources/assets/images/logo/brandlogo1.png" alt="brand" title="" /></a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>
                -->
                <!--End Brand Logo Slider-->
            </div>
            <!--End Body Container-->



<center>
${pageInfo.pagingHtml} <!-- 코드가 삽입되게 함 -->
</center>
<br>




<%@include file="../member/commonBottom.jsp" %>