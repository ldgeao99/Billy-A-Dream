<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    

<%@include file="../common/common.jsp" %>
<%@include file="../member/commonTop.jsp" %>

	<script type="text/javascript" src="//code.jquery.com/jquery-1.9.1.js"></script>
	<script type="text/javascript" src="https://cdn.rawgit.com/poolerMF/bootstrap-multiselectsplitter/master/bootstrap-multiselectsplitter.js"></script>
	<script type="text/javascript" src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">

      <script>
        function gotoSellPage(){
        	location.href = "insert.prd";
        }
     </script>
	
	<script type="text/javascript">

	var components = [];
	var componentsSize = 0;
	
	$(function() {
		
		
		/* 대분류 카테고리를 화면에 추가하는 부분 */
		$.ajax({
			url : "getLargeCategory.lcate",
			success : function(resdata){
				var large_items = resdata.split('|'); 
				for(var i = 0; i<large_items.length; i++){
					var small_items = large_items[i].split(',');
					$('#leftcategory').append("<li><input type='button' value='"+ small_items[0] + "' class='lcategory' id='lcategory/"+ small_items[1] +"'></li>");	
				}
			}
		});
		
		/* 대분류 카테고리를 클릭하면 그에맞는 소분류 카테고리가 화면에 보여지는 부분 */
		$('#leftcategory').on('click', '.lcategory', function(){
			$('.lcategory').css('color', '');
			$(this).css('color', 'red');
			$('input[name="lcategory_no"]').val($(this).attr('id').split('/')[1]);
			$('input[name="scategory_no"]').val("");
			
			$.ajax({
				url : "getSmallCategory.scate",
				data : {
					lcategoryNo : $('input[name="lcategory_no"]').val()
				},
				success : function(resdata){
					$('#rightcategory').empty();
					var large_items = resdata.split('|'); 
					for(var i = 0; i<large_items.length; i++){
						var small_items = large_items[i].split(',');
						$('#rightcategory').append("<li><input type='button' value='"+ small_items[0] + "' class='scategory' id='scategory/"+ small_items[1] +"'></li>");	
					} 
				}
			});
		});
		
		/* 소분류 카테고리를 클릭하면 선택한 소분류의 색깔이 바뀌게하는 부분 */
		$('#rightcategory').on('click', '.scategory', function(){
			$('.scategory').css('color', '');
			$(this).css('color', 'red');
			$('input[name="scategory_no"]').val($(this).attr('id').split('/')[1]);
		});
			
		
		/* 세부 구성품 추가하는 부분 */
		$('#add_component').click(function(){
			
			if(componentsSize == 10){
				alert("세부 구성품은 최대 10개 까지만 입력 가능합니다.");
			}
			
			var isExistComponent = components.indexOf($('#component_text').val()) != -1;
			/* $('#component_text').val() */
			if($('#component_text').val() != "" && !isExistComponent && componentsSize < 10){
				componentsSize++;
				$('#limit_component_Counter').empty();
				$('#limit_component_Counter').append("("+ componentsSize + "/10)");
				$(this).parent().parent().parent().append("<div class='row row-cols-3 components'><div class='col' style='padding:10px 10px'>"+ $('#component_text').val() + "</div><div class='col' style='padding:12px 10px'><i class='fa-regular fa-circle-check change_component' style='cursor:pointer'></i> <i class='fa-regular fa-circle-xmark delete_component'  style='cursor:pointer'></i></div><div class='col'></div></div>");
				components.push($('#component_text').val());
				//alert(components);					
			}else if(isExistComponent){
				alert("중복되는 구성품명은 사용할 수 없습니다.");
			}
			
			$('#component_text').val(""); // 입력하는 곳 초기화
		});//click끝
		
		/* 세부 구성품 수정하는 부분*/
		$('.col').on('click', '.change_component', function(){
			
			var re_name = window.prompt("변경할 이름을 입력해주세요", "");
			
			var isExistComponent = components.indexOf(re_name) != -1;
			
			if(re_name != null && !isExistComponent){
				
				var pre_name = $(this).parent().prev().text();
				
				//배열에서 수정
				for(var i = 0; i < components.length; i++){ 
					if (components[i] == pre_name) { 
						components.splice(i, 1);
						components.splice(i, 0, re_name);
					}
				}
				//화면에서 삭제
				$(this).parent().prev().text(re_name);
			}else if(isExistComponent){
				alert("중복되는 구성품명은 사용할 수 없습니다.");
			}
			
			
			//alert(components);
		});
		
		/* 세부 구성품 삭제하는 부분*/
		$('.col').on('click', '.delete_component', function(){
			componentsSize--;
			$('#limit_component_Counter').empty();
			$('#limit_component_Counter').append("("+ componentsSize + "/10)");
			
			//배열에서 삭제
			for(var i = 0; i < components.length; i++){ 
				if (components[i] == $(this).parent().prev().text()) { 
					components.splice(i, 1); 
				}
			}
			
			//화면에서 삭제
			$(this).parent().parent().remove();
			
			//alert(components);
		});
		

		//var newJquery = $.noConflict(true); // 다른 라이브러리랑 겹칠때 이렇게 해주면 됨.
		$('#openZipSearch').click(function(){
			new daum.Postcode({
				oncomplete: function(data) {
		
					//newJquery('[name=full_address1]').val(data.jibunAddress);
					
					var temp = "";
					
					temp += data.sido;
					temp += " " + data.sigungu;
					if(data.bname1 != ""){
						temp += " " + data.bname1;
					}
					temp += " " + data.bname;
					
					$('[name=full_address]').val(temp);
					
					$('[name=add1_sido]').val(data.sido);
					$('[name=add2_sigungu]').val(data.sigungu);
					$('[name=add3_eubmyeon]').val(data.bname1);
					$('[name=add4_donglee]').val(data.bname);
				}
			}).open();
		});//click끝
		
		//집주소 버튼 누르면 ajax 요청을 통해 자기 집주소 얻어오는 부분
		$('#setMyAddress').click(function(){
			$.ajax({
				url : "getUserAddress.mb",
				data : {
					id : '<%=(String)session.getAttribute("id")%>'
				},
				success : function(resdata){
					
					var addressArr = resdata.split(' ');
					var temp = "";
					
					temp += addressArr[0];
					temp += " " + addressArr[1];
					if(addressArr[2] != "null"){
						temp += " " + addressArr[2];	
					}
					temp += " " + addressArr[3];
					
					$('input[name="full_address"]').val(temp);
					
					$('[name=add1_sido]').val(addressArr[0]);
					$('[name=add2_sigungu]').val(addressArr[1]);
					if(addressArr[2] == "null"){
						$('[name=add3_eubmyeon]').val("");
					}else{
						$('[name=add3_eubmyeon]').val(addressArr[2]);	
					}
					$('[name=add4_donglee]').val(addressArr[3]);
				}
			});
			
			
		});
		
		$('input[name="original_day_price"]').keyup(function(){
			if(isNaN($(this).val())){
				alert("숫자만 입력 가능합니다.");
				$(this).val("");
			}
		})
		
		$('input[name="discounted_day_price"]').keyup(function(){
			if(isNaN($(this).val())){
				alert("숫자만 입력 가능합니다.");
				$(this).val("");
			}
		})
		
		
		$('input[name="rentday_minimum"]').keyup(function(){
			if(isNaN($(this).val())){
				alert("숫자만 입력 가능합니다.");
				$(this).val("");
			}
		})
		
		/* 등록 버튼을 눌렀을 때 */
		$('#submit_button').click(function(){
			
			/* 구성용품 정보를 보내기 위해 hidden 타입의 input을 채워줌 */
			var temp = "";
			
			$('.components').each(function(index){
				
				if(index == 0){
					temp = $(this).children().first().text();
				}else{
					temp += "," + $(this).children().first().text();
				}

			});
			
			$('input[name="components"]').val(temp);
			
			
			/*
			<div class="row row-cols-3 components">
				<div class="col" style="padding:10px 10px">Column</div>
				<div class="col" style="padding:12px 10px"><i class="fa-regular fa-circle-xmark delete_component"  style="cursor:pointer"></i></div>
				<div class="col"></div>
			</div> 
			*/
			
			/* 유효성 검사 */
			if($('input[name="name"]').val() == ""){
				alert("상품 이름을 입력하세요");
				return;
			}
			if($('input[name="upload"]').val() == ""){
				alert("상품 이미지를 선택하세요");
				return;
			}
			if($('input[name="lcategory_no"]').val() == ""){
				alert("카테고리를 선택하세요");
				return;
			}
			if($('input[name="scategory_no"]').val() == ""){
				alert("소분류를 선택하세요");
				return;
			}
			if($('input[name="full_address"]').val() == ""){
				alert("주소를 입력하세요");
				return;
			}
			if($('input[name="original_day_price"]').val() == ""){
				alert("원래 일일렌트가격을 입력하세요");
				return;
			}
			if($('input[name="discounted_day_price"]').val() == ""){
				alert("할인된 일일렌트가격을 입력하세요");
				return;
			}
			if($('input[name="rentday_minimum"]').val() == ""){
				alert("대여가능 최소일수를 입력하세요");
				return;
			}
			if($('input[name="end_day"]').val() == ""){
				alert("게시종료 예정일자를 선택하세요");
				return;
			}
			
			$('#prd_register_form').submit();
			
		});//click끝 

	});
	</script>
	
	<style>
		#att_zone {
			width: 100%;
			min-height: 150px;
			padding: 10px;
			border: 1px solid #D7D7D7;
			border-radius: 10px;
		}
		
		#att_zone:empty:before {
			content: attr(data-placeholder);
			color: #999;
			font-size: .9em;
		}
		
		input[type="text"]{
			width:100%;
		}
	</style>
	
	<style>
		ol li > input{
			width : 100%;
			border: none;
			background: none;
			padding : 10px;
			text-align: left;
		}
		
		ol > li:hover {
			background-color: #F4F4FA;
		}
		
		ol > li:active {
			background-color: #EAE9F1;
		}

	</style>








<div class="collection-header">
	<div class="collection-hero">
		<div class="collection-hero__image"></div>
		<div class="collection-hero__title-wrapper container">
			<h2 style="font-family: 'Poppins', Arial, Tahoma !important; font-weight: 700 !important; font-size: 25px; color: black; margin-bottom: 0px">
			상품등록
			</h2>
		</div>
	</div>
</div>
<!--End Collection Banner-->

<!--Main Content-->

<form id="prd_register_form" action="insert.prd" method="post" enctype="multipart/form-data">
	

	<div class="container">
		<!-- 상품명 입력부분 -->
		<div class="row justify-content-md-center">
			<div class="col col-lg-2" style="padding : 10px 10px;">상품명</div>
			
			<div class="col col-lg-6">
				<input type="text" name="name" placeholder="상품이름을 입력해 주세요(최대 40자)" value="오큘러스 VR" maxlength="40">
			</div>
		</div>
		
		<div class="row justify-content-md-center">
			<div class="col col-lg-8">
				<hr style="border: 0; height: 1px ; background: #BDBDBD;">	
			</div>
		</div>
		
		<!-- 첨부파일 선택 부분 -->
		<div class="row justify-content-md-center">
			<div class="col col-lg-2" style="padding : 83px 10px;">상품 이미지<span id="limit_image_Counter" style="color:#9B99A9">(0/10)</span></div>
			
			<div class="col col-lg-6">
				<input type='file' name="upload" id='btnAtt' accept="image/*" multiple='multiple' style="width:40%; padding:2px; border: none; border-radius: 0px;"/>
				<div id='att_zone' data-placeholder='파일을 첨부 하려면 파일 선택 버튼을 클릭하세요'></div>
			</div>
		</div>
		
		<div class="row justify-content-md-center">
			<div class="col col-lg-8">
				<hr style="border: 0; height: 1px ; background: #BDBDBD;">	
			</div>
		</div>
		<!-- 카테고리 선택부분 -->
		<div class="row justify-content-md-center">
			<div class="col col-lg-2" style="padding : 112px 10px;">카테고리</div>
			
			<div class="col col-lg-6">
				<div class="row">
					<div class="col" style="overflow: auto; height: 250px; margin-left:15px; margin-right:15px">
						<ol style="list-style-type: none; padding-left: 0px;" id="leftcategory">
							<!-- ajax로 대분류 요청하면 json으로 받아짐. -->
						
							<!-- 
							<li><input type="button" value="여성의류" class="lcategory" id="lcategory/1"></li> id는 파싱을 위한 용도
							<li><input type="button" value="남성의류" class="lcategory" id="lcategory/2"></li>
							<li><input type="button" value="신발" class="lcategory" id="lcategory/3"></li> 
							-->
							
						</ol>
					</div>
	
					<div class="col" style="overflow: auto; height: 250px; margin-right:15px">
						<ol style="list-style-type: none; padding-left: 0px" id="rightcategory">
							<!-- 
							<li><input type="button" value="여성의류" class="scategory" id="scategory/1"></li>
							<li><input type="button" value="여성의류" class="scategory" id="scategory/2"></li>
							<li><input type="button" value="여성의류" class="scategory" id="scategory/3"></li> 
							-->
						</ol>
					</div>
				</div>
				
				<input type="hidden" name="lcategory_no" value="">
				<input type="hidden" name="scategory_no" value=""> 
			</div>
		</div>
		
		<div class="row justify-content-md-center">
			<div class="col col-lg-8">
				<hr style="border: 0; height: 1px ;background: #BDBDBD;">	
			</div>
		</div>
		<!-- 거래지역 입력부분 -->
		<div class="row justify-content-md-center">
			<div class="col col-lg-2" style="padding : 10px 10px;">거래지역</div>
			
			<div class="col col-lg-6">
				<div class="row row-cols-auto">
					<div class="col"><input type="text" name="full_address" placeholder="버튼을 눌러 입력해주세요" style="width: 270px" readonly></div>
    				<div class="col" style="padding:0px"><input type="button" id="setMyAddress" value="집주소"></div>
    				<div class="col"><input type="button" value="새로지정" id="openZipSearch"></div>
  				</div>
				
				<input type="hidden" name="add1_sido" value="">		<!-- 도/시 이름 --> 
				<input type="hidden" name="add2_sigungu" value=""> 	<!-- 시/군/구 이름 --> 
				<input type="hidden" name="add3_eubmyeon" value=""> <!-- 법정리의 읍/면 이름 --> 
				<input type="hidden" name="add4_donglee" value=""> <!-- 법정동/법정리 이름 -->
			</div>
		</div>
		<div class="row justify-content-md-center">
			<div class="col col-lg-8">
				<hr style="border: 0; height: 1px ;background: #BDBDBD;">	
			</div>
		</div>
		<!-- 일일렌트가격 입력부분 -->
		<div class="row justify-content-md-center">
			<div class="col col-lg-2" style="padding : 10px 10px;">원래 일일렌트가격</div>
			
			<div class="col col-lg-6">
				<input type="text" name="original_day_price" placeholder="숫자만 입력해주세요" maxlength="8" style="width: 200px" value="9000"> 원
			</div>
		</div>
		<div class="row justify-content-md-center">
			<div class="col col-lg-8">
				<hr style="border: 0; height: 1px ;background: #BDBDBD;">	
			</div>
		</div>
		<!-- 일일렌트가격 입력부분 -->
		<div class="row justify-content-md-center">
			<div class="col col-lg-2" style="padding : 10px 10px;">할인된 일일렌트가격</div>
			
			<div class="col col-lg-6">
				<input type="text" name="discounted_day_price" placeholder="숫자만 입력해주세요" maxlength="8" style="width: 200px" value="6000"> 원
			</div>
		</div>
		<div class="row justify-content-md-center">
			<div class="col col-lg-8">
				<hr style="border: 0; height: 1px ;background: #BDBDBD;">	
			</div>
		</div>
		<!-- 대여가능 최소일수 입력부분 -->
		<div class="row justify-content-md-center">
			<div class="col col-lg-2" style="padding : 10px 10px;">대여가능 최소일수</div>
			
			<div class="col col-lg-6">
				<input type="text" name="rentday_minimum" placeholder="숫자만 입력해주세요" maxlength="3" style="width: 200px" value="7"> 일
			</div>
		</div>
		<div class="row justify-content-md-center">
			<div class="col col-lg-8">
				<hr style="border: 0; height: 1px ;background: #BDBDBD;">	
			</div>
		</div>
		<!-- 세부 구성품 입력부분 -->
		<div class="row justify-content-md-center">
			<div class="col col-lg-2" style="padding : 10px 10px;">세부 구성품<span id="limit_component_Counter" style="color:#9B99A9">(0/10)</span></div>
			
			<div class="col col-lg-6">
				<div class="row row-cols-auto">
    				<div class="col"><input type="text" id="component_text" placeholder="세부 구성품을 입력해 주세요(최대 25자, 중복불가)" maxlength="25" style="width: 410px"></div>
    				<div class="col" style="padding:0px"><input type="button" id="add_component" value="+"></div>
  				</div>
  				
  				<!-- 
  				<div class="row row-cols-3 components">
					<div class="col" style="padding:10px 10px">Column</div>
					<div class="col" style="padding:12px 10px"><i class="fa-regular fa-circle-xmark delete_component"  style="cursor:pointer"></i></div>
					<div class="col"></div>
				</div> 
  				-->
				
				<input type="hidden" name="components" value="">
			</div>
		</div>
		<div class="row justify-content-md-center">
			<div class="col col-lg-8">
				<hr style="border: 0; height: 1px ;background: #BDBDBD;">	
			</div>
		</div>
		<!-- 상세설명 입력부분 -->
		<div class="row justify-content-md-center">
			<div class="col col-lg-2" style="padding : 38px 10px;">상세설명</div>
			
			<div class="col col-lg-6">
				<textarea  name="description" placeholder="내용을 입력해 주세요(최대 300자)" maxlength="300" style="width: 100%; height: 6.25em; resize: none;">지금 당장 체험해보세요</textarea>
			</div>
		</div>
		<div class="row justify-content-md-center">
			<div class="col col-lg-8">
				<hr style="border: 0; height: 1px ;background: #BDBDBD;">	
			</div>
		</div>
		<!-- 게시종료 예정일자 입력부분 -->
		<div class="row justify-content-md-center">
			<div class="col col-lg-2" style="padding : 10px 10px;">게시종료 예정일자</div>
			
			<div class="col col-lg-6">
				<input type="date" name="end_day" style="width: 140px">
				<script>
					//make today as string
					var today = new Date();
					var dd = String(today.getDate()).padStart(2, '0');
					var mm = String(today.getMonth() + 1).padStart(2, '0');
					var yyyy = today.getFullYear();
					var today_string = yyyy + "-" + mm + '-' + dd;
					$('input[name="end_day"]').attr('min',today_string);
				</script>
			</div>
		</div>
		<div class="row justify-content-md-center">
			<div class="col col-lg-8">
				<hr style="border: 0; height: 1px ;background: #BDBDBD;">	
			</div>
		</div>
		
		<div class="row justify-content-md-center">
			<div class="col col-lg-8">
				<input type="button" id="submit_button" value="등록하기">	
			</div>
		</div>
		
		
	</div>
</form>



<!-- 내 코드가 위치하면 되는 곳 -->

	
		


	





	<!-- ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ -->


	<!--End Body Container-->

	<!--Footer-->
	<style>
		a{
			text-decoration: none;
		}
	</style>
	<%@include file="../member/commonBottom.jsp" %>
	
	<!--End Footer-->

	<!--Scoll Top-->
	<span id="site-scroll"><i class="icon an an-chevron-up"></i></span>
	<!--End Scoll Top-->

	<!--MiniCart Drawer-->
	<div class="minicart-right-drawer modal right fade"
		id="minicart-drawer">
		<div class="modal-dialog">
			<div class="modal-content">
				<div id="cart-drawer" class="block block-cart">
					<div class="minicart-header">
						<a href="javascript:void(0);" class="close-cart"
							data-bs-dismiss="modal" aria-label="Close"><i
							class="an an-times-r" aria-hidden="true" data-bs-toggle="tooltip"
							data-bs-placement="left" title="Close"></i></a>
						<h4 class="fs-6">Your cart (2 Items)</h4>
					</div>
					<div class="minicart-content">
						<ul class="clearfix">
							<li class="item d-flex justify-content-center align-items-center">
								<a class="product-image" href="product-layout1.html"> <img
									class="blur-up lazyload"
									src="resources/assets/images/products/cart-product-img1.jpg"
									data-src="resources/assets/images/products/cart-product-img1.jpg"
									alt="image" title="">
							</a>
								<div class="product-details">
									<a class="product-title" href="product-layout1.html">Floral
										Crop Top</a>
									<div class="variant-cart">Black / XL</div>
									<div class="priceRow">
										<div class="product-price">
											<span class="money">$59.00</span>
										</div>
									</div>
								</div>
								<div class="qtyDetail text-center">
									<div class="wrapQtyBtn">
										<div class="qtyField">
											<a class="qtyBtn minus" href="javascript:void(0);"><i
												class="icon an an-minus-r" aria-hidden="true"></i></a> <input
												type="text" name="quantity" value="1" class="qty"> <a
												class="qtyBtn plus" href="javascript:void(0);"><i
												class="icon an an-plus-l" aria-hidden="true"></i></a>
										</div>
									</div>
									<a href="#" class="edit-i remove"><i
										class="icon an an-edit-l" data-bs-toggle="tooltip"
										data-bs-placement="top" title="Edit"></i></a> <a href="#"
										class="remove"><i class="an an-times-r"
										data-bs-toggle="tooltip" data-bs-placement="top"
										title="Remove"></i></a>
								</div>
							</li>
							<li class="item d-flex justify-content-center align-items-center">
								<a class="product-image" href="product-layout1.html"> <img
									class="blur-up lazyload"
									src="resources/assets/images/products/cart-product-img1.jpg"
									data-src="resources/assets/images/products/cart-product-img1.jpg"
									alt="image" title="">
							</a>
								<div class="product-details">
									<a class="product-title" href="product-layout1.html">V Neck
										T-shirts</a>
									<div class="variant-cart">Blue / XL</div>
									<div class="priceRow">
										<div class="product-price">
											<span class="money">$199.00</span>
										</div>
									</div>
								</div>
								<div class="qtyDetail text-center">
									<div class="wrapQtyBtn">
										<div class="qtyField">
											<a class="qtyBtn minus" href="javascript:void(0);"><i
												class="icon an an-minus-r" aria-hidden="true"></i></a> <input
												type="text" name="quantity" value="1" class="qty"> <a
												class="qtyBtn plus" href="javascript:void(0);"><i
												class="icon an an-plus-l" aria-hidden="true"></i></a>
										</div>
									</div>
									<a href="#" class="edit-i remove"><i
										class="icon an an-edit-l" data-bs-toggle="tooltip"
										data-bs-placement="top" title="Edit"></i></a> <a href="#"
										class="remove"><i class="an an-times-r"
										data-bs-toggle="tooltip" data-bs-placement="top"
										title="Remove"></i></a>
								</div>
							</li>
						</ul>
					</div>
					<div class="minicart-bottom">
						<div class="shipinfo text-center mb-3 text-uppercase">
							<p class="freeShipMsg">
								<i class="an an-truck fs-5 me-2 align-middle"></i>SPENT <b>$199.00</b>
								MORE FOR FREE SHIPPING
							</p>
						</div>
						<div class="subtotal">
							<span>Total:</span> <span class="product-price">$93.13</span>
						</div>
						<a href="checkout-style1.html"
							class="w-100 p-2 my-2 btn btn-outline-primary proceed-to-checkout rounded">Proceed
							to Checkout</a> <a href="cart-style1.html"
							class="w-100 btn-primary cart-btn rounded">View Cart</a>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!--End MiniCart Drawer-->
	<div class="modalOverly"></div>


	<!-- Including Jquery -->
	<script src="resources/assets/js/vendor/jquery-min.js"></script>
	<script src="resources/assets/js/vendor/js.cookie.js"></script>
	<!--Including Javascript-->
	<script src="resources/assets/js/plugins.js"></script>
	<script src="resources/assets/js/main.js"></script>

	<!--Including Tagsinput-->
	<script src="resources/assets/js/vendor/bootstrap-tagsinput.js"></script>
	<script>
                $(document).ready(function () {
                    $("#inputTag").tagsinput('items');
                });
            </script>

	<!--Including editor tinymce-->
	<script src="resources/assets/js/vendor/tinymce.min.js"></script>
	<script>
                $(document).ready(function () {
                    tinymce.init({
                        selector: '#editor',
                        menubar: false,
                        statusbar: false,
                        plugins: 'autoresize anchor autolink charmap code codesample directionality fullpage help hr image imagetools insertdatetime link lists media nonbreaking pagebreak preview print searchreplace table template textpattern toc visualblocks visualchars',
                        toolbar: 'h1 h2 bold italic strikethrough blockquote bullist numlist backcolor | link image media | removeformat help fullscreen ',
                        skin: 'bootstrap',
                        toolbar_drawer: 'floating',
                        min_height: 200,
                        autoresize_bottom_margin: 16
                    });
                });
            </script>

</div>
<!--End Page Wrapper-->
	</body>
	</html>
	
<script type="text/javascript">

/* 코드를 이런식으로 작성하면 function의 파라미터를 호출로 주는게 아니라 여기서 줄 수 있음 */
( 
	imageView = function imageView(att_zone, btn){ /* ('att_zone', 'btnAtt') 이미지들이 들어갈 위치, 파일추가 버튼 */
						
		var attZone = document.getElementById(att_zone); // 이미지들이 표시되는 공간 
		var btnAtt = document.getElementById(btn)		 // 파일 추가 버튼
		var sel_files = [];
							    
							    
		/* 각 요소의 style 정의 */
		// 이미지와 체크 박스를 감싸고 있는 div 속성
		var div_style = 'display:inline-block;position:relative;'
						+ 'width:31%;height:160px;margin:7px;border:1px solid #D7D7D7;z-index:1';
		// 미리보기 이미지 속성
		var img_style = 'width:100%;height:100%;z-index:none;';
							    
		// 이미지안에 표시되는 체크박스의 속성
		var chk_style = 'width:30px; height:30px; position:absolute; font-size:24px;'
						+ 'right: 0px; bottom:0px; z-index:999; color:#FFFFFF; cursor:pointer;';
							  
							    
		/* 사용자에 의한 파일 추가 이벤트가 발생하면 */					
		btnAtt.onchange = function(e){
			
			var files = e.target.files; // object FileList
			var fileArr = Array.prototype.slice.call(files) // Array 타입으로 변경 [object File],[object File],,
			
			if(fileArr.length == 0){
				//when cancel button is clicked
				var dt = new DataTransfer();
				
				// 바로 위 dt 변수에 모든 파일객체 담음
				for(index in sel_files) {
					var file = sel_files[index];
					dt.items.add(file);
				}
				
				btnAtt.files = dt.files; // input type file 에 담긴 FileList를 덮어씌움
				return;
			}
			
			if(sel_files.length + fileArr.length > 9){
				alert("상품 이미지는 최대 9장 첨부 가능합니다.");	
				
				var dt = new DataTransfer();
				
				// 바로 위 dt 변수에 모든 파일객체 담음
				for(index in sel_files) {
					var file = sel_files[index];
					dt.items.add(file);
				}
				
				btnAtt.files = dt.files; // input type file 에 담긴 FileList를 덮어씌움
				return;
			}
			
			for(file of fileArr){
				imageLoader(file);	
			}
		}
							    
		/* 첨부된 이미리를을 배열에 넣고 미리보기 */
		imageLoader = function(file){
			
			var isAlreadyExist = false;
			
			for(index in sel_files) {
				if(file.name == sel_files[index].name){
					isAlreadyExist = true; 	
				}
			}
			
			if(isAlreadyExist == false){
				sel_files.push(file);
				
				var reader = new FileReader();
				
				reader.onload = function(ee){
					let img = document.createElement('img');
					img.setAttribute('style', img_style);
					img.src = ee.target.result;
					attZone.appendChild(makeDiv(img, file));
				}
								      
				reader.readAsDataURL(file);
			}

			/* 여기서 이제 보여지는 리밋 숫자 보여주면 됨. */
			$('#limit_image_Counter').empty();
			$('#limit_image_Counter').append("("+ sel_files.length +"/9)");
			
			
			/* 기존에 존재하는 input type file 에 덮어띄워주는 작업이 필요함 */
			var dt = new DataTransfer();
			
			// 바로 위 dt 변수에 모든 파일객체 담음
			for(index in sel_files) {
				var file = sel_files[index];
				dt.items.add(file);
			}
			
			btnAtt.files = dt.files; // input type file 에 담긴 FileList를 덮어씌움
			

		}
							    
		/*첨부된 파일이 있는 경우 checkbox와 함께 attZone에 추가할 div를 만들어 반환 */
		makeDiv = function(img, file){
			var div = document.createElement('div')
			div.setAttribute('style', div_style)
							      
			/* 
			var btn = document.createElement('input') 
			btn.setAttribute('type', 'button')
			btn.setAttribute('value', 'x')
			btn.setAttribute('delFile', file.name);
			btn.setAttribute('style', chk_style);
			*/
		      
			/* 이미지 오른편에 보여지는 X표시 버튼 */
			var btn = document.createElement('i');
			btn.setAttribute('class', 'fa-solid fa-square-xmark');
			btn.setAttribute('delFile', file.name); /* 이게 있어야 삭제가능 */
			btn.setAttribute('style', chk_style);
		      
			/* 삭제 버튼이 눌릴 경우 이벤트 처리 */
			btn.onclick = function(ev){
				var ele = ev.srcElement;
				var watnToDelFileName = ele.getAttribute('delFile'); // 삭제할 파일의 이름
				
				// sel_files 배열에서 해당 파일객체 삭제
				for(var i=0 ;i<sel_files.length; i++){
					if(watnToDelFileName == sel_files[i].name){
						sel_files.splice(i, 1);      
					}
				}
			        
				var dt = new DataTransfer(); // input type file은 내부적으로 선택된 파일을 저장하는 FileList를 갖는데, 이를 수정하려면 DataTransfer 객체로 덮어씌워야 한다. 
				
				// 바로 위 dt 변수에 모든 파일객체 담음
				for(index in sel_files) {
					var file = sel_files[index];
					dt.items.add(file);
				}
				
				// input type file 에 담긴 FileList를 덮어씌움
				btnAtt.files = dt.files;
				
				var p = ele.parentNode;
				attZone.removeChild(p);
				
				$('#limit_image_Counter').empty();
				$('#limit_image_Counter').append("("+ sel_files.length +"/9)");
			}
			
			div.appendChild(img)
			div.appendChild(btn)
			return div
		}						      
	}
	)('att_zone', 'btnAtt')
					
</script>